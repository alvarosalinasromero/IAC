terraform {
  backend "s3" {
    bucket = "buckettotfstate-007"
    key    = "production.tfstate"
    region = "eu-west-1"
    use_lockfile = true
  }
}