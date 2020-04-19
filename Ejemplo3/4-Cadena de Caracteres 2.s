@-------------------------------------------- Cadena de caracteres 2 -------------------------------------------

/*---------------------------------------- Problema 2 - Version 1 ----------------------------------------------
Realizar un programa que dado un vector de 16 halfword con signos, guarde en R1 el resultado de su promedio.
---------------------------------------------------------------------------------------------------------------*/

.data					/* Seccion de Datos*/

VEConSIG: .hword 10,9,7,10,8,6,5,9   	@ Ingreso 8 halfword con signo y las almaceno en memoria

.text					/*Seccion de Codigo*/
.global _start				/*Aqui comienza el programa*/

_start:
    MOV r3,#0           @ R3=0
    LDR r2,=VEConSIG    @ Carga en R2 la direccion de VEConSIG
While:                  @ Label While
    LDRSH r4,[r2]       @ Cargo en R4 el contenido del halfword R2
    ADD r1,r4           @ R1=R1+R4
    ADD r3,#1           @ R3=R3+1
    ADD r2,#2           @ R2=R2+2
    CMP r3,#8           @ R3-8 --> Luego Actualiza Banderas
    BNE While           @ Branch Condicional --> NE: Not Equal
    MOV r1,r1,asr #3    @ R1=R1/8
    STR r1,PROM         @ Remplaza el valor almacenado en PROM, por el contenido de R1 
	                
fin: b fin

PROM: .hword 0
      .align 1          @ Directiva que rellena con 2 bytes 

@----------------------------------------- Problema 2 - Version 2 ------------------------------------------------

.data					/* Seccion de Datos*/

VEConSIG: .hword 10,9,7,10,8,6,5,9   	@ Ingreso 8 halfword con signo y las almaceno en memoria

.text					/*Seccion de Codigo*/
.global _start				/*Aqui comienza el programa*/

_start:
    MOV r3,#8           @ R3=8
    LDR r2,=VEConSIG    @ Carga en R2 la direccion de VEConSIG
While:                  @ Label While
    LDRSH r4,[r2],#2    @ Cargo en R4 el contenido del halfword R2 --> Post Indexado
    ADD r1,r4           @ R1=R1+R4
    SUBS r3,#1          @ R3=R3-1 --> Luego Actualiza Banderas
    BNE While           @ Branch Condicional --> NE: Not Equal
    MOV r1,r1,asr #3    @ R1=R1/8
    STR r1,PROM         @ Remplaza el valor almacenado en PROM, por el contenido de R1
	                
fin: b fin

PROM: .hword 0
      .align 1          @ Directiva que rellena con 2 bytes

@-------------------------------------------------------Observaciones---------------------------------------------

@	1) La Version 2 es mas corta que la 1, por lo cual se ejecuta en menos ciclos de reloj

@ 			by Matias Vironi
@			Github:   https://github.com/mativironi/ej-asm-pi
@                   LinkedIn: https://www.linkedin.com/in/matias-vironi/