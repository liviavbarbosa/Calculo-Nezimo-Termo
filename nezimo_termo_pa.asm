# Integrantes: Luiza Figueiredo, Livia Barbosa
# Tema: Cálculo para achar o nézimo termo de uma Progressão Aritmética (PA)

.data
A1: .word 2         # Define A1 como 2, o primeiro termo da PA
N: .word 5         # Define N como  5, o numero de termos da PA
R: .word 1         # Define R como 1, a razao da PA
msg:.asciiz "AN = "

.text
.globl main
main:
    lw $t0, A1 # Carrega o valor de 'A1' no registrador $t0
    lw $t1, N # Carrega o valor de 'N' no registrador $t1
    lw $t2, R # Carrega o valor de 'R' no registrador $t5

    sub $t3, $t1, 1     # divisao = N - 1 ($t3 = $t1 - 1)     
    mul $t4, $t3, $t2   # multiplicacao = (N - 1) * R ($t4 = $t3 * $t2)
    add $t5, $t0, $t4   # AN = A1 + (N - 1) * R ($t5 = $t0 + $t4)

    # Imprime a msg 
    la $a0, msg
    li $v0, 4
    syscall 
    
    # Imprime o resultado
    move $a0, $t5
    li $v0, 1
    syscall
end:
    move $v0, $t5        # Move o resultado (nézimo termo) para o registrador $v0 

    li $v0, 10           # Carrega o codigo de encerramento (10) no registrador $v0 
    syscall              # Executa a syscall para encerrar o programa