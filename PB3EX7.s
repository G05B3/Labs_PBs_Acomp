#Exercício 7
.data

.text

li x10, 7
jal fatorial

li x17, 1
ecall
li x17, 10
ecall


fatorial:
	ble x10, zero, end #if (i==0) return 1;
	#salvaguarda de contexto
	addi sp, sp, -8
	sw x1, 4(sp)
	sw x18, 0(sp) #x18 é um saved register

mv x18, x10
addi x10, x10, -1
jal fatorial
mul x10, x10, x18

	#reposição de contexto
	lw x18, 0(sp)
	lw x1, 4(sp)
	addi sp, sp, 8
	ret

end:
li x10, 1
ret


