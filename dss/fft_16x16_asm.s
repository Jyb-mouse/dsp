
.global vmac_butterfly
_begin:

.text
#Param:
#	GR4 address of x[2*l] GR30+0
#	GR5 address of x[2*i] GR30+1
#	GR6 address of w GR30+2
#

vmac_butterfly:
#vr0 x[2*m] l>m
#vr1 x[2*l]
#vr2 w
#vr3 xt,yt
||||vload16 vr0 gr4 0|vload16 vr1 gr5 0||
movigh gr10 0x0||vsub20 vr3 vr0 vr1|vadd20 vr6 vr1 vr0|load32 gr6 gr30 2|||
movigl gr10 0x4||||vload16 vr2 gr6 0|||
||vcmul20 vr4 vr3 vr2|||||
||||vmovrg2v20 vr5 gr10|||
||vsl20 vr7 vr6 vr5|||||
||vsl20 vr8 vr4 vr5|||||
||||||vstore20 vr7 gr4 0|vstore20 vr8 gr5 0
ret|||||||
nop|||||||
nop|||||||







