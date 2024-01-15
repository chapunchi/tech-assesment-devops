resource "aws_elb" "web_lb" {
  name = "web-lb"
  security_groups = [var.security_group_id]
  subnets = [for subnet in var.public_subnets_list:subnet]

    cross_zone_load_balancing   = true
    health_check {
        healthy_threshold = 3
        unhealthy_threshold = 3
        timeout = 3
        interval = 30
        target = "HTTP:80/"
    }
    listener {
        lb_port = 80
        lb_protocol = "http"
        instance_port = "80"
        instance_protocol = "http"
    }
}


