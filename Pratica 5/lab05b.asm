.section .data
saida: 
	.asciz "Teste %d: Resultado = %X\n\n"

saida2:
	.asciz "Teste %d: Quociente = %X e Resto = %X\n\n"

saida3:
	.asciz "Teste %d: Resultado = %X:%X\n\n"

.section .text

.globl _start

_start:
	movl $0x12340000, %eax
	movl $0x00005678, %ebx
	addl %ebx, %eax
	pushl %eax
	pushl $1
	pushl $saida
	call printf
_parte2:
	movl $0x10000000, %eax
	movl $0x00005678, %ebx
	addw %bx, %ax
	pushl %eax
	pushl $2
	pushl $saida
	call printf
_parte3:
	movl $0x10000000, %eax
	movl $0x00005678, %ebx
	addb %bl, %al
	pushl %eax
	pushl $3
	pushl $saida
	call printf
_part4:
	movl $0x10000000, %eax
	movl $0x00005678, %ebx
	addb %bl, %al
	pushl %eax
	pushl $4
	pushl $saida
	call printf
_parte5:
	movl $0x12345678, %eax
	movl $0x02045608, %ebx
	subl %ebx, %eax
	pushl %eax
	pushl $5
	pushl $saida
	call printf
_parte6:
	movl $0x12345678, %eax
	movl $0x12345678, %ebx
	subw %bx, %ax
	pushl %eax
	pushl $6
	pushl $saida
	call printf
_parte7:
	movl $0x12345678, %eax
	movl $0x12345678, %ebx
	subb %bl, %al
	pushl %eax
	pushl $7
	pushl $saida
	call printf
_parte8:
	movl $0x12345678, %eax
	movl $0x12345678, %ebx
	subb %bh, %ah
	pushl %eax
	pushl $8
	pushl $saida
	call printf
_parte9:
	movl $0xC, %eax
	incl %eax
	incw %ax
	incb %al
	pushl %eax
	pushl $9
	pushl $saida
	call printf
_parte10:
	movl $0xF, %eax
	decl %eax
	decw %ax
	decb %al
	pushl %eax
	pushl $10
	pushl $saida
	call printf
_parte11:
	movl $0, %edx
	movl $0x24682467, %eax
	movl $2, %ebx
	divl %ebx
	pushl %edx
	pushl %eax
	pushl $11
	pushl $saida
	call printf
_parte12:
	movl $0x00002468, %edx
	movl $0x00001234, %eax
	movl $0x24680, %ebx
	divl %ebx
	pushl %edx
	pushl %eax
	pushl $12
	pushl $saida
	call printf	
_parte13:
	movl $0, %eax
	movl $0, %edx
	movw $0x8817, %ax
	movw $0x8800, %bx
	divw %bx
	pushl %edx
	pushl %eax
	pushl $13
	pushl $saida
	call printf
_parte14:
	movl $0, %eax
	movl $0x1, %edx
	movw $0xFF17, %ax
	movw $0xFF00, %bx
	divw %bx
	pushl %edx
	pushl %eax
	pushl $14
	pushl $saida
	call printf
_parte15:
	movl $0, %eax
	movl $0, %edx
	movw $0x00F7, %ax
	movb $0xF0, %bl
	divb %bl
	movl %eax, %edx
	sarw $8, %dx
	pushl %edx
	andw $0x00FF, %ax
	pushl %eax
	pushl $15
	pushl $saida2
	call printf
_parte16:
	movl $0, %eax
	movl $0, %edx
	movw $0x01F7, %ax
	movb $0xF0, %bl
	divb %bl
	movl %eax, %edx
	sarw $8, %dx
	pushl %edx
	andw $0x00FF, %ax
	pushl %eax
	pushl $16
	pushl $saida2
	call printf
_parte17:
	movl $0x12345678, %eax
	movl $0x2, %ebx
	mull %ebx
	pushl %eax
	pushl %edx
	pushl $17
	pushl $saida3
	call printf
_parte18:
	movl $0xFFFFFFFF, %eax
	movl $0x2, %ebx
	mull %ebx
	pushl %eax
	pushl %edx
	pushl $18
	pushl $saida3
	call printf
_parte19:
	movl $0, %edx
	movl $0, %eax
	movw $0x5678, %ax
	movw $0x2, %bx
	mulw %bx
	pushl %eax
	pushl %edx
	pushl $19
	pushl $saida3
	call printf
_parte20:
	movl $0, %edx
	movl $0, %eax
	movw $0xFFFF, %ax
	movw $0x2, %bx
	mulw %bx
	pushl %eax
	pushl %edx
	pushl $20
	pushl $saida3
	call printf
_parte21:
	movl $0, %edx
	movl $0, %eax
	movb $0x78, %al
	movb $0x2, %bl
	mulb %bl
	pushl %eax
	pushl $21
	pushl $saida
	call printf
_parte22:
	movl $0, %edx
	movl $0, %eax
	movb $0xFF, %al
	movb $0x2, %bl
	mulb %bl
	pushl %eax
	pushl $22
	pushl $saida
	call printf
_exit:	
	pushl $0
	call exit
