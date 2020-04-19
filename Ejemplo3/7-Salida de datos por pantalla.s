@ -----------------------------------------Salida de datos por pantalla ------------------------------------------

@ En el siguiente ejemplo vamos a imprimir en el bash el tradicional " Hola Mundo " programado en Assembly.

.data					/* Seccion de Datos*/
					/*Los datos son modificables*/
salu2: .ascii "Hola Mundo"


.text					/*Seccion de Codigo*/
.global _start				/*Aqui comienza el programa*/

_start:
	MOV R7,#4           @ Syscall Salida por la pantalla
	MOV R0,#1           @ Usa el monitor como flujo de salida
	MOV R2,#11          @ Longitud de cadena a escribir (12 caracteres)
	LDR R1,=salu2       @ Cargar registro con dirección de cadena
	SWI 0
		
end:
	MOV R7, #1          @ Salir de syscall
	SWI 0

@------------------------------------------------ Observaciones --------------------------------------------------

@	1) Usamos los comandos siguientes para compilar y enlazar:
/*          as -o ej3-7.o ej3-7.s 
            ld -o ej3-7 ej3-7.o
            ./ej3-7 ; echo $?
*/
@	2) Para la salida también necesitamos establecer parámetros
@		R0: Flujo de salida (1: monitor)
@		R1: Dirección de los caracteres a escribir.
@		R2: Número de caracteres para escribir
@		R7: Syscall (4 para escribir en la pantalla)


@ 			by Matias Vironi
@			Github:   https://github.com/mativironi/ej-asm-pi
@                   	LinkedIn: https://www.linkedin.com/in/matias-vironi/