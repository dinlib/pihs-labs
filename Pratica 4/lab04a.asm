.section .data
	saida: .asciz "Soma: %d + %d + %d - %d = %d\n"
	n1: .int 10
	n2: .int 25
	n3: .int 5
	n4: .int 5
	v1: .int 10, 25, 5, 5
.section .bss
.lcomm res, 4
.section .text
.globl _start
_start:
	movl n3, %eax
	addl n2, %eax
	addl n1, %eax
	subl n4, %eax
	movl %eax, res
_passo1:
	pushl res
	pushl n3
	pushl n2
	pushl n1
	pushl n4
	pushl $saida
	
	call printf
	addl $25, %esp
_passo2:
	movl $v1, %edi	
	movl (%edi), %eax
	addl $4, %edi
	addl (%edi), %eax
	addl $4, %edi
	addl (%edi), %eax
	addl $4, %edi
	subl (%edi), %eax

	movl %eax, res
	
_passo3:
	pushl res
	pushl n3
	pushl n2
	pushl n1
	pushl n4
	pushl $saida
	call printf
	
	pushl $0
	call exit
