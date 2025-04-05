data "aws_caller_identity" "current" {}

data "aws_iam_role" "LabRole" {
  name = "LabRole"
}

data "aws_vpc" "vpc" {
  cidr_block = var.vpcCidr
}

data "aws_subnets" "subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
}

data "aws_subnet" "subnet" {
  for_each = toset(data.aws_subnets.subnets.ids)
  id       = each.value
}

data "aws_instance" "ec2" {
  depends_on = [aws_eks_node_group.node-group]

  filter {
    name   = "tag:eks:nodegroup-name"
    values = ["NG-${var.projectName}"]
  }

  filter {
    name   = "instance-state-name"
    values = ["running"]
  }
}

data "aws_security_group" "sg-eks" {
  depends_on = [aws_eks_node_group.node-group]

  tags = {
    "aws:eks:cluster-name" = "tech-fiap-app"
  }
}
