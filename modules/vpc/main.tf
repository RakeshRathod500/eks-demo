resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
}
resource "aws_subnet" "public_subnet" {
  count = length(var.subnet_cidrs)
  vpc_id = aws_vpc.eks_vpc.id
  cidr_block = var.subnet_cidrs[count.index]
}


variable "public_subnet_1_cidr" {
  type = string
}

variable "public_subnet_2_cidr" {
  type = string
}

resource "aws_vpc" "eks_vpc" {
  cidr_block = var.vpc_cidr
}
