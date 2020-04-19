@------------------------------------------- Enlace y Compilacion ------------------------------------------------

@ Un enlazador (linker) es un programa de sistema informático que toma uno o más archivos de objetos generados 
@ por un compilador o un ensamblador y los combina en un solo archivo ejecutable.

@ En esta seccion vamos a hacer dos programas en Assembly, luego vamos enlazarlos juntos y finalmente compilarlo.
@ Solo usaremos dos programas en Assembly, de todas formas se puede linkear multiples programas.

@---------------------------------------- Primer Programa (ej3-6a.s) --------------------------------------------

.text					/*Seccion de Codigo*/
.global _start				/*Aqui comienza el programa*/

_start:
    MOV R0,#25      @ R0=25
    MOV R1,#25      @ R1=25
    ADD R0,R0,R1    @ R0 = R0+R1
    B parte2        @ Branch Incondional

@--------------------------------------- Segundo Programa (ej3-6b.s) --------------------------------------------

.global parte2              /*Comienza la parte 2*/

parte2:
    MOV R7,#1      @ R7=1 -----> Salir de syscall
    SWI 0          @ Finaliza el programa y regresa a la terminal


@--------------------------------------------- Observaciones ----------------------------------------------------

@	1) Para linkear facilmente los dos programas, tenemos que colocarlos en el mismo directorio
@   2) En el ejemplo tenemos dos ficheros con el nombre de "ej1.s" y "ej2.s"
@   3) Usamos los comandos siguientes para compilar y enlazar:
/*          as -o ej3-6a.o ej3-6a.s 
            as -o ej3-6b.o ej3-6b.s 
            ld -o enlace ej3-6b.o ej3-6a.o
            ./enlace ; echo $?
*/

@ 			by Matias Vironi
@			Github:   https://github.com/mativironi/ej-asm-pi
@                   LinkedIn: https://www.linkedin.com/in/matias-vironi/

