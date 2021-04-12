#Lab 2 (outra maneira de fazer) - by Martim Bento
	.data

a:	.word 0
b:	.word 0
c:	.word 1

	.text
#x14 = w1; x15 = w2; x16 = b; x3 =


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
jal neuronio  #daqui sai A xor B no x19
mv x20, x19 #gravar A xor B no x20
li x14, 3
li x15, -2
li x16, -2
lw x3, c
lw x4, a
jal neuronio #daqui sai C and (Not A)
mv x21, x19 #gravar C and (Not A) no x21
li x14, 2
li x15, 2
li x16, -1
mv x3, x20
mv x4, x21
jal neuronio #daqui deve sair (A xor B) or (C and (Not A))
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

