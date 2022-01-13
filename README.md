# ARM code snippets

## Branching

### Simplest leaf branch
```assembly
  b address
```

### Simple leaf bl and return
```assembly
  bl address
  ...
  mov pc,lr
```
