# Valid module with dashes in directory name
resource "null_resource" "example" {
  triggers = {
    always_run = timestamp()
  }
}
