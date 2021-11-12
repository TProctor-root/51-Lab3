.text
F:
    ####################
    # Add prologue here
    ####################
    addi $sp, $sp, -32
    sw $s0, 0($sp)
    sw $s1, 4($sp)
    sw $s2, 8($sp)
    sw $s3, 12($sp)    
    sw $s4, 16($sp)
    sw $s5, 20($sp)    
    sw $s6, 24($sp)
    sw $s7, 28($sp)   
    

    
     
       
	move $s0, $a0   # Save argument, n

	li $v0, 4       # Print F label
	la $a0, F_label
	syscall

	li $v0, 1       # Print n value
	move $a0, $s0
	syscall

	li $v0, 11      # Print newline
	li $a0 '\n'
	syscall

	bnez $s0, F_recurse # Check n for recursion
	li $v0, 1           # N == 0, it's base case!

F_done:
    ####################
    # Add epilogue here
    ####################
    lw $s7, 28($sp)
    lw $s6, 24($sp)
    lw $s5, 20($sp) 
    lw $s4, 16($sp)
    lw $s3, 12($sp)
    lw $s2, 8($sp)
    lw $s1, 4($sp)
    lw $s0, 0($sp)
    addi $sp, $sp, 32
	jr $ra

F_recurse:
    ####################
    # Calculate & Load F arguments here
    ####################
    addi $sp, $sp, -8
    sw $ra , 0($sp)
    sw $s0 , 4($sp)
    addi $s1, $0, 1
    sub $a0, $s0, $s1
	jal F				# F(n-1)
    ####################
    # Load M arguments here
    ####################
    move $a0, $v0
	jal M               # M(F(n-1))
    ####################
    # Caluculate return value here 
    # n - F(M(n-1))
    ####################
    lw $s0, 4($sp)
    lw $ra, 0($sp)
    addi $sp, $sp, 8
    sub $v0, $s0, $v0
	j F_done

M:
    ####################
    # Add prologue here
    ####################

    addi $sp, $sp, -32
    sw $s0, 0($sp)
    sw $s1, 4($sp)
    sw $s2, 8($sp)
    sw $s3, 12($sp)    
    sw $s4, 16($sp)
    sw $s5, 20($sp)    
    sw $s6, 24($sp)
    sw $s7, 28($sp)   

	move $s0, $a0       # Save argument, n

	li $v0, 4           # Print F label
	la $a0, M_label
	syscall

	li $v0, 1           # Print n value
	move $a0, $s0
	syscall

	li $v0, 11          # Print newline
	li $a0 '\n'
	syscall

	bnez $s0, M_recurse # Check n for recursion
	li $v0, 0           # N == 0, it's base case!

M_done:
    ####################
    # Add epilogue here
    ####################
    lw $s7, 28($sp)
    lw $s6, 24($sp)
    lw $s5, 20($sp) 
    lw $s4, 16($sp)
    lw $s3, 12($sp)
    lw $s2, 8($sp)
    lw $s1, 4($sp)
    lw $s0, 0($sp)
    addi $sp, $sp, 32
    jr $ra

M_recurse:
    ####################
    # Calculate & Load M arguments here
    ####################
    addi $sp, $sp, -8
    sw $ra , 0($sp)
    sw $s0 , 4($sp)
    addi $s1, $0, 1
    sub $a0, $s0, $s1
	jal M				# M(n-1)
    ####################
    # Load F arguments here
    ####################
    move $a0, $v0
	jal F               # F(M(n-1))
    ####################
    # Caluculate return value here 
    # n - M(F(n-1))
    ####################
    lw $s0, 4($sp)
    lw $ra, 0($sp)
    addi $sp, $sp, 8
    sub $v0, $s0, $v0
	j M_done


.data
F_label: .asciiz "F: "
M_label: .asciiz "M: "
