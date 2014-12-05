#Author: Ahmed Fahmy (a7med.fahmy94@gmail.com)
#created on: 4-12-2014
#purpose: to input an integer, determine the grade,
#					then print the grade according to the following table
# 95 -> 100  =>  AA
# 90 -> 94   =>  A
# 85 -> 89   =>  BB
# 80 -> 84   =>  B
# 75 -> 79   =>  CC
# 70 -> 74   =>  C
# 50 -> 79   =>  D
# 0 -> 49    =>  F

#free to study,use,modify, and distribute

.data
	promptMsg: 	.asciiz "Enter your number: "
	AA: 				.asciiz "AA"
	A:  				.asciiz "A"
	BB: 				.asciiz "BB"
	B:  				.asciiz "B"
	CC: 				.asciiz "CC"
	C:  				.asciiz "C"
	D:  				.asciiz "D"
	F:  				.asciiz "F"
	Error: 			.asciiz "Not in 0 > 100"
.text

.globl main

main:

	#prompt the user
	li $v0 , 4
	la $a0 , promptMsg
	syscall



	#read int
	li $v0 , 5
	syscall

	#store that int in $s0
	addi $s0 , $v0 , 0

	# < 0 ?
	blt $s0 , $0 , error
	# < 50
	li $s1 , 50
	blt $s0 , $s1 , f
	# < 70
	li $s1 , 70
	blt $s0 , $s1 , d
	# < 75
	li $s1 , 75
	blt $s0 , $s1 , c
	# < 80
	li $s1 , 80
	blt $s0 , $s1 , cc
	# < 85
	li $s1 , 85
	blt $s0 , $s1 , bbb
	# < 90
	li $s1 , 90
	blt $s0 , $s1 , bb
	# < 95
	li $s1 , 95
	blt $s0 , $s1 , a
	# < 100
	li $s1 , 101
	blt $s0 , $s1 , aa
	# > 100 ??
	j error
aa:
	la $a0 , AA
	j exit

a:
	la $a0 , A
	j exit

bb:
	la $a0 , BB
	j exit

bbb:
	la $a0 , B
	j exit

cc:
	la $a0 , CC
	j exit

c:
	la $a0 , C
	j exit

d:
	la $a0 , D
	j exit

f:
	la $a0 , F
	j exit

error:
	la $a0 , Error

exit:
	#print the msg
	li $v0 , 4
	syscall

	li $v0 , 10
	syscall
.end


