.data
array: .word 4,3,9,5,2,1   
msg: .asciiz "\n"          

.text
.globl main
main:
    li $t6, 6         
    li $t7, 0          

outer_loop:
    li $t8, 0       

inner_loop:
    bge $t8, 5, end_inner   

 
    la $t1, array
    sll $t2, $t8, 2       
    add $t3, $t1, $t2
    lw $t0, 0($t3)

    
    addi $t9, $t8, 1
    sll $t2, $t9, 2
    add $t5, $t1, $t2
    lw $t4, 0($t5)

 
    slt $s0, $t4, $t0   
    beq $s0, $zero, no_swap

    sw $t0, 0($t5)
    sw $t4, 0($t3)

no_swap:
    addi $t8, $t8, 1
    j inner_loop

end_inner:
    addi $t7, $t7, 1
    blt $t7, $t6, outer_loop

    
    li $t8, 0
print_loop:
    bge $t8, $t6, end_program

    la $t1, array
    sll $t2, $t8, 2
    add $t3, $t1, $t2
    lw $a0, 0($t3)

    li $v0, 1
    syscall

    li $v0, 4
    la $a0, msg
    syscall

    addi $t8, $t8, 1
    j print_loop

end_program:
    li $v0, 10
    syscall
