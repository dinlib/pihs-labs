# pihs-labs
repositório de aulas práticas da matéria Programação para Interfaceamento de Hardware e Software

# Gerando o executável
 - gere o objeto através do comando "as nomeArquivo.s -o nomeArquivo.o"
 - Link dinâmicamente com o comando "ld nomeArquivo.o -l c -dynamic-linker /lib/ld-linux.so.2 -o nomeArquivo"
 - Execute com o comando "./nomeArquivo"
 
# Depurando o programa
- gere o objeto através do comando "as -gstabs nomeArquivo.s -o nomeArquivo.o"
- Link dinâmicamente com o comando "ld nomeArquivo.o -l c -dynamic-linker /lib/ld-linux.so.2 -o nomeArquivo"
- Execute com o comando "gdb nomeArquivo"
