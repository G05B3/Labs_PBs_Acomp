#L3 b)

	.data

n:	.word 10

	.text

	lw a0, n
	li s1, 0
	addi sp, sp, -8
	sw s1, 4(sp)
	sw a0, 0(sp)
	jal Un
	lw a0, 0(sp)
	li a7, 1
	ecall
	li a7, 10
	ecall

Un:
	addi sp, sp, -8
	sw ra, 4(sp)
	sw s1, 0(sp)
	lw t1, 8(sp) #t2 = x
	li t0, 1
	beq t1, t0, endrec
	
	andi t0, t1, 1
	bne t0, zero, impar
par:
srli t2, t1, 1 #t2 = n/2 = x
addi sp, sp -4
sw t2, 0(sp)
jal Un
lw s1, 0(sp)
li t3, 2
mul s1, s1, t3
j EndLoop

impar:
addi t2, t1, -1 #t2 = (n-1)/2 = x
srli t2, t1, 1
addi sp, sp -4
sw t2, 0(sp)
jal Un
lw s1, 0(sp)
li t3, 3
mul s1, s1, t3
j EndLoop

endrec:
li s1, 1
EndLoop:
sw s1, 12(sp)
lw s1, 0(sp)
lw ra, 4(sp)
addi sp, sp, 12
ret
