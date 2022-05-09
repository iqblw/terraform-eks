module "vpc" {
  source                        = "../module/vpc"
  vpc_cidr_block                = "10.230.0.0/19"
  public_subnet_cidr_block      = ["10.230.0.0/24", "10.230.1.0/24"]
  eks_private_subnet_cidr_block = ["10.230.8.0/22", "10.230.12.0/22"]
}

module "eks" {
  source                 = "../module/eks"
  vpc_id                 = module.vpc.vpc_id
  eks_subnet_id          = module.vpc.eks_subnet_id
}

module "ecr" {
  source = "../module/ecr"
}
  
module "bastion-host" {
  source            = "../Module/Bastion"
  vpc_id            = module.vpc.vpc_id
  public_subnet_id  = module.vpc.public_subnet_id
}
