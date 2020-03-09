@--------------------------------------Estructuras de Control IF-ELSE----------------------------------

@		B{cond}	Branch Condicional
@		B 	Branch Incondicional

@----------------------------------------------Ejemplo 1-------------------------------------------

.data					/* Seccion de Datos*/
					/*Los datos son modificables*/

var1 : .word 10			@Variable 1 en memoria
var2 : .word 5

.text					/*Seccion de Codigo*/
.global _start				/*Aqui comienza el programa*/

_start:                       
   	ldr r0, =var1	@ Carga en R0 la Direccion de var1 
        ldr r0, [r0]   	@ Carga en R0 el Contenido de var1		Codigo en C:     
	ldr r1,=var2	@ Carga en R1 la Direccion de var2			int R0=10;	
	ldr r1,[r1]	@ Carga en R1 el Contenido de var2			int R1=5;
	cmp r0,r1	@ R0-R1 --> Luego Actualiza Banderas (Z=0)		int R3;
			@							if(R0==R1){	
			@ Si R0 != R1 Ejecuta SUB (No ingresa al if)		   R3=R0+R1;
	BNE salto	@ Branch Condicional --> NE(NOT EQUAL)			}
	ADD r3,r0,r1	@ R3 = R0+R1						else{
	B salir		@ Branch Incondicional				 	   R3=R0-R1;
salto:			@ etiqueta salto					}
	SUB r3,r0,r1	@ R3 = R0-R1
salir:			@ eiqueta salir

fin: b fin

@----------------------------------------------Ejemplo 2-------------------------------------------

.data					/* Seccion de Datos*/
					/*Los datos son modificables*/

var1 : .word 10			@Variable 1 en memoria
var2 : .word 5

.text					/*Seccion de Codigo*/
.global _start				/*Aqui comienza el programa*/

_start:                       
   	ldr r0, =var1
        ldr r0, [r0]   							   
	ldr r1,=var2	 								
	ldr r1,[r1]	 							
	cmp r0,r1	@ R0-R1 --> Luego Actualiza Banderas (Z=0)		
		
	ADDEQ r3,r0,r1	@ ADD Si (R0 == R1) --> R3 = R0+R1 
	SUBNE r3,r0,r1	@ SUB Si (R0 != R1) --> R3 = R0-R1

fin: b fin

@----------------------------------------Observaciones---------------------------------------------

@	1) El Ejemplo 1 realiza las mismas operaciones que el Ejemplo 2.
@	2) El Ejemplo 2 es mas compacto y se ejecuta en menos ciclos de reloj que el Ejemplo1.
@	3) Como hemos visto anteriormente EQ(EQUAL), NE(NOT EQUAL).

@ 			by Matias Vironi
@			Github: https://github.com/mativironi/ej-asm-pii