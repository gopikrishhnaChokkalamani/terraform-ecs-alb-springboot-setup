resource "aws_lb_target_group" "product-app-target-group" {
  deregistration_delay = "300"

  health_check {
    enabled             = "true"
    healthy_threshold   = "5"
    interval            = "30"
    matcher             = "200"
    path                = "/actuator/health"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = "5"
    unhealthy_threshold = "2"
  }

  ip_address_type                   = "ipv4"
  load_balancing_algorithm_type     = "round_robin"
  load_balancing_anomaly_mitigation = "off"
  load_balancing_cross_zone_enabled = "use_load_balancer_configuration"
  name                              = "product-app-target-group"
  port                              = "8080"
  protocol                          = "HTTP"
  protocol_version                  = "HTTP1"
  slow_start                        = "0"

  stickiness {
    cookie_duration = "86400"
    enabled         = "false"
    type            = "lb_cookie"
  }

  tags = var.common_tags

#  target_group_health {
#    dns_failover {
#      minimum_healthy_targets_count      = "1"
#      minimum_healthy_targets_percentage = "off"
#    }
#
#    unhealthy_state_routing {
#      minimum_healthy_targets_count      = "1"
#      minimum_healthy_targets_percentage = "off"
#    }
#  }

  target_type = "ip"
  vpc_id = data.aws_vpc.default.id
}
