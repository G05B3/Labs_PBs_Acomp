#Lab 2 - by Martim Bento & Joao Rodrigues

	.data

k1:	.word 1 #k1 = x1 = a
k2:	.word 0 #k2 = x2 = b

	.text
rede_neuronal_xor:

#salvaguarda dos w e b
addi sp, sp, -36

#para neuronio 3
li x10, 2 #w2
sw x10, 32(sp)
li x10, 2 #w1
sw x10, 28(sp)
li x10, -1 #b
sw x10, 24(sp)

#para neuronio 2
li x10, 2 #w2
sw x10, 20(sp)
li x10, -2 #w1
sw x10, 16(sp)
li x10, -1 #b
sw x10, 12(sp)

#para neuronio 1
li x10, -2 #w2
sw x10, 8(sp)
li x10, 2 #w1
sw x10, 4(sp)
li x10, -1 #b
sw x10, 0(sp)

#Chamar neuronios
addi sp, sp, -8
lw x10, k2
sw x10, 4(sp)
lw x10, k1
sw x10, 0(sp)
jal x1, neuronio
mv x20, x18

addi sp, sp, 16
lw x10, k2
sw x10, 4(sp)
lw x10, k1
sw x10, 0(sp)
jal x1, neuronio
mv x19, x18

addi sp, sp, 16
sw x20, 4(sp)
sw x19, 0(sp)
jal x1, neuronio
addi sp, sp, 16

j end

multiplica:
li x12, 0
li x13, 0
blt x11, zero, negative
while:
add x13, x13, x10
addi x12, x12, 1
blt x12, x11, while
sw x13, 4(sp) #guardar valor
ret
negative:
add x13, x13, x10
addi x12, x12, -1
blt x11, x12, negative
sub x13, zero, x13
sw x13, 4(sp) #guardar valor
ret

neuronio:
addi sp, sp, -4
sw x1, 0(sp)
lw x10, 4(sp)
lw x11, 16(sp)
jal multiplica
lw x13, 4(sp)
mv x18, x13
lw x10, 8(sp)
lw x11, 20(sp)
jal multiplica
lw x13, 4(sp)
add x18, x18, x13
lw x10, 12(sp) #load b
add x18, x18, x10

bge x18, zero, ret1
li x18, 0
lw x1, 0(sp)
ret

ret1:
li x18, 1
lw x1, 0(sp)
ret

end:
mv x10, x18
li x17, 1
ecall
li x17, 10
ecall


#PILHA
#x1					x1					x1					x1
#w2	  x20 (1?) 		w2	  x19 (2?)		w2	  x18 (xor)		x20
#w1		->			w1		->			w1		->			x19
#b					b					b					x1
#w2					w2					k2
#w1					w1					k1
#b					b					x1
#w2					k2
#w1					k1
#b					x1
#k2
#k1
#x1