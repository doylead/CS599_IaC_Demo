# Create a virtual private cloud to contain public and private subnets
resource "aws_vpc" "my_vpc" {
    cidr_block = "10.0.0.0/16"

    tags = {
        Name  = format("%s_%s", var.AWS_project_name, "vpc")
    }
}

# Create a public subnet within the new VPC
resource "aws_subnet" "my_public_subnet" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = "10.0.1.0/24"

    tags = {
        Name  = format("%s_%s", var.AWS_project_name, "public_subnet")
    }
}

# Create an IGW for the new VPC
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
      Name  = format("%s_%s", var.AWS_project_name, "igw")
  }
}

# Create a routing table for public traffic
resource "aws_route_table" "my_public_route_table" {
    vpc_id = aws_vpc.my_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my_igw.id
    }

    tags = {
        Name  = format("%s_%s", var.AWS_project_name, "public_route_table")
    }
}

# Set the new routing table as main for the VPC
resource "aws_route_table_association" "my_public_route_association" {
    subnet_id = aws_subnet.my_public_subnet.id
    route_table_id = aws_route_table.my_public_route_table.id
}

## Add a private subnet for the private server
# Create a private subnet within the new VPC
resource "aws_subnet" "my_private_subnet" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = "10.0.2.0/24"

    tags = {
        Name  = format("%s_%s", var.AWS_project_name, "private_subnet")
    }
}


