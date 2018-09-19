# CS24 Helloworld sample program
#   with comments to explain basic MIPS/SPIM features
# Fall 2004, (c) Steve J. Hodges
	
.globl main			# export symbol
				# main should be labeled and exported
				# for your program to be executed

.text				# the text segment contains your code
main: 	add $v0,$zero,4		# 4 = code for print string
	la $a0, str		# $a0 "points" at string to print
	syscall			# transfer control to "os"

	li $v0, 10		# 10 = code for exit
	syscall			# to exit cleanly from the program

	
.data				# the data segment contains data
				# used by your program
str: 	.asciiz "hello world!\n"
