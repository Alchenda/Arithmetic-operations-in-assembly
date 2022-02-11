#### Danny Webb-McClain
	
# EECE.3170: Microprocessors I
# UMass Lowell

        .global    main

        .data
A:	.int	    50 #for different test cases these values must be changed manually
B:	.int	    60
R:	.space	    4
X:	.int	    0
Y:	.int	    0

        .text
        .set	noreorder
        .ent	main

main:
    lw $a0, A #load A into $a0
    lw $a1, B #load B into $a1
    lw $a2, R #load R into $a2
    jal func # R = func(A,B)
    nop
    move $a2, $v0
    sw $v0, R
    nop
    

# This code simply loops infinitely
spin:   j          spin
    nop

       .end        main
       
func:
    lw $t1, X #load x into $t0
    lw $t2, Y #load y into $t1
    li $t1, 0 #set X to zero
    li $t2, 0 #set Y to zero
L1: 
    slt $t3, $t1, $a0 # X < A
    slt $t4, $t2, $a1 # Y < B
    OR $t3, $t3, $t4 # (X < A) || (Y < B)
    beqz $t3, FALSE
    nop
    addi $t1, $t1, 1 # x = x + 1
    addi $t2, $t2, 2 # y = y + 2
    j L1
    nop
FALSE: #in the case where the or condtion fails jump here, and then return to main
    slt $t3, $t2, $t1 # y < x Return whatever value is larger
    beqz $t3, ELSE
    nop
    move $v0, $t1
    jr $ra
    
ELSE:
    move $v0, $t2
    jr $ra