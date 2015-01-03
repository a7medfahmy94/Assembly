.data
	star: .asciiz "*"
	str: .asciiz "Hello World"
.text
################### paramter in the stack, return in $v1
is_small:
	lw $t0 , 0($sp)
	li $t1 , 97
	li $t2 , 122
	blt $t0 , $t1 , no
	bgt $t0 , $t2 , no
	li $v1 , 1
	jr $ra
	no:
		li $v1 , 0
		jr $ra

################### paramter in the stack
replace_small_letters:
	lw $s0 , 0($sp) # the address of the string -> $s0
	loop:
		lb $s1 , 0($s0) # current char in $s1
		beq $s1 , $0, exit

		addi $sp , $sp , -8 #reserve 4 bytes for $ra, 4 bytes for param to is_small
		sw $ra , 4($sp)
		sb $s1 , 0($sp)
		jal is_small
		lw $ra , 4($sp)
		addi $sp , $sp , 8 #release the stack pointer
		bne $v1 , $0 , replace
		continue:
			addi $s0 , $s0 , 1
			j loop

	replace:
		la $s3 , star
		lb $s4 , 0($s3)
		sb $s4 , 0($s0)
		j continue
	exit:
		jal $ra

###################
.globl main
main:
	la $s5 , str
	addi $sp , $sp , -4
	sw $s5 , 0($sp)
	jal replace_small_letters
	addi $sp , $sp , 4

	addi $a0 , $s5 , 0
	li $v0 , 4
	syscall

	#program termination
	li $v0 , 10
	syscall
.end