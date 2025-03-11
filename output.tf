output "security_group_id" {
  value = aws_security_group.ecs_alb_security_group.id
}

#output "iam_role_arn" {
#  value = aws_iam_role.ecs_task_execution_role.arn
#}

output "task_definition_arn" {
  value = aws_ecs_task_definition.product-app-fargate-task.arn
}

output "ecs_cluster_name" {
  value = aws_ecs_cluster.product-app-cluster.name
}

output "task_definition_id" {
  value = aws_ecs_task_definition.product-app-fargate-task.id
}

output "public_subnet_ids" {
  value = data.aws_subnets.public_subnets.id
}