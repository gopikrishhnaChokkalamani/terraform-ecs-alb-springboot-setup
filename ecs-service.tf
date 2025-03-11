resource "aws_ecs_service" "product-app-fargate-service" {
  name            = "product-app-fargate-service"
  cluster         = aws_ecs_cluster.product-app-cluster.id
  task_definition = aws_ecs_task_definition.product-app-fargate-task.arn
  #iam_role = ""
  desired_count   = 2
  #launch_type     = "FARGATE"
  platform_version    = "LATEST"
  scheduling_strategy = "REPLICA"

  deployment_maximum_percent         = "200"
  deployment_minimum_healthy_percent = "100"
  enable_ecs_managed_tags            = "true"
  enable_execute_command             = "false"
  health_check_grace_period_seconds  = "0"

  availability_zone_rebalancing = "ENABLED"

  capacity_provider_strategy {
    base              = "0"
    capacity_provider = "FARGATE"
    weight            = "1"
  }

  deployment_circuit_breaker {
    enable   = "true"
    rollback = "true"
  }

  deployment_controller {
    type = "ECS"
  }

  network_configuration {
    subnets          = data.aws_subnets.public_subnets.ids
    security_groups  = [aws_security_group.ecs_alb_security_group.id]
    assign_public_ip = true
  }


  load_balancer {
    container_name   = "product-application-container"
    container_port   = "8080"
    target_group_arn = aws_lb_target_group.product-app-target-group.arn
  }

#  alarms {
#    enable   = "false"
#    rollback = "false"
#    alarm_names {}
#  }

  tags = var.common_tags
}