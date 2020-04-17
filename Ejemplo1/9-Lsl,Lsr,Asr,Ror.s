@---------------------------Instrucciones de Desplazamiento y Rotacion LSL-LSR-ASR-ROR---------------------------

@ Las instrucciones de desplazamiento pueden ser logicas o aritmeticas.
@ 	LSL: Logical Shift Left
@	LSR: Logical Shift Right
@	ASR: Arithmetic Shift Right.

@ Las instrucciones de rotacion tambien desplazan, pero el bit que sale del valor se realimenta.
@	ROR: Rotate Right
@	RRX: Rotate Right with Extend

@ Sintaxis:
@		LSL{S}{cond} dest, op1, op2 {, SHIFT_op #expression}
@		LSR{S}{cond} dest, op1, op2 {, SHIFT_op #expression}
@		ASR{S}{cond} dest, op1, op2 {, SHIFT_op #expression}
@		ROR{S}{cond} dest, op1, op2 {, SHIFT_op #expression}

.data					/* Seccion de Datos*/
					/*Los datos son modificables*/

var1: .word 0b010100010111000		@ HEX 28B8, DEC 10424	
           
.text					/*Seccion de Codigo*/
.global _start				/*Aqui comienza el programa*/

_start:
     ldr r0, adr_var
     ldr r0,[r0]          
	mov r1,#2			@ r1 = 00000010
	mov r2,#3			@ r2 = 00000011
	mov r3,#-250			@ r3 = FFFFFF06 (HEX) 11111111111111111111111100000110
	
				@ Desplazamiento Logico a la izquierda						
	LSL r5,r1,#2			@ r5 = 00001000 (Desplaza a la izquierda 2 posiciones)
	LSL r6,r1,r2			@ r6 = 00010000 (Desplaza a la izquierda 3 posiciones)

				@ Desplazamiento Logico a la derecha
	LSR r7,r0,r2			@ r7 = 000010100010111 (Desplaza a la derecha 3 pociciones)

				@ Desplazamiento aritmetico a la derecha
	ASR r8,r3,r1			@ r8 = FFFFFFC1 (HEX) (Desplaza a la derecha 2 veces manteniendo el signo)

 				@ Rotacion a la derecha
	ROR r9,r0,#31			@ r8 = 0101000101110000 (Rota 1 vez a la izquierda)


fin: b fin


				/*Los datos no son modificables*/
						
adr_var: .word var1		@Direccion a var1 guardada aqui


@----------------------------------------Observaciones---------------------------------------------

@	1) Si no se especifica un shift(desplazamiento), por defecto es LSL #0
@	2) LSL multiplica por potencia de 2
@	3) LSR divide por potencia de 2
@	4) ASR divide por potencia de 2 y preserva el bit de signo


@ 			by Matias Vironi
@			Github:   https://github.com/mativironi/ej-asm-pi
@           LinkedIn: https://www.linkedin.com/in/matias-vironi/