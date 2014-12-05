.data

.text

.globl main

main:
	#reading the first param
	li $v0,6
	syscall
	#storing it in $f10
	li.s   $f10 , 0.0
	add.s $f10,$f0,$f10
	#reading the second param
	syscall
	#storing it in $f11
	li.s $f11 , 0.0
	add.s $f11,$f0,$f11
	#computing area in $f12
	mul.s  $f12,$f11,$f10
	#output the area
	li $v0,2
	syscall
	#computing the circumference in $f12
	add.s  $f12,$f11,$f10
	li.s   $f9,2.0
	mul.s  $f12,$f12,$f9
 	#print the circumference
	syscall
	#program exits
	li $v0,10
	syscall

.end main
