module "vpc" {
  source                        = "../Module/VPC"
}

module "eks" {
  source                 = "../Module/EKS"
  vpc_id                 = module.vpc.vpc_id
  public_subnet_id       = module.vpc.public_subnet_id
  eks_subnet_id          = module.vpc.eks_subnet_id
}

module "bastion-host" {
  source            = "../Module/Bastion"
  vpc_id            = module.vpc.vpc_id
  public_subnet_id  = module.vpc.public_subnet_id
}
