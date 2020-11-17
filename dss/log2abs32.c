
#include <stdlib.h>
/* mmwave Include Files. */


#include "mmwave_lib.h"
void log2abs32(const cmplx32ImRe_t *fftOutBuf,uint16_t *Log2AbsBuf,int numDopplerBins)
{   for(short i=0;i<numDopplerBins;i++)
	{int32_t real = abs((*(fftOutBuf+i)).real);
	int32_t imag = abs((*(fftOutBuf+i)).imag);

	int32_t max = imag;
	int32_t min = real;
	if (real > imag) {
		max = real;
		min = imag;
	}
	int absvalue = max + ((min * 3) >> 3);
	*(Log2AbsBuf+i)= log2_q8(absvalue);
 }
}
//
//int main(){
//	short temp = 0;
////	for(int i = 0; i < INT32_MAX; ++i) {
//	int i=16;int j=32;
//		temp = log2abs32(i,j);
////	}
//
//	return temp;
//}

