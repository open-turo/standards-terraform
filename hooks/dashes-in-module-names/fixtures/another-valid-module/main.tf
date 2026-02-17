# Another valid module with dashes
resource "null_resource" "another" {
  triggers = {
    value = "test"
  }
}
