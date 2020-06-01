variable "aws_access_key" {
    default = "ACCESS"
}
variable "aws_secret_key" {
    default = "SECRET"
}
variable "aws_key_path" {
    default = "/root/terraform-ansible/terraform"
}
variable "aws_key_name" {
    default = "ansible"
}

variable "aws_region" {
    description = "EC2 Region for the VPC"
    default = "us-west-2"
}

variable "amis" {
    description = "AMIs by region"
    default = {
        us-west-2 = "ami-066e477209039595b"
    }
}
