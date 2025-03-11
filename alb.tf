resource "aws_lb" "product-app-alb" {
  name                = "product-app-alb"
  internal            = false
  load_balancer_type  = "application"
  security_groups     = [aws_security_group.ecs_alb_security_group.id]
  subnets             = data.aws_subnets.public_subnets.ids
  client_keep_alive   = "3600"
  idle_timeout        = "60"
  tags = var.common_tags
}
