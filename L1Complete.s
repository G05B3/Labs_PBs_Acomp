#--------------------------------------------------------------------------------------------------+
# Laboratory 1.1|Calculate the greatest power of 2 smaller than the 10th element of the fibonacci's|
#               |Sequence                                                                          |
#--------------------------------------------------------------------------------------------------+
# Authors: Joao Barreiros C. Rodrigues (Joao-Ex-Machina), Martim Rendeiro Bento                    |
# Date: March 22nd, 2021                                                                           |
#-------------------------------------------------------------------------------------------------*/


.data

num:    .word 1, 0, 0 ,0 ,0 ,0 ,0 ,0 ,0 ,0

        .text

#Preparacao

ori x11, x0, 1 #x11 = y
ori x13, x0, 1 #x13 = x
ori x16, x0, 1 #x16 = 1 = i
ori x15, x0, 0x09 #x15 = 9
la x10, num #x10 = addr(num)
lw x12, 0(x10) #x12 = addr x10, offset = 0   (pointer to num array)

sw x11, 0(x10) #save y value on addr
for:

addi x16, x16, 1 #i++
sw x11, 4(x10) #save y value on addr
or x14, x0, x11 #x14 = z = y
add x11, x11, x13 #y = y + x
or x13, x0, x14 #x = z
addi x10, x10, 4 #addr = addr + 4
bge x15, x16, for    #while 9>=i ou for i=1;i<=9;i++ 


#Lab  Determinar a maior potencia de 2, que seja menor que o elemento 10 da sequencia de Fibonacci
#(comparar x13 ao valor 2^k)

la x11, num
li x12, 9 #numero do elemento (n-1)
slli x12, x12, 2 # multiplicar p/ 4 (word = 4 bytes)
add x12, x12, x11 #endere?o do n-esimo elemento
lw x13, 0(x12) #vai buscar o n-esimo elemnto
li x10, 1

# while x >= 2^k <- x11:
branch: blt x13, x10, end #will jump to the end when x10 = 64
slli x10, x10, 1 # k++
j branch # repeat loop
end:
srai x10, x10, 1 #64/=2


li x17, 1
ecall
li x17, 10
ecall