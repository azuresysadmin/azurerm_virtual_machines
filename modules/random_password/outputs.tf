output "password_result" {
  value       = random_password.password.result
  sensitive   = true
  description = "The created password"
}
