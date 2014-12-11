.data
	arr: .space 64
.text

.globl main

main:

la $s8 , arr
getNum:
	li $v0 , 5
	syscall
	addi $s0 , $v0 , 0
	sw $s0 , 0($s8)
	addi $s8 , $s8 , 4
	beq $s0 , 0 , exit
	j getNum
exit:
	li $v0 , 5
	syscall
	addi $s1 , $v0 , 0
	la $s8 , arr
	li $s2 , -1
loop:
	lw $s5 , 0($s8)
	addi $s8 , $s8 , 4
	addi $s2 , $s2 , 1
	beq $s5 , $0  , printMinusOne
	beq $s5 , $s1 , printIdx
	j loop
printIdx:
	addi $a0 , $s2 , 0
	li $v0 , 1
	syscall
	j finish
printMinusOne:
	li $a0 , -1
	li $v0 , 1
	syscall
finish:
	li $v0 , 10
	syscall
.end main