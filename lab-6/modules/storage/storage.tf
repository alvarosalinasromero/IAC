
resource "aws_s3_bucket" "prod-encrypted-data-s3-bucket" {
  bucket = "my-unique-lab-bucket-123456"

  tags = {
    Name        = "Lab Bucket"
    Environment = "Dev"
  }
}