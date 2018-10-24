.data           # the data segment to store global data
    space:  .asciiz " "     # whitespace to separate prime numbers
    yes:    .asciiz "has remainder\n"
    no:     .asciiz "does not have remainder\n"
    enterTop:  .asciiz "enter top number:\n"
    enterBottom:  .asciiz "enter bottom number:\n"

.globl  main        # define main to be a global label
.text           # the text segment to store instructions
main:
   la $a0, enterTop
   li $v0, 4
   syscall 
   li $v0, 5
   syscall
   move $t0, $v0
   
   la $a0, enterBottom
   li $v0, 4
   syscall 
   li $v0, 5
   syscall
   move $t1, $v0

   div $t0, $t1
   mfhi $t2
   beqz $t2, printNo
   
printYes:
   la $a0, yes
   li $v0, 4
   syscall 
   j exit
printNo:
   la $a0, no
   li $v0, 4
   syscall 
   j exit
exit:
    li   $v0, 10     # set up system call 10 (exit)
    syscall 
