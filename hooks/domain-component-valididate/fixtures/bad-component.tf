module "foo_bar_component" {
  source  = "app.terraform.io/turo/component-metadata/null"
  version = "3.1.2"

  name            = "foo-bar"
  system_metadata = var.metadata_module.parent_system_metadata
}
