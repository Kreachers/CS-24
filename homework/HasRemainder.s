.data
word11to16:	.word 00000000001111110000000000000000
word0to26:	.word 11111111111111111111111111000000
vart1:	.word 01010101010101011011010010101011
vart0:	.word 10101010101010111010101011101010
			  
	
.text
.globl main

main:
	lw  $t0, vart0
	lw  $t1, vart1
	lw  $t2, word11to16
	and $t2, $t0, $t2
	srl $t2, $t2, 16
	lw  $t3, word0to26
	and $t1, $t1, $t3
	add $t1, $t1, $t3
	
	li $v0, 10
	syscall