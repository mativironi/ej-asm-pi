@--------------------------------------------- Llamadas Multiples a Subrutinas ----------------------------------

@ Supongamos el siguiente codigo en C:

@        #include<stdio.h>

@        int llamo (int x,int y);

@        int main(){
@            int a=10;
@            int b=15;
@            int c;
@            int d;
@            c = llamo(b,a);
@            d = llamo(c,a);
@            return 0;
@        }

@        int llamo (int x,int y){
@            return (x+y);
@        }
@----------------------------------------------------------------------------------------------------------------
@ Podemos expresarlo en Assembly de la siguiente manera:

.text					/*Seccion de Codigo*/
.global _start				/*Aqui comienza el programa*/

_start:
        push    {fp, lr}                @ Mete FP y LR a la pila
        add     fp, sp, #4              @ FP = SP+4
        sub     sp, sp, #16             @ SP = SP-16
        mov     r3, #10                 @ R3 = 10
        str     r3, [fp, #-8]           @ Almacena el contenido de R3 en la direccion de memoria [FP-8]
        mov     r3, #15                 @ R3 = 15
        str     r3, [fp, #-12]          @ Almacena el contenido de R3 en la direccion de memoria [FP-12]
        ldr     r1, [fp, #-8]           @ Carga en R1 el contenido de [FP-8]
        ldr     r0, [fp, #-12]          @ Carga en R0 el contenido de [FP-12]
        bl      llamo                   @ Branch and Link (Primera llamada)
        ldr     r2, [fp, #-12]          @ Carga en R2 el contenido de [FP-12]
        ldr     r3, [fp, #-8]           @ Carga en R3 el contenido de [FP-8]
        sub     r3, r2, r3              @ R3 = R2-R3
        str     r3, [fp, #-16]          @ Almacena el contenido de R3 en la direccion de memoria [FP-16]
        ldr     r1, [fp, #-8]           @ Carga en R1 el contenido de [FP-8]
        ldr     r0, [fp, #-16]          @ Carga en R0 el contenido de [FP-16]
        bl      llamo                   @ Branch and Link (Segunda Llamada)
        mov     r3, #0                  @ R3 = 0
        mov     r0, r3                  @ R0 = R3
        sub     sp, fp, #4              @ SP = SP-4
        pop     {fp, lr}                @ Saca FP y LR de la pila
        bx      lr                      @ Branch and exchange instruction set

/* Inicio de Subrutina */
llamo:                                  @ Label llamo
        str     fp, [sp, #-4]!          @ Almacena el contenido de FP en la direccion de memoria [SP-4] (Pre-Index)
        add     fp, sp, #0              @ FP = SP+0
        sub     sp, sp, #12             @ SP = SP-12
        str     r0, [fp, #-8]           @ Almacena el contenido de R0 en la direccion de memoria [FP-8]
        str     r1, [fp, #-12]          @ Almacena el contenido de R1 en la direccion de memoria [FP-12]
        ldr     r2, [fp, #-8]           @ Carga en R2 el contenido de [FP-8]
        ldr     r3, [fp, #-12]          @ Carga en R3 el contenido de [FP-12]
        add     r3, r2, r3              @ R3 = R2+R3
        mov     r0, r3                  @ R0 = R3
        add     sp, fp, #0              @ SP = FP+0
        ldr     fp, [sp], #4            @ Carga en FP el contenido de [SP] (Post-Index)
        bx      lr                      @ Branch and exchange instruction set

@--------------------------------------------------Observaciones-------------------------------------------------

@	1) En este caso utilice el compilador -> https://godbolt.org/ para traducir de C a Assembly
@       2) Si bien el codigo es un poco mas largo de lo habitual, no es dificil interpretarlo con el debugger.
@       3) Utilizamos el registro R11(FP) Frame Pointer que se explica en el directorio Add.
@       4) Utilizamos BX LR que se explica en el directorio Add.
@       5) Tambien se emplean diferentes Modos de direccionamiento

@ 	    by Matias Vironi
@	    Github:   https://github.com/mativironi/ej-asm-pi
@           LinkedIn: https://www.linkedin.com/in/matias-vironi/