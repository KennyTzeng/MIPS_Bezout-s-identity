	.text
	.globl main
main:
	li	$v0, 4
	la	$a0, input1
	syscall
	li	$v0, 5
        syscall
        move	$s0, $v0				#$s0=A
        li	$v0, 4
	la	$a0, input2
	syscall
	li	$v0, 5
        syscall
        move	$s1, $v0				#$s1=B
        
        jal	GCDex
        
        li	$v0, 4
	la	$a0, output1
	syscall
	li	$v0,1
	add	$a0, $s2, $zero
	syscall
	li	$v0, 4
	la	$a0, output2
	syscall
	li	$v0,1
	add	$a0, $s3, $zero
	syscall
	li	$v0, 4
	la	$a0, output3
	syscall
	li	$v0,1
	add	$a0, $s4, $zero
	syscall
	
        li	$v0, 10
	syscall
        
GCDex:
	subi	$sp,	$sp, 12
	sw	$ra, 	8($sp)
	sw	$s0,	4($sp)
	sw	$s1,	0($sp)
	
	beq	$s1,	$zero, GCDex_return
	add	$t0, $s0, $zero
	add	$s0, $s1, $zero
	rem	$s1, $t0, $s1
	jal	GCDex
	lw	$s1, 0($sp)
	lw	$s0, 4($sp)
	lw	$ra, 8($sp)
	addi	$sp, $sp, 12
	add	$t1, $s2, $zero
	add	$s2, $s3, $zero
	div	$t2, $s0, $s1
	mul	$t2, $t2, $s3
	sub	$s3, $t1, $t2
	jr	$ra
	
	
	
GCDex_return:
	li	$s2, 1				#$s2=x
	add	$s3, $zero, $zero		#$s3=y
	add	$s4, $s0, $zero		#$s4=GCX
	addi	$sp, $sp, 12
	jr	$ra
	
        
        
        
        .data
		input1: .asciiz "input number A which A < 2,147,483,648\n>"
		input2: .asciiz "input number B which B < 2,147,483,648\n>"
		output1: .asciiz "x = "
		output2: .asciiz " , y = "
		output3: .asciiz " , D = "
