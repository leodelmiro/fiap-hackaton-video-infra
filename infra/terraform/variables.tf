variable "regionDefault" {
  default = "us-east-1"
}

variable "projectName" {
  default = "tech-hackathon-fiap"
}

variable "vpcCidr" {
  default = "172.31.0.0/16"
}

variable "instanceType" {
  default = "t3a.medium"
}

variable "accessConfig" {
  default = "API_AND_CONFIG_MAP"
}

variable "eksClusterVersion" {
  default = "1.30"
}

variable "eksNodeMinSize" {
  default = 1
}

variable "eksDesiredSize" {
  default = 1
}

variable "eksNodeMaxSize" {
  default = 2
}

variable "policyArn" {
  default = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
}
