module "component_good_foo_bar" {
  source  = "app.terraform.io/turo/component-metadata/null"
  version = "3.1.2"

  name            = "good-foo-bar"
  system_metadata = var.metadata_module.parent_system_metadata
}
