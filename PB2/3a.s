#3a)

		.data

		.text

ori x10, x0, 0xD  #13 = 1101  -> 3 '1's
ori x13, x0, 0 #x13 = '0'
ori x14, x0, 0 # x14 = n� de '1's

andi x11, x10, 0x1 #ser� que o �ltimo bit � '1'??
slt, x12, x13, x11 #x12 � o sinal da condi��o
add x14, x14, x12
srli x10, x10, 1 #passa ao pr�ximo bit
 
andi x11, x10, 0x1 #ser� que o �ltimo bit � '1'??
slt, x12, x13, x11 #x12 � o sinal da condi��o
add x14, x14, x12
srli x10, x10, 1 #passa ao pr�ximo bit

andi x11, x10, 0x1 #ser� que o �ltimo bit � '1'??
slt, x12, x13, x11 #x12 � o sinal da condi��o
add x14, x14, x12
srli x10, x10, 1 #passa ao pr�ximo bit

andi x11, x10, 0x1 #ser� que o �ltimo bit � '1'??
slt, x12, x13, x11 #x12 � o sinal da condi��o
add x14, x14, x12

li x17, 1
ecall
li x17, 10
ecall
