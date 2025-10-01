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

# Create a repository

resource "github_repository" "newrepo" {
  name = "newrepo"
  description = "My awesome web page"
  visibility  = "public"

#   pages {
#     source {
#       branch = "master"
#       path   = "/docs"
#     }
#   }

}