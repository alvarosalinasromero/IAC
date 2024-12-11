# Notes: To destroy a resource in terraform: terraform destroy -target github_repository.example1
#         To create a resource in terraform: terraform apply

# Configure the GitHub Provider
terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

# Configure token for github

provider "github" {
  token = "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"
}

# Create a repository

resource "github_repository" "example1" {
  name = "example1"
  description = "My awesome web page"
  visibility  = "private"

#   pages {
#     source {
#       branch = "master"
#       path   = "/docs"
#     }
#   }

}