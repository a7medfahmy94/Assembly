.data
message1: 		.asciiz "Enter an integer:\n"
message2: 		.asciiz "Factorial of "
message2cont:	.asciiz " is:\n"

.text

printInt:
	li $v0 , 1
	syscall
	jr $ra

printStr:
	li $v0 , 4
	syscall
	jr $ra

readInt:
	li $v0 , 5
	syscall
	addi $v1 , $v0 , 0
	jr $ra


factorial:
	addi $v1 , $a0 , 0
	loop:
		addi $a0 , $a0 , -1
		beq $a0 , $zero , exit
		mul $v1 , $v1 , $a0
		j loop
	exit:
		jr $ra

.globl main

main:
	#arguments go in $a0, return value in $v1

	la $a0 , message1
	jal printStr

	jal readInt
	addi $s0 , $v1 , 0
	addi $a0 , $v1 , 0
	jal factorial

	la $a0 , message2
	jal printStr

	addi $a0 , $s0 , 0
	jal printInt

	la $a0 , message2cont
	jal printStr

	addi $a0 , $v1 , 0
	jal printInt

	li $v0 , 10
	syscall
.end

