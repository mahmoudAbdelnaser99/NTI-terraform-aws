
output "vpc_id" {
    value = aws_vpc.vpc.id
}

output "igw_id" {
    value = aws_internet_gateway.igw.id
}

output "nat_id" {
    value = aws_nat_gateway.nat.id
}