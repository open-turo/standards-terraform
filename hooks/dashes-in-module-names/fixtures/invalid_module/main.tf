# Invalid module with underscores in directory name
resource "null_resource" "invalid" {
  triggers = {
    value = "should fail"
  }
}
