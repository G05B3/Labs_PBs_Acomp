
		.data

x:		.word 50
y:		.word 0

# if (x<10) => (if (y<1) => x-=10) ELSE x+=10

		.text

la	x10, x
la	x11, y

lw x12, 0(x10)
lw x13, 0(x11)

li x14, 11
li x15, 1

bge x14, x12, else   #if not x<10 => jump to else
blt x15, x13, success


jal x0, nothing #x<10, but y>=1


else:
addi x12, x12, 10 #x+=10
jal x0, nothing

success:
addi x12, x12, -10

nothing:
sw x12, 8(x10)

li x17, 10