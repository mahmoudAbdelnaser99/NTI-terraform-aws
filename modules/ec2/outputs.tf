output "public_ec2_id" {value = aws_instance.pub-ec2[*].id}

output "private_ec2_id" {value = aws_instance.priv-ec2[*].id}

output "security_group_id" {value = aws_security_group.sg.id}