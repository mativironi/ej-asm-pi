@---------------------------------------- Entrada minuscula Salida MAYUSCULA ----------------------------------------

@ En el siguiente ejemplo vamos a ingresar una letra minuscula por teclado y se imprimira la misma letra en mayuscula

.data					/* Seccion de Datos*/
caracter:  .ascii " "

.text					/*Seccion de Codigo*/
.global _start				/*Aqui comienza el programa*/

_start:
	MOV R7,#3               @ Syscall lectura desde el teclado
	MOV R0,#0               @ Flujo de entrada mediante teclado 
	MOV R2,#1               @ Lee 1 caracter
	LDR R1,=caracter        @ Coloca la cadena a escribir en caracter
	SVC 0
			
mayuscula:
	LDR R1,=caracter        @ Carga en R1 la direccion de caracter
	LDR R0,[R1]             @ Carga en R0 el contenido de R1
	BIC R0,R0, #32		    @ R0 = R0 AND NOT(100000)

			            @ Ejemplo:
                            @ a : 0110 0001
			                @   : 0010 0000
			                @ A : 0100 0001		
	
    STR R0,[R1]             @ Almacena el contenido de R0 en R1
		
escritura:
	MOV R7,#4               @ Syscall Salida por la pantalla
	MOV R0,#1               @ Usa el monitor como flujo de salida 
	MOV R2,#1               @ Longitud de cadena a escribir (1 caracter)	
	LDR R1,=caracter        @ Imprimir cadena en mensaje caracter
	SWI 0
		
end:
	MOV R7,#1               @ Salir de syscall
	SWI 0


@------------------------------------------------ Observaciones --------------------------------------------------



@ 			by Matias Vironi
@			Github:   https://github.com/mativironi/ej-asm-pi
@                   LinkedIn: https://www.linkedin.com/in/matias-vironi/