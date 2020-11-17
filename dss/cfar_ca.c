
#include "mmwave_lib.h"
uint16_t cfarCa(const uint16_t *inp,
                            uint16_t *out, int16_t len,
							int16_t const1, int16_t const2,
							int16_t guardLen, int16_t noiseLen )
{
 uint32_t idx, idxLeftNext, idxLeftPrev, idxRightNext,
             idxRightPrev,  idxCUT;
    uint32_t sum, sumLeft, sumRight;
    int16_t   outIdx;
    /* initializations */
    outIdx = 0;
    sumLeft = 0;
    sumRight = 0;
    for (idx = 0; idx < noiseLen; idx++)
    {
        sumRight += inp[idx + guardLen + 1U];
    }

    /*********************************************************************************************/
    /* One-sided comparision for the first segment (for the first noiseLen+gaurdLen samples */
    idxCUT = 0;
    if ((uint32_t) inp[idxCUT] > ((sumRight >> (const2 - 1U)) + const1))
    {
        out[outIdx] = (uint16_t)idxCUT;
//        noise[outIdx] = sumRight >> (const2-1U);
        outIdx++;
    }
    idxCUT++;

    idxLeftNext = 0;
    idxRightPrev = idxCUT + guardLen;
    idxRightNext = idxRightPrev + noiseLen;
    for (idx = 0; idx < (noiseLen + guardLen - 1U); idx++)
    {
        sumRight = (sumRight + inp[idxRightNext]) - inp[idxRightPrev];
        idxRightNext++;
        idxRightPrev++;

        if (idx < noiseLen)
        {
            sumLeft += inp[idxLeftNext];
            idxLeftNext++;
        }

        if ((uint32_t) inp[idxCUT] > ((sumRight >> (const2 - 1U)) + const1))
        {
            out[outIdx] = (uint16_t)idxCUT;
//            noise[outIdx] = sumRight >> (const2-1U);
            outIdx++;
        }
        idxCUT++;
    }

    /*********************************************************************************************/
    /* Two-sided comparision for the middle segment */
    sumRight = (sumRight + inp[idxRightNext]) - inp[idxRightPrev];
    idxRightNext++;
    idxRightPrev++;

//    if (cfartype == CFAR_CA)

        sum = sumRight + sumLeft;
        if ((uint32_t) inp[idxCUT] > ((sum >> const2) + const1))
        {
            out[outIdx] = (uint16_t)idxCUT;
//            noise[outIdx] = sum >> const2;
            outIdx++;
        }
        idxCUT++;

        idxLeftPrev = 0;
        for (idx = 0; idx < (len - 2U*(noiseLen + guardLen) - 1U); idx++)
        {
            sumLeft = (sumLeft + inp[idxLeftNext]) - inp[idxLeftPrev];
            sumRight = (sumRight + inp[idxRightNext]) - inp[idxRightPrev];
            idxLeftNext++;
            idxLeftPrev++;
            idxRightNext++;
            idxRightPrev++;
            sum = sumLeft + sumRight;

            if ((uint32_t) (inp[idxCUT]) > ((sum >> const2) + const1))
            {
                out[outIdx] = (uint16_t)idxCUT;
//                noise[outIdx] = sum >> const2;
                outIdx++;
            }
            idxCUT++;
        }
    /*CFAR_CA*/
    /*********************************************************************************************/
       /* One-sided comparision for the last segment (for the last noiseLen+gaurdLen samples) */
       for (idx = 0; idx < (noiseLen + guardLen); idx++)
       {
           sumLeft = (sumLeft + inp[idxLeftNext]) - inp[idxLeftPrev];
           idxLeftNext++;
           idxLeftPrev++;
           if ((uint32_t) inp[idxCUT] > ((sumLeft >> (const2 - 1U)) + const1))
           {
               out[outIdx] = (uint16_t)idxCUT;
//               noise[outIdx] = sumLeft >> (const2-1U);
               outIdx++;
           }
           idxCUT++;
       }
       /*********************************************************************************************/

       return (outIdx);

   }  /* CFARCADSP_cfarCadB_SOGO */
