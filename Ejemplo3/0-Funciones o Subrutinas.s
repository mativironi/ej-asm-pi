@--------------------------------------- Funciones o Subrutinas ------------------------------------------

@ El Stack, es fundamental para el funcionamiento de las subrutinas.
@ El Stack Pointer apunta siempre a la palabra de memoria que corresponde a la cima de la pila.
@ El Stack tiene asociadas dos operaciones: Push y Pop.

@ Supongamos:	PUSH {R0}
@ La instrucción PUSH implementa las dos siguientes instrucciones:
@        sub sp,sp,#4    @ Decrementamos en 4 (1 palabra son 4 bytes) el registro SP.
@        str r0,[sp]     @ Almacena el contenido de R0 en la direccion de memoria de SP.

@ La instrucción POP implementa las dos siguientes instrucciones:
@        ldr r0,[sp]     @ Carga en R0 el contenido de SP.
@        add sp,sp,#4    @ Incrementamos en 4 el registro SP.

@------------------------------------------- LLamadas de Funciones --------------------------------------- 
@ Las funciones tienen entradas, llamadas argumentos, y una salida, llamada valor de retorno.

@ Cuando una función llama a otra deben acordar dónde colocar los argumentos y el valor de retorno.

@ El Caller, coloca hasta 4 argumentos en los registros R0–R3 antes de realizar la llamada a la función.

@ El Callee coloca el valor de retorno en el registro R0 antes de terminar.

@ El Caller almacena la dirección de retorno en el LR, al mismo tiempo que salta al Callee utilizando BL.

@ El Callee debe dejar los registros guardados (R4 – R11 y LR) y la pila


	MOV R0,#1
	MOV R1,#3
	MOV R2,#5
	MOV R3,#6
	BL DIFFOFSUMS 		@ Guarda en el LR la pocicion de memoria siguiente y el PC salta a la funcion.
fin: b fin
@ Fin de programa principal

@ Inicio de Subrutina
DIFFOFSUMS:
	PUSH {R4}  	  	@ Decrementamos en 4 el SP y Guarda el estado anterior de R4 en el Stack (R4=0)
	ADD R1,R0,R1  		@ R1 = R0+R1
	ADD R3,R2,R3  		@ R3 = R2+R3
	SUB R4,R1,R3  		@ R4 = R1-R3 -> Modifica el registro R4
	MOV R0,R4  	  	@ R0 = R4 -> El resultado de una función se devuelve a través del registro R0
	POP {R4}      		@ Carga en R0 el contenido de SP, luego incrementamos en 4 el registro SP
	MOV PC,LR    		@ Transfiere la direccion de LR a PC -> Me permite salir de la funcion

@-------------------------------------------- Observaciones ---------------------------------------------

@	1) Caller: Se refiere a la funcion llamadora. -> Invoca la funcion.
@	2) Callee: Se refiere a la funcion llamada.   -> Definicion de funcion.
@	3) Recordar que R0-R3 son registros no preservados.
@	4) Se utiliza BL, porque nos guarda el LR y nos permite retornar de la funcion al programa principal


@ 			by Matias Vironi
@			Github: https://github.com/mativironi/ej-asm-pi
