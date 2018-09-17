.syntax unified
.global _start
.text

.thumb_func:
_start:
  ldr r0, =#0x60000000 //faster io to PAxx
  ldr r1, =#0x00000300 // set direction for 2 ports, aiming for PA09
  ldr r2, =#0x00000000
  str r1,[r0]
loop:
  str r1,[r0,#0x10]   // actual output
  ldr r3, =#0x00010000
  bl wait
  str r2,[r0,#0x10]
  ldr r3, =#0x00010000
  bl wait
  b loop

SysTick_Handler:
  b .

wait:
  subs r3, #0x0001
  bne wait
  mov pc, lr

