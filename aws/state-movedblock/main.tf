# Resource 1 with moved block
# moved block is used to track resource movements
resource "null_resource" "demo1" {
  triggers = {
    version = "v1"
  }
}
moved {
  from = null_resource.demo
  to   = null_resource.demo1
}