@----------------------------------------------- Cadena de Caracteres -------------------------------------------------

@ En esta seccion emplearemos el uso de las "Directivas de definicion de Cadenas", dicha cadena se recorrera byte
@ por byte, ya que se lo considera como un arreglo de caracteres con terminacion nula (\0).

@ ARM proporciona Load Byte (LDRB), Load Signed Byte (LDRSB) y Store Byte (STRB) para acceder a bytes individuales
@ en la memoria.

/*
    Instrucciones de carga/almacenamiento mas utilizadas:

    Loads   Stores  Size and Type
    LDR     STR     Word (32 bits)
    LDRB    STRB    Byte (8 bits)
    LDRH    STRH    Halfword (16 bits)
    LDRSB           Signed byte
    LDRSH           Signed halfword
    LDM STM         Multiple words
*/

@ Sintaxis:
@   LDR|STR {<size>}{<cond>} <Rd>, <addressing_mode>

/*--------------------------------------------------- Problema 1 ---------------------------------------------------
 Realizar un programa que dada una cadena con terminacion nula guardada en VECT, la pase a mayuscula, guardando 
 el resultado en el mismo vector VECT. 
 NOTA:la cadena de entrada solo contendra valores alfabeticos o espacio en blanco ('a' - 'z','A' - 'Z').
------------------------------------------------------------------------------------------------------------------*/

.data					/* Seccion de Datos*/

VECT: .asciz "aBcdeFG hIjk  LMNOpQrstuVwxyZ"    @ Ingreso la cadena y la almaceno en memoria

.text					/*Seccion de Codigo*/
.global _start				/*Aqui comienza el programa*/

_start:
    LDR r1,=VECT        @ Carga en R1 la direccion de VECT
While:                  @ Label While
    LDRB r2,[r1]        @ Cargo en R2 el contenido del byte R1
    CMP r2,#0           @ R2-0
    BEQ Findecadena     @ SI Z=1: Findecadena
    CMP r2,#' '         @ R2-32
    ADDEQ r1,#1         @ SI: Z=1: R1=R1+1
    BEQ While           @ SI: Z=1: Branch Condicional
    CMP r2,#'a'         @ R2-97
    SUBHS r2,r2,#0x20   @ SI: R2>=97: R2=R2-1
    STRB r2,[r1],#1     @ Almacena el contenido de R2 en R1, Luego el Registro Base se incrementa en 1 (PostIndex)
    B While             @ Branch Incondicional

Findecadena:            @ Label Findecadena
	                
fin: b fin

@-------------------------------------------------------Observaciones------------------------------------------------

@	1) La memoria direccionable por byte se organizan de forma Big-Endian o Little-Endian En ambos formatos, 
@      el byte mas significativo (MSB) de una palabra de 32 bits esta a la izquierda y el byte menos significativo
@      (LSB) esta a la derecha. Las direcciones de Word son las mismas en ambos formatos y se refieren a los mismos
@      cuatro bytes. Solo las direcciones de bytes dentro de una palabra difieren. 
@      En las maquinas Big-endian, los bytes se numeran comenzando con 0 en el extremo grande (mas significativo). 
@      En las maquinas Little-endian, los bytes se numeran comenzando con 0 en el extremo pequeno (menos significativo).

@   2) Los valores ASCII se dan en hexadecimal. Las letras minusculas y mayusculas difieren en 0x20 o (32 decimal).

@   3) El resultado de la cadena sera: " ABCDEFG HIJK  LMNOPQRSTUVWXYZ "

@ 			by Matias Vironi
@			Github:   https://github.com/mativironi/ej-asm-pi
@           LinkedIn: https://www.linkedin.com/in/matias-vironi/


