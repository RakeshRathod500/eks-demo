

variable "subnet_cidrs" {
  description = "List of subnet CIDR blocks"
  type        = list(string)
}
variable "vpc_cidr" {
  type = string
  description = "CIDR block for the VPC"
}
