output "hello_world" {
  value = "Hello, World!"
}

output "public_ip" {
  value = aws_instance.localstack.public_ip
}
