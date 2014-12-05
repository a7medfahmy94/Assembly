#Author: Ahmed Fahmy (a7med.fahmy94@gmail.com)
#created on: 4-12-2014
#purpose: to input an array of 5 integers, reverse the array,
#					then print the integers in reverse oreder

#free to study,use,modify, and distribute

.data

	arr:       .space 20 #array of 5 ints
	swapArray: .space 20 #array of 5 ints to be used in swapping

.text

.globl main

main:

	la $s0 , arr       #s0 = arr
	la $s3 , swapArray #s3 = swapArray
	li $s1 , 0         #s1 = counter = 0
	li $s2 , 5         #s2 = size = 5

#this is the input loop for taking 5 ints in array
inputLoop:

	#read int in v0
	li $v0 , 5
	syscall

	sw $v0 , ($s0) # M[s0] = v0
	addi $s0 , $s0 , 4 #s0 += 4
	addi $s1 , $s1 , 1 #s1++

	beq $s1 , $s2 , exitInputLoop #if counter == size then break

	j inputLoop #jump back to loop
exitInputLoop:

	#s0 is standing at the end of the array
	#bring it back to point to the last int (16th byte)
	addi $s0 , $s0 , -4

#now the counter == size (we will use it to exit the next loop)
#this loop reverses the array in the swapArray
swapLoop:
	lw   $s4 , ($s0) # temp = $s4 = M[s0]
	sw   $s4 , ($s3) # M[s3] = temp

	addi $s0 , $s0 , -4 # decrement array index
	addi $s3 , $s3 , 4 # increment swapArray index
	addi $s1 , $s1 , -1 # decrement counter

	beq $s1 , $0 , exitSwapLoop  #exit when the counter reaches zero
	j swapLoop #go back to loop

exitSwapLoop:


#this is the loop where we print the swapArray
#we can take another step before this loop
#in which we store back the swapArray in array and print it
#but i'm satisfied by printing the swapArray for now
#i'll use the counter($s1) again here , it's value is 0 from previous loop

la $s3 , swapArray #reposition $s3 at swapArray[0]

printLoop:
	lw $s4  , ($s3) #get the int to be printed

	#print block
	addi $a0 , $s4 , 0
	li $v0 , 1
	syscall

	addi $s3 , $s3 , 4 #next int
	addi $s1 , $s1 , 1 #increment counter
	beq $s1 , $s2 , exitPrintLoop #if counter == size
	j printLoop #jump back

exitPrintLoop:

	#exit program
	li $v0 , 10
	syscall
.end


