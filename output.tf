output "instance_ids" {
  value = { for k, v in aws_instance.jenkins : k => v.id }
}

output "instance_public_ips" {
  value = { for k, v in aws_instance.jenkins : k => v.public_ip }
}
# or use the below code
# output "jenkins_instance_id" {
#   value       = aws_instance.jenkins["Jenkins"].id
#   description = "Jenkins Instance ID"
# }
# output "jenkins_public_ip" {
#   value       = aws_instance.jenkins["Jenkins"].public_ip
#   description = "Jenkins Public IP"
# }
# output "jenkins_instance_id" {
#   value       = aws_instance.jenkins["Jenkins-Node"].id
#   description = "Jenkins-Node Instance ID"
# }
# output "jenkins_public_ip" {
#   value       = aws_instance.jenkins["Jenkins-Node"].public_ip
#   description = "Jenkins-Node Public IP"
# }
