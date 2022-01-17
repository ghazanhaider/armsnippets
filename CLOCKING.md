# Clocking

- Main oscillator (MAINCK) is 3MHz to 20MHz.
-- Connects to xtal (18.432 MHz)
-- Must be enabled first (bit MOSCEN/CKGR_MOR):
```assembly
  // Enable the main oscillator
  ldr r1, =PMC_BASE
  ldr r0, =0x801
  str r0, [r1, #CKGR_MOR_OFFSET]
```

- PLL clock (PLLACK/PLLBCK) inputs MAINCK
  - Set divider (DIVA/DIVB) between 1 and 255
  - Optionally set multiplier (MULA/MULB) 1-2047 (it adds 1 to this)
  - Set PLLCOUNT field in CKGR_PLLR in SCLK cycles before changing PLL fields
  - For ethernet, output 80MHz by mul 625 div 144
  - For USB, output 48MHz by mul 125 div 48
  - [Calculator](http://ww1.microchip.com/downloads/en/DeviceDoc/AT91SAM_pll.htm)
 ```assembly
  // PLLA 80MHz for Ethernet
  //  OUTA is 00 for 80MHz freq range
  //  PLLACOUNT 6
  //  MULA 624 (multiplier adds 1) = hex 270
  //  DIVA 144 = hex 90
  ldr r1, =PMC_BASE
  ldr r0, =0x22700690
  str r0, [r1, #CKGR_PLLAR_OFFSET]
```

- Master Clock (MCK) runs most peripherals and CPU
  - Select between SLCK,MAINCK,PLLACK,PLLBCK in PMC_MCKR
  - Prescaler divides it 1-64 (it adds 1)
  - Output after PREScaler goes to processor clock PCK
  - Divider MDIV further divides it 1-4
```assembly
  // Selecting PLLA
  ldr r1, =PMC_BASE
  ldr r0, =0x2
  str r0, [r1, #PMC_MCKR_OFFSET]
```

- Peripheral clocks can be enabled for each peripheral
  - Clock enable disable status regs are: PMC_PCER PMC_PCDR PMC_PCSR
  - Ethernet is peripheral number 21
```assembly
  // Enabling peripheral clock
  ldr r1, =PMC_BASE
  ldr r0, =0x00200000
  str r0, [r1, #PMC_PCER_OFFSET]
```

- USB clock takes input only from PLLB
  - PLLB must be 48MHz, 96MHz or 192MHz (Divider is 1-4)


- MDC is ethernet clock that must be 2.5MHz
  - MCK divided by 8,16,32,64 in EMAC_NCFGR (20MHz to 160MHz)

- Board has:
  - 18.432MHz at XIN XOUT
  - 32.768kHz at XIN32 XOUT32
  - 25MHz and 50MHz at the ethernet controller
