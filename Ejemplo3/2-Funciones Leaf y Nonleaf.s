@-------------------------------------------Funciones Leaf y Non-Leaf---------------------------------------------

@ >> Funcion Leaf(Hoja):   Es una función que no llama a otra. Este tema ya fue presentado en los ejemplos anteriores

@ >> Funciom Non-Leaf:     Es una función que llama a otras (Como una funcion anidada).

@ Las funciones Non-Leaf son algo más complicadas porque pueden necesitar guardar registros no preservados en la 
@ pila antes de llamar a otra función y luego restaurar esos registros después. Específicamente:

@       Regla de Almacenamiento de Caller: Antes de una llamada a función, El Caller debe guardar los registros no 
@       preservados (R0–R3 y R12) que necesita después de la llamada.

@       Regla de Almacenamiento de Callee: Antes de que el Callee perturbe cualquiera de los registros preservados 
@       (R4–R11 y LR), debe guardar los registros. Antes de que regrese, debe restaurar estos registros.
@-----------------------------------------------------------------------------------------------------------------
@ Codigo en C:
@    int f1(int a, int b) {
@        int i, x;
@        x = (a + b)*(a − b);
@        for (i=0; i<a; i++) x = x + f2(b+i);
@        return x;
@    }

@    int f2(int p) {
@        int r;
@        r = p + 5;
@        return r + p;
@    }
@-----------------------------------------------------------------------------------------------------------------
.text					/*Seccion de Codigo*/
.global _start				/*Aqui comienza el programa*/

_start:                 @ Supongamos los valores siguientes
    MOV R0,#5           @ R0=5
    MOV R1,#2           @ R1=2
    
F1:
    PUSH {R4, R5, LR}   @ Save preserved registers used by f1
    ADD R5, R0, R1      @ x = (a + b)
    SUB R12, R0, R1     @ temp = (a − b)
    MUL R5, R5, R12     @ x = x * temp = (a + b) * (a − b)
    MOV R4, #0          @ i = 0
FOR:
    CMP R4, R0          @ i < a?
    BGE RETURN          @ No: exit loop
    PUSH {R0, R1}       @ Save nonpreserved registers
    ADD R0, R1, R4      @ Argument is b + i
    BL F2               @ Call f2(b+i)
    ADD R5, R5, R0      @ x = x + f2(b+i)
    POP {R0, R1}        @ Restore nonpreserved registers
    ADD R4, R4, #1      @ i++
    B FOR               @ Continue for loop
RETURN:
    MOV R0,R5           @ Return value is x
    POP {R4, R5, LR}    @ Restore preserved registers
    MOV PC, LR          @ Return from f1
                        @ R0 = p, R4 = r
F2:
    PUSH {R4}           @ Save preserved registers used by f2
    ADD R4,R0,#5        @ r = p + 5
    ADD R0, R4,R0       @ Return value is r + p
    POP {R4}            @ Restore preserved registers
    MOV PC,LR           @ Return from f2

@--------------------------------------------------Observaciones-------------------------------------------------

@       1) F1: Es una funcion Non-Leaf y F2: es una funcion Leaf.
     

@ 			by Matias Vironi
@			Github:   https://github.com/mativironi/ej-asm-pi
@                   	LinkedIn: https://www.linkedin.com/in/matias-vironi/