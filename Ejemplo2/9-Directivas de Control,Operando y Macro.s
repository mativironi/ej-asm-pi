@---------------------------------------- Directivas de control ---------------------------------------------

@ .text y .data -> Sirven para delimitar las distintas secciones de nuestro modulo.

@ .end -> Marca el final del archivo Assembly.

@ .align -> (Alineamiento) es para alinear el siguiente dato, rellenando con ceros, de tal forma que comience 
@  en una direccion multiplo del numero que especifiquemos en alineamiento, normalmente potencia de 2.
@  Si no especificamos alineamiento por defecto toma el valor de 4 (alineamiento a palabra).
@ Ejemplo:
            a1 : .byte 25   /* definimos un byte con el valor 25 */
            .align          /* directiva que rellena con 3 bytes */
            a2 : .word 4    /* variable alineada a tamanio palabra */

@ .include -> Para incluir un archivo fuente dentro del actual.

@ .global -> Hace visible al enlazador el simbolo que hemos definido con la etiqueta del mismo nombre.

@---------------------------------------- Directivas de Operando --------------------------------------------

@ Se aplican a los datos en tiempo de compilacion. En general, incluyen las operaciones logicas &, |, ∼, 
@ aritmeticas +, -, *, /, % y de desplazamiento <, >, <<, >>:
@ Ejemplo:
            .equ pies, 9                /* definimos a 9 la constante pies */
            .equ yardas, pies / 3       /* calculamos las yardas = 3 */
            .equ pulgadas, pies * 12    /* calculamos pulgadas = 108 */
@ La directiva .equ (o .set) es utilizada para asignar un valor a una constante simbólica:
            .equ N, -3                  /* en adelante N se sustituye por -3 */

@------------------------------------------ Directivas de Macros --------------------------------------------

@ .macro -> es un conjunto de sentencias en ensamblador (directivas e instrucciones) que pueden aparecer 
@ varias veces repetidas en un programa con algunas modificaciones (opcionales).

@ Ejemplo: Supongamos que a lo largo de un programa realizamos varias veces la operación n^2+1 donde n y el 
@ resultado son registros. Para acortar el código a escribir podríamos usar una macro como la siguiente:

.macro CuadM1 input, aux, output    /* CuadM1 es el nombre y tiene 3 parametros (input, aux y output) */
    mul aux,input,input             /* aux = input x input */
    add output,aux,#1               /* output = aux + 1 */
.endm                               /* Fin de Macro */

@ Si posteriormente usamos la macro de la siguiente forma:
    CuadM1 r1, r8, r0
@ el ensamblador se encargará de expandir la macro, es decir, en lugar de la macro coloca:
    mul r8, r1, r1
    add r0, r8, #1

@----------------------------------------------Observaciones-------------------------------------------------

@ 			by Matias Vironi
@			Github:   https://github.com/mativironi/ej-asm-pi
@           LinkedIn: https://www.linkedin.com/in/matias-vironi/