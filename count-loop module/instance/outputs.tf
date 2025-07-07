
output "instance_ids" {
  description = "A list of IDs of the created EC2 instances."
  value       = aws_instance.this[*].id // este output devuelve una lista de IDs de las instancias EC2 creadas.
}