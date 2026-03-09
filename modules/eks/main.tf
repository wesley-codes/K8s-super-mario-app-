resource "aws_eks_cluster" "mario_cluster" {
  name = var.cluster_name

  access_config {
    authentication_mode = "API"
  }

  role_arn = var.eks_cluster_role_arn
  version  = var.eks_version
  vpc_config {
    subnet_ids = var.subnets_id
  }

}
