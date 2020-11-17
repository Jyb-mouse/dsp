//#include <swift_math.h>

#include "mmwave_lib.h"
//int data[]={0,25,14,20,23,8,24,-6,15,-19,1,-24,-12,-21,-22,-10,-24,4,-17,18,-3,24,11,22,22,11,24,-3,18,-16,5,-24,-9,-23,-21,-13,-24,1,-19,15,-7,23,7,23,20,14,24,0,20,-13,8,-23,-6,-24,-18,-16,-24,-2,-21,12,-10,22,4,24,17,17,24,4,22,-10,12,-21,-2,-24,-16,-18,-24,-6,-23,8,-13,20,0,24,14,20,23,7,23,-7,15,-19,1,-24,-13,-21,-23,-9,-24,5,-16,18,-3,24,11,22,22,11,24,-3,18,-17,4,-24,-10,-22,-21,-12,-24,1,-19,15,-6,24,8,23,20,14,25,0,20,-14,8,-23,-6,-24,-19,-15,-24,-1,-21,12,-10,22,4,24,18,17,24,3,22,-11,11,-22,-3,-24,-16,-18,-24,-5,-23,9,-13,21,1,24,15,19,23,7,23,-7,14,-20,0,-24,-13,-20,-23,-8,-24,6,-16,18,-2,24,12,21,22,10,24,-4,17,-17,4,-24,-10,-22,-21,-12,-24,2,-18,16,-6,24,8,23,20,13,24,0,20,-14,7,-23,-7,-23,-19,-15,-24,-1,-21,13,-9,23,5,24,18,16,24,3,22,-11,11,-22,-3,-24,-17,-18,-24,-4,-22,10,-12,21,1,24,15,19,24,6,23,-8,14,-20,0,-25,-14,-20,-23,-8,-24,6,-15,19,-1,24,12,21,22,10,24,-4,17,-18,3,-24,-11,-22,-22,-11,-24,3,-18,16,-5,24,9,23,21,13,24,-1,19,-15,7,-23,-7,-23,-20,-14,-24,0,-20,13,-8,23,6,24,18,16,24,2,21,-12,10,-22,-4,-24,-17,-17,-24,-4,-22,10,-12,21,2,24,16,18,24,6,23,-8,13,-20,0,-24,-14,-20,-23,-7,-23,7,-15,19,-1,24,13,21,23,9,24,-5,16,-18,3,-24,-11,-22,-22,-11,-24,3,-18,17,-4,24,10,22,21,12,24,-1,19,-15,6,-24,-8,-23,-20,-14,-25,0,-20,14,-8,23,6,24,19,15,24,1,21,-12,10,-22,-4,-24,-18,-17,-24,-3,-22,11,-11,22,3,24,16,18,24,5,23,-9,13,-21,-1,-24,-15,-19,-23,-7,-23,7,-14,20,0,24,13,20,23,8,24,-6,16,-18,2,-24,-12,-21,-22,-10,-24,4,-17,17,-4,24,10,22,21,12,24,-2,18,-16,6,-24,-8,-23,-20,-13,-24,0,-20,14,-7,23,7,23,19,15,24,1,21,-13,9,-23,-5,-24,-18,-16,-24,-3,-22,11,-11,22,3,24,17,18,24,4,22,-10,12,-21,-1,-24,-15,-19,-24,-6,-23,8,-14,20,0,25,14,20,23,8,24,-6,15,-19,1,-24,-12,-21,-22,-10,-24,4,-17,18,-3,24,11,22,22,11,24,-3,18,-16,5,-24,-9,-23,-21,-13,-24,1,-19,15,-7,23,7,23,20,14,24,0,20,-13,8,-23,-6,-24,-18,-16,-24,-2,-21,12,-10,22,4,24,17,17,24,4,22,-10,12,-21,-2,-24,-16,-18,-24,-6,-23,8,-13,20,0,24,14,20,23,7,23,-7,15,-19,1,-24,-13,-21,-23,-9,-24,5,-16,18,-3,24,11,22,22,11,24,-3,18,-17,4,-24,-10,-22,-21,-12,-24,1,-19,15,-6,24,8,23,20,14,25,0,20,-14,8,-23,-6,-24,-19,-15,-24,-1,-21,12,-10,22,4,24,18,17,24,3,22,-11,11,-22,-3,-24,-16,-18,-24,-5,-23,9,-13,21,1,24,15,19,23,7,23,-7,14,-20,0,-24,-13,-20,-23,-8,-24,6,-16,18,-2,24,12,21,22,10,24,-4,17,-17,4,-24,-10,-22,-21,-12,-24,2,-18,16,-6,24,8,23,20,13,24,0,20,-14,7,-23,-7,-23,-19,-15,-24,-1,-21,13,-9,23,5,24,18,16,24,3,22,-11,11,-22,-3,-24,-17,-18,-24,-4,-22,10,-12,21,1,24,15,19,24,6,23,-8,14,-20,0,-25,-14,-20,-23,-8,-24,6,-15,19,-1,24,12,21,22,10,24,-4,17,-18,3,-24,-11,-22,-22,-11,-24,3,-18,16,-5,24,9,23,21,13,24,-1,19,-15,7,-23,-7,-23,-20,-14,-24,0,-20,13,-8,23,6,24,18,16,24,2,21,-12,10,-22,-4,-24,-17,-17,-24,-4,-22,10,-12,21,2,24,16,18,24,6,23,-8,13,-20,0,-24,-14,-20,-23,-7,-23,7,-15,19,-1,24,13,21,23,9,24,-5,16,-18,3,-24,-11,-22,-22,-11,-24,3,-18,17,-4,24,10,22,21,12,24,-1,19,-15,6,-24,-8,-23,-20,-14,-25,0,-20,14,-8,23,6,24,19,15,24,1,21,-12,10,-22,-4,-24,-18,-17,-24,-3,-22,11,-11,22,3,24,16,18,24,5,23,-9,13,-21,-1,-24,-15,-19,-23,-7,-23,7,-14,20,0,24,13,20,23,8,24,-6,16,-18,2,-24,-12,-21,-22,-10,-24,4,-17,17,-4,24,10,22,21,12,24,-2,18,-16,6,-24,-8,-23,-20,-13,-24,0,-20,14,-7,23,7,23,19,15,24,1,21,-13,9,-23,-5,-24,-18,-16,-24,-3,-22,11,-11,22,3,24,17,18,24,4,22,-10,12,-21,-1,-24,-15,-19,-24,-6,-23,8,-14,20,0,25,14,20,23,8,24,-6,15,-19,1,-24,-12,-21,-22,-10,-24,4,-17,18,-3,24,11,22,22,11,24,-3,18,-16,5,-24,-9,-23,-21,-13,-24,1,-19,15,-7,23,7,23,20,14,24,0,20,-13,8,-23,-6,-24,-18,-16,-24,-2,-21,12,-10,22,4,24,17,17,24,4,22,-10,12,-21,-2,-24,-16,-18,-24,-6,-23,8,-13,20,0,24,14,20,23,7,23,-7,15,-19,1,-24,-13,-21,-23,-9,-24,5,-16,18,-3,24,11,22,22,11,24,-3,18,-17,4,-24,-10,-22,-21,-12,-24,1,-19,15,-6,24,8,23,20,14,25,0,20,-14,8,-23,-6,-24,-19,-15,-24,-1,-21,12,-10,22,4,24,18,17,24,3,22,-11,11,-22,-3,-24,-16,-18,-24,-5,-23,9,-13,21,1,24,15,19,23,7,23,-7,14,-20,0,-24,-13,-20,-23,-8,-24,6,-16,18,-2,24,12,21,22,10,24,-4,17,-17,4,-24,-10,-22,-21,-12,-24,2,-18,16,-6,24,8,23,20,13,24,0,20,-14,7,-23,-7,-23,-19,-15,-24,-1,-21,13,-9,23,5,24,18,16,24,3,22,-11,11,-22,-3,-24,-17,-18,-24,-4,-22,10,-12,21,1,24,15,19,24,6,23,-8,14,-20,0,-25,-14,-20,-23,-8,-24,6,-15,19,-1,24,12,21,22,10,24,-4,17,-18,3,-24,-11,-22,-22,-11,-24,3,-18,16,-5,24,9,23,21,13,24,-1,19,-15,7,-23,-7,-23,-20,-14,-24,0,-20,13,-8,23,6,24,18,16,24,2,21,-12,10,-22,-4,-24,-17,-17,-24,-4,-22,10,-12,21,2,24,16,18,24,6,23,-8,13,-20,0,-24,-14,-20,-23,-7,-23,7,-15,19,-1,24,13,21,23,9,24,-5,16,-18,3,-24,-11,-22,-22,-11,-24,3,-18,17,-4,24,10,22,21,12,24,-1,19,-15,6,-24,-8,-23,-20,-14,-25,0,-20,14,-8,23,6,24,19,15,24,1,21,-12,10,-22,-4,-24,-18,-17,-24,-3,-22,11,-11,22,3,24,16,18,24,5,23,-9,13,-21,-1,-24,-15,-19,-23,-7,-23,7,-14,20,0,24,13,20,23,8,24,-6,16,-18,2,-24,-12,-21,-22,-10,-24,4,-17,17,-4,24,10,22,21,12,24,-2,18,-16,6,-24,-8,-23,-20,-13,-24,0,-20,14,-7,23,7,23,19,15,24,1,21,-13,9,-23,-5,-24,-18,-16,-24,-3,-22,11,-11,22,3,24,17,18,24,4,22,-10,12,-21,-1,-24,-15,-19,-24,-6,-23,8,-14,20,0,25,14,20,23,8,24,-6,15,-19,1,-24,-12,-21,-22,-10,-24,4,-17,18,-3,24,11,22,22,11,24,-3,18,-16,5,-24,-9,-23,-21,-13,-24,1,-19,15,-7,23,7,23,20,14,24,0,20,-13,8,-23,-6,-24,-18,-16,-24,-2,-21,12,-10,22,4,24,17,17,24,4,22,-10,12,-21,-2,-24,-16,-18,-24,-6,-23,8,-13,20,0,24,14,20,23,7,23,-7,15,-19,1,-24,-13,-21,-23,-9,-24,5,-16,18,-3,24,11,22,22,11,24,-3,18,-17,4,-24,-10,-22,-21,-12,-24,1,-19,15,-6,24,8,23,20,14,25,0,20,-14,8,-23,-6,-24,-19,-15,-24,-1,-21,12,-10,22,4,24,18,17,24,3,22,-11,11,-22,-3,-24,-16,-18,-24,-5,-23,9,-13,21,1,24,15,19,23,7,23,-7,14,-20,0,-24,-13,-20,-23,-8,-24,6,-16,18,-2,24,12,21,22,10,24,-4,17,-17,4,-24,-10,-22,-21,-12,-24,2,-18,16,-6,24,8,23,20,13,24,0,20,-14,7,-23,-7,-23,-19,-15,-24,-1,-21,13,-9,23,5,24,18,16,24,3,22,-11,11,-22,-3,-24,-17,-18,-24,-4,-22,10,-12,21,1,24,15,19,24,6,23,-8,14,-20,0,-25,-14,-20,-23,-8,-24,6,-15,19,-1,24,12,21,22,10,24,-4,17,-18,3,-24,-11,-22,-22,-11,-24,3,-18,16,-5,24,9,23,21,13,24,-1,19,-15,7,-23,-7,-23,-20,-14,-24,0,-20,13,-8,23,6,24,18,16,24,2,21,-12,10,-22,-4,-24,-17,-17,-24,-4,-22,10,-12,21,2,24,16,18,24,6,23,-8,13,-20,0,-24,-14,-20,-23,-7,-23,7,-15,19,-1,24,13,21,23,9,24,-5,16,-18,3,-24,-11,-22,-22,-11,-24,3,-18,17,-4,24,10,22,21,12,24,-1,19,-15,6,-24,-8,-23,-20,-14,-25,0,-20,14,-8,23,6,24,19,15,24,1,21,-12,10,-22,-4,-24,-18,-17,-24,-3,-22,11,-11,22,3,24,16,18,24,5,23,-9,13,-21,-1,-24,-15,-19,-23,-7,-23,7,-14,20,0,24,13,20,23,8,24,-6,16,-18,2,-24,-12,-21,-22,-10,-24,4,-17,17,-4,24,10,22,21,12,24,-2,18,-16,6,-24,-8,-23,-20,-13,-24,0,-20,14,-7,23,7,23,19,15,24,1,21,-13,9,-23,-5,-24,-18,-16,-24,-3,-22,11,-11,22,3,24,17,18,24,4,22,-10,12,-21,-1,-24,-15,-19,-24,-6,-23,8,-14,20};
//int f[]={0,1048560,-25732,1048244,-51450,1047296,-77136,1045718,-102776,1043510,-128354,1040674,-153855,1037210,-179263,1033122,-204563,1028412,-229740,1023082,-254779,1017135,-279664,1010577,-304380,1003409,-328914,995637,-353249,987265,-377371,978298,-401266,968743,-424919,958603,-448317,947887,-471444,936599,-494287,924747,-516833,912338,-539067,899379,-560977,885879,-582548,871845,-603769,857286,-624626,842211,-645107,826628,-665199,810547,-684890,793978,-704169,776931,-723024,759416,-741443,741443,-759416,723024,-776931,704169,-793978,684890,-810547,665199,-826628,645107,-842211,624626,-857286,603769,-871845,582548,-885879,560977,-899379,539067,-912338,516833,-924747,494287,-936599,471444,-947887,448317,-958603,424919,-968743,401266,-978298,377371,-987265,353249,-995637,328914,-1003409,304380,-1010577,279664,-1017135,254779,-1023082,229740,-1028412,204563,-1033122,179263,-1037210,153855,-1040674,128354,-1043510,102776,-1045718,77136,-1047296,51450,-1048244,25732,-1048560,0,-1048244,-25732,-1047296,-51450,-1045718,-77136,-1043510,-102776,-1040674,-128354,-1037210,-153855,-1033122,-179263,-1028412,-204563,-1023082,-229740,-1017135,-254779,-1010577,-279664,-1003409,-304380,-995637,-328914,-987265,-353249,-978298,-377371,-968743,-401266,-958603,-424919,-947887,-448317,-936599,-471444,-924747,-494287,-912338,-516833,-899379,-539067,-885879,-560977,-871845,-582548,-857286,-603769,-842211,-624626,-826628,-645107,-810547,-665199,-793978,-684890,-776931,-704169,-759416,-723024,-741443,-741443,-723024,-759416,-704169,-776931,-684890,-793978,-665199,-810547,-645107,-826628,-624626,-842211,-603769,-857286,-582548,-871845,-560977,-885879,-539067,-899379,-516833,-912338,-494287,-924747,-471444,-936599,-448317,-947887,-424919,-958603,-401266,-968743,-377371,-978298,-353249,-987265,-328914,-995637,-304380,-1003409,-279664,-1010577,-254779,-1017135,-229740,-1023082,-204563,-1028412,-179263,-1033122,-153855,-1037210,-128354,-1040674,-102776,-1043510,-77136,-1045718,-51450,-1047296,-25732,-1048244};
//i32x64_t f[]={0,65532,-1608,65512,-3215,65453,-4820,65354,-6423,65216,-8021,65039,-9615,64822,-11203,64567,-12784,64272,-14358,63939,-15922,63568,-17478,63158,-19022,62710,-20556,62224,-22077,61701,-23584,61140,-25078,60543,-26556,59909,-28018,59240,-29463,58534,-30891,57794,-32300,57018,-33690,56208,-35059,55364,-36407,54487,-37733,53577,-39037,52635,-40317,51661,-41573,50656,-42803,49621,-44008,48556,-45186,47461,-46338,46338,-47461,45186,-48556,44008,-49621,42803,-50656,41573,-51661,40317,-52635,39037,-53577,37733,-54487,36407,-55364,35059,-56208,33690,-57018,32300,-57794,30891,-58534,29463,-59240,28018,-59909,26556,-60543,25078,-61140,23584,-61701,22077,-62224,20556,-62710,19022,-63158,17478,-63568,15922,-63939,14358,-64272,12784,-64567,11203,-64822,9615,-65039,8021,-65216,6423,-65354,4820,-65453,3215,-65512,1608,-65532,0,-65512,-1608,-65453,-3215,-65354,-4820,-65216,-6423,-65039,-8021,-64822,-9615,-64567,-11203,-64272,-12784,-63939,-14358,-63568,-15922,-63158,-17478,-62710,-19022,-62224,-20556,-61701,-22077,-61140,-23584,-60543,-25078,-59909,-26556,-59240,-28018,-58534,-29463,-57794,-30891,-57018,-32300,-56208,-33690,-55364,-35059,-54487,-36407,-53577,-37733,-52635,-39037,-51661,-40317,-50656,-41573,-49621,-42803,-48556,-44008,-47461,-45186,-46338,-46338,-45186,-47461,-44008,-48556,-42803,-49621,-41573,-50656,-40317,-51661,-39037,-52635,-37733,-53577,-36407,-54487,-35059,-55364,-33690,-56208,-32300,-57018,-30891,-57794,-29463,-58534,-28018,-59240,-26556,-59909,-25078,-60543,-23584,-61140,-22077,-61701,-20556,-62224,-19022,-62710,-17478,-63158,-15922,-63568,-14358,-63939,-12784,-64272,-11203,-64567,-9615,-64822,-8021,-65039,-6423,-65216,-4820,-65354,-3215,-65453,-1608,-65512};
//int data[]={0,65532,44008,48556,65216,6423,52635,-39037,12784,-64272,-33690,-56208,-62710,-19022,-59240,28018,-25078,60543,22077,61701,57794,30891,63568,-15922,36407,-54487,-9615,-64822,-50656,-41573,-65453,3215,-46338,46338,-3215,65453,41573,50656,64822,9615,54487,-36407,15922,-63568,-30891,-57794,-61701,-22077,-60543,25078,-28018,59240,19022,62710,56208,33690,64272,-12784,39037,-52635,-6423,-65216,-48556,-44008,-65532,0,-48556,44008,-6423,65216,39037,52635,64272,12784,56208,-33690,19022,-62710,-28018,-59240,-60543,-25078,-61701,22077,-30891,57794,15922,63568,54487,36407,64822,-9615,41573,-50656,-3215,-65453,-46338,-46338,-65453,-3215,-50656,41573,-9615,64822,36407,54487,63568,15922,57794,-30891,22077,-61701,-25078,-60543,-59240,-28018,-62710,19022,-33690,56208,12784,64272,52635,39037,65216,-6423,44008,-48556,0,-65532,-44008,-48556,-65216,-6423,-52635,39037,-12784,64272,33690,56208,62710,19022,59240,-28018,25078,-60543,-22077,-61701,-57794,-30891,-63568,15922,-36407,54487,9615,64822,50656,41573,65453,-3215,46338,-46338,3215,-65453,-41573,-50656,-64822,-9615,-54487,36407,-15922,63568,30891,57794,61701,22077,60543,-25078,28018,-59240,-19022,-62710,-56208,-33690,-64272,12784,-39037,52635,6423,65216,48556,44008,65532,0,48556,-44008,6423,-65216,-39037,-52635,-64272,-12784,-56208,33690,-19022,62710,28018,59240,60543,25078,61701,-22077,30891,-57794,-15922,-63568,-54487,-36407,-64822,9615,-41573,50656,3215,65453,46338,46338,65453,3215,50656,-41573,9615,-64822,-36407,-54487,-63568,-15922,-57794,30891,-22077,61701,25078,60543,59240,28018,62710,-19022,33690,-56208,-12784,-64272,-52635,-39037,-65216,6423,-44008,48556,0,65532,44008,48556,65216,6423,52635,-39037,12784,-64272,-33690,-56208,-62710,-19022,-59240,28018,-25078,60543,22077,61701,57794,30891,63568,-15922,36407,-54487,-9615,-64822,-50656,-41573,-65453,3215,-46338,46338,-3215,65453,41573,50656,64822,9615,54487,-36407,15922,-63568,-30891,-57794,-61701,-22077,-60543,25078,-28018,59240,19022,62710,56208,33690,64272,-12784,39037,-52635,-6423,-65216,-48556,-44008,-65532,0,-48556,44008,-6423,65216,39037,52635,64272,12784,56208,-33690,19022,-62710,-28018,-59240,-60543,-25078,-61701,22077,-30891,57794,15922,63568,54487,36407,64822,-9615,41573,-50656,-3215,-65453,-46338,-46338,-65453,-3215,-50656,41573,-9615,64822,36407,54487,63568,15922,57794,-30891,22077,-61701,-25078,-60543,-59240,-28018,-62710,19022,-33690,56208,12784,64272,52635,39037,65216,-6423,44008,-48556,0,-65532,-44008,-48556,-65216,-6423,-52635,39037,-12784,64272,33690,56208,62710,19022,59240,-28018,25078,-60543,-22077,-61701,-57794,-30891,-63568,15922,-36407,54487,9615,64822,50656,41573,65453,-3215,46338,-46338,3215,-65453,-41573,-50656,-64822,-9615,-54487,36407,-15922,63568,30891,57794,61701,22077,60543,-25078,28018,-59240,-19022,-62710,-56208,-33690,-64272,12784,-39037,52635,6423,65216,48556,44008,65532,0,48556,-44008,6423,-65216,-39037,-52635,-64272,-12784,-56208,33690,-19022,62710,28018,59240,60543,25078,61701,-22077,30891,-57794,-15922,-63568,-54487,-36407,-64822,9615,-41573,50656,3215,65453,46338,46338,65453,3215,50656,-41573,9615,-64822,-36407,-54487,-63568,-15922,-57794,30891,-22077,61701,25078,60543,59240,28018,62710,-19022,33690,-56208,-12784,-64272,-52635,-39037,-65216,6423,-44008,48556};
//int f[]={0,32767,-804,32757,-1607,32727,-2410,32678,-3211,32609,-4011,32520,-4807,32412,-5601,32284,-6392,32137,-7179,31970,-7961,31785,-8739,31580,-9511,31356,-10278,31113,-11038,30851,-11792,30571,-12539,30272,-13278,29955,-14009,29621,-14732,29268,-15446,28897,-16150,28510,-16845,28105,-17530,27683,-18204,27244,-18867,26789,-19519,26318,-20159,25831,-20787,25329,-21402,24811,-22004,24278,-22594,23731,-23169,23169,-23731,22594,-24278,22004,-24811,21402,-25329,20787,-25831,20159,-26318,19519,-26789,18867,-27244,18204,-27683,17530,-28105,16845,-28510,16150,-28897,15446,-29268,14732,-29621,14009,-29955,13278,-30272,12539,-30571,11792,-30851,11038,-31113,10278,-31356,9511,-31580,8739,-31785,7961,-31970,7179,-32137,6392,-32284,5601,-32412,4807,-32520,4011,-32609,3211,-32678,2410,-32727,1607,-32757,804,-32767,0,-32757,-804,-32727,-1607,-32678,-2410,-32609,-3211,-32520,-4011,-32412,-4807,-32284,-5601,-32137,-6392,-31970,-7179,-31785,-7961,-31580,-8739,-31356,-9511,-31113,-10278,-30851,-11038,-30571,-11792,-30272,-12539,-29955,-13278,-29621,-14009,-29268,-14732,-28897,-15446,-28510,-16150,-28105,-16845,-27683,-17530,-27244,-18204,-26789,-18867,-26318,-19519,-25831,-20159,-25329,-20787,-24811,-21402,-24278,-22004,-23731,-22594,-23169,-23169,-22594,-23731,-22004,-24278,-21402,-24811,-20787,-25329,-20159,-25831,-19519,-26318,-18867,-26789,-18204,-27244,-17530,-27683,-16845,-28105,-16150,-28510,-15446,-28897,-14732,-29268,-14009,-29621,-13278,-29955,-12539,-30272,-11792,-30571,-11038,-30851,-10278,-31113,-9511,-31356,-8739,-31580,-7961,-31785,-7179,-31970,-6392,-32137,-5601,-32284,-4807,-32412,-4011,-32520,-3211,-32609,-2410,-32678,-1607,-32727,-804,-32757};
//i32x64_t data[]={0,300,201,222,298,29,240,-178,58,-294,-154,-257,-287,-87,-271,128,-114,277,101,282,264,141,291,-72,166,-249,-44,-296,-231,-190,-299,14,-212,212,-14,299,190,231,296,44,249,-166,72,-291,-141,-264,-282,-101,-277,114,-128,271,87,287,257,154,294,-58,178,-240,-29,-298,-222,-201,-300,0,-222,201,-29,298,178,240,294,58,257,-154,87,-287,-128,-271,-277,-114,-282,101,-141,264,72,291,249,166,296,-44,190,-231,-14,-299,-212,-212,-299,-14,-231,190,-44,296,166,249,291,72,264,-141,101,-282,-114,-277,-271,-128,-287,87,-154,257,58,294,240,178,298,-29,201,-222,0,-300,-201,-222,-298,-29,-240,178,-58,294,154,257,287,87,271,-128,114,-277,-101,-282,-264,-141,-291,72,-166,249,44,296,231,190,299,-14,212,-212,14,-299,-190,-231,-296,-44,-249,166,-72,291,141,264,282,101,277,-114,128,-271,-87,-287,-257,-154,-294,58,-178,240,29,298,222,201,300,0,222,-201,29,-298,-178,-240,-294,-58,-257,154,-87,287,128,271,277,114,282,-101,141,-264,-72,-291,-249,-166,-296,44,-190,231,14,299,212,212,299,14,231,-190,44,-296,-166,-249,-291,-72,-264,141,-101,282,114,277,271,128,287,-87,154,-257,-58,-294,-240,-178,-298,29,-201,222,0,300,201,222,298,29,240,-178,58,-294,-154,-257,-287,-87,-271,128,-114,277,101,282,264,141,291,-72,166,-249,-44,-296,-231,-190,-299,14,-212,212,-14,299,190,231,296,44,249,-166,72,-291,-141,-264,-282,-101,-277,114,-128,271,87,287,257,154,294,-58,178,-240,-29,-298,-222,-201,-300,0,-222,201,-29,298,178,240,294,58,257,-154,87,-287,-128,-271,-277,-114,-282,101,-141,264,72,291,249,166,296,-44,190,-231,-14,-299,-212,-212,-299,-14,-231,190,-44,296,166,249,291,72,264,-141,101,-282,-114,-277,-271,-128,-287,87,-154,257,58,294,240,178,298,-29,201,-222,0,-300,-201,-222,-298,-29,-240,178,-58,294,154,257,287,87,271,-128,114,-277,-101,-282,-264,-141,-291,72,-166,249,44,296,231,190,299,-14,212,-212,14,-299,-190,-231,-296,-44,-249,166,-72,291,141,264,282,101,277,-114,128,-271,-87,-287,-257,-154,-294,58,-178,240,29,298,222,201,300,0,222,-201,29,-298,-178,-240,-294,-58,-257,154,-87,287,128,271,277,114,282,-101,141,-264,-72,-291,-249,-166,-296,44,-190,231,14,299,212,212,299,14,231,-190,44,-296,-166,-249,-291,-72,-264,141,-101,282,114,277,271,128,287,-87,154,-257,-58,-294,-240,-178,-298,29,-201,222};
//i32x64_t f[]={0,1048512,-25731,1048196,-51448,1047249,-77133,1045671,-102772,1043463,-128349,1040626,-153848,1037163,-179255,1033075,-204554,1028365,-229730,1023035,-254767,1017089,-279651,1010530,-304366,1003363,-328899,995591,-353233,987220,-377354,978254,-401248,968698,-424900,958559,-448296,947843,-471422,936556,-494265,924705,-516809,912296,-539042,899338,-560951,885839,-582522,871805,-603741,857247,-624597,842172,-645077,826590,-665168,810510,-684859,793942,-704137,776896,-722991,759381,-741409,741409,-759381,722991,-776896,704137,-793942,684859,-810510,665168,-826590,645077,-842172,624597,-857247,603741,-871805,582522,-885839,560951,-899338,539042,-912296,516809,-924705,494265,-936556,471422,-947843,448296,-958559,424900,-968698,401248,-978254,377354,-987220,353233,-995591,328899,-1003363,304366,-1010530,279651,-1017089,254767,-1023035,229730,-1028365,204554,-1033075,179255,-1037163,153848,-1040626,128349,-1043463,102772,-1045671,77133,-1047249,51448,-1048196,25731,-1048512,0,-1048196,-25731,-1047249,-51448,-1045671,-77133,-1043463,-102772,-1040626,-128349,-1037163,-153848,-1033075,-179255,-1028365,-204554,-1023035,-229730,-1017089,-254767,-1010530,-279651,-1003363,-304366,-995591,-328899,-987220,-353233,-978254,-377354,-968698,-401248,-958559,-424900,-947843,-448296,-936556,-471422,-924705,-494265,-912296,-516809,-899338,-539042,-885839,-560951,-871805,-582522,-857247,-603741,-842172,-624597,-826590,-645077,-810510,-665168,-793942,-684859,-776896,-704137,-759381,-722991,-741409,-741409,-722991,-759381,-704137,-776896,-684859,-793942,-665168,-810510,-645077,-826590,-624597,-842172,-603741,-857247,-582522,-871805,-560951,-885839,-539042,-899338,-516809,-912296,-494265,-924705,-471422,-936556,-448296,-947843,-424900,-958559,-401248,-968698,-377354,-978254,-353233,-987220,-328899,-995591,-304366,-1003363,-279651,-1010530,-254767,-1017089,-229730,-1023035,-204554,-1028365,-179255,-1033075,-153848,-1037163,-128349,-1040626,-102772,-1043463,-77133,-1045671,-51448,-1047249,-25731,-1048196};
//extern short fft_32x32_asm(int *x, int *h,int *c);
void bit_reverse(int n, int* x) // Bitreversal operation
           // n : squence length
           // x : input/output sequence
{
	 int temp;
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
void fft_32x32a(int *x, int *w, int nx){
	int n1,n2,ie,ia,i,j,k,l,m;
	int xt,yt,c,s;
	n2 = nx;
	ie = 1;
	for (k=nx; k > 1;  k = (k >> 1)) {
		n1 = n2;
		n2 = n2>>1;
//		if(n2>=64){
//			for (j=0; j < nx; j+=n1) {
//				ia = 0;
//				int time;
//				time = n2/32;
//				for (i=0; i < time; i += 1) {
//					m = i*32+j;
//					l = m + n2;
//					fft_32x32_asm(&x[2*m],&x[2*l],&w[2*ia]);
//					ia = ia + 32;
//				}
//			}
//		}
//		else{
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
					x[2*l] = (c*yt + s*xt)>>16;		//imag
					x[2*l+1] = (s*yt - c*xt)>>16;		//real
				}
			}
//		}
	  for(int p = 0; p < n2; p+=2){
	   w[p]=w[2*p];
	   w[p+1]=w[2*p+1];
	  }
//	  for(int j = 0; j < 512; j++ ){
//	  				x[j] >>= 1;
//	  			}
	}
	bit_reverse(nx,x);
}
void fft_32x32(const cmplx32ImRe_t *fftSrcAddr, cmplx32ImRe_t * fftDstAddr, const int nfft)
{   int data[64];
	short ndata = nfft;
	int f[]={0,32767,-6392,32137,-12539,30272,-18204,27244,-23169,23169,-27244,18204,-30272,12539,-32137,6392,-32767,0,-32137,-6392,-30272,-12539,-27244,-18204,-23169,-23169,-18204,-27244,-12539,-30272,-6392,-32137,0,-32766,6392,-32137,12539,-30272,18204,-27244,23169,-23169,27244,-18204,30272,-12539,32137,-6392,32766,0,32137,6392,30272,12539,27244,18204,23169,23169,18204,27244,12539,30272,6392,32137};

	for (int j=0;j<32;j++)
		{
		   data[2*j]=(*(fftSrcAddr+j)).imag;
		   data[2*j+1]=(*(fftSrcAddr+j)).real;}
//	int ndata = 1024;
//	set_vpsel(4);
	fft_32x32a(data,f,ndata);
	for (int j=0;j<32;j++)
				{  (*(fftDstAddr+j)).imag=data[2*j];
				   (*(fftDstAddr+j)).real=data[2*j+1];
				}

}
//int main(){
//	int ndata = 256;
//	set_vpsel(4);
//	fft_32x32(data,f,ndata);

//	return 0;
//}

