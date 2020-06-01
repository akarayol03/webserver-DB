resource "aws_lb" "test" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = "sg-d3ca99b5"
  vpc_id             = "vpc-97e7b1f3"
  subnets            = ["${aws_subnet.public.*.id}"]

  enable_deletion_protection = true 

  tags = {
    Environment = "dev"
  }
}
