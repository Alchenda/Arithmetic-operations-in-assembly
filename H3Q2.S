#### Danny Webb-McClain
	
# EECE.3170: Microprocessors I
# UMass Lowell

        .global    main

        .data
x:	.int	    0 #these values must be manually changed in the case of different test cases
y:	.int	    0
a:	.int	    10
b:	.int	    6

        .text
        .set	noreorder
        .ent	main

main:
    lw $t0, x  # $t0 = x
    lw $t1, y # $t1 = y 
    lw $t2, a # $t2 = a
    lw $t3, b # $t3 = b
    add $s0, $zero, $zero # $s0 = j
L1: # for(int j = 0; j < 3; j++)
    slti $t4, $s0, 3 
    beqz $t4, EXIT    # jump to EXIT if s0 >= 3
    nop
    slti $t4, $t0, 10
    beqz $t4, L2 # jump to L2 if x >= 10
    nop
    add $t1, $t0, $t2 # y = x + a
    addi $s0, $s0, 1 # j++
    j L1
    nop


L2:
    slt $t4, $t1, $t3
    bne $t4, $zero, L3 # y < b go to L3
    nop
    sub $t0, $t1, $t2 # x = y - a
    addi $s0, $s0, 1 # j++
    j L1
    nop
L3:
    addi $t0, $t1, 4 # x = y + 4
    addi $t1, $t0, 4 # y = x + 4
    addi $s0, $s0, 1 # j++
    j L1
    nop
    
EXIT:
    sw $t0, x # store x
    sw $t1, y # store y
    nop
# This code simply loops infinitely
spin:   j          spin
    nop

       .end        main