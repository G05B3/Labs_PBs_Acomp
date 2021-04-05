
	.data

	.text

li x10, 10
li x11, 4

addi x2, x2, -8
sw x10, 4(x2)
sw x11, 0(x2)

lw x10, 0(x2)
lw x11, 4(x2)
addi x2, x2, 8

li x17, 10