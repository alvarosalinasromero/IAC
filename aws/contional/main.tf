/*

conditional expression.
?  symbol is used to separate the condition from the value to be returned if the condition is true.
:  if the condition is false.
*/


resource "aws_instance" "server" {
  ami           = "ami-02df5cb5ad97983ba"
  instance_type = var.environment == "pre" && var.region == "eu-north-1" ? "t3.large" : "t3.micro"
}

# resource "aws_instance" "server" {
#   ami           = "ami-02df5cb5ad97983ba"
#   instance_type = var.environment != "pro" ? "t3.large" : "t3.micro"
# }