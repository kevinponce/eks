resource "aws_vpc" "ecr_eks_vpc" {
  cidr_block       = "172.31.0.0/16"
  instance_tenancy = "default"

  enable_dns_hostnames = "true"
  enable_dns_support   = "true"
}
