resource "aws_ecs_cluster" "product-app-cluster" {
  name = "product-app-cluster"
  setting {
    name  = "containerInsights"
    value = "disabled"
  }
  tags = var.common_tags
}