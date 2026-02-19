module "networking" {
  source                    = "./modules/networking"
  vpc_cidr_block            = var.vpc_cidr_block
  azs                       = var.azs
  public_subnet_cidr_block  = var.public_subnet_cidr_block
  private_subnet_cidr_block = var.private_subnet_cidr_block
}