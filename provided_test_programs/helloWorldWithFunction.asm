# CS24 demonstration of simple function
# file:	hellofn.s, Fall 2004, (c) Steve J. Hodges
.globl main			
.text				
main: 	jal fn_ln		# function call
	addi $v0, $zero, 4	# 4 = print string
	la $a0, str		
	syscall			
	jal fn_ln
	li $v0, 10		# 10 = exit
	syscall		
	# ----------
fn_ln:	li $v0, 4		# 4 = print string
	la $a0, newline
	syscall
	jr $ra			# return
.data				
str:		.asciiz "hello world!"
newline:	.asciiz "\n"

