resource "aws_lb_target_group" "tg-usuario" {
  name        = "TG-usuario"
  port        = 80
  target_type = "instance"
  protocol    = "HTTP"

  vpc_id = data.aws_vpc.vpc.id

  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 30
    path                = "/actuator/health"
    port                = "traffic-port"
    matcher             = "200"
    timeout             = 5
    unhealthy_threshold = 2
  }
}

resource "aws_lb_target_group" "tg-recebe-video" {
  name        = "TG-recebe-video"
  port        = 80
  target_type = "instance"
  protocol    = "HTTP"

  vpc_id = data.aws_vpc.vpc.id

  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 30
    path                = "/actuator/health"
    port                = "traffic-port"
    matcher             = "200"
    timeout             = 5
    unhealthy_threshold = 2
  }
}

resource "aws_lb_target_group" "tg-gerencia-envio" {
  name        = "TG-gerencia-envio"
  port        = 80
  target_type = "instance"
  protocol    = "HTTP"

  vpc_id = data.aws_vpc.vpc.id

  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 30
    path                = "/actuator/health"
    port                = "traffic-port"
    matcher             = "200"
    timeout             = 5
    unhealthy_threshold = 2
  }
}

resource "aws_lb_target_group_attachment" "attach_usuario" {
  target_group_arn = aws_lb_target_group.tg-usuario.arn
  target_id        = data.aws_instance.ec2.id
  port             = 30080
  depends_on       = [aws_lb_target_group.tg-usuario]
}

resource "aws_lb_target_group_attachment" "attach_recebe-video" {
  target_group_arn = aws_lb_target_group.tg-recebe-video.arn
  target_id        = data.aws_instance.ec2.id
  port             = 30081
  depends_on       = [aws_lb_target_group.tg-recebe-video]
}

resource "aws_lb_target_group_attachment" "attach_gerencia-envio" {
  target_group_arn = aws_lb_target_group.tg-gerencia-envio.arn
  target_id        = data.aws_instance.ec2.id
  port             = 30082
  depends_on       = [aws_lb_target_group.tg-gerencia-envio]
}