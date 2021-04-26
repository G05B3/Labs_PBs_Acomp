#L3 - by João Barreiro C. Rodrigues e Martim Rendeiro Bento

	.data

n:	.word 18
	.text

	lw a0, n
	li s1, 0
	addi sp, sp, -8
	sw s1,4(sp)
	sw a0,0(sp)
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

	li t0, 1
	lw t1, 8(sp)
	bge t0, t1, endrec
	
	andi t0, t1, 1
	addi t0, t0, -1
	beq t0, zero, impar
par:
srai t2, t1, 1 #t2 = x = n/2
addi sp, sp, -4
sw t2, 0(sp)
jal Un
li t3, 2
lw s1, 0(sp)
mul s1, s1, t3 #2*U(n/2)
j EndLoop

impar:
addi t2, t1, -1
srai t2, t2, 1 #t2 = x = (n-1)/2
addi sp, sp, -4
sw t2, 0(sp)
jal Un
lw s1, 0(sp)
addi t3, s1, 0 #mv t3, s1
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