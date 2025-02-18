# Create an EC2 instance in the public subnet
resource "aws_instance" "public_server" {
  # Amazon Linux 2023
  ami           = "ami-0ccabb5f82d4c9af5"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.my_public_subnet.id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.my_public_sg.id]
  key_name = var.AWS_key_pair_name # Defined in private_vars.tf, not included in git

  tags = {
    Name  = format("%s_%s", var.AWS_project_name, "public_server")
  }

  # Install a web server on startup to demonstrate basic functionality
  user_data = "${file("install_httpd.sh")}"

}
