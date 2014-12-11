.data
	str: .space 20

.text

.globl main

main:
	# input the string
	la $a0 , str
	li $v0 , 8
	syscall

la $s0 , str # i = $s0 = str
outerLoop:
	lb $s2 , 0($s0) #char at i
	lb $s4 , 1($s0) #char at i+1
	beq $s4 , 0 , exit #exit when i == n-1
	addi $s1 , $s0 , 1 # j = i + 1
innerLoop:
	lb $s3 , 0($s1) #char at j
	blt $s3 , $s2 , swap
endSwap: #set the stage before going for another iteration
	addi $s1 , 1
	lb $s3 , 0($s1)
	beq $s3 , $0 , preOuterLoop
	j innerLoop
swap:  #do the swapping
	sb $s3 , 0($s0)
	sb $s2 , 0($s1)
	addi $s2 , $s3 , 0
	j endSwap
preOuterLoop: #increment the i
	addi $s0 , 1
	j outerLoop

exit:
	# output the string
	li $v0 , 4
	syscall


	li $v0 , 10
	syscall

.end main