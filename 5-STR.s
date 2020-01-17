@--------------------------Almacenamiento de registro (STR)----------------------------

@	STR: Store Register

@	Sintaxis:
@		STR {type}{cond} Rt, [Rn {, #offset}]

.data					/* Seccion de Datos*/
					/*Los datos son modificables*/
label: .word 0x000012A4
label1: .word 0


.text					/*Seccion de Codigo*/
.global _start				/*Aqui comienza el programa*/

_start:   
		mov r5,#7 		@ Carga el valor 7 en el registro R5
		ldr r1,=label		@ Carga la direccion de memoria de label en R1
		ldr r0,[r1]		@ Carga el contenido del registro R1 en R0
		STR r5,[r0]		@ Almacena el contenido de R5 en la direccion de memoria de R0
		ldr r2,=label1		@ Carga la direccion de memoria de label1 en R5
		STR r5,[r2]		@ Almacena el contenido de R5 en la direccion de memoria de R2

		/*No se si la sentencia siguiente es una buena practica de programacion, pero funciona*/
		str r5, etiqueta	@ Remplaza el valor almacenado en etiqueta, por el contenido de R5
	
fin:	b fin

				/*Los datos no son modificables*/
etiqueta: .word 99						



@----------------------------Observaciones-------------------------------------------

@	1) Rt: es el registro para almacenar
@	   Rn: es el registro en el que se basa la dirección de memoria.

@	

@ 			by Matias Vironi
@			Github: https://github.com/mativironi/ej-asm-pi