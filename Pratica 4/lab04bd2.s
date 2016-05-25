.section .data

	abertura: .asciz "\nProgram\n"
	saida: .asciz "Soma: %d + %d + %d = %d\n"
	entrada1: .asciz "\nEntre com o valor de 1 do vetor = "
	entrada2: .asciz "\nEntre com o valor de 2 do vetor = "
	entrada3: .asciz "\nEntre com o valor de 3 do vetor = "
	formato: .asciz "%d" #usado pelo scanf para saber 
			     #o tipo de dado a ser lido

	array: .int 0, 0, 0
	n1: .int 35
	n2: .int 25
	n3: .int 0
	res: .int 0

.section .text

.globl _start

_start:
	pushl $abertura
	call printf
	
	movl $array, %edi

	pushl $entrada1
	call printf
	pushl %edi
	pushl $formato
	call scanf
	addl $4, %edi	

	pushl $entrada2
	call printf
	pushl %edi
	pushl $formato
	call scanf
	addl $4, %edi
		
	pushl $entrada3
	call printf
	pushl %edi
	pushl $formato
	call scanf
	
	movl $array, %edi
	
	movl (%edi), %eax
	addl 4(%edi), %eax
	addl 8(%edi), %eax
	movl %eax, res
	
	pushl res
	pushl 8(%edi)
	pushl 4(%edi)
	pushl (%edi)
	pushl $saida
	call printf
	
	addl $60, %esp
	
	pushl $0
	call exit
