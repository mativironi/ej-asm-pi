@--------------------------------------Estructura de Control IF-----------------------------------

@		B{cond}	Branch Condicional
@		B 	Branch Incondicional

@----------------------------------------------Ejemplo 1-------------------------------------------

.text					/*Seccion de Codigo*/
.global _start				/*Aqui comienza el programa*/

_start:                 @						Codigo en C:     
	mov r0,#10	@ R0=10							int R0=10;	
	mov r1,#5	@ R1=5							int R1=5;
	cmp r0,r1	@ R0-R1 --> Luego Actualiza Banderas (Z=0)		int R3;
			@							if(R0==R1){	
			@ Si R0 != R1 Ejecuta SUB (No ingresa al if)			R3=R0+R1;
	BNE salto	@ Branch Condicional --> NE(NOT EQUAL)			}
	ADD r3,r0,r1	@ R3 = R0+R1						R3=R0-R1;
salto:			@ etiqueta salto
	SUB r3,r0,r1	@ R3 = R0-R1

fin: b fin

@----------------------------------------------Ejemplo 2-------------------------------------------

.text					/*Seccion de Codigo*/
.global _start				/*Aqui comienza el programa*/

_start:                 @						
	mov r0,#10	@ R0=10						
	mov r1,#5	@ R1=5							
	cmp r0,r1	@ R0-R1 --> Luego Actualiza Banderas (Z=0)		
		
	ADDEQ r3,r0,r1	@ Si (R0==R1) --> R3 = R0+R1 
	SUB r3,r0,r1	@ R3 = R0-R1

fin: b fin

@----------------------------------------Observaciones---------------------------------------------

@	1) Si comparamos este codigo con un lenguaje de alto nivel como C, vemos que para ingresar al 
@	   bloque "IF" la condicion se escribe de manera inversa en este caso.
@	2) El Ejemplo 1 realiza las mismas operaciones que el Ejemplo 2.
@	3) El Ejemplo 2 necesita menos ciclos de reloj que el Ejemplo1.

@ 			by Matias Vironi
@			Github:   https://github.com/mativironi/ej-asm-pi
@           		LinkedIn: https://www.linkedin.com/in/matias-vironi/
