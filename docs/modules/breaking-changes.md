# Breaking changes

This must be specified if the change will break any current usages of the module.

This is best implemented through deprecation first to add new/replacement functionality followed up with remove of the
now unused functionality.

When creating a breaking change - you **MUST** include a markdown document in the `docs/breaking-changes` directory. It
should be named `v<version>.md` where `<version>` is the new/breakign version. This document should explain the breaking
change and how to migrate to the new version.
