###############1 a)
addi x10,x0,3
addi x11,x0,7
addi x12,x0,4

add x10,x10,x11
sub x10,x10,x12

###############1 b)
slli x13,x10,3

###############1 c)
li x14,824    #824 dec = 0x338
li x15,0x0F0
and x14,x14,x15
srli x14,x14,4

#############1 d)
li x16,824
li x17,0x100
xor x16,x16,x17
