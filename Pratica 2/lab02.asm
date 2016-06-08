.section .data

output: .ascii "O fabricante 'XXXXXXXXXXXX' foi identificado\n"

.section .text

.globl _start

_start:
	movl $0, %eax
	cpuid

_passo1:
	movl $output, %edi
	movl %ebx, 14(%edi) # posicao 23 da area apontada
	movl %edx, 18(%edi) # posicao 27 da area apontada
	movl %ecx, 22(%edi) # posicao 31 da area apontada
	
_passo2:
	# %eax contem o numero da system call
	# %ebx contem o descritor de arquivo a escrever
	# %ecx contem o inicio da string
	# %edx contem o tamanho da string

	movl $4, %eax
	movl $1, %ebx
	movl $output, %ecx
	movl $45, %edx
	int $0x80

_exit:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
	
