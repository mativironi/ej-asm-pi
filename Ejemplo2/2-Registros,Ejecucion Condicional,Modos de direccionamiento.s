/*-------------------------------------------------Registros ARM----------------------------------------------*/

@	General Purpose Registers

@		R0	-	Argument / return value / temporary variable
@	  	R1-R3   -	Argument / temporary variables
@	   	R4-R6   -	Saved variables
@		R7	-	Saved variables / Holds Syscall Number
@	   	R8-R10	-	Saved variables
@		R11	FP	Saved variables / Frame Pointer

@	Special Purpose Registers
	
@		R12	IP	Temporary variable / Intra Procedural Call
@		R13	SP	Stack Pointer
@		R14	LR	Link Register
@		R15	PC	Program Counter

/*-----------------------------------------------Ejecucion Condicional-----------------------------------------*/

@	EQ (Equal, igual). 				Cuando Z está activo (Z vale 1).
@	NE (Not equal, distinto).			Cuando Z está inactivo (Z vale 0).
@	MI (Minus, negativo). 				Cuando N está activo (N vale 1).
@	PL (Plus, positivo o cero). 			Cuando N está inactivo (N vale 0).
@ 	CS/HS (Carry set / Unsigned higher or same). 	Cuando C está activo (C vale 1).
@ 	CC/LO (Carry clear / Unsigend lower).		Cuando C está inactivo (C vale 0).
@	HI (Higher, mayor). 				Cuando C está activo y Z inactivo (C vale 1, Z vale 0).
@	LS (Lower or same, menor o igual).		Cuando C está inactivo ó Z activo (C vale 0 ó Z vale 1).
@	VS (Overlow set, desbordamiento activo). 	Cuando V está activo (V vale 1).
@	VC (Overlow clear, desbordamiento inactivo). 	Cuando V está inactivo (V vale 0).
@	GT (Signed Greater than, mayor). 		Cuando Z está inactivo y N=V (Z vale 0, N vale V).
@	LT (Signed Lower than, menor). 			Cuando N!=V (N vale not V).
@	GE (Signed Greater or equal, mayor o igual).	Cuando N=V (N vale V).
@	LE (Signed Lower or equal, menor o igual). 	Cuando Z está activo y N!=V (Z vale 1, N vale not V).

/*-----------------------------------------------Modos de direccionamiento--------------------------------------*/

@	Mode 		ARM Assembly 	   Address     Base Register

@	Offset 		LDR R0, [R1, R2]   R1 + R2 	Unchanged
@	Pre-index 	LDR R0, [R1, R2]!  R1 + R2 	R1 = R1 + R2
@	Post-index 	LDR R0, [R1], R2     R1 	R1 = R1 + R2

@------------------------------------------------------Observaciones----------------------------------------------

@	1) El operador R2 puede ser remplazado en los modos de direccionamientos por { Registro
@										     { Registro con desplazamiento
@										     { Inmediato 

@ 			by Matias Vironi
@			Github: https://github.com/mativironi/ej-asm-pii
