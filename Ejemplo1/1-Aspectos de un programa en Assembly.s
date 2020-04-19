@-----------------Aspecto de un programa en ARM Assembly-----------------------------


.data					/* Seccion de Datos*/

var1: .word 10
var2: .word 0x19A

.text					/*Seccion de Codigo*/
.global _start				/*Aqui comienza el programa*/

_start:                       
    ldr r0, punt_var1  		
    ldr r1, punt_var2  
    ldr r2, [r0]      
    str r2, [r1, r2]  
    bx lr

punt_var1: .word var1
punt_var2: .word var2


@----------------------------Observaciones-------------------------------------------

@Para comentar nuestro codigo podemos utilizar:
						@Comentario de linea
						/*Comentario de Bloque*/

@En la Seccion de Datos se almacenan en memoria las variables que vamos a utilizar
@En la Seccion de Codigo se encuentra nuestro codigo o datos no modificables


@ 		by Matias Vironi
@		Github:   https://github.com/mativironi/ej-asm-pi
@       	LinkedIn: https://www.linkedin.com/in/matias-vironi/
