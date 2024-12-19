module "vpc" {
  source          = "terraform-aws-modules/vpc/aws"
  name            = "nodejs-vpc"
  cidr            = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support  = true
  private_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets   = ["10.0.3.0/24", "10.0.4.0/24"]
  azs              = ["us-west-2a", "us-west-2b", "us-west-2c"]
  enable_nat_gateway = true
}
