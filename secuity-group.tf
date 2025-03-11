resource "aws_security_group" "ecs_alb_security_group" {
  name        = "ecs_alb_security_group"
  description = "inbound traffic to 80 and 8080"

  ingress {
    description = "All 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow 8080"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # -1 implies all protocol in security group
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.common_tags

#  tags = {
#    app-name = "product-application-service-component"
#    component-name = "product-application-security-group"
#    environment-name = "dev"
#  }
}