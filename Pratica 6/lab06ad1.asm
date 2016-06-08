.section .data

pergunta: .asciz "\n\nDeseja Executar de Novo? <1> SIM ou <0> NÃO? -> "
tchau: .asciz "\nvlw flw\n\n"
pede_a: .asciz "\nDigite a -> "
pede_b: .asciz "\nDigite b -> "
pede_c: .asciz "\nDigite c -> "
mostra_a_b_c: .asciz "\na = %d, b = %d e c = %d\n"
todos_iguais: .asciz "\nA = B = C\n"
todos_diferentes: .asciz "\nA != B != C\n"
parcialmente_iguais: .asciz "\nA, B e C são parcialmente iguais\n"

a: .int 0
b: .int 1
c: .int 0
resp: .int 0
formato: .asciz "%d"
pulalin: .asciz "\n\n"

.section .text

.globl _start
_start:

volta:
	pushl $pulalin
	call printf

	pushl $pede_a
	call printf

	pushl $a
	pushl $formato
	call scanf

	pushl $pede_b
	call printf

	pushl $b
	pushl $formato
	call scanf

	pushl $pede_c
	call printf

	pushl $c
	pushl $formato
	call scanf
	
	pushl c
	pushl b
	pushl a
	pushl $mostra_a_b_c
	call printf

	addl $56, %esp

	movl b, %ebx
	cmpl a, %ebx
	
	je aigualb
	jne adiferenteb

aigualb:
	movl c, %ebx
	cmpl a, %ebx
	je todosiguais
	jne parcialmenteiguais
	
adiferenteb:
	movl c, %ebx
	cmpl a, %ebx
	je parcialmenteiguais
	jne todosdiferentes

todosiguais:
	pushl $todos_iguais
	call printf
	jmp fim

todosdiferentes:
	pushl $todos_diferentes
	call printf
	jmp fim

parcialmenteiguais:
	pushl $parcialmente_iguais
	call printf
	jmp fim	

fim:
	pushl $pergunta
	call printf

	pushl $resp
	pushl $formato
	call scanf
	movl resp, %eax

	cmpl $1, resp
	jz volta

	pushl $tchau
	call printf
	addl $4, %esp

	pushl $0
	call exit


	




