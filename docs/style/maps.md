# Maps

We should prefer using `=` over `:` in maps

## Good

```hcl
common_tags = {
  Environment = "production"
}
```

## Bad

```hcl
common_tags = {
  Environment : "production"
}
```
