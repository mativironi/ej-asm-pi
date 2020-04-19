@---------------------------Intrucciones de multiplicacion MUL,UMULL,SMULL------------------------------

@	MUL:   Multiplicacion con operandos de 32 bits con signo o sin signo, dando los 32 bits menos significativos del resultado.
@	UMULL: Unsigned Long Multiply, con operandos de 32 bits y resultado de 64 bits.
@	SMULL: Signed Long Multiply, con operandos de 32 bits y resultado de 64 bits.
		
@ Sintaxis:
@	   MUL{S}{cond} {Rd}, op1, op2
@	   UMULL{S}{cond} RdLo, RdHi, op1, op2
@	   SMULL{S}{cond} RdLo, RdHi, op1, op2

.data					/* Seccion de Datos*/

var1: .word 0x000010AC
var2: .word 0x00000006
var3: .word 0x006CA820


.text					/*Seccion de Codigo*/
.global _start				/*Aqui comienza el programa*/

_start:
	LDR r1,=var1		@Carga la direccion de var1 en R1
	LDR r1,[r1]		@Carga el contenido de var1 en R1
	LDR r2,=var2
	LDR r2,[r2]
	LDR r3,=var3
	LDR r3,[r3]
	       
	MUL r0,r1,r2		@Multiplicacion de 32 bits y resultado de 32 bits
	UMULL r4,r5,r1,r3	@Multiplicacion de 32 bits y resultado de 64 bits (Sin Signo)

	STR R5,label1		@Almaceno el contenido de R5 en la direccion de label1
	STR r4,label2		@Almaceno el contenido de R4 en la direccion de label2
	

label1: .word 0
label2: .word 0
	                
fin: b fin


@----------------------------------------Observaciones---------------------------------------------

@	1) RdLo se refiere al registro destino con los 32 bits menos significativos
@	2) RdHi se refiere al registro destino con los 32 bits mas significativos

@ 			by Matias Vironi
@			Github:   https://github.com/mativironi/ej-asm-pi
@           		LinkedIn: https://www.linkedin.com/in/matias-vironi/
