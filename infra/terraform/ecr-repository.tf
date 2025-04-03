resource "aws_ecr_repository" "fiap-videos-usuario" {
  name                 = "${var.projectName}-usuario"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_repository" "fiap-videos-recebe-video" {
  name                 = "${var.projectName}-recebe-video"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_repository" "fiap-videos-gerencia-envio" {
  name                 = "${var.projectName}-gerencia-envio"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}