@--------------------------------------Estructuras de Control WHILE---------------------------------

@ Un bucle ejecuta repetidamente un bloque de codigo, mientras se cumpla una determinada condicion.

@ Existen 2 formas de controlar un bucle: 
@   Por Contador: Conozco de antemano la cantidad de iteraciones (repeticiones).
@   Por Centinela: No conozco la cantidad de iteraciones.

@--------------------------------------------Ejemplo 1-------------------------------------------
.text					/*Seccion de Codigo*/
.global _start				/*Aqui comienza el programa*/
                    
_start:
    mov r0,#1           @ R0 = 1
    mov r1,#0           @ R1 = 0
WHILE:                  @ Label WHILE
    CMP r0,#128         @ R0-128 --> Luego Actualiza Banderas
    BEQ SALIR           @ Branch Condicional
    LSL r0,r0,#1        @ R0= R0 x 2
    ADD r1,r1,#1        @ R1 = R1 + 1
    B WHILE             @ Branch Incondicional
SALIR:                  @ Label SALIR

fin: b fin

@--------------------------------------------Ejemplo 2--------------------------------------------

.text					/*Seccion de Codigo*/
.global _start				/*Aqui comienza el programa*/
                    
_start:
    mov r1,#1           @ R0 = 1
    str r1,[sp,#-4]     @ Almaceno R1 en el stack sp(-4)
    mov r1,#0           @ R1 = 0
    str r1,[sp,#-8]     @ Almaceno R1 en el stack sp (-8)                                           

WHILE:                  @ Label WHILE
    ldr r1,[sp,#-8]     @ Carga en R1 el contenido del sp(-8)
    ADD r1,r1,#1        @ R1 = R1 + 1
    str r1,[sp,#-8]     @ Almaceno en R1 en el stack sp(-8)
    ldr r1,[sp,#-4]     @ Carga en R1 el contenido del sp(-4)
    LSL r1,r1,#1        @ Logical Shift Left (R0 = R0 * 2)
    str r1,[sp,#-4]     @ Almaceno en R1 en el stack sp(-4)
    CMP r1,#128         @ R0-128 --> Luego Actualiza Banderas
    BNE WHILE           @ Branch Condicional

fin: b fin

@----------------------------------------Observaciones---------------------------------------------

@   1) Si comparamos este codigo con un lenguaje de alto nivel como C, vemos que para ingresar al 
@      bloque "WHILE" la condicion se escribe de manera inversa en este caso.
@   2) En el ejemplo 1 trabajamos solo con registros por lo tanto es mas simple el codigo.
@   3) En el ejemplo 2 trabajamos con registros almacenando sus valores en el Stack.


@ 			by Matias Vironi
@			Github:   https://github.com/mativironi/ej-asm-pi
@                   	LinkedIn: https://www.linkedin.com/in/matias-vironi/