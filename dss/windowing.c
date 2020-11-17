#include "mmwave_lib.h"

extern void windowing_asm(cmplx16ImRe_t *x, short *h);

void windowing(cmplx16ImRe_t *fftSrcAddr, short *window, int len)
{
	int q = len / 64;

	for (int i = 0; i < q; i++) {
		windowing_asm(&(fftSrcAddr[i * 64]), &(window[i * 128]));
	}

}
