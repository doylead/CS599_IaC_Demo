# Create security group for this environment
resource "aws_security_group" "my_public_sg" {
    name  = format("%s_%s", var.AWS_project_name, "sg")
    vpc_id = aws_vpc.my_vpc.id
}

# Allow inbound SSH from my machine
resource "aws_vpc_security_group_ingress_rule" "allow_local_ssh" {
    security_group_id = aws_security_group.my_public_sg.id

    # Originating IP address(es)
    cidr_ipv4 = var.my_ip_address # Defined in private_vars.tf, not included in git

    # Defines a port range
    from_port = 22
    to_port = 22

    # Protocol
    ip_protocol = "tcp"
}

# Allow inbound ICMP from my machine
resource "aws_vpc_security_group_ingress_rule" "allow_local_icmp" {
    security_group_id = aws_security_group.my_public_sg.id

    # Originating IP address(es)
    cidr_ipv4 = var.my_ip_address # Defined in private_vars.tf, not included in git

    # I'm unsure what this means for icmp
    from_port = -1
    to_port = -1

    # Protocol
    ip_protocol = "icmp"
}

# Allow inbound HTTP from my machine
resource "aws_vpc_security_group_ingress_rule" "allow_local_http" {
    security_group_id = aws_security_group.my_public_sg.id

    # Originating IP address(es)
    cidr_ipv4 = var.my_ip_address # Defined in private_vars.tf, not included in git

    # I'm unsure what this means for icmp
    from_port = 80
    to_port = 80

    # Protocol
    ip_protocol = "tcp"
}

# Allow all outbound traffic
resource "aws_vpc_security_group_egress_rule" "all_all_outbound" {
    security_group_id = aws_security_group.my_public_sg.id
    cidr_ipv4 = "0.0.0.0/0"
    from_port = -1
    to_port = -1
    ip_protocol = -1
}
