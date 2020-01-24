/*-----------------------------Directivas de definición de cadena-----------------------------------*/

@ Asigna uno o más bytes de memoria en la sección actual y define el contenido inicial de la memoria
@ de una cadena literal.

@ Sintaxis:
@		.ascii "cadena"
@		.asciz "cadena"
@		.string "cadena"


/*------------------------------Directivas de definición de datos-----------------------------------*/

@ Estas directivas asignan memoria en la sección actual y definen el contenido inicial de esa memoria.

@ Sintaxis:
@		.byte expr  [, expr]	@ 1 byte  = 8 bits
@		.hword expr [, expr]	@ 2 bytes = 16 bits
@		.word expr  [, expr]	@ 4 bytes = 32 bits

/*--------------------------------Directivas que llenan espacios------------------------------------*/

@ La directiva .space emite un número(COUNT) de bytes de datos, cada uno de los cuales tiene un valor VALUE. 
@ Si se omite el argumento de VALUE, por defecto sera cero.

@ Sintaxis:
@ 		.space count [, value]
@ 		

@----------------------------------------Observaciones------------------------------------------------

@	1) La directiva .ascii no agrega un byte nulo al final de la cadena.
@	2) La directiva .asciz agrega un byte nulo al final de la cadena.
@	3) La directiva .string es un alias para .asciz.
@	4) La directiva .space emite un número de bytes de datos, cada uno de los cuales tiene un valor 
@	   VALUE. Si se omite el argumento de VALUE , el valor predeterminado es cero.
@	   Las directivas .skip y .zero son alias de la directiva .space.


@ 			by Matias Vironi
@			Github: https://github.com/mativironi/ej-asm-pi