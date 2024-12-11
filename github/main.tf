
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

resource "github_repository" "examplerepo" {
  name = "examplerepo"
}