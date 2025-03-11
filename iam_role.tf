#resource "aws_iam_role" "ecs_task_execution_role" {
#  name = "productSvcECSTaskExecutionRole"
#  description = "ECS role with AmazonECSTaskExecutionRolePolicy & AmazonEC2ContainerServiceforEC2Role"
#  assume_role_policy = jsonencode({
#    Version = "2012-10-17"
#    Statement = [
#      {
#        Effect = "Allow"
#        Principal = {
#          Service = "ecs-tasks.amazonaws.com"
#        }
#        Action = "sts:AssumeRole"
#      }
#    ]
#  })
#
#  tags = var.common_tags
#}
#
## Attaching Policy to Role
#resource "aws_iam_role_policy_attachment" "ecs_task_execution_role_policy" {
#  role       = aws_iam_role.ecs_task_execution_role.name
#  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
#}
#
#resource "aws_iam_role_policy_attachment" "ecs_ec2_role" {
#  role       = aws_iam_role.ecs_task_execution_role.name
#  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
#}