

resource "local_file" "test" {
  content = "Hello world"
  filename = "${path.module}/test.txt"
}