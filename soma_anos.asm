.data
ano1: .word 2005
ano2: .word 2005
msg: .asciiz "\n"

.text
.globl main
main:
    lw $t0, ano1
    lw $t1, ano2

    add $t2, $t0, $t1   

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 10
    syscall
