# Module: Component

## Define component

Developer **MUST** use turo component module to define a component, and the resource name **MUST** prefix with `component_`.

```tf
module "component_good_foo_bar" {
  source  = "app.terraform.io/turo/component-metadata/null"
  version = "3.1.2"

  name            = "good-foo-bar"
  system_metadata = var.metadata_module.parent_system_metadata
}
```

## Locate the component

### Simple Component

The component definition block **MUST** sit in a terraform file named `<component-name>.tf`

For the above good-foo-bar example, the file name **MUST** be `good-foo-bar.tf`

### Component module

For complex component which has its own component module/folder, the component definition block **MUST** sit in the `main.tf` of the component module/folder.

For the above good-foo-bar example, the file **MUST** be `<component-name>-component/main.tf`.
