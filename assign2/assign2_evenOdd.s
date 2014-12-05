#Author: Ahmed Fahmy (a7med.fahmy94@gmail.com)
#created on: 4-12-2014
#purpose: to input an integer, print it's even or odd

#free to study,use,modify, and distribute


.data
	oddMsg:  .asciiz "Odd"
	evenMsg: .asciiz "even"
.text

.globl main

main:

	#first we mark the section at which we start taking input
	input:
		#take input
		li $v0 , 5
		syscall
		#we have our int in $v0
		beq $v0 , $0 , exit #stopping condition
		#assume it's even
		la $a0 , evenMsg
		#compute $v0 % 2 in $s1
		li $s0 , 2
		rem $s1 , $v0 , $s0
		#if it's zero go print
		beq $s1 , $0 , print
		#else it's odd
		la $a0 , oddMsg
		print:
			li $v0 , 4
			syscall
			j input #take another round

	exit:

	li $v0 , 10
	syscall
.end