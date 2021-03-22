#3b)

		.data

vals:	.word 3, 7, 4, 6
lista2: .word 0, 0, 0, 0
		.text

la x10, vals
la x11, lista2

lw x12, 0(x10)
lw x13, 4(x10)
lw x14, 8(x10)
lw x15, 12(x10)

sw x12, 0(x11)

add x13, x13, x12
sw x13, 4(x11)

add x14, x14, x13
sw x14, 8(x11)

add x15, x15, x14
sw, x15, 12(x11)

li x17, 1
ecall