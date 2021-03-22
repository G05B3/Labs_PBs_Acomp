		.data

vals:	.word 3, 4, 7, 6

		.text

la x10, vals
lw x11, 0(x10)
lw x12, 4(x10)
lw x13, 8(x10)
lw x14, 12(x10)

add x11, x11, x12
add x11, x11, x13
add x11, x11, x14

srai x11, x11, 2
sw x11, 16(x10)

li x17, 1
ecall