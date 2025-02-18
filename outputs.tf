# Provide information about server's public IP address
output "public_server_IP" {
  value = "${
    formatlist(
        "%s",
        aws_instance.public_server.public_ip
        # Not desired formatting, but could can extend
        # "%s:%s",
        # aws_instance.public_server.tags.Name,
        # aws_instance.public_server.public_ip
    )
  }"
}