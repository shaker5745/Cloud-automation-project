module "network" {
  source          = "../../modules/aws-network"
  name            = var.name
  cidr_block      = var.cidr_block
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  azs             = var.azs
  tags            = var.tags
}

module "iam" {
  source = "../../modules/aws-iam"
  name   = var.name
  tags   = var.tags
}

module "eks" {
  source           = "../../modules/aws-eks"
  name             = "${var.name}-eks"
  subnet_ids       = concat(module.network.public_subnet_ids, module.network.private_subnet_ids)
  cluster_role_arn = module.iam.cluster_role_arn
  nodes_role_arn   = module.iam.nodes_role_arn
  tags             = var.tags
}

output "cluster_name"     { value = module.eks.cluster_name }
output "cluster_endpoint" { value = module.eks.cluster_endpoint }
