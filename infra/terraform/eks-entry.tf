resource "aws_eks_access_entry" "access-entry" {
  cluster_name  = aws_eks_cluster.eks-cluster.name
  principal_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/voclabs"
  type          = "STANDARD"
}