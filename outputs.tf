output "mumbai_ec2_public_ip" {
  value = aws_instance.mumbai_ec2.public_ip
}

output "virginia_ec2_public_ip" {
  value = aws_instance.virginia_ec2.public_ip
}

output "mumbai_vpc_id" {
  value = aws_vpc.mumbai_vpc.id
}

output "virginia_vpc_id" {
  value = aws_vpc.virginia_vpc.id
}

output "mumbai_public_subnet_id" {
  value = aws_subnet.mumbai_public.id
}

output "virginia_public_subnet_id" {
  value = aws_subnet.virginia_public.id
}

output "mumbai_security_group_id" {
  value = aws_security_group.mumbai_sg.id
}

output "virginia_security_group_id" {
  value = aws_security_group.virginia_sg.id
}

output "mumbai_instance_id" {
  value = aws_instance.mumbai_ec2.id
}

output "virginia_instance_id" {
  value = aws_instance.virginia_ec2.id
}