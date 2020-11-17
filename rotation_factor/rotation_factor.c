/*
 * rotation_factor.c
 *
 *  Created on: 2020��9��16��
 *      Author: Jyb_mouse
 */
#include <swift_debug.h>
#include <swift_math.h>
extern short vmac_rotation_factor(short *x, short *h,short *c);
//short f[]={0,32767,-804,32757,-1607,32727,-2410,32678,-3211,32609,-4011,32520,-4807,32412,-5601,32284,-6392,32137,-7179,31970,-7961,31785,-8739,31580,-9511,31356,-10278,31113,-11038,30851,-11792,30571,-12539,30272,-13278,29955,-14009,29621,-14732,29268,-15446,28897,-16150,28510,-16845,28105,-17530,27683,-18204,27244,-18867,26789,-19519,26318,-20159,25831,-20787,25329,-21402,24811,-22004,24278,-22594,23731,-23169,23169,-23731,22594,-24278,22004,-24811,21402,-25329,20787,-25831,20159,-26318,19519,-26789,18867,-27244,18204,-27683,17530,-28105,16845,-28510,16150,-28897,15446,-29268,14732,-29621,14009,-29955,13278,-30272,12539,-30571,11792,-30851,11038,-31113,10278,-31356,9511,-31580,8739,-31785,7961,-31970,7179,-32137,6392,-32284,5601,-32412,4807,-32520,4011,-32609,3211,-32678,2410,-32727,1607,-32757,804,-32767,0,-32757,-804,-32727,-1607,-32678,-2410,-32609,-3211,-32520,-4011,-32412,-4807,-32284,-5601,-32137,-6392,-31970,-7179,-31785,-7961,-31580,-8739,-31356,-9511,-31113,-10278,-30851,-11038,-30571,-11792,-30272,-12539,-29955,-13278,-29621,-14009,-29268,-14732,-28897,-15446,-28510,-16150,-28105,-16845,-27683,-17530,-27244,-18204,-26789,-18867,-26318,-19519,-25831,-20159,-25329,-20787,-24811,-21402,-24278,-22004,-23731,-22594,-23169,-23169,-22594,-23731,-22004,-24278,-21402,-24811,-20787,-25329,-20159,-25831,-19519,-26318,-18867,-26789,-18204,-27244,-17530,-27683,-16845,-28105,-16150,-28510,-15446,-28897,-14732,-29268,-14009,-29621,-13278,-29955,-12539,-30272,-11792,-30571,-11038,-30851,-10278,-31113,-9511,-31356,-8739,-31580,-7961,-31785,-7179,-31970,-6392,-32137,-5601,-32284,-4807,-32412,-4011,-32520,-3211,-32609,-2410,-32678,-1607,-32727,-804,-32757};
short m[] = {0,1,4,5,8,9,12,13,16,17,20,21,24,25,28,29,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32};
short f[] = {0,1,4,5,8,9,12,13,16,17,20,21,24,25,28,29,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32};
int main(){
	int n2 = 16;
	if(n2>=16){
		int step = 0;
		set_vpsel(1);
		for(int p = 0; p < n2; p += 16){
			vmac_rotation_factor(&f[p*2],m,&f[step]);
			step += 16;
		}
	}
	return 0;
}
