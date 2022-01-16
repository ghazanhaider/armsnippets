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

### Light up an LED
```assembly
  // PIOA_PER enable
  ldr r0,=PIOA_BASE
  ldr r1,=PIOA_PER_P6_MASK
  str r1,[r0, #PIOA_PER_OFFSET]

  // PIOA_OER output enable
  str r1,[r0, #PIOA_OER_OFFSET]

  // PIOA_SODR/PIOA_CODR 1 or 0
  str r1,[r0, #PIOA_CODR_OFFSET]
```
