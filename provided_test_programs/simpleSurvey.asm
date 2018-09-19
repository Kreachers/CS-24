# CS24, file:survey.s, Fall 2004, (c) Steve J. Hodges
# demonstrates:	static/const/global simple "string array"
	
.globl main			

.text				
main: 	li $v0, 4			# print greeting
	la $a0, greet		
	syscall

	li $v0, 5			# read int "i" (into $v0)
	syscall

	sll $v0, $v0, 4			# $v0 *= 16 (offset addr of i)

	la $a0, strings			# $a0 = strings[]
	add $a0, $a0, $v0		# $a0 = strings[i]

	li $v0, 4
	syscall
			
	li $v0, 10			# exit
	syscall
	
	
.data				

# use space to align entries every 16 bytes
strings: .asciiz "Superior\n"
	 .space 6
	 .asciiz "Above Average\n"
	 .space 1
	 .asciiz "Average\n"
         .space 7
	 .asciiz "Below Average\n"
	 .space 1
	 .asciiz "Unacceptable\n"
greet:	 .asciiz "Welcome to Survey. Your vote (0-4)?"
