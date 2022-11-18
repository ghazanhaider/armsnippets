
; Example Blinky for Keil/ARM/SAMD10-xplained
; 
; Not an easy way to import C-Based headers
; 


        AREA    START, CODE, READONLY
				ENTRY
Start			
                EXPORT  Start
				
				; Enable OUTPUT on port PA9
				LDR		R0, =0x41004400 ;PORT_BASE_ADDRESS
		    LDR		R1, =0x08 ;PORT_DIRSET_REG_OFST
				LDR		R2, =(1 << 9)  ;PORT_PA09
				STR		R2,[R0, R1]
				
				; Delay
				LDR		R3, =0x00010000
				
Loop			LDR		R1, =0x18 ;PORT_OUTSET_REG_OFST
				STR		R2,[R0, R1]
				BL		Delay
				LDR		R1, =0x14 ;PORT_OUTCLR_REG_OFST
				STR		R2,[R0, R1]
				BL		Delay
				B Loop
				
Delay			MOV		R4,R3
DelayLoop		SUBS	R4, #1
				BNE		DelayLoop
				MOV		PC,LR
				
				
Finish			B Finish				
			    
				END
