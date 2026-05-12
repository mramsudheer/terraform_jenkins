resource "aws_instance" "jenkins" {
  for_each      = toset(var.instance_names)
  ami           = var.ami_id
  instance_type = var.instance_type
  # root_block_device {
  #     volume_size = 50
  # }
  root_block_device {
    volume_size = each.key == "Jenkins-Node" ? 50 : 20
  }
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group]

  #user_data = file("${path.module}/jenkins_user_data.sh")
  user_data = each.key == "Jenkins" ? file("${path.module}/jenkins_user_data.sh") : file("${path.module}/jenkins_node_user_data.sh")
  tags = {
    Name = each.key
  }
}
