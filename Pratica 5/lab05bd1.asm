.section .data
	saida: .asciz "Res = (X + 10) * Z - (W/2) = (%d + 10) * %d - (%d/2) = %d\n"
	entradaX: .asciz "\nEntre com o valor de X = "
	entradaZ: .asciz "\nEntre com o valor de Z = "
	entradaW: .asciz "\nEntre com o valor de W = "
	formato: .asciz "%i"
	

	n1: .int 10
	n2: .int 2
	x: .int 0 
	z: .int 0 
	w: .int 0
	res: .int 0
.section .text
.globl _start

_start:
	pushl $entradaX
	call printf
	pushl $x
	pushl $formato
	call scanf

	pushl $entradaZ
	call printf
	pushl $z
	pushl $formato
	call scanf

	pushl $entradaW
	call printf
	pushl $w
	pushl $formato
	call scanf

	movl x, %eax
	addl n1, %eax
	movl z, %ebx
	movl $-0, %edx
	imull %ebx
	movl %eax, res
	movl w, %eax
	movl n2, %ebx
	movl $-0, %edi
	idivl %ebx
	subl %eax, res

	pushl res
	pushl w
	pushl z
	pushl x
	pushl $saida
	call printf

	addl $56, %esp

	pushl $0
	call exit
