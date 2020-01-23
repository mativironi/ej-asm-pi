@---------------------------Instrucciones de comparacion CMP-CMN-TST-TEQ------------------------------

@ Estas instrucciones realizan una operacion aritmetica o logica y luego 
@ actualizan las banderas de condicion de acuerdo al resultado

@ Las banderas de condicion son 4 y estan alojadas en el CPSR:
@						N: (Negative) -> Se activa cuando el resultado es negativo.
@						Z: (Zero)     -> Se activa cuando el resultado es cero
@						C: (Carry)    -> Indica acarreo en las operaciones aritmeticas
@						O: (Overflow) -> Desbordamiento aritmetico.


@ Sintaxis:
@		CMP {cond} op1, op2 {, SHIFT_op #expression}
@		CMN {cond} op1, op2 {, SHIFT_op #expression}
@		TST {cond} op1, op2 {, SHIFT_op #expression}
@		TEQ {cond} op1, op2 {, SHIFT_op #expression}

.text					/*Seccion de Codigo*/
.global _start				/*Aqui comienza el programa*/

_start:                       

	mov r0,#2		@ R0=2	Binario 000010
	mov r1,#1		@ R1=1	Binario 000001
	mov r2,#-2		@ R2=-2   Binario 111110
	
	CMP r0, #3		@ R0 - 3  --flags--> N=1
	CMP r0, r1		@ R0 - R1 --flags--> C=1

	
	CMN r0,r2		@ R0 + R2  --flags--> Z=1 y C=1
	TST r1,r2		@ R1 AND R2  --flags--> Z=1 y C=1
	TEQ r1,r0		@ R1 XOR R0 --flags--> C=1

	ADD r3,r0,r2	@ Operacion de addicion sin actualizacion de flags
	ADDS r4,r0,r2  @ Operacion de addicion con actualizacion de flags

fin: b fin


@----------------------------------------Observaciones---------------------------------------------

@	1) Otra forma de actualizar banderas es agregar despues de una operacion la letra "S"
@	2) TST: Test Bits			--> Actualiza Banderas despues de: op1 AND op2
@	3) TEQ: Test Equivalence		--> Actualiza Banderas despues de: op1 XOR op2
@	4) CMP: Compare			--> Actualiza Banderas despues de: op1 - op2
@	5) CMN: Compare Negative		--> Actualiza Banderas despues de: op1 + op2
@	6) Por defecto las banderas que no figuran en el codigo estan en 0

@ 			by Matias Vironi
@			Github: https://github.com/mativironi/ej-asm-pi