
.data

i:		.word 1, 0, 0, 0, 0, 0, 0, 0, 0, 0

.text

la x10, i
lw x11, 0(x10) #i
li x12, 1 #counter
li x13, 11 #max_counter (n-1)
li x14, 2 #i-1
branch: bge x12, x13, end
	or x11, x0, x12 #x11 = x12 = counter
	fatorial: blt x14, x11, cycle
		mul x11, x11, x14 # i * (i-1)
	cycle:



srai x11, x11, 1
sub x11, x11, x12 #i!-i
sw x11, 4(x10)
add x11, x11, x12
addi x10, x10, 4 # ++ endereco
addi x12, x12, 1 # ++ ciclo
slli x11, x11, 1
mv x14, x11 #i-1 = i
j branch
end:

li x17, 1
ecall
li x17, 10
ecall