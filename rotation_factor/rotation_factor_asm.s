/*
 * rotation_factor_asm.s
 *
 *  Created on: 2020Äê9ÔÂ16ÈÕ
 *      Author: Jyb_mouse
 */

.global vmac_rotation_factor
_begin:

.text

vmac_rotation_factor:
||||vload16 vr0 gr4 0|vload16 vr1 gr5 0||
movigh gr11 0x0|||||load32 gr10 gr30 2||
movigl gr11 0x4||||vload16 vr2 gr10 0|||
||vsfl vr3 vr2 vr0||vmovrg2v20 vr12 gr11|||
||vsl20 vr1 vr3 vr12|||||
||||||vstore20 vr1 gr4 0|
ret|||||||
nop|||||||
nop|||||||
