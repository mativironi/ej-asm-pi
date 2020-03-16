@----------------------Movimiento de Datos con MOV y MVN ---------------------------------

@	MOV: Transfiere el contenido del operando fuente al registro destino
@	MVN: Niega el operdando fuente y lo transfiere al registro destino
		
@ Sintaxis:
@	MOV{S}{cond}	dest, op1 {, SHIFT_op #expression}
@	MVN{S}{cond}	dest, op1 {, SHIFT_op #expression}

.text					/*Seccion de Codigo*/
.global _start				/*Aqui comienza el programa*/

_start:                       
	mvn	r0,#0b0011   @Transferencia de Inmediato Binario		
	mvn	r1,#0x002    @Transferencia de Inmediato Hexadecimal	/*-----MVN-----*/	
	mvn	r2,#1        @Transferencia de Inmediato Decimal		
	mvn	r3,#0										
	
	mov	r4,#0										
	mov	r5,#0x01
	mov	r6,#02	     @Transferencia de Inmediato Octal			
	mov	r7,r8        @Transferencia de Registro			/*-----MOV-----*/
	mov	r8,#'b'      @Trasnferencia de b minuscula
	mov	r9,r6,lsl #1 @Transferencia de Registro con desplazamiento		

fin: b fin			 @Bucle Infinito



@--------------------------------Observaciones---------------------------------------------

@	1) La unica seccion que obligatoriamente debe existir es la seccion de codigo
@	2) MVN realiza el complemento A1 del operando fuente
@	3) Todas las instrucciones ocupan 32 bits, por lo tanto es técnicamente imposible que 
@	   podamos cargar en un registro cualquier constante de 32 bits con la instrucción mov. 


@ 			by Matias Vironi
@			Github: https://github.com/mativironi/ej-asm-pi
