# CS24, Fall 2004, (c) Steve Hodges
# add two integers together
	
.globl main

.text
main: 	li $v0, 4		# print greeting
	la $a0, s_greet
	syscall

	li $v0, 4		# print prompt
	la $a0, s_prompt
	syscall			
	
	li $v0, 5		# read int
	syscall
	add $t0, $v0, $zero	# $t0 = first int

	li $v0, 4		# print prompt
	la $a0, s_prompt
	syscall			
	
	li $v0, 5		# read int
	syscall
	move $t1, $v0		# $t1 = second int
	
	add $t0, $t0, $t1	# t0 = num1 + num2

	li $v0, 4		# print result message
	la $a0, s_result
	syscall			
	
	li $v0, 1		# print int
	move $a0, $t0		# prepare $t0 to print
	syscall
	
	li $v0, 4		# print newline
	la $a0, s_newline
	syscall

	li $v0, 10		# exit
	syscall
	

.data
s_greet:	.asciiz "The Integer Sum program!\n"	
s_prompt:	.asciiz "Enter an integer: "
s_result:	.asciiz "The sum is: " 
s_newline:	.asciiz "\n"
