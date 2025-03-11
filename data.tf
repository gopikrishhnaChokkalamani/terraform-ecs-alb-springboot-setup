data "aws_availability_zones" "available" {}

#data "aws_subnet" "us_east_1a" {
#  availability_zone = data.aws_availability_zones.available.names[0]
#}
#
##data "aws_subnet" "us_east_1b" {
##  availability_zone = data.aws_availability_zones.available.names[1]
##}
#
#output "us_east_1a_subnet_id" {
#  value = data.aws_subnet.us_east_1a.availability_zone
#}

#output "us_east_1b_subnet_id" {
#  value = data.aws_subnet.us_east_1b.availability_zone
#}

data "aws_subnets" "public_subnets" {
  filter {
    name   = "map-public-ip-on-launch"
    values = ["true"]
  }
  filter {
    name   = "availability-zone"
    values = ["us-east-1a", "us-east-1b"]
  }
}

data "aws_vpc" "default" {
  default = true
}

#
#data "aws_subnet" "public_subnet_details" {
#  for_each = toset(data.aws_subnets.public_subnets.ids)
#  id = each.value
#}
#
#output "public_subnet_info" {
#  value = { for id, subnet in data.aws_subnet.public_subnet_details :
#    id => subnet.availability_zone
#  }
#}

#output "all_availability_zones" {
#  value = data.aws_availability_zones.available
#}