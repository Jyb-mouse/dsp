
.global vmac_shuffle
_begin:

.text
#Param:
#	GR4 address of x[2*j] GR30+0
#	GR5 address of x[2*l] GR30+1
#	GR6 address of w GR30+2
#
vmac_shuffle:
||||vload16 vr0 gr4 0|vload16 vr1 gr5 0||
||||load32 gr7 gr30 3|load32 gr8 gr30 4||
||||load32 gr9 gr30 5|load32 gr10 gr30 6||
||||vload16 vr2 gr7 0|vload16 vr3 gr8 0||
||||vload16 vr8 gr9 0|vload16 vr9 gr10 0||
|||||load32 gr6 gr30 2||
||vsfl vr4 vr3 vr1|vsfl vr5 vr2 vr0||vload16 vr10 gr6 0||
||vsfl vr6 vr8 vr0|vsfl vr7 vr9 vr1||||
||vadd20 vr0 vr4 vr6|vadd20 vr1 vr5 vr7||||
movigh gr12 0x0||vsub20 vr4 vr0 vr1|vadd20 vr5 vr0 vr1||||
||vsfl vr6 vr3 vr10|vsfl vr11 vr8 vr10||||
movigl gr12 0x4||vadd20 vr10 vr6 vr11|||||
||vcmul20 vr0 vr10 vr4|||||
||vsfl vr11 vr2 vr5|vsfl vr12 vr3 vr0||||
||vsfl vr3 vr8 vr5|vsfl vr0 vr9 vr0||||
||vadd20 vr5 vr12 vr3|vadd20 vr6 vr11 vr0||||
||||vmovrg2v20 vr1 gr12|||
||vsl20 vr7 vr5 vr1|||||
||vsl20 vr8 vr6 vr1|||||
||||||vstore20 vr7 gr4 0|vstore20 vr8 gr5 0
ret|||||||
nop|||||||
nop|||||||
