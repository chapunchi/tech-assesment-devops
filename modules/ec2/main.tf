resource "aws_launch_configuration" "web" {
  name_prefix = "web-"
  image_id = "ami-0120e0e7231daa18b" 
  instance_type = "t2.micro"
  key_name = "deployer-key"
  security_groups = [ var.security_group_id ]
  associate_public_ip_address = true
  user_data = <<-EOF
  #!/bin/bash
  sudo yum update -y
  sudo yum install -y nginx
  sudo systemctl start nginx
  sudo systemctl enable nginx
  EOF

lifecycle {
    create_before_destroy = true
  }
}