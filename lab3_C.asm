.text
processStrings:
	# Your code here
	# Delete this line

    addi $sp, $sp, -32
    sw $s0, 0($sp)
    sw $s1, 4($sp)
    sw $s2, 8($sp)
    sw $s3, 12($sp)    
    sw $s4, 16($sp)
    sw $s5, 20($sp)    
    sw $s6, 24($sp)
    sw $s7, 28($sp) 
	
    la $t0, array
    
    addi $s0, $0, 0
    addi $s1, $0, 4
    addi $s2, $0, 104
    addi $s3, $0, 0
    
	do: #loop to set freq values all to 0
    	bge $s0, $s2, end
 
    	add $t5, $t0, $s0
    	sw $s3, ($t5)

    	add $s0, $s0, $s1
    	j do
    	end:
	
	li $s0, 0 # Num of Spaces
	li $s6, 0 # Num of Symbols
	
	move $s3, $a0 # Moving list of strings into s3
	move $s4, $a1 # Moving number of string into s4
	addi $sp, $sp, -104
	move $s2, $sp
	
	li $t0, 0
	li $s1, 1
	
	while:
	beq $t0, $s4, finish
	#############################
	
	move $a0, $s2
	lw $a1, ($s3)
	
	addi $sp, $sp, -32
    	sw $ra , 0($sp)
    	sw $s0 , 4($sp)
    	sw $s2 , 8($sp)
    	sw $a1, 12($sp)
    	sw $s6, 16($sp)
    	sw $t0, 20($sp)
    	sw $s3, 24($sp)
    	sw $s4, 28($sp)
    	jal countAllChars
    	lw $s4, 28($sp)
    	lw $s3, 24($sp)
    	lw $t0, 20($sp)
    	lw $s6, 16($sp)
    	lw $a1, 12($sp)
    	lw $s2, 8($sp)
    	lw $s0, 4($sp)
    	lw $ra, 0($sp)
    	addi $sp, $sp, 32
	
	add $s0, $s0, $v1
	add $s6, $s6, $v0
	
	
	
	
	move $a0, $s2
	la $a1, array
	li $a2, 26
	
	addi $sp, $sp, -32
    	sw $ra , 0($sp)
    	sw $s0 , 4($sp)
    	sw $s2 , 8($sp)
    	sw $a1, 12($sp)
    	sw $s6, 16($sp)
    	sw $t0, 20($sp)
    	sw $s3, 24($sp)
    	sw $s4, 28($sp)
    	jal addArray
    	lw $s4, 28($sp)
    	lw $s3, 24($sp)
    	lw $t0, 20($sp)
    	lw $s6, 16($sp)
    	lw $a1, 12($sp)
    	lw $s2, 8($sp)
    	lw $s0, 4($sp)
    	lw $ra, 0($sp)
    	addi $sp, $sp, 32

	move $a0, $s0
	la $a2, array
	move $a1, $s6
		
	addi $sp, $sp, -32
    	sw $ra , 0($sp)
    	sw $s0 , 4($sp)
    	sw $s2 , 8($sp)
    	sw $a1, 12($sp)
    	sw $s6, 16($sp)
    	sw $t0, 20($sp)
    	sw $s3, 24($sp)
    	sw $s4, 28($sp)
    	jal printStats
    	lw $s4, 28($sp)
    	lw $s3, 24($sp)
    	lw $t0, 20($sp)
    	lw $s6, 16($sp)
    	lw $a1, 12($sp)
    	lw $s2, 8($sp)
    	lw $s0, 4($sp)
    	lw $ra, 0($sp)
    	addi $sp, $sp, 32
	
	#############################
	add $t0, $t0, $s1
	
	li $s5, 4
	add $s3, $s3, $s5
	j while
	finish:
	
	
	addi $sp, $sp, 104

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


.data
array: .word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

