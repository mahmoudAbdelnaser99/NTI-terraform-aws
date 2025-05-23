# CREATE AMI TO BE USED IN EC2
data "aws_ami" "ubuntu" {
  most_recent = true
  owners = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}



#  PUBLIC EC2 INSTANCES
resource "aws_instance" "pub-ec2" {
  count                       = length(var.ec2_public_subnet_id) 
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  subnet_id                   = var.ec2_public_subnet_id[count.index]    
  security_groups             = [aws_security_group.sg.id]
  associate_public_ip_address = true
  tags = {
      Name = "nti_public_ec2_${count.index}"
    } 
      # user_data = templatefile("${path.module}/public.sh.tpl", {
      #   priv_lb_dns = var.priv_lb_dns
      #   })
    user_data = <<EOF
#!/bin/bash
sudo apt-get update
sudo apt-get install -y nginx
sudo systemctl start nginx
sudo systemctl enable nginx
sudo cat > /etc/nginx/sites-enabled/default << EOL
server {
    listen 80 default_server;
    location / {
      proxy_pass http://${var.priv_lb_dns};
    }
}
  
EOL
sudo systemctl restart nginx
EOF

  provisioner "local-exec" {
    when        = create
    on_failure  = continue
    command = "echo public-ip-${count.index} : ${self.private_ip} >> all-ips.txt"
 }
}



###  private ec2
resource "aws_instance" "priv-ec2" {
  count                       = length(var.ec2_private_subnet_id) 
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  subnet_id                   = var.ec2_private_subnet_id[count.index]    
  security_groups             = [aws_security_group.sg.id]
  associate_public_ip_address = false

  tags = {
    Name = "nti_private_ec2_${count.index}"  
  }

    user_data = file("${path.module}/private.sh")
    

  provisioner "local-exec" {
    when        = create
    on_failure  = continue
    command = "echo private-ip-${count.index} : ${self.private_ip} >> all-ips.txt"
 }
} 



### SECURITY GROUP
resource "aws_security_group" "sg" {
  vpc_id = var.sg_vpc_id

  dynamic "ingress" {
    for_each =  [22, 80, 443] 
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "nti_sg"
  }
}