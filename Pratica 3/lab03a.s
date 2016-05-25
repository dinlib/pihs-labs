.section .data
	output: .asciz "O ID do fabricante eh 'XXXXXXXXXXXX'\n"
.section .text
.globl _start

_start:
	movl $0, %eax
	cpuid
_passo1:
	movl $output, %edi
	movl %ebx, 23(%edi) # posicao 23 da area apontada
	movl %edx, 27(%edi) # posicao 27 da area apontada
	movl %ecx, 31(%edi) # posicao 31 da area apontada
_passo3:
	pushl $output
	call printf
	addl $4, %esp
_passo4:
	push $0
	call exit

