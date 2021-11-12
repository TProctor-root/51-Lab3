.text
countAllChars:
	# Your code here
	# Delete these lines

    addi $sp, $sp, -32
    sw $s0, 0($sp)
    sw $s1, 4($sp)
    sw $s2, 8($sp)
    sw $s3, 12($sp)    
    sw $s4, 16($sp)
    sw $s5, 20($sp)    
    sw $s6, 24($sp)
    sw $s7, 28($sp) 
	
	move $s2, $a1 # str
	move $s3, $a0 # myhist
	
	addi $s0, $0, 0 # sym = 0
	addi $s1, $0, 1 # 1+
	
	li $t0, '!'
	li $t1, '@'
	
	for:
	bgt $t0, $t1, done
	
	move $a1, $t0 # Moving symbol into argument spot
	move $a0, $s2 # Moving str into argument
	
    	addi $sp, $sp, -24
    	sw $ra , 0($sp)
    	sw $s0 , 4($sp)
    	sw $s2 , 8($sp)
    	
    	sw $a0, 12($sp)
    	sw $s3, 16($sp)
    	sw $a1, 20($sp)
    	jal countC
    	lw $a1, 20($sp)
    	lw $s3, 16($sp)
    	lw $a0, 12($sp)
    	lw $s2, 8($sp)
    	lw $s0, 4($sp)
    	lw $ra, 0($sp)
    	addi $sp, $sp, 24

    	addi $s1, $0, 1 # 1+
    
    	add $s0, $s0, $v0 # Adding v0 into s0
	li $t1, '@'
	move $t0, $a1 # Restoring the character into symbol
	add $t0, $t0, $s1 # Incrementing the symbol
	j for
	done:

	
	addi $s5, $0, 0 # space = 0
	li $a1, ' '
	li $s6, 0 # space count
	
    	addi $sp, $sp, -20
    	sw $ra, 0($sp)
  	sw $s6, 4($sp)
    	sw $s2, 8($sp)
    	sw $s3, 12($sp)
    	sw $s0, 16($sp)
    	jal countC
    	lw $s0, 16($sp)
    	lw $s3, 12($sp)
    	lw $s2, 8($sp)
    	lw $s6, 4($sp)
    	lw $ra, 0($sp)
    	addi $sp, $sp, 20
    	
    	add $s6, $s6, $v0
	
	

	li $t2, 'A'
	li $t3, 0x5b
	
	for2:
	beq $t2, $t3, done2
	###################################
	
	move $a1, $t2 # Moving symbol into argument spot
	move $a0, $s2 # Moving str into argument
	
    	addi $sp, $sp, -24
    	sw $ra , 0($sp)
    	sw $s0 , 4($sp)
    	sw $s2 , 8($sp)
    	sw $a1, 12($sp)
    	sw $s3, 16($sp)
    	sw $s6, 20($sp)
    	jal countC
    	lw $s6, 20($sp)
    	lw $s3, 16($sp)
    	lw $a1, 12($sp)
    	lw $s2, 8($sp)
    	lw $s0, 4($sp)
    	lw $ra, 0($sp)
    	addi $sp, $sp, 24

    	addi $s1, $0, 1 # 1+
    	
    	
    	sw $v0, ($s3)
    	
    	addi $s3, $s3, 4
    	
	move $t2, $a1 # Restoring the character into symbol
	li $t3, 0x5b
	###################################
	add $t2, $t2, $s1
	j for2
	done2:
		
    move $v0, $s0
    move $v1, $s6
	

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
