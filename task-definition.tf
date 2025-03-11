resource "aws_ecs_task_definition" "product-app-fargate-task" {
  family                   = "product-app-fargate-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "1024"  # CPU units (512 is 0.5 vCPU)
  memory                   = "3072" # Memory (3GB)
  execution_role_arn       = "arn:aws:iam::433240000570:role/ecsTaskExecutionRole"
  enable_fault_injection   = "false"

  runtime_platform {
    cpu_architecture        = "X86_64"
    operating_system_family = "LINUX"
  }

  container_definitions = jsonencode([
    {
      name      = "product-application-container"
      image     = "docker.io/gopikrishhna/springboot-for-aws:latest"
      cpu       = 1024
      memory    = 3072
      essential = true
      portMappings = [
        {
          containerPort = 8080
          hostPort      = 8080,
          name          = "product"
          protocol      = "tcp"
          appProtocol   = "http"
        }
      ]
      healthCheck = {
        # this is a happy path to make container always healthy,
        #ideally should be curl -f http://localhost:8080/actuator/health || exit 1
        command         = [ "CMD-SHELL", "exit 0" ]
        interval        = 30
        timeout         = 5
        retries         = 3
        startPeriod     = 60
      }
#      logConfiguration = {
#        logDriver = "awslogs"
#        options = {
#          "awslogs-group"         = "/ecs/product-app-fargate-task"
#          "awslogs-region"        = "us-east-1"
#          "awslogs-stream-prefix" = "ecs"
#        }
#      }
    }
  ])

  tags = var.common_tags
}