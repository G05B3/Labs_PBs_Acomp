#Lab 2 (outra maneira de fazer) - by Martim Bento
	.data

a:	.word 1
b:	.word 1


	.text
rede_neuronal_xor:
lw x3, a
lw x4, b
li x14, 2
li x15, -2
li x16, -1
jal neuronio
mv x20, x19
li x14, -2
li x15, 2
li x16, -1
jal neuronio
li x14, 2
li x15, 2
li x16, -1
mv x3, x20
mv x4, x19
jal neuronio

jal x0, end

neuronio:
addi sp, sp, -4
sw x1, 0(sp)

mv x10, x3
mv x11, x14
jal multiplica
lw x18, 0(sp)
addi sp, sp, 4
mv x10, x4
mv x11, x15
jal multiplica
lw x19, 0(sp)
addi sp, sp, 4
mv x12, x16
add x19, x19, x18
add x19, x19, x16
lw x1, 0(sp)
addi sp, sp, 4
blt x19, zero, null
li x19, 1
jalr x0, x1, 0
null:
li x19, 0
jalr x0, x1, 0

multiplica:
li x12, 0 
li x13, 0
blt x11, zero, negative
while:
add x13, x13, x10
addi x12, x12, 1
blt x12, x11, while
addi sp, sp, -4
sw x13, 0(sp)
jalr x0, x1, 0
negative:
sub x13, x13, x10
addi x12, x12, -1
bge x12, x11, negative
addi sp, sp, -4
sw x13, 0(sp)
jalr x0, x1, 0

end:
mv x10, x19
li x17, 1
ecall
li x17, 10
ecall

