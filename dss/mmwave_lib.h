#ifndef MMWAVE_LIB_H_
#define MMWAVE_LIB_H_
#include <swift_math.h>
#include <stdint.h>
typedef struct cmplx16ImRe_t_
{
    int16_t imag; /*!< @brief imaginary part */
    int16_t real; /*!< @brief real part */
} cmplx16ImRe_t;
typedef struct cmplx32ReIm_t_
{
    int32_t real; /*!< @brief real part */
    int32_t imag; /*!< @brief imaginary part */
} cmplx32ReIm_t;
typedef struct cmplx32ImRe_t_
{
    int32_t imag; /*!< @brief imaginary part */
    int32_t real; /*!< @brief real part */
} cmplx32ImRe_t;

typedef struct objec_t_
{
    int32_t x; /*!< @brief x part */
    int32_t y; /*!< @brief y part */
    int32_t z; /*!< @brief z part */
} objec_t;

typedef struct cfarpList_
{  int16_t rangeIdx;
   int16_t dopplerIdx;
   int16_t numObjsIn;
}cfarList;


/*
 * Vector operation
 */

void vecsum(const cmplx16ImRe_t *input, cmplx32ImRe_t *output, int ncplx);
void vecsubc(const cmplx16ImRe_t *input, cmplx16ImRe_t *output, const cmplx16ImRe_t subval,int ncplx);
void dcremove(int len, cmplx16ImRe_t *data,cmplx32ImRe_t *sum);

/* * Mathematical operation
 */
void accum16shift(const uint16_t inp[restrict],
                            uint16_t out[restrict],
                            uint32_t len);
void log2abs32(const cmplx32ImRe_t *inp, uint16_t *out, int len);
/*
 * Windowing
 */
void windowing(cmplx16ImRe_t *fftSrcAddr, short *window, int len);
void windowing_16x32(const cmplx16ImRe_t *inp, const int *win, cmplx32ImRe_t *out, int len);
void windowing_32x32(const cmplx16ImRe_t *inp, const cmplx32ImRe_t *win, cmplx32ImRe_t *out, int len);
/*
 * FFT
 */
void fft_16x16(const int16_t *fftSrcAddr, int16_t * fftDstAddr, const int nfft);
void fft_32x32(const cmplx32ImRe_t *fftSrcAddr, cmplx32ImRe_t * fftDstAddr, const int nfft);


uint16_t cfarCadBwrap(const uint16_t *inp,
                            uint16_t *out, uint16_t len,
							uint16_t const1, uint16_t const2,
							uint16_t guardLen, uint16_t noiseLen );

uint16_t cfarCa(const uint16_t *inp,
                            uint16_t *out, int16_t len,
							int16_t const1, int16_t const2,
							int16_t guardLen, int16_t noiseLen );

void dopplerandcfar(cmplx16ImRe_t*radarCubeBuf1);
/*
 *
 * XYZestimation
 */
int32_t _powerAndMax(cmplx32ImRe_t *input,
                              int32_t Ncplx,
							  int32_t * outpowbuf,
							  int32_t * maxpow);
void XYZestimation(cmplx32ImRe_t *aoaDspObj,int objOutIdx,int objInCfarIdx,int maxIdx,int peakVal);

//void atan2()
#endif /* MMWAVE_LIB_TEST_H_ */
