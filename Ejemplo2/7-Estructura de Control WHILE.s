@--------------------------------------Estructuras de Control WHILE---------------------------------

@ Un bucle ejecuta repetidamente un bloque de codigo, mientras se cumpla una determinada condicion.

@ Existen 2 formas de controlar un bucle: 
@   Por Contador: Conozco de antemano la cantidad de iteraciones (repeticiones).
@   Por Centinela: No conozco la cantidad de iteraciones.

@---------------------------------------Ejemplo1----------------------------------------------------

.text
.global _start

_start:
    mov r0,#1
    mov r1,#0

WHILE:
    CMP r0,#128
    BEQ SALIR
    LSL r0,r0,#1
    ADD r1,r1,#1 
    B WHILE
SALIR:

loop: b loop