
.data

.text

li x10, 7
li x11, 5
jal power

li x17, 1
ecall
li x17, 10
ecall

power:
addi sp, sp, -16
sw x1, 12(sp)
sw x18, 8(sp) #i
sw x19, 4(sp) #y
sw x20, 0(sp) #x

li x19, 1
mv x18, x11
mv x20, x10


loop:
ble x18, zero, end
mv x10, x19
mv x11, x20
jal multiplica
mv x19, x10
addi x18, x18, -1
j loop
end:
	lw x1, 0(sp)
	lw x18, 4(sp) #i
	lw x19, 8(sp) #y
	lw x20, 12(sp) #x
	addi sp, sp, 16
	ret

multiplica:
	mul x10, x10, x11
	ret