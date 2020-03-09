@------------------------------Instrucciones de Bifurcacion y Control B-BL-BX-BLX-------------------------------

@		B: 	Branch --> Salto simple a una función
@		BL:	Branch with Link --> Guarda (PC + 4) en LR y salta a la funcion
@		BX: 	Branch and exchange instruction set	      } BX / BLX se utiliza para intercambiar el  
@		BLX:	Branch with Link and exchange instruction set } conjunto de instrucciones de ARM a Thumb
		
@ Sintaxis:
@		 B{cond} label
@		 BL{cond} label
@		 BX{cond} Rm
@		 BLX{cond} Rm

                     
			

@-----------------------------------------------Observaciones--------------------------------------------------

@	1) label o etiqueta: es un símbolo que representa la dirección de una instrucción o datos literales.
@	2) cond: Es un código de condición opcional
@	3) Rm: Es un registro que proporciona la dirección a la que se ramifica.
@	4) Cuando saltamos a una etiqueta empleamos b.
@	5) Si queremos saltar a un registro lo hacemos con bx.
@	6) En los saltos condicionales añadimos dos letras a la (b/bx), mediante las cuales 
@	   condicionamos si se salta o no dependiendo del estado de los flags.
@	7) Las instrucciones BL y BLX copian la dirección de la siguiente instrucción en 
	   LR (R14, el registro de enlace).

@ 			by Matias Vironi
@			Github: https://github.com/mativironi/ej-asm-pii
