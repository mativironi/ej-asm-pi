@---------------------------Operaciones logicas con AND,ORR,EOR,BIC------------------------------

@		AND:	Intruccion logica and
@		ORR:	Intruccion logica or
@		EOR:	Intruccion logica or exclusiva
@		BIC:	Intruccion bic clear
		
@ Sintaxis:
@		 AND{S}{cond}	dest, op1, op2 {, SHIFT_op #expression}
@		 ORR{S}{cond}	dest, op1, op2 {, SHIFT_op #expression}
@		 EOR{S}{cond}	dest, op1, op2 {, SHIFT_op #expression}
@		 BIC{S}{cond}	dest, op1, op2 {, SHIFT_op #expression}

.text					/*Seccion de Codigo*/
.global _start				/*Aqui comienza el programa*/

_start:                       
	mov	r0,#10			@1010 (binario)
	mov	r1,#6			@0110
	mov	r2,#15			@1111
		
	orr	r3,r1,r0 		@ R2 = R1 OR R0
	and	r4,r1,r0		@ R3 = R1 AND R0
	eor	r5,r1,r0		@ R4 = R1 XOR R0
	bic	r6,r1,#0b11111		@ R6 = R1 AND 000
		
	orr	r7,r0,#0b1111  		@Inicio los bits en 1
	and	r8,r0,#0b0000 		@Inicio los bits en 0 (Enmascaramiento)
	eor	r9,r0,#0b1010  		@Inicio los bits en 0
	eor	r10,r0,#0b0101 		@Inicio los bits en 1		

fin: b fin


@----------------------------------------Observaciones---------------------------------------------

@	1)Estas instrucciones nos permiten manipular cada bit
@	2)Con AND, Si el op2 es 0 el resultado sera 0
@	3)Con ORR, Si el op2 es 1 el resultado sera 1
@	4)Con EOR, Si el op2 es igual que el op1 el resultado sera 0
@	5)BIC es una operacion AND con la diferencia de que niega el op2

@ 			by Matias Vironi
@			Github:   https://github.com/mativironi/ej-asm-pi
@           LinkedIn: https://www.linkedin.com/in/matias-vironi/