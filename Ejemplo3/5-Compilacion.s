@------------------------------------------------- Compilacion ---------------------------------------------------

@ En los ejemplos vistos anteriormente, utilizamos un debugger para poder analizar nuestro codigo linea por linea.

@ En los ejemplos siguientes, vamos a compilar nuestros programa. Esto nos permite convertir nuestro codigo en 
@ instrucciones de maquina, que seran ejecutadas por la misma.

/*-------------------------------------- Pasos para compilar en Raspbian ---------------------------------------*/
/* >Abrimos el terminal(Shell) y nos ubicamos donde se encuentra nuestro fichero. Ej: ej3-5.s    

    1)  as -o ej3-5.o ej3-5.s     @ Crea un archivo objeto
	2)	ld -o ej3-5 ej3-5.o       @ Crea un archivo ejecutable	
	3)  ./ej3-5 ; echo $?         @ Ejecuta 

Para facilitar la tarea de compilacion podriamos hacer un MAKEFILE. De esta forma evitamos tener que escribir los
mismos comandos una y otra vez. */                                                                       

.text					/*Seccion de Codigo*/
.global _start				/*Aqui comienza el programa*/

_start:
    MOV R0,#25      @ R0=25
    mov r7,#1       @ R7=1 -----> Salir de syscall
    SWI 0           @ Finaliza el programa y regresa a la terminal


@------------------------------------------------ Observaciones --------------------------------------------------

@	1) SWI significa Interrupción de SoftWare. Si R7 tiene un valor de 1, SWI sabe que debe salir al terminal. 
@   2) El valor almacenado en R7 es el número de Syscall. Dependiendo de cómo se configuren los diferentes 
@      registros, podemos llamar para que se invoquen otras rutinas o bibliotecas Raspbian.
@   3) Si se escribe: echo $? en el terminal se devuelve el valor almacenado en R0
@   4) SWI: interrupción de SoftWare
@      Sintaxis: 
@               SWI <sufijo> <número>
@   5) Entrada y salida
@      Para salir a la pantalla necesitamos establecer los parámetros tales como:
@         R0: flujo de salida (1: monitor)
@         R1: Dirección de los caracteres a escribir.
@         R2: Número de caracteres para escribir
@         R7: Syscall (4 para escribir en la pantalla)


@ 			by Matias Vironi
@			Github:   https://github.com/mativironi/ej-asm-pi
@                   LinkedIn: https://www.linkedin.com/in/matias-vironi/
