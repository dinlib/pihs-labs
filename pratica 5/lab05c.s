.section .data

pedido1: .asciz "\nTeste %d: Digite um valor inteiro -> "
formato1: .asciz "%d"
mostra1: .asciz "Teste %d: numero digitado = %d\n"
numero: .int 0

pedido2: .asciz "\nTeste %d: Digite um caractere -> "
formato2: .asciz "%c"
mostra2: .asciz "Teste %d: caractere digitado = %c\n"
tecla: .int 'A'

pedido3: .asciz "\nTeste %d: Digite uma string -> "
formato3: .asciz "%s"
mostra3: .asciz "Teste %d: string digitada = %s\n"
frase: .space 64

formatox: .asciz " %c" #despreza o <enter> e pega o próximo

pedido4: .asciz "\nTeste %d: Digite dois numeros:\n n1 = -> "
pedido5: .asciz " n2 = "
n1: .int 0
n2: .int 0

mostra4: .asciz "\nTeste %d: Numeros lidos: n1 = %d e n2 = %d\n"

mostra5: .asciz "\nTeste %d:  n1 = n2\n"
mostra6: .asciz "\nTeste %d:  n1 >= n2\n"
mostra7: .asciz "\nTeste %d:  n1 <= n2\n"
mostra8: .asciz "\nTeste %d:  Acabou as comparações!\n"

pedido6: .asciz "\nTeste %d: Quantos giros quer no loop? "
ngiros: .int 0 

mostra9: .asciz "Teste %d: Girando %d...\n"
mostra10: .asciz "Teste %d: Acabou o loop!\n\n"

.section .text

.globl _start

_start: #lendo um caractere
	pushl $1
	pushl $pedido2
	call printf


	pushl $tecla
	pushl $formato2
	call scanf
	
	pushl tecla
	pushl $1
	pushl $mostra2
	call printf

_passo2: #lendo um numero
	pushl $2
	pushl $pedido1
	call printf


	pushl $numero
	pushl $formato1
	call scanf
	
	pushl numero
	pushl $2
	pushl $mostra1
	call printf

_passo3: #lendo uma string
	pushl $3
	pushl $pedido3
	call printf


	pushl $frase
	pushl $formato3
	call scanf
	
	pushl $frase
	pushl $3
	pushl $mostra3
	call printf

_passo4: #lendo um caractere depois de numero e de string usando "%c"
	pushl $4
	pushl $pedido1
	call printf
	
	pushl $numero
	pushl $formato1
	call scanf

	pushl numero
	pushl $4
	pushl $mostra1
	call printf

	pushl $4
	pushl $pedido2
	call printf
	
	pushl $tecla
	pushl $formato2
	call scanf

	pushl tecla
	pushl $4
	pushl $mostra2
	call printf
	
	pushl $4
	pushl $pedido3
	call printf
	
	pushl $frase
	pushl $formato3
	call scanf

	pushl $frase
	pushl $4
	pushl $mostra3
	call printf

	pushl $4
	pushl $pedido2
	call printf
	
	pushl $tecla
	pushl $formato2
	call scanf

	pushl tecla
	pushl $4
	pushl $mostra2
	call printf

_passo5: #lendo um caractere depois de numero e de string usando " %c"
	pushl $5
	pushl $pedido1
	call printf
	
	pushl $numero
	pushl $formato1
	call scanf

	pushl numero
	pushl $5
	pushl $mostra1
	call printf

	pushl $5
	pushl $pedido2
	call printf
	
	pushl $tecla
	pushl $formatox
	call scanf

	pushl tecla
	pushl $5
	pushl $mostra2
	call printf
	
	pushl $5
	pushl $pedido3
	call printf
	
	pushl $frase
	pushl $formato3
	call scanf

	pushl $frase
	pushl $5
	pushl $mostra3
	call printf

	pushl $5
	pushl $pedido2
	call printf
	
	pushl $tecla
	pushl $formatox
	call scanf

	pushl tecla
	pushl $5
	pushl $mostra2
	call printf

_passo6: #testando je, jl e jmp. Outros: je, jne, jnz, jle, jg, jge, jcxz, jecxz
	pushl $6
	pushl $pedido4
	call printf

	pushl $n1
	pushl $formato1
	call scanf

	pushl $6
	pushl $pedido5
	call printf

	pushl $n2
	pushl $formato1
	call scanf
	
	pushl n2
	pushl n1
	pushl $6
	pushl $mostra4
	call printf

	movl n2, %ebx #%eax e %ecx sao alterados no printf. %ebx nao.
	cmpl n1, %ebx
	je saoiguais #aqui também serve o jz
	jl n2menorn1
	jmp n1menorn2

	saoiguais:
		pushl $6
		pushl $mostra5
		call printf
		jmp fim

	n2menorn1:
		pushl $6
		pushl $mostra6
		call printf
		jmp fim

	n1menorn2:
		pushl $6
		pushl $mostra7
		call printf
		jmp fim

	fim:
		pushl $6
		pushl $mostra8
		call printf

_passo7: #testando loop. ele utiliza o %ecx para decremento automatico até 0
	pushl $7
	pushl $pedido6
	call printf

	pushl $ngiros
	pushl $formato1
	call scanf
	movl ngiros, %ecx
	
	volta2:
		movl %ecx, %ebx #backup de %ecx, pois ele é alterado no printf
		pushl %ecx
		pushl $7
		pushl $mostra9
		call printf
		movl %ebx, %ecx
		loop volta2

		pushl $7
		pushl $mostra10
		call printf
_exit:
	pushl $0
	call exit
	


