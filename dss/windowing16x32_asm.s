.global windowing16x32_asm

_begin:

.text
#Function:
# void win16x32_asm(short *data, int *win, int *out, short *shuffle_l, short *shuffle_h, short *shuffle_x2_l, short *shuffle_x2_h);
#
# result: out[i].imag = data[i].imag*win[i]
#		  out[i].real = data[i].real*win[i]
#
#Param£º
# GR4 address of data[0]
# GR5 address of win[0]
# GR2 address of out[0] GR30+2
# GR3 address of shuffle_l[0] GR30+3
# GR4 address of shuffle_h[0] GR30+4
# GR5 address of shuffle_x2_l[0] GR30+5
# GR6 address of shuffle_x2_h[0] GR30+6
windowing16x32_asm:
#VR0 data
#VR1 win
#VR2 shuffle_l
#VR4 shuffle_h
#VR5 shuffle_x2_l
#VR6 shuffle_x2_h
movigh GR9 0x0|movigh GR13 0x0|||vload16 VR0 GR4 0|vload32 VR1 GR5 0||
movigl GR9 0x8|movigl GR13 0x4|||load32 GR2 GR30 2|load32 GR3 GR30 3||
||vmovrg2v20 VR4 GR13||vload16 VR2 GR3 0|load32 GR4 GR30 4||
||vsra20 VR0 VR0 VR4||load32 GR5 GR30 5|load32 GR6 GR30 6||
||||vload16 VR4 GR4 0|vload16 VR5 GR5 0||
||vsfl VR3 VR2 VR0|vsfl VR4 VR4 VR0|vload16 VR6 GR6 0|||
||vsfl VR5 VR5 VR1|vsfl VR6 VR6 VR1||||
||vfmul40 VR6 VR6 VR4|||||
||vfmul40 VR3 VR5 VR3|||vmovrg2v40 VR4 GR9||
||vsl40 VR3 VR3 VR4|vsl40 VR6 VR6 VR4||||
||||||vstore40 VR3 GR2 0|vstore40 VR6 GR2 1
ret|||||||
nop|||||||
nop|||||||
