.data           # the data segment to store global data
   welcome:  .asciiz "Welcome to the Prime Number application.\n"
   space:    .asciiz " "     # whitespace to separate prime numbers
   yes:      .asciiz "has remainder\n"
   no:       .asciiz "does not have remainder\n"
   enter:    .asciiz "enter number:\n"
   howMany:  .asciiz "How many Prime Numbers do you want to find?\n"
   thisMany: .asciiz "These are the prime numbers:\n"
   newline:  .asciiz "\n"
#   arr:      .word 1000



.globl  main             # define main to be a global label
.text                    # the text segment to store instructions
main:
   and $s0, $zero, $s0   # t0 outside number
   and $s1, $zero, $s1   # t1 inside counter
   and $s2, $zero, $s2   # t2 remainder
   and $s3, $zero, $s3   # t3 quotient
   and $s4, $zero, $s4   # t4 midpoint
   and $s5, $zero, $s5   # t5 number of primes
   and $s6, $zero, $s6   # t6 array address
   and $s7, $zero, $s7   # t7 input count

#   la   $s6, arr        # load array address into register
   
   la   $a0, welcome      # prompt user
   li   $v0, 4          # prompt user
   syscall              # prompt user

   la   $a0, howMany      # prompt user
   li   $v0, 4          # prompt user
   syscall              # prompt user

   li   $v0, 5          # get input number
   syscall              # get input number

   move $s7, $v0        # move from input to t7
   li   $s0, 3          # start outside number at 3 since 2 is hard coded
   li   $s1, 2          # start inside counter at 2
# hard code 2
#   sw   $s1, 0($s6)     # hard code 2 into answer
#   addi $s6, $s6, 4     # increment array address

   li   $a0, 2
   li   $v0, 1          # print integer
   syscall              # print prime number

   la   $a0, space      # Print space
   li   $v0, 4          # Print space
   syscall              # Print space

   li   $s5, 1          # hard code 2 into answer

outerloop:
#   beq  $s5, $s7, print # prime counter and input count are the same then print
   beq  $s5, $s7, exit # prime counter and input count are the same then exit
loop:
   div  $s0, $s1        # do division
   mfhi $s2             # remainder
   mflo $s3             # quotient

   beqz $s2, No         # branch if remainder equal zero

Yes:
   #jal printYes        # print that it has a remainder

   addi $s1, $s1, 1     # increment inside counter
   beq  $s1, $s0, end   # if outside number and inside number
                        # are the same then we found a prime
   j    loop            # restart the loop

No:
   #jal printNo         # print that it has a remainder

   li   $s1, 2          # start inside counter at 2
   addi $s0, $s0, 1     # increment current number

   j    loop            # restart the loop

end:

   li   $s1, 2          # start inside counter at 2
   # sw   $s0, 0($s6)     # store number in memory

   move $a0, $s0
   li   $v0, 1          # print integer
   syscall              # print prime number

   la   $a0, space      # Print space
   li   $v0, 4          # Print space
   syscall              # Print space

#   addi $s6, $s6, 4     # move to next array address
   addi $s5, $s5, 1     # increment number of primes
   addi $s0, $s0, 1     # increment outside counter

   j    outerloop

exit:

   la   $a0, newline      # prompt user
   li   $v0, 4          # prompt user
   syscall              # prompt user

   li   $v0, 10         # set up system call 10 (exit)
   syscall              # close program

#print:
#   la   $t6, arr        # print string
#   la   $a0, thisMany   # print string
#   li   $v0, 4          # print string
#   syscall              # print string
#printloop:
#   lw   $a0, 0($t6)     # load prime number from memory to print
#   beqz $a0, exit       # branch to exit if loaded word is equal to zero
#   li   $v0, 1          # print prime number
#   syscall              # print prime number
#
#   la   $a0, space      # add space between prime numbers
#   li   $v0, 4          # add space between prime numbers
#   syscall              # add space between prime numbers
#
#   addi $t6, $t6, 4     # increment to next prime in array
#   j    printloop       # restart loop
#
#printYes:               # print string for debigging
#   la   $a0, yes        # print string for debigging
#   li   $v0, 4          # print string for debigging
#   syscall              # print string for debigging
#   jr   $ra             # print string for debigging
#
#printNo:                # print string for debigging
#   la   $a0, no         # print string for debigging
#   li   $v0, 4          # print string for debigging
#   syscall              # print string for debigging
#   jr   $ra             # print string for debigging
