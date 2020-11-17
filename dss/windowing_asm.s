.global windowing_asm
#final
_begin:

.text
#Function:
# void windowing_asm(short* x, short* h);
# result: x[i] = x[i]*h[i]
#
#Param£º
# GR4 address of x[0]
# GR5 address of h[0]


windowing_asm:
#VR0 x
#VR1 h
movigh GR9 0x0||||vload16 VR0 GR4 0|vload16 VR1 GR5 0||
movigl GR9 0x4|||||||
||vfmul20 VR2 VR0 VR1|||vmovrg2v20 VR3 GR9||
||vsl20 VR2 VR2 VR3|||||
||||||vstore20 VR2 GR4 0|
ret|||||||
nop|||||||
nop|||||||
