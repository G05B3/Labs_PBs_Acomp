#Exerício 2 Corrigido
	.data

var:	.word 0x0F0F

	.text

lw x11, var
li x10, 0
li x12, 32

loop:
	ble x12, zero, end
	andi x13, x11, 1
	add x10, x10, x13
	srli x11, x11, 1
	addi x12, x12, -1
	j loop

end:

li x17, 1
ecall
li x17, 10
ecall