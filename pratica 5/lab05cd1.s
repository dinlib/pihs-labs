.section .data

pedidon1: .asciz "Digite dois numeros:\n n1 = "
pedidon2: .asciz " n2 = "
formato: .asciz "%d"
n1: .int 0
n2: .int 0

lidos: .asciz "Numeros lidos: n1 = %d e n2 = %d\n"
comp1: .asciz "n1 = n2\n"
comp2: .asciz "n1 >= n2\n"
comp3: .asciz "n1 <= n2\n"

mostranloop: .asciz "\nLaço %d\n"
fimloop: .asciz "\nFim das comparacoes\n"

fraseloop: .asciz "\nQuantos pares de numeros quer comparar? "
nloop: .int 0 

.globl _start

_start:
	pushl $fraseloop
	call printf

	pushl $nloop
	pushl $formato
	call scanf
	movl nloop, %ecx

	emloop:		
		movl %ecx, nloop
		pushl %ecx
		pushl $mostranloop
		call printf
		jmp comparacoes
		voltaloop:		
			movl nloop, %ecx
			loop emloop
		

		pushl $fimloop
		call printf
		jmp _exit 

	comparacoes:
		pushl $pedidon1
		call printf

		pushl $n1
		pushl $formato
		call scanf

		pushl $pedidon2
		call printf

		pushl $n2
		pushl $formato
		call scanf

		pushl n2
		pushl n1
		pushl $lidos
		call printf

		movl n2, %ebx
		cmpl n1, %ebx
		je saoiguais #aqui também serve o jz
		jl n2menorn1
		jmp n1menorn2

		saoiguais:
			pushl $comp1
			call printf
			jmp voltaloop

		n2menorn1:
			pushl $comp2
			call printf
			jmp voltaloop

		n1menorn2:
			pushl $comp3
			call printf
			jmp voltaloop


_exit:
	pushl $0
	call exit

