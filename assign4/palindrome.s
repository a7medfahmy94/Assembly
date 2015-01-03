.data
message: .asciiz "Enter a string\n"
true:    .asciiz "Is palindrome"
false:   .asciiz "Not palindrome"
input:   .space 100
.text

#last char address is $a1 , first char address is at 0($a0)
is_palindrome:
	li $t3 , 10 #new line char
	repeated:
		lb $s0 , 0($a0)
		lb $s1 , 0($a1)
		beq $s0 , $t3 , success
		bne $s0 , $s1 , fail
		addi $a0 , $a0 , 1
		addi $a1 , $a1 , -1
		j repeated
	fail:
		li $v1 , 1
		jr $ra
	success:
		li $v1 , 0
		jr $ra

readStr:
	la $a0 , input
	li $v0 , 8
	syscall
	jr $ra

lastChar:
	addi $t0 , $a0 , 0
	loop:
		lb $s0 , 0($t0)
		beq $s0 , $zero , exit
		addi $t0 , $t0 , 1
		j loop
	exit:
		addi $v1 , $t0 , -2 #go back , skip the \0 and \n
		jr $ra

printMessage:
	li $v0 , 4
	syscall
	jr $ra


initBuffer:
	li $t0 , 0
	li $t1 , 100
	la $t2 , input
	while:
		beq $t0 , $t1 , out
		addi $t0 , $t0 , 1
		sb $zero , 0($t2)
		addi $t2 , $t2 , 1
		j while
	out:
		jr $ra

.globl main

main:
	#arguments goes in $a0 & $a1 , return in $v1

	jal initBuffer

	la $a0 , message
	jal printMessage

	jal readStr

	jal lastChar #last char address is now in $v1

	addi $a1 , $v1 , 0
	jal is_palindrome

	la $a0 , true
	beq $v1 , $zero , printSuccess
	la $a0 , false
printSuccess:
	jal printMessage

	li $v0 , 10
	syscall

.end


