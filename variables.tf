variable "common_tags" {
  type = map(string)
  default = {
    app-name          = "product-application-service-component"
    component-name    = "product-application-security-group"
    environment-name  = "dev"
  }
}