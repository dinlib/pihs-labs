.section .data
	output: .asciz "O ID do fabricante eh '%s'\n"
.section .bss
.lcomm fabri, 16
.section .text
.globl _start
_start:
	movl $0, %eax
	cpuid
_passo1:
	movl $fabri, %edi
	movl %ebx, 0(%edi) #posicao 0 da area apontada
	movl %edx, 4(%edi) #posicao 4 da area apontada
	movl %ecx, 8(%edi) #posicao 8 da area apontada
	movl $0, 12(%edi)  #caractere final da string na 13 posicao 
			   #mas que ocupa os ultimos 4 bytes
_passo2:
	pushl $fabri
	pushl $output
	call printf
	popl %eax
	popl %eax
_exit:
	pushl $0
	call exit
