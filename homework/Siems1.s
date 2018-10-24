# Welcome to Euclids GCD algorithm assmebly program
# this uses Euclids GCD algorithm

# The Euclidean Algorithm for finding GCD(A,B) is as follows:
# If A = 0 then GCD(A,B)=B, since the GCD(0,B)=B, and we can stop.
# If B = 0 then GCD(A,B)=A, since the GCD(A,0)=A, and we can stop.
# Write A in quotient remainder form (A = B⋅Q + R)
# Find GCD(B,R) using the Euclidean Algorithm since GCD(A,B) = GCD(B,R)


.globl main # export symbol
  # main should be labeled and exported
  # for your program to be executed

.text  # the text segment contains your code
main:
  and $s0, $s0, $0         # A integer
  and $s1, $s1, $0         # B integer
  and $s2, $s2, $0         #
  and $s3, $s3, $0         #
  and $s4, $s4, $0         #
  and $s5, $s5, $0         #
  and $s6, $s6, $0         #
  and $s7, $s7, $0         #

  add $v0, $zero, 4      # 4 = code for print string
  la $a0, first_prompt   # $a0 "points" at string to print
  syscall                # transfer control to "os"

  add $v0, $zero, 5      # 5 = code for integer input
  syscall                # transfer control to "os"
  move   $s0, $v0        # $s0 = $v0

  add $v0, $zero, 4      # 4 = code for print string
  la $a0, second_prompt  # $a0 "points" at string to print
  syscall                # transfer control to "os"

  add $v0, $zero, 5      # 5 = code for integer input
  syscall                # transfer control to "os"
  move   $s1, $v0        # $s1 = $v0

  move $v1, $s0        # $v1 = $s0
  beqz $s0, answerB
  move $v0, $s1        # $v0 = $s1
  beqz $s1, answerA



end:
  li $v0, 10         # 10 = code for exit
  syscall            # to exit cleanly from the program

answerA:
mv $v0
add $v0, $zero, 4    # 4 = code for print string
la $a0, the_answer   # $a0 "points" at string to print
syscall              # transfer control to "os"
add $v0, $zero, 1    # 4 = code for print integer
la $a0, $a3          # $a0 "points" at string to print
syscall              # transfer control to "os"
j exit               # jump to the exit

answerB:
add $v0, $zero, 4    # 4 = code for print string
la $a0, the_answer   # $a0 "points" at string to print
syscall              # transfer control to "os"
add $v0, $zero, 1    # 4 = code for print integer
la $a0, $a2          # $a0 "points" at string to print
syscall              # transfer control to "os"
j exit               # jump to the exit


# fn_ln:          # taken from http://www.cabrillo.edu/~shodges/cs24/files/hellofn.s
#   # and modified with https://stackoverflow.com/questions/9875468/printing-newline-in-mips
#   # becuase \n wasnt printing a new line
#   li $v0, 11      # 11 = print char
#   addi $a0, $0, 0xA     # ascii code for LF, if you have any trouble try 0xD for CR.
#   syscall        # transfer control to "os"

fn_ln:  li $v0, 4    # 4 = print string
  la $a0, newline
  syscall
  jr $ra      # return

.data
  # the data segment contains dataused by your program
  first_prompt:    .asciiz "Welcome to Euclids GCD algorithm\nEnter the First number now\n"
  second_prompt:   .asciiz "Enter the Second number now\n"
  the_answer:      .asciiz "The GCD is: "
  newline:         .asciiz "\n"
