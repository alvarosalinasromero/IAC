/*

- Configure environment variables
- set TF_LOG=INFO  (Windows environments)
- set TF_LOG=TRACE
- set TF_LOG=DEBUG
- set TF_LOG_PATH=debug.txt
- export TF_LOG=INFO (Linux environments)
- export TF_LOG_PATH=debug.txt
*/


resource "local_file" "name" {
  content = "Hello world"
  filename = "${path.module}/test.txt"
}