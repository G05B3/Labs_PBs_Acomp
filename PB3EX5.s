	.data
x:	.word 4
y:	.word 7
z:	.word 7
w:	.word 3

	.text

#5a)

la x5, x
lw x10, 0(x5)
la x11, y
lw x11, 0(x11)
la x12, z
lw x12, 0(x12)
la x13, w
lw x13, 0(x13)

mv x14, x10 #x
mv x15, x11 #y
mv x16, x12 #z 
jal x1, Soma3

mv x15, x13 #w
jal x1, Subtrai
sw x14, 16(x5)
jal x0, EOF


#5b) ??

#Soma(a,b)
Soma:
add x14, x14, x15
jalr x0, x1, 0

#Soma3(a,b,c)
Soma3:
addi x2, x2, -4
sw x1, 0(x2) #guardo o valor do x1 antes de entrar noutra fun��o
jal Soma #x14 + x15
mv x15, x16 #c = x16 -> x15
jal Soma #x14 + novo x15 (=x16)
lw x1, 0(x2)  #x1 antes de entrar em fun��es,i.e. para retornar � m�e
addi x2, x2, 4
jalr x0, x1, 0

#Subtrai(a,b)
Subtrai:
sub x14, x14, x15
jalr x0, x1, 0

#Final
EOF:

li x17, 10

#5c) � entrada e � sa�da da fun��o m�e, a pilha n�o t�m
#	 nada guardado (pelo menos introduzido por mim)
#	 No seu m�ximo t�m o valor de x1 (quando est� na fun��o Soma3 e entra na fun��o Soma)
#	 para poder voltar � fun��o m�e