# Welcome to Euclids GCD algorithm assmebly program
# this uses Euclids GCD algorithm

# The Euclidean Algorithm for finding GCD(A,B) is as follows:
# If A = 0 then GCD(A,B)=B, since the GCD(0,B)=B, and we can stop.
# If B = 0 then GCD(A,B)=A, since the GCD(A,0)=A, and we can stop.
# Write A in quotient remainder form (A = B⋅Q + R)
# Where Q is the quotient of A/B
# And R is the remainder of A/B
# Find GCD(B,R) using the Euclidean Algorithm since GCD(A,B) = GCD(B,R)


.globl main # export symbol
  # main should be labeled and exported
  # for your program to be executed

.text  # the text segment contains your code
main:
  li $s0, 0              # A integer
  li $s1, 0              # B integer

##Prompts##

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

##Inital test##

  move $a0, $s0          # $v1 = $s0 = A
  beqz $a0, answerB
  move $a1, $s1          # $v0 = $s1 = B
  beqz $a1, answerA

##Loop##
  jal gcd

exit:
  jal fn_ln
  li $v0, 10            # 10 = code for exit
  syscall               # to exit cleanly from the program

gcd:
##store $ra on the stack##
  addi $sp, $sp, -4     # Decrement stack pointer by 4
  sw   $ra, ($sp)       # Save $t0 to stack
##clear registers##
  li $t0, 0             # A integer / B integer
  li $t1, 0             # B integer / R integer
  li $t2, 0             # LO = floor($t0 / $t1) = quotient
  li $t3, 0             # HI = $t0 mod $t1 = remainder
  ##move data from v register to t registers##
  move   $t0, $a0       # $t0 = $v0 =  A
  move   $t1, $a1       # $t1 = $v1 =  B
##division##
  div   $t0, $t1        # $t0 / $t1
  mflo  $t2             # $t2 = LO = floor($t0 / $t1) = quotient
  mfhi  $t3             # $t3 = HI = $t0 mod $t1 = remainder
##Testing##
  move $a0, $t1         # $v1 = $t1 = A
  beqz $a0, answerB     # jump to function to print
  move $a1, $t3         # $v0 = $t3 = B
  beqz $a1, answerA     # jump to function to print
##Call itself##
  jal gcd
##retrieve $ra from the stack##
  lw   $ra, ($sp)       # Copy from stack to $t0
  addi $sp, $sp, 4      # Increment stack pointer by 4
  jr   $ra              # jump to $ra

answerA:
  move $t0, $a0         # $t0 = $v0 = A
  add $v0, $zero, 4     # 4 = code for print string
  la $a0, the_answer    # $a0 "points" at string to print
  syscall               # transfer control to "os"
  add $v0, $zero, 1     # 4 = code for print integer
  move $a0, $t0         # $a0 = $t0 = A
  syscall               # transfer control to "os"
  j exit                # jump to the exit

answerB:
  move $t0, $a1         # $t0 = $v1 = B
  add $v0, $zero, 4     # 4 = code for print string
  la $a0, the_answer    # $a0 "points" at string to print
  syscall               # transfer control to "os"
  add $v0, $zero, 1     # 4 = code for print integer
  move $a0, $t0         # $a0 = $t0 = A
  syscall               # transfer control to "os"
  j exit                # jump to the exit


# fn_ln:          # taken from http://www.cabrillo.edu/~shodges/cs24/files/hellofn.s
#   # and modified with https://stackoverflow.com/questions/9875468/printing-newline-in-mips
#   # becuase \n wasnt printing a new line
#   li $v0, 11      # 11 = print char
#   addi $a0, $0, 0xA     # ascii code for LF, if you have any trouble try 0xD for CR.
#   syscall        # transfer control to "os"

fn_ln:  li $v0, 4       # 4 = print string
  la $a0, newline
  syscall               # transfer control to "os"
  jr $ra                # return

.data
  # the data segment contains dataused by your program
  first_prompt:    .asciiz "Welcome to Euclids GCD algorithm\nEnter the First number now\n"
  second_prompt:   .asciiz "Enter the Second number now\n"
  the_answer:      .asciiz "The GCD is: "
  newline:         .asciiz "\n"
