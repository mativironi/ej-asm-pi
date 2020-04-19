@---------------------------Operaciones aritmeticas con ADD,SUB y RSB------------------------------

@	ADD:	Microoperacion aritmetica de suma
@	SUB:	Microoperacion aritmetica de resta
@	RSB:	Microoperacion aritmetica de resta inversa
		
@ Sintaxis:
@	ADD{S}{cond} dest, op1, op2 {, SHIFT_op #expression}
@	SUB{S}{cond} dest, op1, op2 {, SHIFT_op #expression}
@	RSB{S}{cond} dest, op1, op2 {, SHIFT_op #expression}

.text					/*Seccion de Codigo*/
.global _start				/*Aqui comienza el programa*/

_start:                       
	mov		r0,#1
	mov		r1,#2
		
	add		r2,r1,r0         	@R2=R1+R0 (Adicion con registros)
	add		r3,r1,r0,lsl r0  	@R3=R1+R0*2 (Adicion con el operando 2 desplazado a la izquierda)
	add		r4,r1,#3		@R4=R1+3 (Adicion con inmediato)
	add		r5,r1,r0,lsl #2  	@R5=R1+R0*4
		
	sub		r7,r1,#2         	@R7=R1-2
	sub		r8,r0,r1         	@R8=R0-R1
	sub		r9,r1,r2,lsr r0  	@R9=R1-R2/2 (Sustraccion con el operando 2 desplazado a la derecha)
		
	rsb		r10,r0,r1        	@R10=R1-R0 (Sustraccion inversa con registro)
	rsb		r11,r5,#2        	@R11=2-R5 (Sustraccion inversa con inmediato)		

fin: b fin



@----------------------------------------Observaciones---------------------------------------------

@	1) el operando 2 puede ser un Registro,Inmediato o Registro con desplazamiento
@	2) LSL Logical Shift Left funciona como multiplicacion 2^n
@	3) LSR Logical Shift Right funciona como division 2^n sin mantener el bit de signo
@	4) ADD r0,r1 esto es igual a R0=R1+R1 


@ 			by Matias Vironi
@			Github:   https://github.com/mativironi/ej-asm-pi
@           		LinkedIn: https://www.linkedin.com/in/matias-vironi/
