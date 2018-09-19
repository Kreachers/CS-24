# CS24 Simulation of Multiplication
# Fall 2004, (c) Steve J. Hodges
# implementing unsigned (16bit) multiply with "shift and add" textbook 
v3
# $s0 is muliplicand  $s1 is muliplier & product  $s2 is loop counter -- 
it is set initially to number of bits to mult  $s3 is a temp

.globl main

.text
main:    addi $s2, $zero, 16           # loop per bits                
         addi $v0, $zero, 4            # print_string code
         la   $a0, str_title
         syscall                       # print title
         addi $v0, $zero, 5            # read_int code
         syscall
         add $s0, $zero, $v0           # store muliplicand
         sll $s0, $s0, 16              # temp (top16) = Mcand
         addi $v0, $zero, 5            # read_int code
         syscall
         add $s1, $zero, $v0           # store muliplier into bottom of 
prod(<16bit only)     
loop:    andi $s3, $s1, 1              # s3 = mask lower bit of $s1
         beq $s3, $zero, next          # if LSB is 0 skip add to prod
         addu $s1, $s1, $s0            # top16 of s1 = s1+s0(mcand)
next:    srl $s1, $s1, 1               # prod/mult shift 1 right
         addi $s2, $s2, -1             # loop = loop -1
         bne $s2, $zero, loop          # while more bits...                                  
         addi $v0, $zero, 1            # print_int code
         add $a0, $s1, $zero           # arg = product
         syscall
         addi $v0, $zero, 10           # exit code
         syscall

.data
str_title:    .asciiz "\nmult: input two (16bit) ints:\n"

