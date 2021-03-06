// VPC
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "main"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Name   = "172.31.0.0/16",
    Author = "user",
    Tool   = "Terraform",
    Environment = "devops-demo"
  }
}

// resource "aws_vpc" "main" {
//   cidr_block           = "172.31.0.0/16"
//   enable_dns_hostnames = true

//   tags = {
//     Name   = "172.31.0.0/16"
//     Author = "user"
//     Tool   = "Terraform",
//     Environment = "devops-demo"
//   }
// }

resource "aws_subnet" "main" {
  vpc_id     = "${module.vpc.vpc_id}"
  // cidr_block = "172.31.0.0/16"10.0.3.0/24
  cidr_block = "10.0.4.0/24"

  tags = {
    Name   = "172.31.0.0/16",
    Author = "user",
    Tool   = "Terraform",
    Environment = "devops-demo"
  }
}