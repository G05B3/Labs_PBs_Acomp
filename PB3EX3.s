
	.data

n_valores: .word 8
valores:   .word 1, 2, 3, 4, 5, 6, 7, 8

	.text
la x10, n_valores
lw x11, 0(x10)

la x12, valores
lw x13, 0(x12)

li x14, 0

while:
add x14, x14, x13
addi x11, x11, -1
addi x12, x12, 4
lw x13, 0(x12)
bge x11, x0, while

sw x14, 0(x10)
li x17, 0