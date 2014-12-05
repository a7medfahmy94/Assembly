.data

.text

.globl main

main:
	#reading total time
	li $v0,6
	syscall
	#storing it in $f9
	li.s   $f9 , 0.0
	add.s $f9,$f0,$f9
	#reading affected time
	syscall
	#storing it in $f10
	li.s $f10 , 0.0
	add.s $f10,$f0,$f10
	#reading amount of improvement
	syscall
	#storing it in $f11
	li.s $f11 , 0.0
	add.s $f11,$f0,$f11
	#computing unaffected and storing it in $f9
	sub.s $f9,$f9,$f10
	#computing new time
	div.s $f10,$f10,$f11
	add.s $f12,$f9,$f10
	#printing answer
	li $v0,2
	syscall
	#program exits
	li $v0,10
	syscall

.end main
