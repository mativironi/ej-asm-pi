@--------------------------------------Estructuras de Control FOR---------------------------------

@ Un bucle ejecuta repetidamente un bloque de codigo, mientras se cumpla una determinada condicion.

@ Existen 2 formas de controlar un bucle: 
@   Por Contador: Conozco de antemano la cantidad de iteraciones (repeticiones).
@   Por Centinela: No conozco la cantidad de iteraciones.

@--------------------------------------------Ejemplo 1-------------------------------------------
.text					/*Seccion de Codigo*/
.global _start				/*Aqui comienza el programa*/
                    
_start:
    MOV r1,#0       @ R1=0
FOR:                @ Label FOR
    CMP r1,#10      @ R1-10 --> Luego Actualiza Banderas
    BGE SALIR       @ Branch Condicional -> Si (R1 >= 10), SALIR
    add r2,#10      @ R2 = R2+10
    ADD r1,r1,#1    @ R1 = R1 +1
    B FOR           @ Branch Incondicional
SALIR:              @ Label SALIR

fin: b fin

@--------------------------------------------Ejemplo 2--------------------------------------------

.text					/*Seccion de Codigo*/
.global _start				/*Aqui comienza el programa*/
                    
_start:
    MOV r1,#10      @ R1=10
FOR:                @ Label FOR
    add r2,#10      @ R2 = R2 + 10
    SUBS r1,r1,#1   @ Cuenta descendente, R1 = R1 - 1 --> Luego Actualiza Banderas
    BNE FOR         @ Branch Condicional --> Si (R1 == 0), salgo del bucle

fin: b fin

@----------------------------------------Observaciones---------------------------------------------

@   1) Si comparamos este codigo con un lenguaje de alto nivel como C, vemos que para ingresar al 
@      bloque "FOR" la condicion se escribe de manera inversa en este caso.
@   2) El bucle FOR es una variacion del bucle WHILE.
@   3) El ejemplo 2 es mas eficiente que el Ejemplo 1, ya que nos evitamos de colocar un Branch.


@ 			by Matias Vironi
@			Github:   https://github.com/mativironi/ej-asm-pi
@                   LinkedIn: https://www.linkedin.com/in/matias-vironi/