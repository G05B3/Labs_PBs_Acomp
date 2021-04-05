
	.data

var:	.word 255

	.text

la x10, var
lw x11, 0(x10)

li x13, 1
li x14,0

slli x11, x11, 1
while:
srai x11, x11, 1
addi x14, x14, 1
blt x13, x11, while

mv x12, x14
sw x12, 4(x10)

li x17, 10