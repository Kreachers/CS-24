# CS24, file:oddeven.s, Fall 2004, (c) Steve J. Hodges
# demonstrates:	function with parameter and return value
#		if/else  control stucture
#		while loop  control structure	
#		(extra registers used to emphasize convention of usage)
	
.globl main			

.text				
main: 	li $v0, 4			# print greeting
	la $a0, s_greet		
	syscall

loop:	li $v0, 4			# print prompt
	la $a0, s_prompt		
	syscall		

	li $v0, 5			# read int (into $v0)
	syscall
	move $a0, $v0			# $a0 = <STDIN> integer

	beq $a0, $zero, done		# program done if input is 0

	li $v0, 1			# echo input value
	syscall
	jal fn_is_odd			# is_odd($a0)?

	beq $v0, $zero, even_case	# check return value (odd/even)

	li $v0, 4			# odd case
	la $a0, s_odd
	syscall
	j loop				# next loop iteration

even_case:				# even case
	li $v0, 4
	la $a0, s_even
	syscall			
	j loop				# next loop iteration
			
done:	li $v0, 4			# print bye message
	la $a0, s_bye	
	syscall		

	li $v0, 10			# exit
	syscall
	
# function is_odd 
# argument: integer value in $a0
# return value:	$v0=1 if $a0 is odd
#		$v0=0 if $a0 is even		

fn_is_odd:
	andi $v0, $a0, 1		# check lsb of $a0
	jr $ra				# return (0/1)

	
.data				
s_greet:	.asciiz "Welcome to the odd/even program!\n"
s_prompt:	.asciiz "Enter a number (0 to quit):"
s_odd:		.asciiz " is odd.\n"
s_even:		.asciiz " is even.\n"
s_bye:		.asciiz "Thanks for playing!\n"
