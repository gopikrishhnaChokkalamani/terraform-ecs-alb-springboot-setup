resource "aws_lb_listener" "product-app-listener" {
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.product-app-target-group.arn
  }
  load_balancer_arn                    = aws_lb.product-app-alb.arn
  port                                 = "80"
  protocol                             = "HTTP"
  routing_http_response_server_enabled = "true"
}