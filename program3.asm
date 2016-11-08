	.ORIG	x3000
	LD	R4,Record
	LDR	R3,R4,#0
	LDI	R1,Head
	
Loop	LDR	R2,R1,#0
	JSR	Compare
	ADD	R5,R5,#0
	BRnz	Insert
	AND	R0,R0,#0
	ADD	R0,R0,R1
	LDR	R1,R1,#1
	BRnzp	Loop
	
Insert	STR	R4,R0,#1
	STR	R1,R4,#1

	LD	R0,LookUp
	LDI	R1,Head
	AND	R4,R4,#0
	AND	R6,R6,#0
	ADD	R6,R6,#1
	LDI	R4,Head	
	
Loop1	LDR	R2,R0,#0
	BRz	S1end
	LDR	R3,R1,#2
Cont	JSR	Compare
	ADD	R5,R5,#0
	BRnp	Break
	ADD	R0,R0,#1
	ADD	R1,R1,#1
	BRnzp	Loop1
	
Break	AND	R1,R1,#0
	ADD	R1,R1,R4			
	LDR	R1,R1,#1
	AND	R4,R4,#0
	ADD	R4,R4,R1
	BRz	NotF
	ADD	R6,R6,#1
	LD	R0,LookUp
	BRnzp	Loop1

NotF	AND	R6,R6,#0
Done	LD	R0,Rank
	STR	R6,R0,#0
	TRAP	x25
Compare	ST	R3,SaveR3
	NOT 	R3,R3
	ADD	R3,R3,#1
	AND	R5,R5,#0
	ADD	R5,R2,R3
	LD	R3,SaveR3
	JMP	R7
S1end	LDR	R3,R1,#2
	BRz	Done
	BRnzp	Cont
SaveR3	.FILL	0
Head	.FILL	x3500
Record	.FILL	x4500
LookUp	.FILL	x5500
Rank	.FILL	x54FF
	.END