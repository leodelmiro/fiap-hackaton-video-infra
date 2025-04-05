resource "aws_security_group" "sg" {
  name        = "SG-${var.projectName}"
  description = "Security group para App"
  vpc_id      = data.aws_vpc.vpc.id

  ingress {
    description = "All"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["172.31.0.0/20"]
  }

  ingress {
    description = "NodePort"
    from_port   = 30080
    to_port     = 30082
    protocol    = "tcp"
    cidr_blocks = [for subnet_id in data.aws_subnets.subnets.ids : data.aws_subnet.subnet[subnet_id].cidr_block]
  }

  egress {
    description = "All"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group_rule" "ingress-sg-eks" {
  type              = "ingress"
  from_port         = 30080
  to_port           = 30082
  protocol          = "tcp"
  cidr_blocks       = [for subnet_id in data.aws_subnets.subnets.ids : data.aws_subnet.subnet[subnet_id].cidr_block]
  security_group_id = data.aws_security_group.sg-eks.id
}
