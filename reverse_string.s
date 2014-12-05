#this was a practice in a lab
#input a string of 10 chars
#uppercase all lowercase letters
#output the result string

.data
	str: .space 10  #for storing the string

.text

.globl main

main:

  #input of string
	li $v0 , 8    #syscall code for inputting a string
	la $a0 , str  #system expects to find the address of
	              #the first byte to be read in $a0
	syscall       #do the system call based on the parameters above


	la $s0 , str         #now load the address of the first byte in $s0
	addi $s0 , $s0 , -1  #step backward i.e. str[-1]
	li $s7 , 97          #this is the first small letter ascii code 'a'
	li $s8 , 122         #this is the last small letter ascii code 'z'
looooop:
	addi $s0 , $s0 , 1        #step forward i.e. str[$s0+1]
	lb $s1 , ($s0)            #load byte from str i.e. current char
	beq $s1 , $0 , exit       #if it's NULL then exit
	blt $s1 , $s7 , looooop   #if it's less than 'a' get next char
	bgt $s1 , $s8 , looooop   #if it's greater than 'z' get next char
	addi $s1 , $s1 , -32      #'a'-'A' == 32 , so to "bring back" 'a' to 'A'
														#we have to subtract 32 from it
	sb $s1 , ($s0)						#store byte(char) after modification
	j looooop									#get next char
exit:

#printing the string
li $v0 , 4
la $a0 , str
syscall

	#exit the program
	li $v0 , 10
	syscall
.end


