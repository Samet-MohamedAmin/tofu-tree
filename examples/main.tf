terraform {
  required_version = ">= 1.0"
  
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
  
  backend "local" {
    path = "terraform.tfstate"
  }
}

# Local file resources
resource "local_file" "config_files" {
  for_each = toset(["app", "db", "cache"])
  
  content  = "config for ${each.key}"
  filename = "${path.module}/configs/${each.key}.conf"
}

resource "local_file" "scripts" {
  for_each = {
    "deploy" = "#!/bin/bash\necho deploying"
    "backup" = "#!/bin/bash\necho backing up"
  }
  
  content  = each.value
  filename = "${path.module}/scripts/${each.key}.sh"
}

# Module with nested resources
module "nested_module" {
  source = "./modules/nested_module"
  
  environment = "test"
  services = {
    "web" = { port = 80, replicas = 2 }
    "api" = { port = 8080, replicas = 3 }
    "worker" = { port = 3000, replicas = 1 }
  }
}

# Another module instance
module "nested_module_staging" {
  source = "./modules/nested_module"
  
  environment = "staging"
  services = {
    "web" = { port = 80, replicas = 1 }
  }
}

# Direct nested resources
resource "local_file" "nested_docs" {
  for_each = {
    "readme" = "# Documentation"
    "changelog" = "# Changelog"
    "license" = "MIT License"
  }
  
  content  = each.value
  filename = "${path.module}/docs/${each.key}.md"
}

