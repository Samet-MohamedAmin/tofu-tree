variable "environment" {
  description = "Environment name"
  type        = string
}

variable "services" {
  description = "Map of services to create"
  type = map(object({
    port     = number
    replicas = number
  }))
  default = {}
}

# Service configurations
resource "local_file" "service_configs" {
  for_each = var.services
  
  content = jsonencode({
    name     = each.key
    port     = each.value.port
    replicas = each.value.replicas
    env      = var.environment
  })
  
  filename = "${path.module}/configs/${var.environment}_${each.key}.json"
}

# Service deployments
resource "local_file" "service_deployments" {
  for_each = var.services
  
  content = <<-EOT
    deployment:
      name: ${each.key}
      replicas: ${each.value.replicas}
      port: ${each.value.port}
      environment: ${var.environment}
  EOT
  
  filename = "${path.module}/deployments/${var.environment}_${each.key}.yaml"
}

# Health checks
resource "local_file" "health_checks" {
  for_each = var.services
  
  content  = "health check for ${each.key} on port ${each.value.port}"
  filename = "${path.module}/health/${var.environment}_${each.key}_health.txt"
}

