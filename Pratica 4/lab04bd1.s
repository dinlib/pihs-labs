.section .data

	abertura: .asciz "\nProgram\n"
	saida: .asciz "Soma: %d + %d - %d + %d - %d = %d\n"
	entradaX: .asciz "\nEntre com o valor de x = "
	entradaY: .asciz "\nEntre com o valor de y = "
	formato: .asciz "%d" #usado pelo scanf para saber 
			     #o tipo de dado a ser lido

	n1: .int 35
	n2: .int 25
	n3: .int 18
	x: .int 0
	y: .int 0
	res: .int 0

.section .text

.globl _start

_start:
	pushl $abertura
	call printf
	
	pushl $entradaX
	call printf
	pushl $x
	pushl $formato
	call scanf

	pushl $entradaY
	call printf
	pushl $y
	pushl $formato
	call scanf
	

	movl n1, %eax
	addl n2, %eax
	subl n3, %eax
	addl x, %eax
	subl y, %eax
	movl %eax, res

	pushl res
	pushl y
	pushl x
	pushl n3
	pushl n2
	pushl n1
	pushl $saida
	call printf

	addl $56, %esp
	
	pushl $0
	call exit
