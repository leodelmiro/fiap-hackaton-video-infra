resource "aws_lb" "alb-usuario" {
  name               = "ALB-usuario"
  internal           = false
  load_balancer_type = "application"
  subnets            = data.aws_subnets.subnets.ids
  security_groups    = [aws_security_group.sg.id]
}

resource "aws_lb_listener" "listener-usuario" {
  load_balancer_arn = aws_lb.alb-usuario.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg-usuario.arn
  }
}

resource "aws_lb" "alb-recebe-video" {
  name               = "ALB-recebe-video"
  internal           = false
  load_balancer_type = "application"
  subnets            = data.aws_subnets.subnets.ids
  security_groups    = [aws_security_group.sg.id]
}

resource "aws_lb_listener" "listener-recebe-video" {
  load_balancer_arn = aws_lb.alb-recebe-video.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg-recebe-video.arn
  }
}

resource "aws_lb" "alb-gerencia-envio" {
  name               = "ALB-gerencia-envio"
  internal           = false
  load_balancer_type = "application"
  subnets            = data.aws_subnets.subnets.ids
  security_groups    = [aws_security_group.sg.id]
}

resource "aws_lb_listener" "listener-gerencia-envio" {
  load_balancer_arn = aws_lb.alb-gerencia-envio.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg-gerencia-envio.arn
  }
}