resource "aws_instance" "my_ec2" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = aws_subnet.pub_sub1.id
  key_name      = var.key_name
}