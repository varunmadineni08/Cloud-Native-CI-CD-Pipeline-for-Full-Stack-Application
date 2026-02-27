
#vpc________________________________________________________________
resource "aws_vpc" "eks_vpc" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "eks-vpc"
  }
}

#subnet1________________________________________________________________

resource "aws_subnet" "pub_sub1" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "eu-north-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "eks-pub-subnet-1"
  }
}

#subnet2______________________________________________________________
resource "aws_subnet" "pub_sub2" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "eu-north-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "eks-pub-subnet-1"
  }
}

#internet gateway_____________________________________________________
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.eks_vpc.id
  tags = {
    Name = "eks-igw"
  }
}

#route_table__________________________________________________________________
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "eks-pub-rt"
  }
}

resource "aws_route_table_association" "pub_ass_subnet1" {
  subnet_id      = aws_subnet.pub_sub1.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_route_table_association" "pub_ass_subnet2" {
  subnet_id      = aws_subnet.pub_sub2.id
  route_table_id = aws_route_table.rt.id
}

#iam_role_________________________________________________________________
resource "aws_iam_role" "eks_role" {
  name = "eks_cluster-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "eks.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

#attach_polciy___________________________________________________________
resource "aws_iam_role_policy_attachment" "eks_policy" {
  role       = aws_iam_role.eks_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}
































