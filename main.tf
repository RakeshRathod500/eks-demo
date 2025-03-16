
module "vpc" {
  source                = "./modules/vpc"
  vpc_cidr             = var.vpc_cidr
  public_subnet_1_cidr = var.public_subnet_1_cidr
  public_subnet_2_cidr = var.public_subnet_2_cidr
  subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
}

module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
}

module "iam" {
  source        = "./modules/iam"
  eks_role_name = var.eks_role_name
}

module "eks" {
  source            = "./modules/eks"
  cluster_name      = var.cluster_name
  eks_role_arn      = module.iam.eks_role_arn
  vpc_id            = module.vpc.vpc_id
  subnet_ids        = module.vpc.subnet_ids
  security_group_id = module.security_group.security_group_id
}
