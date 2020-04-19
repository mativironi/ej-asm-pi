@---------------------------------------- Entrada y Salida de datos --------------------------------------------

@ En el siguiente ejemplo nuestro programa va a leer una cadena que ingresemos por el teclado y va a imprimir
@ los cuatro primeros caracteres de esa cadena.

.text					/*Seccion de Codigo*/
.global _start				/*Aqui comienza el programa*/

_start:
	MOV R7,#3           @ Syscall lectura desde el teclado
	MOV R0,#0           @ Flujo de entrada mediante teclado
	MOV R2,#13          @ Lee 13 caracteres
	LDR R1,=mensaje     @ Coloca la cadena a escribir en mensaje
	SVC 0
		
_write:
	MOV R7,#4           @ Syscall Salida por la pantalla
	MOV R0,#1           @ Usa el monitor como flujo de salida
	MOV R2,#5	        @ Longitud de cadena a escribir (5 caracteres)
	LDR R1,=mensaje     @ Imprimir cadena en mensaje
	SVC 0
		
end:
	MOV R7, #1          @ Salir de syscall
	SVC 0
		
.data					/* Seccion de Datos*/
mensaje:    .ascii " "  @ Podemos escribir 12 caracteres


@------------------------------------------------ Observaciones --------------------------------------------------

@	1) Usamos los comandos siguientes para compilar y enlazar:
/*          as -o ej3-7.o ej3-7.s 
            ld -o ej3-7 ej3-7.o
            ./ej3-7 ; echo $?
*/
@	2) Para la salida también necesitamos establecer parámetros
@		R0: Flujo de entrada (0: teclado)
@		R1: Dirección del búfer para guardar la cadena
@		R2: Numero de caracteres para leer
@		R7: Syscall (3 para leer desde el teclado)


@ 			by Matias Vironi
@			Github:   https://github.com/mativironi/ej-asm-pi
@                   LinkedIn: https://www.linkedin.com/in/matias-vironi/