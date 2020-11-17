#ifdef CROSS_VALIDATION
#include <stdlib.h>
#include<stdio.h>
#define TEST_OUT(a) printf("%d\n", a);
#else
#define TEST_OUT(a)
#endif

#ifdef DSP_VALIDATION
#include <swift_debug.h>
#endif
int main()
{
    int a = 1;
    for (int i = 0; i < 64; ++i) {
        a += i;

    }
	TEST_OUT(a);
#ifdef DSP_VALIDATION
	dbg_output(&a, 1, 4);
#endif
    return 0;
}
