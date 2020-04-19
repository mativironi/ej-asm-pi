@--------------------------------------------Carga de Registro (LDR)-------------------------------------------

@ LDR: Load Register

@ Sintaxis:
@	   LDR{type}{cond} Rt, [Rn {, #offset}]

.data					/* Seccion de Datos*/
					/*Los datos son modificables*/

var1 : .word 3			@Variable 1 en memoria
puntero_var1 : .word var1	@Variable 2 en memoria

.text					/*Seccion de Codigo*/
.global _start				/*Aqui comienza el programa*/

_start:                       
   	ldr r0, =puntero_var1	@Carga en R0 la Direccion de puntero_var1 	/* r0 <- &puntero_var1 */
	ldr r1, [r0]		@Carga en R1 el Contenido de puntero_var1 	/* r1 <- &var1 */ o /* r1 <- *r0 */
	ldr r2, [r1]		@Carga en R2 el Contenido de var1		/* r2 <- 3 */ o /* r2 <- *r1 */
	ldr r3, =var1		@Carga en R3 la Direccion de var1		/* r3 <- &var1 */ 
	ldr r4, adr_var		@Carga en R4 el Contenido de adr_var 		/* r4 <- &var1 */ o /* r4 <- *r0 */
	ldr r5, =number		@Carga en R5 la Direccion de number  		/* r5 <- &number */  
	ldr r6, number		@Carga en R6 el Contenido de number  		/* r6 <- 5 */ o /* r1 <- *number */
	
fin:	b fin

				/*Los datos no son modificables*/
						
adr_var: .word var1		@Direccion a var1 guardada aqui
number: .word 5			@Se almacena el valor 5


@------------------------------------------------Observaciones-------------------------------------------

@	1) ARM utiliza un modelo de Almacenamiento/Carga para el acceso a la memoria, lo que significa que solo las 
@ 	   instrucciones de carga/almacenamiento (LDR y STR) pueden acceder a la memoria.

@	2) Rt: es el registro para cargar
@	   Rn: es el registro en el que se basa la dirección de memoria.

@	3) Para cargar datos almacenados en memoria en la seccion de datos se utiliza =(Direccion) y [](Contenido)
@	   Para cargar datos almacenados en la seccion de codigo se utiliza =(Direccion) y variable(Contenido)

@ 			by Matias Vironi
@			Github:   https://github.com/mativironi/ej-asm-pi
@           		LinkedIn: https://www.linkedin.com/in/matias-vironi/
