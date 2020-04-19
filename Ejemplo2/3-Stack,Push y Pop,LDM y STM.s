/*---------------------------------------------------Stack (Pila)---------------------------------------------------*/

@ Zona de memoria, organizada de forma LIFO (Last In, First Out), que el programa emplea principalmente para el
@ almacenamiento temporal de datos. Esta pila, definida en memoria, es fundamental para el funcionamiento de 
@ las rutinas.

@ El puntero de pila r13 o sp (stack pointer) apunta siempre a la palabra de memoria que corresponde a la cima 
@ de la pila (última palabra introducida en ella).

/*-------------------------------------------------PUSH y POP-------------------------------------------------------*/

@ La pila tiene asociadas dos operaciones: push (meter un elemento en la pila) y pop (sacar un elemento de la pila).

@ En la operación push primero decrementamos en 4 (una palabra son 4 bytes) el registro sp y luego escribimos dicho 
@ elemento en la posición de memoria apuntada por sp. Decimos que la pila crece hacia abajo, ya que cada vez que 
@ insertamos un dato el sp se decrementa en 4.

@ Para sacar elementos de la pila tenemos la operación pop, que primero extrae el elemento de la pila y luego 
@ incrementa el puntero (la pila decrece hacia arriba).

@ Ejemplo:
		push { r1, r2, r4 }
	/* codigo que modifica los registros r1, r2 y r4 */
		pop { r1, r2, r4 }
/*---------------------------------------------------LDM y STM ------------------------------------------------------*/
@	LDM: Load Multiple registers
@	STM: Store Multiple registers
	
@ Realmente, para el procesador ARM las instrucciones push y pop no existen.

@ Sin embargo tenemos las instrucciones stm y ldm que son mucho más potentes y el ensamblador permite las 
@pseudoinstrucciones push y pop que de forma transparente traducirá a stm y ldm.

@ Sintaxis:
@		ldm { modo_direc }{ cond } rn {!} , lista_reg
@ 		stm { modo_direc }{ cond } rn {!} , lista_reg

@ Ejemplo:
@		stmdb sp!, { r4, r6 } /* push */
@		ldmia sp!, { r4, r6 } /* pop */

@------------------------------------------------------Observaciones---------------------------------------------------

@	1) modo_direc --> Es cualquiera de los siguientes:

@ IA: Incrementa dirección después (increment after) de cada transferencia. Es el modo por defecto en caso de omitirlo.
@ IB: Incrementa dirección antes (increment before) de cada transferencia.
@ DA: Decrementa después (decrement after) de cada transferencia.
@ DB: Decrementa antes (decrement before) de cada transferencia.

@	2)  rn --> Es el registro base, el cual apunta a la dirección inicial de memoria donde se hará la transferencia. 
@	    El registro más común es sp (r13), pero puede emplearse cualquier otro.

@	3) ! --> Es un sufijo opcional. Si está presente, actualizamos rn con la dirección calculada al final de la operación.

@	4) lista_reg --> Es una lista de uno o más registros, que serán leídos o escritos en memoria. La lista va encerrada 
@	   entre llaves y separada por comas. También podemos usar un rango de registros.
	Ej: stmdb r1!, {r3-r6, r10, r12}

	
@ 			by Matias Vironi
@			Github:   https://github.com/mativironi/ej-asm-pi
@           		LinkedIn: https://www.linkedin.com/in/matias-vironi/
