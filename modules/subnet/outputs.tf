output "public_subnets_id" {
    value = aws_subnet.public_subnets[*].id
}

output "private_subnets_id" {
    value = aws_subnet.private_subnets[*].id
}