.global dsp_maxval_asm

_begin:

.text
#Function dsp_maxval_asm:
#	void dsp_maxval_asm(short *data, short *temp);
#	perform  max(data,temp) , data and temp are 16x128 vector
#   ps: resualt is a 16x128 vector
#Param:
#   GR30 stack pointer
#	GR4 address of data
#	GR5 address of temp
#Ret: temp = max(data,temp) VR2
dsp_maxval_asm:
#VR0 data
#VR1 temp
movigh GR9 0x0||||vload16 VR0 GR4 0|vload16 VR1 GR5 0||
movigl GR9 0x4||vmax20 VR2 VR0 VR1|||||
||||vmovrg2v20 VR1 GR9|||
||vsl20 VR2 VR2 VR1|||||
||||||vstore20 VR2 GR5 0|
ret|||||||
