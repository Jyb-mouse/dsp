
/* mmwave Include Files. */
#include "mmwave_lib.h"
#define PING_IDX 0
#define PONG_IDX 1
#define numDopplerBins 32
#define numRangeBins 256
#define numRxAntennas 4
#define numTxAntennas 3
#define numDopplerChirps 32

//
uint16_t  cfarDetOut[numRangeBins];
uint16_t  cfarDopplerDetOutBitMask[numDopplerBins]={0};
uint16_t cfarDetOutBuffer[numDopplerBins];
uint16_t  localDetMatrixBuffer[numDopplerChirps];
uint16_t Log2AbsBuf1[numDopplerChirps];
uint16_t *Log2AbsBuf=(uint16_t *)&Log2AbsBuf1;
uint16_t sumAbsBuf[numDopplerChirps]={0};
uint16_t detMartrix1 [numRangeBins*numDopplerChirps]={0};
uint16_t *detMartrix=(uint16_t *)&detMartrix1;
cmplx32ImRe_t  *sum;
cmplx16ImRe_t  *radarCubeBase;
cmplx32ReIm_t  windowingOutBuf[2*numDopplerChirps];
cmplx16ImRe_t H[256];
cmplx16ImRe_t pingPongBuf [2*numDopplerChirps];
cmplx16ImRe_t dcoutBuf[numDopplerChirps];
cmplx32ImRe_t fftOutBuf1 [numDopplerChirps]={0};
cmplx32ImRe_t * fftOutBuf;
cmplx32ImRe_t fftinBuf[numDopplerChirps];

cfarList cfardetect[numRangeBins];

int window1[] = {2621.0, 2696.0, 2920.0, 3291.0, 3805.0, 4457.0, 5240.0, 6148.0, 7170.0, 8296.0, 9516.0, 10818.0, 12187.0, 13612.0, 15077.0, 16568.0, 18070.0, 19568.0, 21048.0, 22495.0, 23893.0, 25231.0, 26493.0, 27668.0, 28743.0, 29709.0, 30556.0, 31274.0, 31858.0, 32301.0, 32599.0, 32748.0, 32748.0, 32599.0, 32301.0, 31858.0, 31274.0, 30556.0, 29709.0, 28743.0, 27668.0, 26493.0, 25231.0, 23893.0, 22495.0, 21048.0, 19568.0, 18070.0, 16568.0, 15077.0, 13612.0, 12187.0, 10818.0, 9516.0, 8296.0, 7170.0, 6148.0, 5240.0, 4457.0, 3805.0, 3291.0, 2920.0, 2696.0, 2621.0};
/****************************
				 *cfar doppler process
				 *********************************/
short cfar_doppler (uint16_t * detectmatrix)
{
	uint16_t    numDetObjPerCfar;
    uint16_t    numDetObjDoppler = 0;
    uint16_t    detIndex;
    uint16_t    rangeIdx,Channel;
    uint16_t thresholdScale=3000;
	uint16_t noiseDivShift=3;
	uint16_t DopguardLen=4;
	uint16_t DopwinLen=8;

	uint16_t cfarDetOutBuffer[numDopplerBins];

    /* Loop through all range bins for CFAR detection */

    rangeIdx = 0;
    for(int i=0;i<numDopplerChirps;i++)
    {
    localDetMatrixBuffer[i]=detectmatrix[i+rangeIdx*numDopplerBins];}

       /* Loop through all range bins for CFAR detection */

       do
       {
           uint16_t *currDetMatrixBuffer;
           uint8_t edmaChannel;

//           if(rangeIdx %2 == 0)
//           {
//              Channel = PING_IDX;
//           }
//           else
//           {
//              Channel = PONG_IDX;
//           }

           /* Calculate current local buffer base address */
           currDetMatrixBuffer = (uint16_t *)&localDetMatrixBuffer;
//        		   [numDopplerBins * Channel];


           /* CFAR-detecton on range line: search doppler peak among numDopplerBins samples */
           numDetObjPerCfar = cfarCa(
        		   currDetMatrixBuffer,
                   cfarDetOutBuffer,
				   numDopplerChirps,
                   thresholdScale,
                   noiseDivShift,
                   DopguardLen,
                   DopwinLen);

           for (detIndex = 0; detIndex < numDetObjPerCfar; detIndex++)
           {
               uint16_t dopplerIndex;

               dopplerIndex = cfarDetOutBuffer[detIndex];

               /* Update detection bit mask */
               cfarDopplerDetOutBitMask[dopplerIndex]=1;


           }
           rangeIdx++;

           /* Trigger next EDMA if it is not the last range Bins */
           if(rangeIdx < (numRangeBins - 1))
           {
        	   for(int i=0;i<numDopplerChirps;i++)
        	       {
        	       localDetMatrixBuffer[i]=detectmatrix[i+rangeIdx*numDopplerChirps];}
           }
       }while(rangeIdx < numRangeBins);

       return numDetObjPerCfar;

//    return 0;
}

/*********************************
				 *cfar range process
				 *********************************/
void cfar_rang(uint16_t * detectmatrix,uint16_t *cfarDopplerDetOutBitMask)
{
uint32_t            detIdx;
uint32_t            numDetObjIndex = 0;
uint32_t            dopplerLine;
uint32_t            numDetObj;
int32_t            srcAddr;
int32_t            localBufferAddr;
uint16_t            loopIndex = 0;
uint16_t            oneDopplerBinSize;
int16_t             dopplerSgnIdx;
uint16_t            numDetObjPerCfar;

uint16_t thresholdScale=1000;
uint16_t noiseDivShift=3;
uint16_t DopguardLen=4;
uint16_t DopwinLen=8;

uint16_t cfar_rangdetect[numRangeBins];
uint16_t cfarDetOutBuffer[numDopplerBins]={0};


int flag = 0;
for(int i=0;i<numDopplerChirps;i++)
  {if (cfarDopplerDetOutBitMask[i]&1)
     {    for(int j=0;j<numRangeBins;j++)
	    {cfar_rangdetect[j]=detectmatrix[i+j*numDopplerChirps];}

	      numDetObjPerCfar = cfarCa(
	    		          cfar_rangdetect,
	                       cfarDetOutBuffer,
						   numRangeBins,
	                       thresholdScale,
	                       noiseDivShift,
	                       DopguardLen,
	                       DopwinLen);

          if(numDetObjPerCfar>0)
          {    for (int detIndex = 0; detIndex < numDetObjPerCfar; detIndex++)
	               {
	                   uint16_t rangIndex;

	                   rangIndex = cfarDetOutBuffer[detIndex];
                     if ((rangIndex<numRangeBins)&&(rangIndex>0)&&(i>0))
                     {cfarDetOut[2*flag]=rangIndex;
                      cfarDetOut[2*flag+1]=i;
                      cfardetect[flag].rangeIdx=rangIndex;
                      cfardetect[flag].dopplerIdx=i;
                      cfardetect[flag].numObjsIn=numDetObjPerCfar;
                      flag++;             	}
	                   /* Update detection bit mask */
                     else

                     { rangIndex=0;}

	               }
	               memset((uint16_t *)cfarDetOutBuffer,0,numDopplerChirps*sizeof(int16_t));
          }
        }
     }

//return cfarDetOut;
}



void dopplerandcfar(cmplx16ImRe_t*radarCubeBuf1)
{
	/*********************************
				 *doppler process
				 *********************************/
uint16_t log2VirtAnt=2;
uint16_t rxAntIdx, rangeIdx, txAntIdx,idx;
uint16_t nextTransferRxIdx, nextTransferRangeIdx, nextTransferTxIdx;
uint16_t rxAntIdxBPMPreviousBuffer, txAntIdxBPMPreviousBuffer;
uint32_t nextTransferIdx, waitingTime, pingPongIdx;
uint8_t  channel;

cmplx16ImRe_t  *inpDoppFftBuf;
cmplx16ImRe_t radarCubeBuf[numTxAntennas * numRxAntennas * numDopplerBins * numRangeBins];
//cmplx16ImRe_t radarCubeBuf [numDopplerChirps*numRangeBins*numRxAntennas*numTxAntennas];


for (int i=0;i<numTxAntennas * numRxAntennas * numDopplerBins * numRangeBins;i++)
{ radarCubeBuf[i]=(*(radarCubeBuf1+i));}

/*********************************
			 * Data Input
			 *********************************/

pingPongIdx = PING_IDX;
/*设置pingPongBuf大小，开始输入第一组数据*/
for (int i=0;i<numDopplerChirps;i++)
{   pingPongBuf[i]=radarCubeBuf[i*numRangeBins*numRxAntennas];

}


//for(int loo=0;loo<32;loo++)
//{
/*一帧Doppler fft*/
for (rangeIdx = 0; rangeIdx <numRangeBins; rangeIdx++)
    {
//	rangeIdx=loo*8+rangeIdx;
        for (rxAntIdx = 0; rxAntIdx < numRxAntennas; rxAntIdx++)
        {
            for (txAntIdx = 0; txAntIdx < numTxAntennas; txAntIdx++)
            {
             nextTransferTxIdx    = txAntIdx + 1;
             nextTransferRxIdx    = rxAntIdx;
             nextTransferRangeIdx = rangeIdx;

             if(nextTransferTxIdx == numTxAntennas)
             {
               nextTransferTxIdx = 0;
               nextTransferRxIdx++;
               if(nextTransferRxIdx == numRxAntennas)
               {
                   nextTransferRxIdx = 0;
                   nextTransferRangeIdx++;
               }
             }

      /*处理的下一个chirp*/
      nextTransferIdx = (nextTransferTxIdx * numRxAntennas *numDopplerChirps +
                                                nextTransferRxIdx) * numRangeBins + nextTransferRangeIdx;
      /*pingPongIdx控制*/
      if(nextTransferRangeIdx < numRangeBins)
                      {

                          if (pingPongIdx == PONG_IDX)
                          {
                              channel = PING_IDX;
                          }
                          else
                          {
                              channel = PONG_IDX;
                          }

                          /*下一chirp数据放入pingpongBuf*/
                          for (int i=0;i<numDopplerChirps;i++)
                          {   pingPongBuf[channel*numDopplerChirps+i]=radarCubeBuf[i*numRangeBins*numRxAntennas+nextTransferIdx];

                          }

                      }
      inpDoppFftBuf = (cmplx16ImRe_t *) &pingPongBuf[pingPongIdx * numDopplerChirps];


	  /*********************************
		 * Data Processing
		 *********************************/
      uint16_t sumvalue=0;
       sum=(cmplx32ImRe_t *)&sumvalue;
      /* 静物去除 */
     dcremove(numDopplerChirps,(cmplx16ImRe_t *)inpDoppFftBuf,(cmplx32ImRe_t *) sum);

      memcpy((cmplx16ImRe_t*)dcoutBuf,(cmplx16ImRe_t *)inpDoppFftBuf,numDopplerChirps*sizeof(cmplx16ImRe_t));

      /* 16x32I-Q 加窗,由ImRe变为ReIm */
         windowing_16x32((cmplx16ImRe_t *)dcoutBuf,(int *)window1,(cmplx32ImRe_t *)fftinBuf,numDopplerChirps);
   //      windowing_16x32((cmplx16ImRe_t *)inpDoppFftBuf,(cmplx32ReIm_t *)H,(cmplx32ReIm_t *)windowingOutBuf,numDopplerChirps);
         fftOutBuf=(cmplx32ImRe_t *)&fftOutBuf1;

         /* DSP_fft32x32()*/
   //      fft_32x32((cmplx32ReIm_t *)windowingOutBuf,(cmplx32ReIm_t *)fftOutBuf,numDopplerBins);
         fft_32x32( (cmplx32ImRe_t *)fftinBuf, (cmplx32ImRe_t *) fftOutBuf, numDopplerChirps);
         for(short p=0;p<1;p++)
         {fftOutBuf1[p].real=0;
         fftOutBuf1[p].imag=0;}


      /*计算log2Abs并累加*/
      log2abs32((cmplx32ImRe_t *)fftOutBuf,(uint16_t *)Log2AbsBuf,numDopplerChirps);


      /* 确认是不是第一根虚天线*/
          if (rxAntIdx == 0)
          {if(txAntIdx == 0)
            { /*第一根虚天线就开始一次新的累加 */
              for (idx = 0; idx < numDopplerChirps; idx++)
              {
                  sumAbsBuf[idx] = *(Log2AbsBuf+idx);
              }
            }
          }
          else
          {
              /*不是第一根虚天线就继续累加*/
        	  for ( idx=0; idx<numDopplerChirps; idx++ )
        	         {
        		    sumAbsBuf[idx] +=*(Log2AbsBuf+idx);}

          }


          pingPongIdx ^= 1;
         }/*txAntIdx*/

      }/* rxAntIdx */

        /*********************************
        		 * Data Output
        *********************************/
        /* 把数据放到detection matrix */
//        for(short kk=0;kk<numDopplerChirps;kk++)
//        {
//        	detMartrix[rangeIdx*numDopplerChirps+kk]=sumAbsBuf[kk];
//        }
        uint32_t detMartrixAddr;
        detMartrixAddr=(uint32_t)(detMartrix1+rangeIdx*numDopplerChirps);
        memcpy((uint32_t)detMartrixAddr,(uint16_t*)sumAbsBuf,numDopplerBins*sizeof(uint16_t));

    }
/*********************************
				 *cfar process
				 *********************************/

 cfar_doppler((uint16_t *)detMartrix);
//	int16_t cfar_rangdetect[numRangeBins];
 cfar_rang((uint16_t *)detMartrix,(uint16_t *)cfarDopplerDetOutBitMask);


// return 0;

}


