//#include <swift_debug.h>

//i16x128_t data[]={0,300,201,222,298,29,240,-178,58,-294,-154,-257,-287,-87,-271,128,-114,277,101,282,264,141,291,-72,166,-249,-44,-296,-231,-190,-299,14,-212,212,-14,299,190,231,296,44,249,-166,72,-291,-141,-264,-282,-101,-277,114,-128,271,87,287,257,154,294,-58,178,-240,-29,-298,-222,-201,-300,0,-222,201,-29,298,178,240,294,58,257,-154,87,-287,-128,-271,-277,-114,-282,101,-141,264,72,291,249,166,296,-44,190,-231,-14,-299,-212,-212,-299,-14,-231,190,-44,296,166,249,291,72,264,-141,101,-282,-114,-277,-271,-128,-287,87,-154,257,58,294,240,178,298,-29,201,-222,0,-300,-201,-222,-298,-29,-240,178,-58,294,154,257,287,87,271,-128,114,-277,-101,-282,-264,-141,-291,72,-166,249,44,296,231,190,299,-14,212,-212,14,-299,-190,-231,-296,-44,-249,166,-72,291,141,264,282,101,277,-114,128,-271,-87,-287,-257,-154,-294,58,-178,240,29,298,222,201,300,0,222,-201,29,-298,-178,-240,-294,-58,-257,154,-87,287,128,271,277,114,282,-101,141,-264,-72,-291,-249,-166,-296,44,-190,231,14,299,212,212,299,14,231,-190,44,-296,-166,-249,-291,-72,-264,141,-101,282,114,277,271,128,287,-87,154,-257,-58,-294,-240,-178,-298,29,-201,222,0,300,201,222,298,29,240,-178,58,-294,-154,-257,-287,-87,-271,128,-114,277,101,282,264,141,291,-72,166,-249,-44,-296,-231,-190,-299,14,-212,212,-14,299,190,231,296,44,249,-166,72,-291,-141,-264,-282,-101,-277,114,-128,271,87,287,257,154,294,-58,178,-240,-29,-298,-222,-201,-300,0,-222,201,-29,298,178,240,294,58,257,-154,87,-287,-128,-271,-277,-114,-282,101,-141,264,72,291,249,166,296,-44,190,-231,-14,-299,-212,-212,-299,-14,-231,190,-44,296,166,249,291,72,264,-141,101,-282,-114,-277,-271,-128,-287,87,-154,257,58,294,240,178,298,-29,201,-222,0,-300,-201,-222,-298,-29,-240,178,-58,294,154,257,287,87,271,-128,114,-277,-101,-282,-264,-141,-291,72,-166,249,44,296,231,190,299,-14,212,-212,14,-299,-190,-231,-296,-44,-249,166,-72,291,141,264,282,101,277,-114,128,-271,-87,-287,-257,-154,-294,58,-178,240,29,298,222,201,300,0,222,-201,29,-298,-178,-240,-294,-58,-257,154,-87,287,128,271,277,114,282,-101,141,-264,-72,-291,-249,-166,-296,44,-190,231,14,299,212,212,299,14,231,-190,44,-296,-166,-249,-291,-72,-264,141,-101,282,114,277,271,128,287,-87,154,-257,-58,-294,-240,-178,-298,29,-201,222};
//i16x128_t f[]={0,32767,-201,32766,-402,32764,-603,32761,-804,32757,-1005,32751,-1206,32744,-1406,32736,-1607,32727,-1808,32717,-2009,32705,-2209,32692,-2410,32678,-2610,32662,-2811,32646,-3011,32628,-3211,32609,-3411,32588,-3611,32567,-3811,32544,-4011,32520,-4210,32495,-4409,32468,-4608,32441,-4807,32412,-5006,32382,-5205,32350,-5403,32318,-5601,32284,-5799,32249,-5997,32213,-6195,32176,-6392,32137,-6589,32097,-6786,32056,-6982,32014,-7179,31970,-7375,31926,-7571,31880,-7766,31833,-7961,31785,-8156,31735,-8351,31684,-8545,31633,-8739,31580,-8932,31525,-9126,31470,-9319,31413,-9511,31356,-9703,31297,-9895,31236,-10087,31175,-10278,31113,-10469,31049,-10659,30984,-10849,30918,-11038,30851,-11227,30783,-11416,30713,-11604,30643,-11792,30571,-11980,30498,-12166,30424,-12353,30349,-12539,30272,-12724,30195,-12909,30116,-13094,30036,-13278,29955,-13462,29873,-13645,29790,-13827,29706,-14009,29621,-14191,29534,-14372,29446,-14552,29358,-14732,29268,-14911,29177,-15090,29085,-15268,28992,-15446,28897,-15623,28802,-15799,28706,-15975,28608,-16150,28510,-16325,28410,-16499,28309,-16672,28208,-16845,28105,-17017,28001,-17189,27896,-17360,27790,-17530,27683,-17699,27575,-17868,27466,-18036,27355,-18204,27244,-18371,27132,-18537,27019,-18702,26905,-18867,26789,-19031,26673,-19194,26556,-19357,26437,-19519,26318,-19680,26198,-19840,26077,-20000,25954,-20159,25831,-20317,25707,-20474,25582,-20631,25456,-20787,25329,-20942,25201,-21096,25072,-21249,24942,-21402,24811,-21554,24679,-21705,24546,-21855,24413,-22004,24278,-22153,24143,-22301,24006,-22448,23869,-22594,23731,-22739,23592,-22883,23452,-23027,23311,-23169,23169,-23311,23027,-23452,22883,-23592,22739,-23731,22594,-23869,22448,-24006,22301,-24143,22153,-24278,22004,-24413,21855,-24546,21705,-24679,21554,-24811,21402,-24942,21249,-25072,21096,-25201,20942,-25329,20787,-25456,20631,-25582,20474,-25707,20317,-25831,20159,-25954,20000,-26077,19840,-26198,19680,-26318,19519,-26437,19357,-26556,19194,-26673,19031,-26789,18867,-26905,18702,-27019,18537,-27132,18371,-27244,18204,-27355,18036,-27466,17868,-27575,17699,-27683,17530,-27790,17360,-27896,17189,-28001,17017,-28105,16845,-28208,16672,-28309,16499,-28410,16325,-28510,16150,-28608,15975,-28706,15799,-28802,15623,-28897,15446,-28992,15268,-29085,15090,-29177,14911,-29268,14732,-29358,14552,-29446,14372,-29534,14191,-29621,14009,-29706,13827,-29790,13645,-29873,13462,-29955,13278,-30036,13094,-30116,12909,-30195,12724,-30272,12539,-30349,12353,-30424,12166,-30498,11980,-30571,11792,-30643,11604,-30713,11416,-30783,11227,-30851,11038,-30918,10849,-30984,10659,-31049,10469,-31113,10278,-31175,10087,-31236,9895,-31297,9703,-31356,9511,-31413,9319,-31470,9126,-31525,8932,-31580,8739,-31633,8545,-31684,8351,-31735,8156,-31785,7961,-31833,7766,-31880,7571,-31926,7375,-31970,7179,-32014,6982,-32056,6786,-32097,6589,-32137,6392,-32176,6195,-32213,5997,-32249,5799,-32284,5601,-32318,5403,-32350,5205,-32382,5006,-32412,4807,-32441,4608,-32468,4409,-32495,4210,-32520,4011,-32544,3811,-32567,3611,-32588,3411,-32609,3211,-32628,3011,-32646,2811,-32662,2610,-32678,2410,-32692,2209,-32705,2009,-32717,1808,-32727,1607,-32736,1406,-32744,1206,-32751,1005,-32757,804,-32761,603,-32764,402,-32766,201,-32767,0,-32766,-201,-32764,-402,-32761,-603,-32757,-804,-32751,-1005,-32744,-1206,-32736,-1406,-32727,-1607,-32717,-1808,-32705,-2009,-32692,-2209,-32678,-2410,-32662,-2610,-32646,-2811,-32628,-3011,-32609,-3211,-32588,-3411,-32567,-3611,-32544,-3811,-32520,-4011,-32495,-4210,-32468,-4409,-32441,-4608,-32412,-4807,-32382,-5006,-32350,-5205,-32318,-5403,-32284,-5601,-32249,-5799,-32213,-5997,-32176,-6195,-32137,-6392,-32097,-6589,-32056,-6786,-32014,-6982,-31970,-7179,-31926,-7375,-31880,-7571,-31833,-7766,-31785,-7961,-31735,-8156,-31684,-8351,-31633,-8545,-31580,-8739,-31525,-8932,-31470,-9126,-31413,-9319,-31356,-9511,-31297,-9703,-31236,-9895,-31175,-10087,-31113,-10278,-31049,-10469,-30984,-10659,-30918,-10849,-30851,-11038,-30783,-11227,-30713,-11416,-30643,-11604,-30571,-11792,-30498,-11980,-30424,-12166,-30349,-12353,-30272,-12539,-30195,-12724,-30116,-12909,-30036,-13094,-29955,-13278,-29873,-13462,-29790,-13645,-29706,-13827,-29621,-14009,-29534,-14191,-29446,-14372,-29358,-14552,-29268,-14732,-29177,-14911,-29085,-15090,-28992,-15268,-28897,-15446,-28802,-15623,-28706,-15799,-28608,-15975,-28510,-16150,-28410,-16325,-28309,-16499,-28208,-16672,-28105,-16845,-28001,-17017,-27896,-17189,-27790,-17360,-27683,-17530,-27575,-17699,-27466,-17868,-27355,-18036,-27244,-18204,-27132,-18371,-27019,-18537,-26905,-18702,-26789,-18867,-26673,-19031,-26556,-19194,-26437,-19357,-26318,-19519,-26198,-19680,-26077,-19840,-25954,-20000,-25831,-20159,-25707,-20317,-25582,-20474,-25456,-20631,-25329,-20787,-25201,-20942,-25072,-21096,-24942,-21249,-24811,-21402,-24679,-21554,-24546,-21705,-24413,-21855,-24278,-22004,-24143,-22153,-24006,-22301,-23869,-22448,-23731,-22594,-23592,-22739,-23452,-22883,-23311,-23027,-23169,-23169,-23027,-23311,-22883,-23452,-22739,-23592,-22594,-23731,-22448,-23869,-22301,-24006,-22153,-24143,-22004,-24278,-21855,-24413,-21705,-24546,-21554,-24679,-21402,-24811,-21249,-24942,-21096,-25072,-20942,-25201,-20787,-25329,-20631,-25456,-20474,-25582,-20317,-25707,-20159,-25831,-20000,-25954,-19840,-26077,-19680,-26198,-19519,-26318,-19357,-26437,-19194,-26556,-19031,-26673,-18867,-26789,-18702,-26905,-18537,-27019,-18371,-27132,-18204,-27244,-18036,-27355,-17868,-27466,-17699,-27575,-17530,-27683,-17360,-27790,-17189,-27896,-17017,-28001,-16845,-28105,-16672,-28208,-16499,-28309,-16325,-28410,-16150,-28510,-15975,-28608,-15799,-28706,-15623,-28802,-15446,-28897,-15268,-28992,-15090,-29085,-14911,-29177,-14732,-29268,-14552,-29358,-14372,-29446,-14191,-29534,-14009,-29621,-13827,-29706,-13645,-29790,-13462,-29873,-13278,-29955,-13094,-30036,-12909,-30116,-12724,-30195,-12539,-30272,-12353,-30349,-12166,-30424,-11980,-30498,-11792,-30571,-11604,-30643,-11416,-30713,-11227,-30783,-11038,-30851,-10849,-30918,-10659,-30984,-10469,-31049,-10278,-31113,-10087,-31175,-9895,-31236,-9703,-31297,-9511,-31356,-9319,-31413,-9126,-31470,-8932,-31525,-8739,-31580,-8545,-31633,-8351,-31684,-8156,-31735,-7961,-31785,-7766,-31833,-7571,-31880,-7375,-31926,-7179,-31970,-6982,-32014,-6786,-32056,-6589,-32097,-6392,-32137,-6195,-32176,-5997,-32213,-5799,-32249,-5601,-32284,-5403,-32318,-5205,-32350,-5006,-32382,-4807,-32412,-4608,-32441,-4409,-32468,-4210,-32495,-4011,-32520,-3811,-32544,-3611,-32567,-3411,-32588,-3211,-32609,-3011,-32628,-2811,-32646,-2610,-32662,-2410,-32678,-2209,-32692,-2009,-32705,-1808,-32717,-1607,-32727,-1406,-32736,-1206,-32744,-1005,-32751,-804,-32757,-603,-32761,-402,-32764,-201,-32766};
//short data[]={0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,-1,-1,-1,1,0,0,-2,0,0,1,-2,0,-1,2,-1,-1,-4,2,2,3,-4,-2,-2,5,-1,-1,-5,5,2,1,-8,1,0,6,-3,-1,-5,8,4,1,-10,3,1,13,-1,-1,-8,12,6,4,-9,5,7,17,3,-8,-14,15,11,10,-10,-2,7,20,-5,-11,-16,26,17,11,-15,6,10,25,-1,-4,-4,34,20,5,-18,9,25,37,8,-24,-20,44,45,-4,-31,14,36,39,-10,-27,-9,66,64,-21,-47,19,65,42,1,-30,9,51,45,-30,-40,19,74,28,-43,-58,11,78,45,-37,-52,49,79,20,-45,-14,41,89,52,-48,-24,46,91,3,-39,-51,50,118,74,-121,-96,57,117,2,-81,-2,126,108,-19,-158,-64,124,123,-25,3,17,88,-31,-62,-50,10,104,127,-55,-82,-84,-47,55,39,10,-4,40,95,-18,-109,-9,80,170,92,-130,-33,51,113,-45,-71,0,141,92,40,-202,-120,72,99,-34,-89,43,216,32,-144,-148,14,221,149,-97,-31,-13,89,-16,-45,-43,105,59,16,-138,-75,13,27,27,20,-42,-10,26,74,-22,-51,3,100,71,58,-39,107,-5,10,-157,-99,129,184,-55,-44,-107,9,-3,-29,-37,-9,71,141,-45,-72,-72,44,60,44,-59,-3,-15,89,-38,-65,-102,51,42,26,-163,-74,58,85,-68,-122,-32,63,70,0,-132,-48,84,100,-105,-119,-3,118,45,-11,-159,-40,74,69,-91,-107,42,157,-18,-163,-138,56,164,61,-203,-69,84,129,-95,-144,-52,110,86,-45,-174,-71,61,48,-74,-106,7,84,-3,-103,-124,-34,118,44,-88,-56,31,49,-84,-126,11,75,78,9,-147,-106,56,51,-27,-65,7,71,-9,-42,-66,-45,30,36,-8,-35,-31,11,-17,-44,-54,-16,26,18,-32,-58,-15,4,10,-45,-26,7,23,-26,-39,-15,26,3,-13,-33,-12,-11,14,-11,-14,-22,2,-11,1,-3,-3,-31,11,11,8,-22,-9,5,9,-20,-8,7,8,-8,-19,-15,13,-6,-6,-8,5,-6,-16,-20,13,9,5,-6,-5,-12,4,-5,2,-5,6,5,-1,-8,-7,-5,8,-2,2,-2,4,-1,-4,-11,6,4,7,-1,-3,-2,4,-1,-1,-2,8,6,-2,-6,-2,1,5,-1,-1,-1,3,1,-2,-4,1,2,3,-1,-1,0,1,-1,-1,-1,2,2,0,-1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
//short data[]={0,25,16,18,24,2,20,-14,4,-24,-12,-21,-23,-7,-22,10,-9,23,8,23,22,11,24,-6,13,-20,-3,-24,-19,-15,-24,1,-17,17,-1,24,15,19,24,3,20,-13,6,-24,-11,-22,-23,-8,-23,9,-10,22,7,23,21,12,24,-4,14,-20,-2,-24,-18,-16,-25,0,-18,16,-2,24,14,20,24,4,21,-12,7,-23,-10,-22,-23,-9,-23,8,-11,22,6,24,20,13,24,-3,15,-19,-1,-24,-17,-17,-24,-1,-19,15,-3,24,13,20,24,6,22,-11,8,-23,-9,-23,-22,-10,-23,7,-12,21,4,24,20,14,24,-2,16,-18,0,-25,-16,-18,-24,-2,-20,14,-4,24,12,21,23,7,22,-10,9,-23,-8,-23,-22,-11,-24,6,-13,20,3,24,19,15,24,-1,17,-17,1,-24,-15,-19,-24,-3,-20,13,-6,24,11,22,23,8,23,-9,10,-22,-7,-23,-21,-12,-24,4,-14,20,2,24,18,16,25,0,18,-16,2,-24,-14,-20,-24,-4,-21,12,-7,23,10,22,23,9,23,-8,11,-22,-6,-24,-20,-13,-24,3,-15,19,1,24,17,17,24,1,19,-15,3,-24,-13,-20,-24,-6,-22,11,-8,23,9,23,22,10,23,-7,12,-21,-4,-24,-20,-14,-24,2,-16,18,0,25,16,18,24,2,20,-14,4,-24,-12,-21,-23,-7,-22,10,-9,23,8,23,22,11,24,-6,13,-20,-3,-24,-19,-15,-24,1,-17,17,-1,24,15,19,24,3,20,-13,6,-24,-11,-22,-23,-8,-23,9,-10,22,7,23,21,12,24,-4,14,-20,-2,-24,-18,-16,-25,0,-18,16,-2,24,14,20,24,4,21,-12,7,-23,-10,-22,-23,-9,-23,8,-11,22,6,24,20,13,24,-3,15,-19,-1,-24,-17,-17,-24,-1,-19,15,-3,24,13,20,24,6,22,-11,8,-23,-9,-23,-22,-10,-23,7,-12,21,4,24,20,14,24,-2,16,-18,0,-25,-16,-18,-24,-2,-20,14,-4,24,12,21,23,7,22,-10,9,-23,-8,-23,-22,-11,-24,6,-13,20,3,24,19,15,24,-1,17,-17,1,-24,-15,-19,-24,-3,-20,13,-6,24,11,22,23,8,23,-9,10,-22,-7,-23,-21,-12,-24,4,-14,20,2,24,18,16,25,0,18,-16,2,-24,-14,-20,-24,-4,-21,12,-7,23,10,22,23,9,23,-8,11,-22,-6,-24,-20,-13,-24,3,-15,19,1,24,17,17,24,1,19,-15,3,-24,-13,-20,-24,-6,-22,11,-8,23,9,23,22,10,23,-7,12,-21,-4,-24,-20,-14,-24,2,-16,18};
//short f[]={
//		-0,32767,-804,32757,-1608,32728,-2410,32678,-3212,32609,-4011,32521,-4808,32412,-5602,32285,-6393,32137,-7179,31971,-7962,31785,-8739,31580,-9512,31356,-10278,31113,-11039,30852,-11793,30571,-12539,30273,-13279,29956,-14010,29621,-14732,29268,-15446,28898,-16151,28510,-16846,28105,-17530,27683,-18204,27245,-18868,26790,-19519,26319,-20159,25832,-20787,25329,-21403,24811,-22005,24279,-22594,23731,-23170,23170,-23731,22594,-24279,22005,-24811,21403,-25329,20787,-25832,20159,-26319,19519,-26790,18868,-27245,18204,-27683,17530,-28105,16846,-28510,16151,-28898,15446,-29268,14732,-29621,14010,-29956,13279,-30273,12539,-30571,11793,-30852,11039,-31113,10278,-31356,9512,-31580,8739,-31785,7962,-31971,7179,-32137,6393,-32285,5602,-32412,4808,-32521,4011,-32609,3212,-32678,2410,-32728,1608,-32757,804,-32767,0,-32757,-804,-32728,-1608,-32678,-2410,-32609,-3212,-32521,-4011,-32412,-4808,-32285,-5602,-32137,-6393,-31971,-7179,-31785,-7962,-31580,-8739,-31356,-9512,-31113,-10278,-30852,-11039,-30571,-11793,-30273,-12539,-29956,-13279,-29621,-14010,-29268,-14732,-28898,-15446,-28510,-16151,-28105,-16846,-27683,-17530,-27245,-18204,-26790,-18868,-26319,-19519,-25832,-20159,-25329,-20787,-24811,-21403,-24279,-22005,-23731,-22594,-23170,-23170,-22594,-23731,-22005,-24279,-21403,-24811,-20787,-25329,-20159,-25832,-19519,-26319,-18868,-26790,-18204,-27245,-17530,-27683,-16846,-28105,-16151,-28510,-15446,-28898,-14732,-29268,-14010,-29621,-13279,-29956,-12539,-30273,-11793,-30571,-11039,-30852,-10278,-31113,-9512,-31356,-8739,-31580,-7962,-31785,-7179,-31971,-6393,-32137,-5602,-32285,-4808,-32412,-4011,-32521,-3212,-32609,-2410,-32678,-1608,-32728,-804,-32757
//};
extern short vmac_butterfly(short *x, short *h,short *c);
void bit_reverse1(int n, short* x) // Bitreversal operation
           // n : squence length
           // x : input/output sequence
{
	 short temp;
	 for (int i = 0, j = 1; j < n - 1; j++) {
		  for (int k = n >> 1; k >(i ^= k); k >>= 1);
		  if (i < j){
		   temp = x[2*i];
		   x[2*i] = x[2*j];
		   x[2*j] = temp;
		   temp = x[2*i+1];
		   x[2*i+1]=x[2*j+1];
		   x[2*j+1]=temp;
		  }
	 }
}

void fft_16x16(short *x, short *w, int nx){
	int n1,n2,ie,ia,i,j,k,l,m;
	int xt,yt,c,s;
	int mid_a,mid_b;
	n2 = nx;
	ie = 1;
	for (k=nx; k > 1;  k = (k >> 1)) {
		n1 = n2;
		n2 = n2>>1;
		if(n2>=64){
			for (j=0; j < nx; j+=n1) {
				ia = 0;
				int time;
				time = n2/64;
				for (i=0; i < time; i += 1) {
					m = i*64+j;
					l = m + n2;
					vmac_butterfly(&x[2*m],&x[2*l],&w[2*ia]);
					ia = ia + 64;
				}
			}
		}
		else{
			for (j=0; j < nx; j+=n1) {
				ia = 0;
				for (i=0; i < n2; i += 1) {
					c = w[2*ia];		//imag
					s = w[2*ia+1];			//real
					ia = ia + 1;
					m = i+j;
					l = m + n2;
					xt = x[2*m] - x[2*l];		//imag
					x[2*m] = x[2*m] + x[2*l];		//imag
					yt = x[2*m+1] - x[2*l+1];		//real
					x[2*m+1] = x[2*m+1] + x[2*l+1];		//real
					mid_a = (int)c*(int)yt + (int)s*(int)xt;
					mid_b = (int)s*(int)yt - (int)c*(int)xt;
					x[2*l] = mid_a >> 15;		//imag
					x[2*l+1] = mid_b >> 15;		//real
				}
			}
		}
	  for(int p = 0; p < n2; p+=2){
	   w[p]=w[2*p];
	   w[p+1]=w[2*p+1];
	  }
	  for(int j = 0; j < 512; j++ ){
	  				x[j] >>= 1;
	  			}
	}
	bit_reverse1(nx,x);
}
//int main(){
//	int ndata = 256;
//	set_vpsel(4);
//	fft_16x16_imre(data,f,ndata);
//	dbg_output(data,512,2);
//	return 0;
//}
