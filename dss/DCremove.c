

#include "mmwave_lib.h"

//#define  NSAMPLES 128
//int div2(int ll, int n) {
//	int a = high(ll);
//	int b = low(ll);
//	a /= n;
//	b /= n;
//	return (get(a) << 16) + b;
//}
//short *s1 [128];
//int *s = sample;
//cmplx16ImRe_t *sum[NSAMPLES];
void dcremove(int numsample,cmplx16ImRe_t *s,cmplx32ImRe_t *sum)
{   short i=16;
    short k=numsample/i;
    short m,b;
for(short jj=0;jj<k;jj++)
	{ m=i;b=i;
	(*(sum+jj)).real=0;
	(*(sum+jj)).imag=0;
	  for(int j =jj*i ; j <jj*i+ i; j++)
	 {
		if((*(s+j)).real==0)
	       {m=m-1;}
		else
		{(*(sum+jj)).real += (*(s+j)).real;}
		if((*(s+j)).imag==0)
			       {b=b-1;}
		else
		{(*(sum+jj)).imag += (*(s+j)).imag;}
				}
	 (*(sum+jj)).real /= m;
	 (*(sum+jj)).imag /= b;
	}
(*(sum+k)).real=0;
(*(sum+k)).imag=0;
   for(short n=0;n<k;n++)
   {  (*(sum+k)).real +=(*(sum+n)).real;
   (*(sum+k)).imag +=(*(sum+n)).imag;
   }
     (*(sum+k)).real /= k;
	 (*(sum+k)).imag /= k;

	for(int j = 0; j < numsample; j++)
	{   if((*(s+j)).real!=0)
		{(*(s+j)).real -= (*(sum+k)).real;}
	    if((*(s+j)).imag!=0)
		{(*(s+j)).imag -= (*(sum+k)).imag;
		}
	}

}
//int main()
//{  int numsample=256;
//cmplx16ImRe_t *a;
//cmplx16ImRe_t *b;
//dcremove(numsample,a,b);
////	for (int ii = 0; ii < numsample; ii++)
////					{
////					*(s1 + ii) = *(s + ii);}
////
////	int res = 0;
////	int k=128;
////	int indi=numsample/k;
////	for (int ind=0;ind<indi;ind++)
////	{
////	for (int i = 0; i < k; i += 2) {
////		res = res + (*(s1 + ind*k + i) + *(s1 + ind*k + i + 1));
////	}
////		}
////	res = div2(res, numsample);
////	for (int j = 0; j < numsample; j += 1) {
//// 		*(s1 + j) = *(s1 + j) - res;
////	}
////
////
////
////
////
////	for (int jj = 0; jj < numsample; jj++)
////	{*(s + jj) = *(s1 + jj);
////	}
////	return s1;
//return 0;
//}

