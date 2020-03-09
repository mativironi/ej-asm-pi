@--------------------------------------Estructuras de Control SWITCH/CASE---------------------------------

@		B{cond}	Branch Condicional
@		B 	Branch Incondicional

@----------------------------------------------Ejemplo 1-------------------------------------------

.data					/* Seccion de Datos*/
					/*Los datos son modificables*/

var1 : .word 10			@Variable 1 en memoria


.text					/*Seccion de Codigo*/
.global _start				/*Aqui comienza el programa*/

_start:                       
   	ldr r0, =var1	@ Carga en R0 la Direccion de var1 
     	ldr r0,[r0]    @ Carga en R0 el Contenido de var1		   	
		
	CMP r0,#5	@ R0-5 --> Luego Actualiza Banderas (Z=0)		
	MOVEQ r1,#10	@ Si R0==5 --> Transferencia de Inmediato Decimal a R1
	BEQ listo	@ Branch Condicional

	CMP r0,#10	@ R0-10 --> Luego Actualiza Banderas (Z=1)
	MOVEQ r1,#20	@ Si R0==10 --> Transferencia de Inmediato Decimal a R1
	BEQ listo

	CMP r0,#15	@ R0-15 --> Luego Actualiza Banderas (Z=0)
	MOVEQ r1,#30	@ Si R0==15 --> Transferencia de Inmediato Decimal a R1
	BEQ listo

	MOV r1,#0	@ Default

	listo:		@ label

fin: b fin

@----------------------------------------Observaciones---------------------------------------------


@ 			by Matias Vironi
@			Github: https://github.com/mativironi/ej-asm-pi
