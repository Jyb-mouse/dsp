; ModuleID = '..\fft_16x16.c'
target datalayout = "e-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
target triple = "dsp"

@dbg_addr = constant i32* inttoptr (i64 2684354560 to i32*), align 4
@data = global [512 x i16] [i16 215, i16 1423, i16 238, i16 1141, i16 78, i16 1169, i16 181, i16 1133, i16 378, i16 1041, i16 299, i16 1166, i16 147, i16 1405, i16 309, i16 1552, i16 540, i16 1286, i16 678, i16 1510, i16 981, i16 1751, i16 1186, i16 1322, i16 1049, i16 1322, i16 1100, i16 998, i16 1140, i16 1272, i16 1302, i16 1072, i16 981, i16 1072, i16 969, i16 1504, i16 1513, i16 1221, i16 1443, i16 1083, i16 1697, i16 1484, i16 1952, i16 852, i16 1230, i16 629, i16 1843, i16 846, i16 1679, i16 359, i16 1553, i16 629, i16 1286, i16 791, i16 1459, i16 545, i16 1459, i16 301, i16 1385, i16 579, i16 1988, i16 687, i16 1845, i16 115, i16 1211, i16 -246, i16 1471, i16 55, i16 1488, i16 -537, i16 1346, i16 -204, i16 891, i16 -350, i16 709, i16 -11, i16 1120, i16 -300, i16 1228, i16 -446, i16 1343, i16 -207, i16 1246, i16 -710, i16 559, i16 -1070, i16 579, i16 -831, i16 1005, i16 -1163, i16 278, i16 -1235, i16 246, i16 -673, i16 110, i16 -931, i16 122, i16 -1150, i16 436, i16 -1014, i16 717, i16 -1161, i16 319, i16 -1666, i16 -718, i16 -1598, i16 -177, i16 -1646, i16 -163, i16 -2167, i16 -981, i16 -1763, i16 -733, i16 -1192, i16 -898, i16 -1594, i16 -966, i16 -1725, i16 -764, i16 -2192, i16 -1063, i16 -1994, i16 -1275, i16 -1808, i16 -1630, i16 -2226, i16 -1959, i16 -2140, i16 -1856, i16 -2448, i16 -2276, i16 -2130, i16 -2458, i16 -1381, i16 -2143, i16 -2026, i16 -2881, i16 -1898, i16 -2549, i16 -1956, i16 -2758, i16 -1745, i16 -2733, i16 -1516, i16 -3067, i16 -1847, i16 -3540, i16 -1521, i16 -3188, i16 -1830, i16 -3688, i16 -1046, i16 -3434, i16 -435, i16 -3130, i16 -906, i16 -4013, i16 -875, i16 -3362, i16 -156, i16 -2986, i16 -222, i16 -3086, i16 -85, i16 -3284, i16 120, i16 -3296, i16 154, i16 -3122, i16 325, i16 -2971, i16 689, i16 -2751, i16 1243, i16 -2614, i16 1347, i16 -2516, i16 1160, i16 -2131, i16 1839, i16 -1272, i16 1540, i16 -1773, i16 1501, i16 -1823, i16 1930, i16 -1372, i16 1976, i16 -877, i16 1927, i16 -815, i16 2092, i16 -681, i16 2561, i16 -623, i16 2355, i16 -557, i16 2391, i16 221, i16 2900, i16 930, i16 2213, i16 187, i16 2212, i16 376, i16 2748, i16 615, i16 2288, i16 1033, i16 2137, i16 990, i16 2318, i16 1028, i16 2471, i16 1066, i16 2463, i16 1018, i16 2189, i16 1479, i16 2231, i16 1935, i16 2293, i16 1688, i16 1921, i16 1453, i16 2311, i16 1780, i16 1645, i16 1534, i16 1484, i16 1835, i16 1519, i16 1584, i16 1807, i16 1486, i16 2029, i16 1692, i16 1774, i16 1835, i16 1516, i16 2333, i16 1305, i16 1804, i16 1086, i16 1643, i16 1663, i16 2050, i16 782, i16 1265, i16 583, i16 1745, i16 1034, i16 1632, i16 1145, i16 1671, i16 1077, i16 1403, i16 826, i16 1512, i16 636, i16 1913, i16 538, i16 1540, i16 253, i16 1061, i16 751, i16 1502, i16 317, i16 819, i16 -160, i16 1198, i16 457, i16 1170, i16 199, i16 874, i16 514, i16 983, i16 198, i16 904, i16 -204, i16 755, i16 -78, i16 718, i16 48, i16 511, i16 239, i16 636, i16 45, i16 314, i16 -553, i16 314, i16 111, i16 615, i16 -5, i16 68, i16 239, i16 168, i16 36, i16 178, i16 -75, i16 345, i16 11, i16 289, i16 62, i16 69, i16 265, i16 244, i16 86, i16 -15, i16 -247, i16 -191, i16 356, i16 498, i16 408, i16 21, i16 195, i16 141, i16 374, i16 128, i16 67, i16 377, i16 454, i16 515, i16 308, i16 192, i16 203, i16 199, i16 209, i16 100, i16 187, i16 431, i16 635, i16 659, i16 285, i16 181, i16 394, i16 538, i16 630, i16 645, i16 13, i16 656, i16 243, i16 695, i16 225, i16 321, i16 159, i16 301, i16 260, i16 621, i16 166, i16 702, i16 188, i16 722, i16 235, i16 588, i16 77, i16 478, i16 92, i16 740, i16 -128, i16 597, i16 -158, i16 620, i16 -106, i16 233, i16 -99, i16 371, i16 -20, i16 542, i16 -250, i16 448, i16 -190, i16 415, i16 -171, i16 318, i16 -177, i16 337, i16 -226, i16 474, i16 -485, i16 62, i16 -455, i16 253, i16 -125, i16 158, i16 -363, i16 150, i16 -375, i16 136, i16 -472, i16 127, i16 -437, i16 131, i16 -419, i16 -156, i16 -358, i16 43, i16 -339, i16 70, i16 -493, i16 -18, i16 -534, i16 48, i16 -391, i16 -122, i16 -525, i16 -304, i16 -540, i16 -109, i16 -519, i16 -241, i16 -562, i16 -233, i16 -364, i16 -226, i16 -317, i16 -164, i16 -516, i16 -255, i16 -640, i16 -174, i16 -521, i16 -207, i16 -536, i16 -478, i16 -610, i16 -491, i16 -409, i16 -246, i16 -696, i16 -476, i16 -683, i16 -469, i16 -328, i16 -363, i16 -635, i16 -609, i16 -595, i16 -446, i16 -591, i16 -406, i16 -673, i16 -741, i16 -688, i16 -733, i16 -526, i16 -700, i16 -479, i16 -615, i16 -705, i16 -684, i16 -655, i16 -772, i16 -678, i16 -862, i16 -656, i16 -1018, i16 -551, i16 -846, i16 -452, i16 -925, i16 -557, i16 -744, i16 -562, i16 -1082, i16 -645, i16 -1080, i16 -475, i16 -972, i16 -588, i16 -1171, i16 -649, i16 -1210, i16 -416, i16 -1147, i16 -216, i16 -1205, i16 -508, i16 -1269, i16 -192, i16 -983, i16 -381, i16 -1132, i16 -417, i16 -1416, i16 -302, i16 -1162, i16 -56, i16 -1144, i16 -463, i16 -1485, i16 -233, i16 -1290, i16 151, i16 -1243, i16 -54, i16 -1324, i16 -134, i16 -1310, i16 197, i16 -865, i16 -57, i16 -1484, i16 74, i16 -1106, i16 193, i16 -1273, i16 63, i16 -1288, i16 130, i16 -1271, i16 384], align 2
@f = global [256 x i16] [i16 0, i16 32767, i16 -804, i16 32757, i16 -1607, i16 32727, i16 -2410, i16 32678, i16 -3211, i16 32609, i16 -4011, i16 32520, i16 -4807, i16 32412, i16 -5601, i16 32284, i16 -6392, i16 32137, i16 -7179, i16 31970, i16 -7961, i16 31785, i16 -8739, i16 31580, i16 -9511, i16 31356, i16 -10278, i16 31113, i16 -11038, i16 30851, i16 -11792, i16 30571, i16 -12539, i16 30272, i16 -13278, i16 29955, i16 -14009, i16 29621, i16 -14732, i16 29268, i16 -15446, i16 28897, i16 -16150, i16 28510, i16 -16845, i16 28105, i16 -17530, i16 27683, i16 -18204, i16 27244, i16 -18867, i16 26789, i16 -19519, i16 26318, i16 -20159, i16 25831, i16 -20787, i16 25329, i16 -21402, i16 24811, i16 -22004, i16 24278, i16 -22594, i16 23731, i16 -23169, i16 23169, i16 -23731, i16 22594, i16 -24278, i16 22004, i16 -24811, i16 21402, i16 -25329, i16 20787, i16 -25831, i16 20159, i16 -26318, i16 19519, i16 -26789, i16 18867, i16 -27244, i16 18204, i16 -27683, i16 17530, i16 -28105, i16 16845, i16 -28510, i16 16150, i16 -28897, i16 15446, i16 -29268, i16 14732, i16 -29621, i16 14009, i16 -29955, i16 13278, i16 -30272, i16 12539, i16 -30571, i16 11792, i16 -30851, i16 11038, i16 -31113, i16 10278, i16 -31356, i16 9511, i16 -31580, i16 8739, i16 -31785, i16 7961, i16 -31970, i16 7179, i16 -32137, i16 6392, i16 -32284, i16 5601, i16 -32412, i16 4807, i16 -32520, i16 4011, i16 -32609, i16 3211, i16 -32678, i16 2410, i16 -32727, i16 1607, i16 -32757, i16 804, i16 -32767, i16 0, i16 -32757, i16 -804, i16 -32727, i16 -1607, i16 -32678, i16 -2410, i16 -32609, i16 -3211, i16 -32520, i16 -4011, i16 -32412, i16 -4807, i16 -32284, i16 -5601, i16 -32137, i16 -6392, i16 -31970, i16 -7179, i16 -31785, i16 -7961, i16 -31580, i16 -8739, i16 -31356, i16 -9511, i16 -31113, i16 -10278, i16 -30851, i16 -11038, i16 -30571, i16 -11792, i16 -30272, i16 -12539, i16 -29955, i16 -13278, i16 -29621, i16 -14009, i16 -29268, i16 -14732, i16 -28897, i16 -15446, i16 -28510, i16 -16150, i16 -28105, i16 -16845, i16 -27683, i16 -17530, i16 -27244, i16 -18204, i16 -26789, i16 -18867, i16 -26318, i16 -19519, i16 -25831, i16 -20159, i16 -25329, i16 -20787, i16 -24811, i16 -21402, i16 -24278, i16 -22004, i16 -23731, i16 -22594, i16 -23169, i16 -23169, i16 -22594, i16 -23731, i16 -22004, i16 -24278, i16 -21402, i16 -24811, i16 -20787, i16 -25329, i16 -20159, i16 -25831, i16 -19519, i16 -26318, i16 -18867, i16 -26789, i16 -18204, i16 -27244, i16 -17530, i16 -27683, i16 -16845, i16 -28105, i16 -16150, i16 -28510, i16 -15446, i16 -28897, i16 -14732, i16 -29268, i16 -14009, i16 -29621, i16 -13278, i16 -29955, i16 -12539, i16 -30272, i16 -11792, i16 -30571, i16 -11038, i16 -30851, i16 -10278, i16 -31113, i16 -9511, i16 -31356, i16 -8739, i16 -31580, i16 -7961, i16 -31785, i16 -7179, i16 -31970, i16 -6392, i16 -32137, i16 -5601, i16 -32284, i16 -4807, i16 -32412, i16 -4011, i16 -32520, i16 -3211, i16 -32609, i16 -2410, i16 -32678, i16 -1607, i16 -32727, i16 -804, i16 -32757], align 2
@idx_8 = global [128 x i16] [i16 16, i16 17, i16 18, i16 19, i16 20, i16 21, i16 22, i16 23, i16 24, i16 25, i16 26, i16 27, i16 28, i16 29, i16 30, i16 31, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 0, i16 1, i16 2, i16 3, i16 4, i16 5, i16 6, i16 7, i16 8, i16 9, i16 10, i16 11, i16 12, i16 13, i16 14, i16 15, i16 0, i16 1, i16 2, i16 3, i16 4, i16 5, i16 6, i16 7, i16 8, i16 9, i16 10, i16 11, i16 12, i16 13, i16 14, i16 15, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 16, i16 17, i16 18, i16 19, i16 20, i16 21, i16 22, i16 23, i16 24, i16 25, i16 26, i16 27, i16 28, i16 29, i16 30, i16 31], align 2
@idx_4 = global [128 x i16] [i16 8, i16 9, i16 10, i16 11, i16 12, i16 13, i16 14, i16 15, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 24, i16 25, i16 26, i16 27, i16 28, i16 29, i16 30, i16 31, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 0, i16 1, i16 2, i16 3, i16 4, i16 5, i16 6, i16 7, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 16, i16 17, i16 18, i16 19, i16 20, i16 21, i16 22, i16 23, i16 0, i16 1, i16 2, i16 3, i16 4, i16 5, i16 6, i16 7, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 16, i16 17, i16 18, i16 19, i16 20, i16 21, i16 22, i16 23, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 8, i16 9, i16 10, i16 11, i16 12, i16 13, i16 14, i16 15, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 24, i16 25, i16 26, i16 27, i16 28, i16 29, i16 30, i16 31], align 2
@idx_2 = global [128 x i16] [i16 4, i16 5, i16 6, i16 7, i16 32, i16 32, i16 32, i16 32, i16 12, i16 13, i16 14, i16 15, i16 32, i16 32, i16 32, i16 32, i16 20, i16 21, i16 22, i16 23, i16 32, i16 32, i16 32, i16 32, i16 28, i16 29, i16 30, i16 31, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 0, i16 1, i16 2, i16 3, i16 32, i16 32, i16 32, i16 32, i16 8, i16 9, i16 10, i16 11, i16 32, i16 32, i16 32, i16 32, i16 16, i16 17, i16 18, i16 19, i16 32, i16 32, i16 32, i16 32, i16 24, i16 25, i16 26, i16 27, i16 0, i16 1, i16 2, i16 3, i16 32, i16 32, i16 32, i16 32, i16 8, i16 9, i16 10, i16 11, i16 32, i16 32, i16 32, i16 32, i16 16, i16 17, i16 18, i16 19, i16 32, i16 32, i16 32, i16 32, i16 24, i16 25, i16 26, i16 27, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 4, i16 5, i16 6, i16 7, i16 32, i16 32, i16 32, i16 32, i16 12, i16 13, i16 14, i16 15, i16 32, i16 32, i16 32, i16 32, i16 20, i16 21, i16 22, i16 23, i16 32, i16 32, i16 32, i16 32, i16 28, i16 29, i16 30, i16 31], align 2
@idx_1 = global [128 x i16] [i16 2, i16 3, i16 32, i16 32, i16 6, i16 7, i16 32, i16 32, i16 10, i16 11, i16 32, i16 32, i16 14, i16 15, i16 32, i16 32, i16 18, i16 19, i16 32, i16 32, i16 22, i16 23, i16 32, i16 32, i16 26, i16 27, i16 32, i16 32, i16 30, i16 31, i16 32, i16 32, i16 32, i16 32, i16 0, i16 1, i16 32, i16 32, i16 4, i16 5, i16 32, i16 32, i16 8, i16 9, i16 32, i16 32, i16 12, i16 13, i16 32, i16 32, i16 16, i16 17, i16 32, i16 32, i16 20, i16 21, i16 32, i16 32, i16 24, i16 25, i16 32, i16 32, i16 28, i16 29, i16 0, i16 1, i16 32, i16 32, i16 4, i16 5, i16 32, i16 32, i16 8, i16 9, i16 32, i16 32, i16 12, i16 13, i16 32, i16 32, i16 16, i16 17, i16 32, i16 32, i16 20, i16 21, i16 32, i16 32, i16 24, i16 25, i16 32, i16 32, i16 28, i16 29, i16 32, i16 32, i16 32, i16 32, i16 2, i16 3, i16 32, i16 32, i16 6, i16 7, i16 32, i16 32, i16 10, i16 11, i16 32, i16 32, i16 14, i16 15, i16 32, i16 32, i16 18, i16 19, i16 32, i16 32, i16 22, i16 23, i16 32, i16 32, i16 26, i16 27, i16 32, i16 32, i16 30, i16 31], align 2
@idx = global [32 x i16] [i16 0, i16 1, i16 4, i16 5, i16 8, i16 9, i16 12, i16 13, i16 16, i16 17, i16 20, i16 21, i16 24, i16 25, i16 28, i16 29, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32], align 2
@e_num = global i16 0, align 2
@DSP_minval.temp = private unnamed_addr constant [128 x i16] [i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767, i16 32767], align 2
@DSP_maxval.temp = private unnamed_addr constant [128 x i16] [i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768, i16 -32768], align 2
@num_max = common global i16 0, align 2
@num_min = common global i16 0, align 2

; Function Attrs: nounwind
define i32 @dbg_output(i8* %base, i32 %num, i32 %wid) #0 {
entry:
  %retval = alloca i32, align 4
  %base.addr = alloca i8*, align 4
  %num.addr = alloca i32, align 4
  %wid.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %i2 = alloca i32, align 4
  %i13 = alloca i32, align 4
  store i8* %base, i8** %base.addr, align 4
  call void @llvm.dbg.declare(metadata !{i8** %base.addr}, metadata !68), !dbg !69
  store i32 %num, i32* %num.addr, align 4
  call void @llvm.dbg.declare(metadata !{i32* %num.addr}, metadata !70), !dbg !71
  store i32 %wid, i32* %wid.addr, align 4
  call void @llvm.dbg.declare(metadata !{i32* %wid.addr}, metadata !72), !dbg !73
  %0 = load i32* %wid.addr, align 4, !dbg !74
  switch i32 %0, label %sw.default [
    i32 1, label %sw.bb
    i32 2, label %sw.bb1
    i32 4, label %sw.bb12
  ], !dbg !74

sw.bb:                                            ; preds = %entry
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !75), !dbg !78
  store i32 0, i32* %i, align 4, !dbg !79
  br label %for.cond, !dbg !79

for.cond:                                         ; preds = %for.inc, %sw.bb
  %1 = load i32* %i, align 4, !dbg !79
  %2 = load i32* %num.addr, align 4, !dbg !79
  %cmp = icmp slt i32 %1, %2, !dbg !79
  br i1 %cmp, label %for.body, label %for.end, !dbg !79

for.body:                                         ; preds = %for.cond
  %3 = load i32* %i, align 4, !dbg !80
  %4 = load i8** %base.addr, align 4, !dbg !80
  %arrayidx = getelementptr inbounds i8* %4, i32 %3, !dbg !80
  %5 = load i8* %arrayidx, align 1, !dbg !80
  %conv = sext i8 %5 to i32, !dbg !80
  %6 = load i32** @dbg_addr, align 4, !dbg !80
  store i32 %conv, i32* %6, align 4, !dbg !80
  br label %for.inc, !dbg !80

for.inc:                                          ; preds = %for.body
  %7 = load i32* %i, align 4, !dbg !81
  %inc = add nsw i32 %7, 1, !dbg !81
  store i32 %inc, i32* %i, align 4, !dbg !81
  br label %for.cond, !dbg !81

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %retval, !dbg !82
  br label %return, !dbg !82

sw.bb1:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata !{i32* %i2}, metadata !83), !dbg !85
  store i32 0, i32* %i2, align 4, !dbg !86
  br label %for.cond3, !dbg !86

for.cond3:                                        ; preds = %for.inc9, %sw.bb1
  %8 = load i32* %i2, align 4, !dbg !86
  %9 = load i32* %num.addr, align 4, !dbg !86
  %cmp4 = icmp slt i32 %8, %9, !dbg !86
  br i1 %cmp4, label %for.body6, label %for.end11, !dbg !86

for.body6:                                        ; preds = %for.cond3
  %10 = load i32* %i2, align 4, !dbg !87
  %11 = load i8** %base.addr, align 4, !dbg !87
  %12 = bitcast i8* %11 to i16*, !dbg !87
  %arrayidx7 = getelementptr inbounds i16* %12, i32 %10, !dbg !87
  %13 = load i16* %arrayidx7, align 2, !dbg !87
  %conv8 = sext i16 %13 to i32, !dbg !87
  %14 = load i32** @dbg_addr, align 4, !dbg !87
  store i32 %conv8, i32* %14, align 4, !dbg !87
  br label %for.inc9, !dbg !87

for.inc9:                                         ; preds = %for.body6
  %15 = load i32* %i2, align 4, !dbg !88
  %inc10 = add nsw i32 %15, 1, !dbg !88
  store i32 %inc10, i32* %i2, align 4, !dbg !88
  br label %for.cond3, !dbg !88

for.end11:                                        ; preds = %for.cond3
  store i32 0, i32* %retval, !dbg !89
  br label %return, !dbg !89

sw.bb12:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata !{i32* %i13}, metadata !90), !dbg !92
  store i32 0, i32* %i13, align 4, !dbg !93
  br label %for.cond14, !dbg !93

for.cond14:                                       ; preds = %for.inc19, %sw.bb12
  %16 = load i32* %i13, align 4, !dbg !93
  %17 = load i32* %num.addr, align 4, !dbg !93
  %cmp15 = icmp slt i32 %16, %17, !dbg !93
  br i1 %cmp15, label %for.body17, label %for.end21, !dbg !93

for.body17:                                       ; preds = %for.cond14
  %18 = load i32* %i13, align 4, !dbg !94
  %19 = load i8** %base.addr, align 4, !dbg !94
  %20 = bitcast i8* %19 to i32*, !dbg !94
  %arrayidx18 = getelementptr inbounds i32* %20, i32 %18, !dbg !94
  %21 = load i32* %arrayidx18, align 4, !dbg !94
  %22 = load i32** @dbg_addr, align 4, !dbg !94
  store i32 %21, i32* %22, align 4, !dbg !94
  br label %for.inc19, !dbg !94

for.inc19:                                        ; preds = %for.body17
  %23 = load i32* %i13, align 4, !dbg !95
  %inc20 = add nsw i32 %23, 1, !dbg !95
  store i32 %inc20, i32* %i13, align 4, !dbg !95
  br label %for.cond14, !dbg !95

for.end21:                                        ; preds = %for.cond14
  store i32 0, i32* %retval, !dbg !96
  br label %return, !dbg !96

sw.default:                                       ; preds = %entry
  store i32 -1, i32* %retval, !dbg !97
  br label %return, !dbg !97

return:                                           ; preds = %sw.default, %for.end21, %for.end11, %for.end
  %24 = load i32* %retval, !dbg !98
  ret i32 %24, !dbg !98
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind
define signext i16 @abs_q(i16 signext %x) #0 {
entry:
  %retval = alloca i16, align 2
  %x.addr = alloca i16, align 2
  store i16 %x, i16* %x.addr, align 2
  call void @llvm.dbg.declare(metadata !{i16* %x.addr}, metadata !99), !dbg !100
  %0 = load i16* %x.addr, align 2, !dbg !101
  %conv = sext i16 %0 to i32, !dbg !101
  %cmp = icmp slt i32 %conv, 0, !dbg !101
  br i1 %cmp, label %if.then, label %if.else, !dbg !101

if.then:                                          ; preds = %entry
  %1 = load i16* %x.addr, align 2, !dbg !103
  %conv2 = sext i16 %1 to i32, !dbg !103
  %sub = sub nsw i32 0, %conv2, !dbg !103
  %conv3 = trunc i32 %sub to i16, !dbg !103
  store i16 %conv3, i16* %retval, !dbg !103
  br label %return, !dbg !103

if.else:                                          ; preds = %entry
  %2 = load i16* %x.addr, align 2, !dbg !105
  store i16 %2, i16* %retval, !dbg !105
  br label %return, !dbg !105

return:                                           ; preds = %if.else, %if.then
  %3 = load i16* %retval, !dbg !107
  ret i16 %3, !dbg !107
}

; Function Attrs: nounwind
define signext i16 @max_q(i16 signext %x, i16 signext %y) #0 {
entry:
  %retval = alloca i16, align 2
  %x.addr = alloca i16, align 2
  %y.addr = alloca i16, align 2
  store i16 %x, i16* %x.addr, align 2
  call void @llvm.dbg.declare(metadata !{i16* %x.addr}, metadata !108), !dbg !109
  store i16 %y, i16* %y.addr, align 2
  call void @llvm.dbg.declare(metadata !{i16* %y.addr}, metadata !110), !dbg !111
  %0 = load i16* %x.addr, align 2, !dbg !112
  %conv = sext i16 %0 to i32, !dbg !112
  %1 = load i16* %y.addr, align 2, !dbg !112
  %conv1 = sext i16 %1 to i32, !dbg !112
  %cmp = icmp sgt i32 %conv, %conv1, !dbg !112
  br i1 %cmp, label %if.then, label %if.else, !dbg !112

if.then:                                          ; preds = %entry
  %2 = load i16* %x.addr, align 2, !dbg !114
  store i16 %2, i16* %retval, !dbg !114
  br label %return, !dbg !114

if.else:                                          ; preds = %entry
  %3 = load i16* %y.addr, align 2, !dbg !116
  store i16 %3, i16* %retval, !dbg !116
  br label %return, !dbg !116

return:                                           ; preds = %if.else, %if.then
  %4 = load i16* %retval, !dbg !118
  ret i16 %4, !dbg !118
}

; Function Attrs: nounwind
define signext i16 @DSP_minval(i16* %x, i32 %nx) #0 {
entry:
  %x.addr = alloca i16*, align 4
  %nx.addr = alloca i32, align 4
  %min = alloca i32, align 4
  %temp = alloca [128 x i16], align 2
  %k = alloca i32, align 4
  %i = alloca i32, align 4
  %i2 = alloca i32, align 4
  %i20 = alloca i32, align 4
  store i16* %x, i16** %x.addr, align 4
  call void @llvm.dbg.declare(metadata !{i16** %x.addr}, metadata !119), !dbg !120
  store i32 %nx, i32* %nx.addr, align 4
  call void @llvm.dbg.declare(metadata !{i32* %nx.addr}, metadata !121), !dbg !122
  call void @llvm.dbg.declare(metadata !{i32* %min}, metadata !123), !dbg !124
  store i32 32767, i32* %min, align 4, !dbg !125
  call void @llvm.dbg.declare(metadata !{[128 x i16]* %temp}, metadata !126), !dbg !127
  %0 = bitcast [128 x i16]* %temp to i8*, !dbg !128
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %0, i8* bitcast ([128 x i16]* @DSP_minval.temp to i8*), i32 256, i32 2, i1 false), !dbg !128
  call void @llvm.dbg.declare(metadata !{i32* %k}, metadata !129), !dbg !130
  %1 = load i32* %nx.addr, align 4, !dbg !131
  %div = sdiv i32 %1, 128, !dbg !131
  store i32 %div, i32* %k, align 4, !dbg !131
  %2 = load i32* %nx.addr, align 4, !dbg !132
  %cmp = icmp sge i32 %2, 256, !dbg !132
  br i1 %cmp, label %if.then, label %if.else, !dbg !132

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !134), !dbg !137
  store i32 0, i32* %i, align 4, !dbg !138
  br label %for.cond, !dbg !138

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32* %i, align 4, !dbg !138
  %4 = load i32* %k, align 4, !dbg !138
  %cmp1 = icmp slt i32 %3, %4, !dbg !138
  br i1 %cmp1, label %for.body, label %for.end, !dbg !138

for.body:                                         ; preds = %for.cond
  %5 = load i32* %i, align 4, !dbg !139
  %mul = mul nsw i32 %5, 128, !dbg !139
  %6 = load i16** %x.addr, align 4, !dbg !139
  %arrayidx = getelementptr inbounds i16* %6, i32 %mul, !dbg !139
  %arraydecay = getelementptr inbounds [128 x i16]* %temp, i32 0, i32 0, !dbg !139
  call void @dsp_minval_asm(i16* %arrayidx, i16* %arraydecay), !dbg !139
  br label %for.inc, !dbg !141

for.inc:                                          ; preds = %for.body
  %7 = load i32* %i, align 4, !dbg !142
  %inc = add nsw i32 %7, 1, !dbg !142
  store i32 %inc, i32* %i, align 4, !dbg !142
  br label %for.cond, !dbg !142

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata !{i32* %i2}, metadata !143), !dbg !145
  store i32 0, i32* %i2, align 4, !dbg !146
  br label %for.cond3, !dbg !146

for.cond3:                                        ; preds = %for.inc12, %for.end
  %8 = load i32* %i2, align 4, !dbg !146
  %cmp4 = icmp slt i32 %8, 128, !dbg !146
  br i1 %cmp4, label %for.body5, label %for.end14, !dbg !146

for.body5:                                        ; preds = %for.cond3
  %9 = load i32* %i2, align 4, !dbg !147
  %arrayidx6 = getelementptr inbounds [128 x i16]* %temp, i32 0, i32 %9, !dbg !147
  %10 = load i16* %arrayidx6, align 2, !dbg !147
  %conv = sext i16 %10 to i32, !dbg !147
  %11 = load i32* %min, align 4, !dbg !147
  %cmp7 = icmp slt i32 %conv, %11, !dbg !147
  br i1 %cmp7, label %if.then9, label %if.end, !dbg !147

if.then9:                                         ; preds = %for.body5
  %12 = load i32* %i2, align 4, !dbg !149
  %arrayidx10 = getelementptr inbounds [128 x i16]* %temp, i32 0, i32 %12, !dbg !149
  %13 = load i16* %arrayidx10, align 2, !dbg !149
  %conv11 = sext i16 %13 to i32, !dbg !149
  store i32 %conv11, i32* %min, align 4, !dbg !149
  br label %if.end, !dbg !149

if.end:                                           ; preds = %if.then9, %for.body5
  br label %for.inc12, !dbg !150

for.inc12:                                        ; preds = %if.end
  %14 = load i32* %i2, align 4, !dbg !151
  %inc13 = add nsw i32 %14, 1, !dbg !151
  store i32 %inc13, i32* %i2, align 4, !dbg !151
  br label %for.cond3, !dbg !151

for.end14:                                        ; preds = %for.cond3
  br label %if.end19, !dbg !152

if.else:                                          ; preds = %entry
  %15 = load i32* %nx.addr, align 4, !dbg !153
  %cmp15 = icmp sge i32 %15, 128, !dbg !153
  br i1 %cmp15, label %if.then17, label %if.end18, !dbg !153

if.then17:                                        ; preds = %if.else
  %16 = load i32* %k, align 4, !dbg !155
  %dec = add nsw i32 %16, -1, !dbg !155
  store i32 %dec, i32* %k, align 4, !dbg !155
  br label %if.end18, !dbg !157

if.end18:                                         ; preds = %if.then17, %if.else
  br label %if.end19

if.end19:                                         ; preds = %if.end18, %for.end14
  call void @llvm.dbg.declare(metadata !{i32* %i20}, metadata !158), !dbg !160
  %17 = load i32* %k, align 4, !dbg !161
  %mul21 = mul nsw i32 %17, 128, !dbg !161
  store i32 %mul21, i32* %i20, align 4, !dbg !161
  br label %for.cond22, !dbg !161

for.cond22:                                       ; preds = %for.inc34, %if.end19
  %18 = load i32* %i20, align 4, !dbg !161
  %19 = load i32* %nx.addr, align 4, !dbg !161
  %cmp23 = icmp slt i32 %18, %19, !dbg !161
  br i1 %cmp23, label %for.body25, label %for.end36, !dbg !161

for.body25:                                       ; preds = %for.cond22
  %20 = load i32* %i20, align 4, !dbg !162
  %21 = load i16** %x.addr, align 4, !dbg !162
  %arrayidx26 = getelementptr inbounds i16* %21, i32 %20, !dbg !162
  %22 = load i16* %arrayidx26, align 2, !dbg !162
  %conv27 = sext i16 %22 to i32, !dbg !162
  %23 = load i32* %min, align 4, !dbg !162
  %cmp28 = icmp slt i32 %conv27, %23, !dbg !162
  br i1 %cmp28, label %if.then30, label %if.end33, !dbg !162

if.then30:                                        ; preds = %for.body25
  %24 = load i32* %i20, align 4, !dbg !164
  %25 = load i16** %x.addr, align 4, !dbg !164
  %arrayidx31 = getelementptr inbounds i16* %25, i32 %24, !dbg !164
  %26 = load i16* %arrayidx31, align 2, !dbg !164
  %conv32 = sext i16 %26 to i32, !dbg !164
  store i32 %conv32, i32* %min, align 4, !dbg !164
  br label %if.end33, !dbg !164

if.end33:                                         ; preds = %if.then30, %for.body25
  br label %for.inc34, !dbg !165

for.inc34:                                        ; preds = %if.end33
  %27 = load i32* %i20, align 4, !dbg !166
  %inc35 = add nsw i32 %27, 1, !dbg !166
  store i32 %inc35, i32* %i20, align 4, !dbg !166
  br label %for.cond22, !dbg !166

for.end36:                                        ; preds = %for.cond22
  %28 = load i32* %min, align 4, !dbg !167
  %conv37 = trunc i32 %28 to i16, !dbg !167
  ret i16 %conv37, !dbg !167
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture, i8* nocapture readonly, i32, i32, i1) #2

declare void @dsp_minval_asm(i16*, i16*) #3

; Function Attrs: nounwind
define signext i16 @DSP_maxval(i16* %x, i32 %nx) #0 {
entry:
  %x.addr = alloca i16*, align 4
  %nx.addr = alloca i32, align 4
  %max = alloca i32, align 4
  %temp = alloca [128 x i16], align 2
  %k = alloca i32, align 4
  %i = alloca i32, align 4
  %i2 = alloca i32, align 4
  %i20 = alloca i32, align 4
  store i16* %x, i16** %x.addr, align 4
  call void @llvm.dbg.declare(metadata !{i16** %x.addr}, metadata !168), !dbg !169
  store i32 %nx, i32* %nx.addr, align 4
  call void @llvm.dbg.declare(metadata !{i32* %nx.addr}, metadata !170), !dbg !171
  call void @llvm.dbg.declare(metadata !{i32* %max}, metadata !172), !dbg !173
  store i32 -32768, i32* %max, align 4, !dbg !174
  call void @llvm.dbg.declare(metadata !{[128 x i16]* %temp}, metadata !175), !dbg !176
  %0 = bitcast [128 x i16]* %temp to i8*, !dbg !177
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %0, i8* bitcast ([128 x i16]* @DSP_maxval.temp to i8*), i32 256, i32 2, i1 false), !dbg !177
  call void @llvm.dbg.declare(metadata !{i32* %k}, metadata !178), !dbg !179
  %1 = load i32* %nx.addr, align 4, !dbg !180
  %div = sdiv i32 %1, 128, !dbg !180
  store i32 %div, i32* %k, align 4, !dbg !180
  %2 = load i32* %nx.addr, align 4, !dbg !181
  %cmp = icmp sge i32 %2, 256, !dbg !181
  br i1 %cmp, label %if.then, label %if.else, !dbg !181

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !183), !dbg !186
  store i32 0, i32* %i, align 4, !dbg !187
  br label %for.cond, !dbg !187

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32* %i, align 4, !dbg !187
  %4 = load i32* %k, align 4, !dbg !187
  %cmp1 = icmp slt i32 %3, %4, !dbg !187
  br i1 %cmp1, label %for.body, label %for.end, !dbg !187

for.body:                                         ; preds = %for.cond
  %5 = load i32* %i, align 4, !dbg !188
  %mul = mul nsw i32 %5, 128, !dbg !188
  %6 = load i16** %x.addr, align 4, !dbg !188
  %arrayidx = getelementptr inbounds i16* %6, i32 %mul, !dbg !188
  %arraydecay = getelementptr inbounds [128 x i16]* %temp, i32 0, i32 0, !dbg !188
  call void @dsp_maxval_asm(i16* %arrayidx, i16* %arraydecay), !dbg !188
  br label %for.inc, !dbg !190

for.inc:                                          ; preds = %for.body
  %7 = load i32* %i, align 4, !dbg !191
  %inc = add nsw i32 %7, 1, !dbg !191
  store i32 %inc, i32* %i, align 4, !dbg !191
  br label %for.cond, !dbg !191

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata !{i32* %i2}, metadata !192), !dbg !194
  store i32 0, i32* %i2, align 4, !dbg !195
  br label %for.cond3, !dbg !195

for.cond3:                                        ; preds = %for.inc12, %for.end
  %8 = load i32* %i2, align 4, !dbg !195
  %cmp4 = icmp slt i32 %8, 128, !dbg !195
  br i1 %cmp4, label %for.body5, label %for.end14, !dbg !195

for.body5:                                        ; preds = %for.cond3
  %9 = load i32* %i2, align 4, !dbg !196
  %arrayidx6 = getelementptr inbounds [128 x i16]* %temp, i32 0, i32 %9, !dbg !196
  %10 = load i16* %arrayidx6, align 2, !dbg !196
  %conv = sext i16 %10 to i32, !dbg !196
  %11 = load i32* %max, align 4, !dbg !196
  %cmp7 = icmp sgt i32 %conv, %11, !dbg !196
  br i1 %cmp7, label %if.then9, label %if.end, !dbg !196

if.then9:                                         ; preds = %for.body5
  %12 = load i32* %i2, align 4, !dbg !198
  %arrayidx10 = getelementptr inbounds [128 x i16]* %temp, i32 0, i32 %12, !dbg !198
  %13 = load i16* %arrayidx10, align 2, !dbg !198
  %conv11 = sext i16 %13 to i32, !dbg !198
  store i32 %conv11, i32* %max, align 4, !dbg !198
  br label %if.end, !dbg !198

if.end:                                           ; preds = %if.then9, %for.body5
  br label %for.inc12, !dbg !199

for.inc12:                                        ; preds = %if.end
  %14 = load i32* %i2, align 4, !dbg !200
  %inc13 = add nsw i32 %14, 1, !dbg !200
  store i32 %inc13, i32* %i2, align 4, !dbg !200
  br label %for.cond3, !dbg !200

for.end14:                                        ; preds = %for.cond3
  br label %if.end19, !dbg !201

if.else:                                          ; preds = %entry
  %15 = load i32* %nx.addr, align 4, !dbg !202
  %cmp15 = icmp sge i32 %15, 128, !dbg !202
  br i1 %cmp15, label %if.then17, label %if.end18, !dbg !202

if.then17:                                        ; preds = %if.else
  %16 = load i32* %k, align 4, !dbg !204
  %dec = add nsw i32 %16, -1, !dbg !204
  store i32 %dec, i32* %k, align 4, !dbg !204
  br label %if.end18, !dbg !206

if.end18:                                         ; preds = %if.then17, %if.else
  br label %if.end19

if.end19:                                         ; preds = %if.end18, %for.end14
  call void @llvm.dbg.declare(metadata !{i32* %i20}, metadata !207), !dbg !209
  %17 = load i32* %k, align 4, !dbg !210
  %mul21 = mul nsw i32 %17, 128, !dbg !210
  store i32 %mul21, i32* %i20, align 4, !dbg !210
  br label %for.cond22, !dbg !210

for.cond22:                                       ; preds = %for.inc34, %if.end19
  %18 = load i32* %i20, align 4, !dbg !210
  %19 = load i32* %nx.addr, align 4, !dbg !210
  %cmp23 = icmp slt i32 %18, %19, !dbg !210
  br i1 %cmp23, label %for.body25, label %for.end36, !dbg !210

for.body25:                                       ; preds = %for.cond22
  %20 = load i32* %i20, align 4, !dbg !211
  %21 = load i16** %x.addr, align 4, !dbg !211
  %arrayidx26 = getelementptr inbounds i16* %21, i32 %20, !dbg !211
  %22 = load i16* %arrayidx26, align 2, !dbg !211
  %conv27 = sext i16 %22 to i32, !dbg !211
  %23 = load i32* %max, align 4, !dbg !211
  %cmp28 = icmp sgt i32 %conv27, %23, !dbg !211
  br i1 %cmp28, label %if.then30, label %if.end33, !dbg !211

if.then30:                                        ; preds = %for.body25
  %24 = load i32* %i20, align 4, !dbg !213
  %25 = load i16** %x.addr, align 4, !dbg !213
  %arrayidx31 = getelementptr inbounds i16* %25, i32 %24, !dbg !213
  %26 = load i16* %arrayidx31, align 2, !dbg !213
  %conv32 = sext i16 %26 to i32, !dbg !213
  store i32 %conv32, i32* %max, align 4, !dbg !213
  br label %if.end33, !dbg !213

if.end33:                                         ; preds = %if.then30, %for.body25
  br label %for.inc34, !dbg !214

for.inc34:                                        ; preds = %if.end33
  %27 = load i32* %i20, align 4, !dbg !215
  %inc35 = add nsw i32 %27, 1, !dbg !215
  store i32 %inc35, i32* %i20, align 4, !dbg !215
  br label %for.cond22, !dbg !215

for.end36:                                        ; preds = %for.cond22
  %28 = load i32* %max, align 4, !dbg !216
  %conv37 = trunc i32 %28 to i16, !dbg !216
  ret i16 %conv37, !dbg !216
}

declare void @dsp_maxval_asm(i16*, i16*) #3

; Function Attrs: nounwind
define void @bit_reverse(i32 %n, i16* %x) #0 {
entry:
  %n.addr = alloca i32, align 4
  %x.addr = alloca i16*, align 4
  %temp = alloca i16, align 2
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata !{i32* %n.addr}, metadata !217), !dbg !218
  store i16* %x, i16** %x.addr, align 4
  call void @llvm.dbg.declare(metadata !{i16** %x.addr}, metadata !219), !dbg !220
  call void @llvm.dbg.declare(metadata !{i16* %temp}, metadata !221), !dbg !222
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !223), !dbg !225
  store i32 0, i32* %i, align 4, !dbg !226
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !227), !dbg !228
  store i32 1, i32* %j, align 4, !dbg !226
  br label %for.cond, !dbg !226

for.cond:                                         ; preds = %for.inc23, %entry
  %0 = load i32* %j, align 4, !dbg !226
  %1 = load i32* %n.addr, align 4, !dbg !226
  %sub = sub nsw i32 %1, 1, !dbg !226
  %cmp = icmp slt i32 %0, %sub, !dbg !226
  br i1 %cmp, label %for.body, label %for.end24, !dbg !226

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata !{i32* %k}, metadata !229), !dbg !232
  %2 = load i32* %n.addr, align 4, !dbg !233
  %shr = ashr i32 %2, 1, !dbg !233
  store i32 %shr, i32* %k, align 4, !dbg !233
  br label %for.cond1, !dbg !233

for.cond1:                                        ; preds = %for.inc, %for.body
  %3 = load i32* %k, align 4, !dbg !233
  %4 = load i32* %k, align 4, !dbg !233
  %5 = load i32* %i, align 4, !dbg !233
  %xor = xor i32 %5, %4, !dbg !233
  store i32 %xor, i32* %i, align 4, !dbg !233
  %cmp2 = icmp sgt i32 %3, %xor, !dbg !233
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !233

for.body3:                                        ; preds = %for.cond1
  br label %for.inc, !dbg !233

for.inc:                                          ; preds = %for.body3
  %6 = load i32* %k, align 4, !dbg !234
  %shr4 = ashr i32 %6, 1, !dbg !234
  store i32 %shr4, i32* %k, align 4, !dbg !234
  br label %for.cond1, !dbg !234

for.end:                                          ; preds = %for.cond1
  %7 = load i32* %i, align 4, !dbg !235
  %8 = load i32* %j, align 4, !dbg !235
  %cmp5 = icmp slt i32 %7, %8, !dbg !235
  br i1 %cmp5, label %if.then, label %if.end, !dbg !235

if.then:                                          ; preds = %for.end
  %9 = load i32* %i, align 4, !dbg !237
  %mul = mul nsw i32 2, %9, !dbg !237
  %10 = load i16** %x.addr, align 4, !dbg !237
  %arrayidx = getelementptr inbounds i16* %10, i32 %mul, !dbg !237
  %11 = load i16* %arrayidx, align 2, !dbg !237
  store i16 %11, i16* %temp, align 2, !dbg !237
  %12 = load i32* %j, align 4, !dbg !239
  %mul6 = mul nsw i32 2, %12, !dbg !239
  %13 = load i16** %x.addr, align 4, !dbg !239
  %arrayidx7 = getelementptr inbounds i16* %13, i32 %mul6, !dbg !239
  %14 = load i16* %arrayidx7, align 2, !dbg !239
  %15 = load i32* %i, align 4, !dbg !239
  %mul8 = mul nsw i32 2, %15, !dbg !239
  %16 = load i16** %x.addr, align 4, !dbg !239
  %arrayidx9 = getelementptr inbounds i16* %16, i32 %mul8, !dbg !239
  store i16 %14, i16* %arrayidx9, align 2, !dbg !239
  %17 = load i16* %temp, align 2, !dbg !240
  %18 = load i32* %j, align 4, !dbg !240
  %mul10 = mul nsw i32 2, %18, !dbg !240
  %19 = load i16** %x.addr, align 4, !dbg !240
  %arrayidx11 = getelementptr inbounds i16* %19, i32 %mul10, !dbg !240
  store i16 %17, i16* %arrayidx11, align 2, !dbg !240
  %20 = load i32* %i, align 4, !dbg !241
  %mul12 = mul nsw i32 2, %20, !dbg !241
  %add = add nsw i32 %mul12, 1, !dbg !241
  %21 = load i16** %x.addr, align 4, !dbg !241
  %arrayidx13 = getelementptr inbounds i16* %21, i32 %add, !dbg !241
  %22 = load i16* %arrayidx13, align 2, !dbg !241
  store i16 %22, i16* %temp, align 2, !dbg !241
  %23 = load i32* %j, align 4, !dbg !242
  %mul14 = mul nsw i32 2, %23, !dbg !242
  %add15 = add nsw i32 %mul14, 1, !dbg !242
  %24 = load i16** %x.addr, align 4, !dbg !242
  %arrayidx16 = getelementptr inbounds i16* %24, i32 %add15, !dbg !242
  %25 = load i16* %arrayidx16, align 2, !dbg !242
  %26 = load i32* %i, align 4, !dbg !242
  %mul17 = mul nsw i32 2, %26, !dbg !242
  %add18 = add nsw i32 %mul17, 1, !dbg !242
  %27 = load i16** %x.addr, align 4, !dbg !242
  %arrayidx19 = getelementptr inbounds i16* %27, i32 %add18, !dbg !242
  store i16 %25, i16* %arrayidx19, align 2, !dbg !242
  %28 = load i16* %temp, align 2, !dbg !243
  %29 = load i32* %j, align 4, !dbg !243
  %mul20 = mul nsw i32 2, %29, !dbg !243
  %add21 = add nsw i32 %mul20, 1, !dbg !243
  %30 = load i16** %x.addr, align 4, !dbg !243
  %arrayidx22 = getelementptr inbounds i16* %30, i32 %add21, !dbg !243
  store i16 %28, i16* %arrayidx22, align 2, !dbg !243
  br label %if.end, !dbg !244

if.end:                                           ; preds = %if.then, %for.end
  br label %for.inc23, !dbg !245

for.inc23:                                        ; preds = %if.end
  %31 = load i32* %j, align 4, !dbg !246
  %inc = add nsw i32 %31, 1, !dbg !246
  store i32 %inc, i32* %j, align 4, !dbg !246
  br label %for.cond, !dbg !246

for.end24:                                        ; preds = %for.cond
  ret void, !dbg !247
}

; Function Attrs: nounwind
define void @fft_16x16(i16* %x, i16* %w, i32 %nx) #0 {
entry:
  %retval.i212 = alloca i32, align 4, !dbg !248
  %vpnum.addr.i213 = alloca i32, align 4, !dbg !248
  %vpsel.i214 = alloca i32*, align 4, !dbg !248
  %retval.i201 = alloca i32, align 4, !dbg !255
  %vpnum.addr.i202 = alloca i32, align 4, !dbg !255
  %vpsel.i203 = alloca i32*, align 4, !dbg !255
  %retval.i190 = alloca i32, align 4, !dbg !258
  %vpnum.addr.i191 = alloca i32, align 4, !dbg !258
  %vpsel.i192 = alloca i32*, align 4, !dbg !258
  %retval.i179 = alloca i32, align 4, !dbg !261
  %vpnum.addr.i180 = alloca i32, align 4, !dbg !261
  %vpsel.i181 = alloca i32*, align 4, !dbg !261
  %retval.i168 = alloca i32, align 4, !dbg !263
  %vpnum.addr.i169 = alloca i32, align 4, !dbg !263
  %vpsel.i170 = alloca i32*, align 4, !dbg !263
  %retval.i157 = alloca i32, align 4, !dbg !266
  %vpnum.addr.i158 = alloca i32, align 4, !dbg !266
  %vpsel.i159 = alloca i32*, align 4, !dbg !266
  %retval.i = alloca i32, align 4, !dbg !268
  %vpnum.addr.i = alloca i32, align 4, !dbg !268
  %vpsel.i = alloca i32*, align 4, !dbg !268
  %x.addr = alloca i16*, align 4
  %w.addr = alloca i16*, align 4
  %nx.addr = alloca i32, align 4
  %n1 = alloca i32, align 4
  %n2 = alloca i32, align 4
  %ie = alloca i32, align 4
  %ia = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %m = alloca i32, align 4
  %xt = alloca i32, align 4
  %yt = alloca i32, align 4
  %c = alloca i32, align 4
  %s = alloca i32, align 4
  %mid_a = alloca i32, align 4
  %mid_b = alloca i32, align 4
  %time = alloca i32, align 4
  %time26 = alloca i32, align 4
  %step = alloca i32, align 4
  %p = alloca i32, align 4
  %p129 = alloca i32, align 4
  %j145 = alloca i32, align 4
  store i16* %x, i16** %x.addr, align 4
  call void @llvm.dbg.declare(metadata !{i16** %x.addr}, metadata !270), !dbg !271
  store i16* %w, i16** %w.addr, align 4
  call void @llvm.dbg.declare(metadata !{i16** %w.addr}, metadata !272), !dbg !273
  store i32 %nx, i32* %nx.addr, align 4
  call void @llvm.dbg.declare(metadata !{i32* %nx.addr}, metadata !274), !dbg !275
  call void @llvm.dbg.declare(metadata !{i32* %n1}, metadata !276), !dbg !277
  call void @llvm.dbg.declare(metadata !{i32* %n2}, metadata !278), !dbg !279
  call void @llvm.dbg.declare(metadata !{i32* %ie}, metadata !280), !dbg !281
  call void @llvm.dbg.declare(metadata !{i32* %ia}, metadata !282), !dbg !283
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !284), !dbg !285
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !286), !dbg !287
  call void @llvm.dbg.declare(metadata !{i32* %k}, metadata !288), !dbg !289
  call void @llvm.dbg.declare(metadata !{i32* %l}, metadata !290), !dbg !291
  call void @llvm.dbg.declare(metadata !{i32* %m}, metadata !292), !dbg !293
  call void @llvm.dbg.declare(metadata !{i32* %xt}, metadata !294), !dbg !295
  call void @llvm.dbg.declare(metadata !{i32* %yt}, metadata !296), !dbg !297
  call void @llvm.dbg.declare(metadata !{i32* %c}, metadata !298), !dbg !299
  call void @llvm.dbg.declare(metadata !{i32* %s}, metadata !300), !dbg !301
  call void @llvm.dbg.declare(metadata !{i32* %mid_a}, metadata !302), !dbg !303
  call void @llvm.dbg.declare(metadata !{i32* %mid_b}, metadata !304), !dbg !305
  %0 = load i32* %nx.addr, align 4, !dbg !306
  store i32 %0, i32* %n2, align 4, !dbg !306
  store i32 1, i32* %ie, align 4, !dbg !307
  %1 = load i32* %nx.addr, align 4, !dbg !308
  store i32 %1, i32* %k, align 4, !dbg !308
  br label %for.cond, !dbg !308

for.cond:                                         ; preds = %for.inc154, %entry
  %2 = load i32* %k, align 4, !dbg !308
  %cmp = icmp sgt i32 %2, 1, !dbg !308
  br i1 %cmp, label %for.body, label %for.end156, !dbg !308

for.body:                                         ; preds = %for.cond
  %3 = load i32* %n2, align 4, !dbg !309
  store i32 %3, i32* %n1, align 4, !dbg !309
  %4 = load i32* %n2, align 4, !dbg !310
  %shr = ashr i32 %4, 1, !dbg !310
  store i32 %shr, i32* %n2, align 4, !dbg !310
  %5 = load i32* %n2, align 4, !dbg !311
  %cmp1 = icmp sge i32 %5, 64, !dbg !311
  br i1 %cmp1, label %if.then, label %if.else, !dbg !311

if.then:                                          ; preds = %for.body
  store i32 4, i32* %vpnum.addr.i, align 4, !dbg !268
  call void @llvm.dbg.declare(metadata !{i32* %vpnum.addr.i}, metadata !312), !dbg !313
  call void @llvm.dbg.declare(metadata !{i32** %vpsel.i}, metadata !314), !dbg !315
  store i32* inttoptr (i32 8336896 to i32*), i32** %vpsel.i, align 4, !dbg !316
  %6 = load i32* %vpnum.addr.i, align 4, !dbg !317
  switch i32 %6, label %sw.default.i [
    i32 0, label %sw.bb.i
    i32 1, label %sw.bb1.i
    i32 2, label %sw.bb2.i
    i32 3, label %sw.bb3.i
    i32 4, label %sw.bb4.i
  ], !dbg !317

sw.bb.i:                                          ; preds = %if.then
  %7 = load i32** %vpsel.i, align 4, !dbg !318
  store i32 0, i32* %7, align 4, !dbg !318
  br label %sw.epilog.i, !dbg !320

sw.bb1.i:                                         ; preds = %if.then
  %8 = load i32** %vpsel.i, align 4, !dbg !321
  store i32 1, i32* %8, align 4, !dbg !321
  br label %sw.epilog.i, !dbg !322

sw.bb2.i:                                         ; preds = %if.then
  %9 = load i32** %vpsel.i, align 4, !dbg !323
  store i32 3, i32* %9, align 4, !dbg !323
  br label %sw.epilog.i, !dbg !324

sw.bb3.i:                                         ; preds = %if.then
  %10 = load i32** %vpsel.i, align 4, !dbg !325
  store i32 7, i32* %10, align 4, !dbg !325
  br label %sw.epilog.i, !dbg !326

sw.bb4.i:                                         ; preds = %if.then
  %11 = load i32** %vpsel.i, align 4, !dbg !327
  store i32 15, i32* %11, align 4, !dbg !327
  br label %sw.epilog.i, !dbg !328

sw.default.i:                                     ; preds = %if.then
  store i32 -1, i32* %retval.i, !dbg !329
  br label %set_vpsel.exit, !dbg !329

sw.epilog.i:                                      ; preds = %sw.bb4.i, %sw.bb3.i, %sw.bb2.i, %sw.bb1.i, %sw.bb.i
  store i32 1, i32* %retval.i, !dbg !330
  br label %set_vpsel.exit, !dbg !330

set_vpsel.exit:                                   ; preds = %sw.default.i, %sw.epilog.i
  %12 = load i32* %retval.i, !dbg !331
  store i32 0, i32* %j, align 4, !dbg !332
  br label %for.cond2, !dbg !332

for.cond2:                                        ; preds = %for.inc17, %set_vpsel.exit
  %13 = load i32* %j, align 4, !dbg !332
  %14 = load i32* %nx.addr, align 4, !dbg !332
  %cmp3 = icmp slt i32 %13, %14, !dbg !332
  br i1 %cmp3, label %for.body4, label %for.end19, !dbg !332

for.body4:                                        ; preds = %for.cond2
  store i32 0, i32* %ia, align 4, !dbg !334
  call void @llvm.dbg.declare(metadata !{i32* %time}, metadata !336), !dbg !337
  %15 = load i32* %n2, align 4, !dbg !338
  %div = sdiv i32 %15, 64, !dbg !338
  store i32 %div, i32* %time, align 4, !dbg !338
  store i32 0, i32* %i, align 4, !dbg !339
  br label %for.cond5, !dbg !339

for.cond5:                                        ; preds = %for.inc, %for.body4
  %16 = load i32* %i, align 4, !dbg !339
  %17 = load i32* %time, align 4, !dbg !339
  %cmp6 = icmp slt i32 %16, %17, !dbg !339
  br i1 %cmp6, label %for.body7, label %for.end, !dbg !339

for.body7:                                        ; preds = %for.cond5
  %18 = load i32* %i, align 4, !dbg !341
  %mul = mul nsw i32 %18, 64, !dbg !341
  %19 = load i32* %j, align 4, !dbg !341
  %add = add nsw i32 %mul, %19, !dbg !341
  store i32 %add, i32* %m, align 4, !dbg !341
  %20 = load i32* %m, align 4, !dbg !343
  %21 = load i32* %n2, align 4, !dbg !343
  %add8 = add nsw i32 %20, %21, !dbg !343
  store i32 %add8, i32* %l, align 4, !dbg !343
  %22 = load i32* %m, align 4, !dbg !344
  %mul9 = mul nsw i32 2, %22, !dbg !344
  %23 = load i16** %x.addr, align 4, !dbg !344
  %arrayidx = getelementptr inbounds i16* %23, i32 %mul9, !dbg !344
  %24 = load i32* %l, align 4, !dbg !344
  %mul10 = mul nsw i32 2, %24, !dbg !344
  %25 = load i16** %x.addr, align 4, !dbg !344
  %arrayidx11 = getelementptr inbounds i16* %25, i32 %mul10, !dbg !344
  %26 = load i32* %ia, align 4, !dbg !344
  %mul12 = mul nsw i32 2, %26, !dbg !344
  %27 = load i16** %w.addr, align 4, !dbg !344
  %arrayidx13 = getelementptr inbounds i16* %27, i32 %mul12, !dbg !344
  %call14 = call signext i16 @vmac_butterfly(i16* %arrayidx, i16* %arrayidx11, i16* %arrayidx13), !dbg !344
  %28 = load i32* %ia, align 4, !dbg !345
  %add15 = add nsw i32 %28, 64, !dbg !345
  store i32 %add15, i32* %ia, align 4, !dbg !345
  br label %for.inc, !dbg !346

for.inc:                                          ; preds = %for.body7
  %29 = load i32* %i, align 4, !dbg !347
  %add16 = add nsw i32 %29, 1, !dbg !347
  store i32 %add16, i32* %i, align 4, !dbg !347
  br label %for.cond5, !dbg !347

for.end:                                          ; preds = %for.cond5
  br label %for.inc17, !dbg !348

for.inc17:                                        ; preds = %for.end
  %30 = load i32* %n1, align 4, !dbg !349
  %31 = load i32* %j, align 4, !dbg !349
  %add18 = add nsw i32 %31, %30, !dbg !349
  store i32 %add18, i32* %j, align 4, !dbg !349
  br label %for.cond2, !dbg !349

for.end19:                                        ; preds = %for.cond2
  br label %if.end113, !dbg !350

if.else:                                          ; preds = %for.body
  %32 = load i32* %n2, align 4, !dbg !351
  %cmp20 = icmp sge i32 %32, 16, !dbg !351
  br i1 %cmp20, label %if.then21, label %if.else48, !dbg !351

if.then21:                                        ; preds = %if.else
  store i32 1, i32* %vpnum.addr.i158, align 4, !dbg !266
  call void @llvm.dbg.declare(metadata !{i32* %vpnum.addr.i158}, metadata !312), !dbg !352
  call void @llvm.dbg.declare(metadata !{i32** %vpsel.i159}, metadata !314), !dbg !353
  store i32* inttoptr (i32 8336896 to i32*), i32** %vpsel.i159, align 4, !dbg !354
  %33 = load i32* %vpnum.addr.i158, align 4, !dbg !355
  switch i32 %33, label %sw.default.i165 [
    i32 0, label %sw.bb.i160
    i32 1, label %sw.bb1.i161
    i32 2, label %sw.bb2.i162
    i32 3, label %sw.bb3.i163
    i32 4, label %sw.bb4.i164
  ], !dbg !355

sw.bb.i160:                                       ; preds = %if.then21
  %34 = load i32** %vpsel.i159, align 4, !dbg !356
  store i32 0, i32* %34, align 4, !dbg !356
  br label %sw.epilog.i166, !dbg !357

sw.bb1.i161:                                      ; preds = %if.then21
  %35 = load i32** %vpsel.i159, align 4, !dbg !358
  store i32 1, i32* %35, align 4, !dbg !358
  br label %sw.epilog.i166, !dbg !359

sw.bb2.i162:                                      ; preds = %if.then21
  %36 = load i32** %vpsel.i159, align 4, !dbg !360
  store i32 3, i32* %36, align 4, !dbg !360
  br label %sw.epilog.i166, !dbg !361

sw.bb3.i163:                                      ; preds = %if.then21
  %37 = load i32** %vpsel.i159, align 4, !dbg !362
  store i32 7, i32* %37, align 4, !dbg !362
  br label %sw.epilog.i166, !dbg !363

sw.bb4.i164:                                      ; preds = %if.then21
  %38 = load i32** %vpsel.i159, align 4, !dbg !364
  store i32 15, i32* %38, align 4, !dbg !364
  br label %sw.epilog.i166, !dbg !365

sw.default.i165:                                  ; preds = %if.then21
  store i32 -1, i32* %retval.i157, !dbg !366
  br label %set_vpsel.exit167, !dbg !366

sw.epilog.i166:                                   ; preds = %sw.bb4.i164, %sw.bb3.i163, %sw.bb2.i162, %sw.bb1.i161, %sw.bb.i160
  store i32 1, i32* %retval.i157, !dbg !367
  br label %set_vpsel.exit167, !dbg !367

set_vpsel.exit167:                                ; preds = %sw.default.i165, %sw.epilog.i166
  %39 = load i32* %retval.i157, !dbg !368
  store i32 0, i32* %j, align 4, !dbg !369
  br label %for.cond23, !dbg !369

for.cond23:                                       ; preds = %for.inc45, %set_vpsel.exit167
  %40 = load i32* %j, align 4, !dbg !369
  %41 = load i32* %nx.addr, align 4, !dbg !369
  %cmp24 = icmp slt i32 %40, %41, !dbg !369
  br i1 %cmp24, label %for.body25, label %for.end47, !dbg !369

for.body25:                                       ; preds = %for.cond23
  store i32 0, i32* %ia, align 4, !dbg !371
  call void @llvm.dbg.declare(metadata !{i32* %time26}, metadata !373), !dbg !374
  %42 = load i32* %n2, align 4, !dbg !375
  %div27 = sdiv i32 %42, 16, !dbg !375
  store i32 %div27, i32* %time26, align 4, !dbg !375
  store i32 0, i32* %i, align 4, !dbg !376
  br label %for.cond28, !dbg !376

for.cond28:                                       ; preds = %for.inc42, %for.body25
  %43 = load i32* %i, align 4, !dbg !376
  %44 = load i32* %time26, align 4, !dbg !376
  %cmp29 = icmp slt i32 %43, %44, !dbg !376
  br i1 %cmp29, label %for.body30, label %for.end44, !dbg !376

for.body30:                                       ; preds = %for.cond28
  %45 = load i32* %i, align 4, !dbg !378
  %mul31 = mul nsw i32 %45, 16, !dbg !378
  %46 = load i32* %j, align 4, !dbg !378
  %add32 = add nsw i32 %mul31, %46, !dbg !378
  store i32 %add32, i32* %m, align 4, !dbg !378
  %47 = load i32* %m, align 4, !dbg !380
  %48 = load i32* %n2, align 4, !dbg !380
  %add33 = add nsw i32 %47, %48, !dbg !380
  store i32 %add33, i32* %l, align 4, !dbg !380
  %49 = load i32* %m, align 4, !dbg !381
  %mul34 = mul nsw i32 2, %49, !dbg !381
  %50 = load i16** %x.addr, align 4, !dbg !381
  %arrayidx35 = getelementptr inbounds i16* %50, i32 %mul34, !dbg !381
  %51 = load i32* %l, align 4, !dbg !381
  %mul36 = mul nsw i32 2, %51, !dbg !381
  %52 = load i16** %x.addr, align 4, !dbg !381
  %arrayidx37 = getelementptr inbounds i16* %52, i32 %mul36, !dbg !381
  %53 = load i32* %ia, align 4, !dbg !381
  %mul38 = mul nsw i32 2, %53, !dbg !381
  %54 = load i16** %w.addr, align 4, !dbg !381
  %arrayidx39 = getelementptr inbounds i16* %54, i32 %mul38, !dbg !381
  %call40 = call signext i16 @vmac_butterfly(i16* %arrayidx35, i16* %arrayidx37, i16* %arrayidx39), !dbg !381
  %55 = load i32* %ia, align 4, !dbg !382
  %add41 = add nsw i32 %55, 16, !dbg !382
  store i32 %add41, i32* %ia, align 4, !dbg !382
  br label %for.inc42, !dbg !383

for.inc42:                                        ; preds = %for.body30
  %56 = load i32* %i, align 4, !dbg !384
  %add43 = add nsw i32 %56, 1, !dbg !384
  store i32 %add43, i32* %i, align 4, !dbg !384
  br label %for.cond28, !dbg !384

for.end44:                                        ; preds = %for.cond28
  br label %for.inc45, !dbg !385

for.inc45:                                        ; preds = %for.end44
  %57 = load i32* %n1, align 4, !dbg !386
  %58 = load i32* %j, align 4, !dbg !386
  %add46 = add nsw i32 %58, %57, !dbg !386
  store i32 %add46, i32* %j, align 4, !dbg !386
  br label %for.cond23, !dbg !386

for.end47:                                        ; preds = %for.cond23
  br label %if.end112, !dbg !387

if.else48:                                        ; preds = %if.else
  %59 = load i32* %n2, align 4, !dbg !388
  %cmp49 = icmp eq i32 %59, 8, !dbg !388
  br i1 %cmp49, label %if.then50, label %if.else64, !dbg !388

if.then50:                                        ; preds = %if.else48
  store i32 1, i32* %vpnum.addr.i213, align 4, !dbg !248
  call void @llvm.dbg.declare(metadata !{i32* %vpnum.addr.i213}, metadata !312), !dbg !389
  call void @llvm.dbg.declare(metadata !{i32** %vpsel.i214}, metadata !314), !dbg !390
  store i32* inttoptr (i32 8336896 to i32*), i32** %vpsel.i214, align 4, !dbg !391
  %60 = load i32* %vpnum.addr.i213, align 4, !dbg !392
  switch i32 %60, label %sw.default.i220 [
    i32 0, label %sw.bb.i215
    i32 1, label %sw.bb1.i216
    i32 2, label %sw.bb2.i217
    i32 3, label %sw.bb3.i218
    i32 4, label %sw.bb4.i219
  ], !dbg !392

sw.bb.i215:                                       ; preds = %if.then50
  %61 = load i32** %vpsel.i214, align 4, !dbg !393
  store i32 0, i32* %61, align 4, !dbg !393
  br label %sw.epilog.i221, !dbg !394

sw.bb1.i216:                                      ; preds = %if.then50
  %62 = load i32** %vpsel.i214, align 4, !dbg !395
  store i32 1, i32* %62, align 4, !dbg !395
  br label %sw.epilog.i221, !dbg !396

sw.bb2.i217:                                      ; preds = %if.then50
  %63 = load i32** %vpsel.i214, align 4, !dbg !397
  store i32 3, i32* %63, align 4, !dbg !397
  br label %sw.epilog.i221, !dbg !398

sw.bb3.i218:                                      ; preds = %if.then50
  %64 = load i32** %vpsel.i214, align 4, !dbg !399
  store i32 7, i32* %64, align 4, !dbg !399
  br label %sw.epilog.i221, !dbg !400

sw.bb4.i219:                                      ; preds = %if.then50
  %65 = load i32** %vpsel.i214, align 4, !dbg !401
  store i32 15, i32* %65, align 4, !dbg !401
  br label %sw.epilog.i221, !dbg !402

sw.default.i220:                                  ; preds = %if.then50
  store i32 -1, i32* %retval.i212, !dbg !403
  br label %set_vpsel.exit222, !dbg !403

sw.epilog.i221:                                   ; preds = %sw.bb4.i219, %sw.bb3.i218, %sw.bb2.i217, %sw.bb1.i216, %sw.bb.i215
  store i32 1, i32* %retval.i212, !dbg !404
  br label %set_vpsel.exit222, !dbg !404

set_vpsel.exit222:                                ; preds = %sw.default.i220, %sw.epilog.i221
  %66 = load i32* %retval.i212, !dbg !405
  store i32 0, i32* %j, align 4, !dbg !406
  br label %for.cond52, !dbg !406

for.cond52:                                       ; preds = %for.inc61, %set_vpsel.exit222
  %67 = load i32* %j, align 4, !dbg !406
  %68 = load i32* %nx.addr, align 4, !dbg !406
  %cmp53 = icmp slt i32 %67, %68, !dbg !406
  br i1 %cmp53, label %for.body54, label %for.end63, !dbg !406

for.body54:                                       ; preds = %for.cond52
  %69 = load i32* %j, align 4, !dbg !408
  %add55 = add nsw i32 %69, 16, !dbg !408
  store i32 %add55, i32* %l, align 4, !dbg !408
  %70 = load i32* %j, align 4, !dbg !410
  %mul56 = mul nsw i32 2, %70, !dbg !410
  %71 = load i16** %x.addr, align 4, !dbg !410
  %arrayidx57 = getelementptr inbounds i16* %71, i32 %mul56, !dbg !410
  %72 = load i32* %l, align 4, !dbg !410
  %mul58 = mul nsw i32 2, %72, !dbg !410
  %73 = load i16** %x.addr, align 4, !dbg !410
  %arrayidx59 = getelementptr inbounds i16* %73, i32 %mul58, !dbg !410
  %74 = load i16** %w.addr, align 4, !dbg !410
  %call60 = call signext i16 @vmac_shuffle(i16* %arrayidx57, i16* %arrayidx59, i16* %74, i16* getelementptr inbounds ([128 x i16]* @idx_8, i32 0, i32 0), i16* getelementptr inbounds ([128 x i16]* @idx_8, i32 0, i32 32), i16* getelementptr inbounds ([128 x i16]* @idx_8, i32 0, i32 64), i16* getelementptr inbounds ([128 x i16]* @idx_8, i32 0, i32 96)), !dbg !410
  br label %for.inc61, !dbg !411

for.inc61:                                        ; preds = %for.body54
  %75 = load i32* %j, align 4, !dbg !412
  %add62 = add nsw i32 %75, 32, !dbg !412
  store i32 %add62, i32* %j, align 4, !dbg !412
  br label %for.cond52, !dbg !412

for.end63:                                        ; preds = %for.cond52
  br label %if.end111, !dbg !413

if.else64:                                        ; preds = %if.else48
  %76 = load i32* %n2, align 4, !dbg !414
  %cmp65 = icmp eq i32 %76, 4, !dbg !414
  br i1 %cmp65, label %if.then66, label %if.else80, !dbg !414

if.then66:                                        ; preds = %if.else64
  store i32 1, i32* %vpnum.addr.i202, align 4, !dbg !255
  call void @llvm.dbg.declare(metadata !{i32* %vpnum.addr.i202}, metadata !312), !dbg !415
  call void @llvm.dbg.declare(metadata !{i32** %vpsel.i203}, metadata !314), !dbg !416
  store i32* inttoptr (i32 8336896 to i32*), i32** %vpsel.i203, align 4, !dbg !417
  %77 = load i32* %vpnum.addr.i202, align 4, !dbg !418
  switch i32 %77, label %sw.default.i209 [
    i32 0, label %sw.bb.i204
    i32 1, label %sw.bb1.i205
    i32 2, label %sw.bb2.i206
    i32 3, label %sw.bb3.i207
    i32 4, label %sw.bb4.i208
  ], !dbg !418

sw.bb.i204:                                       ; preds = %if.then66
  %78 = load i32** %vpsel.i203, align 4, !dbg !419
  store i32 0, i32* %78, align 4, !dbg !419
  br label %sw.epilog.i210, !dbg !420

sw.bb1.i205:                                      ; preds = %if.then66
  %79 = load i32** %vpsel.i203, align 4, !dbg !421
  store i32 1, i32* %79, align 4, !dbg !421
  br label %sw.epilog.i210, !dbg !422

sw.bb2.i206:                                      ; preds = %if.then66
  %80 = load i32** %vpsel.i203, align 4, !dbg !423
  store i32 3, i32* %80, align 4, !dbg !423
  br label %sw.epilog.i210, !dbg !424

sw.bb3.i207:                                      ; preds = %if.then66
  %81 = load i32** %vpsel.i203, align 4, !dbg !425
  store i32 7, i32* %81, align 4, !dbg !425
  br label %sw.epilog.i210, !dbg !426

sw.bb4.i208:                                      ; preds = %if.then66
  %82 = load i32** %vpsel.i203, align 4, !dbg !427
  store i32 15, i32* %82, align 4, !dbg !427
  br label %sw.epilog.i210, !dbg !428

sw.default.i209:                                  ; preds = %if.then66
  store i32 -1, i32* %retval.i201, !dbg !429
  br label %set_vpsel.exit211, !dbg !429

sw.epilog.i210:                                   ; preds = %sw.bb4.i208, %sw.bb3.i207, %sw.bb2.i206, %sw.bb1.i205, %sw.bb.i204
  store i32 1, i32* %retval.i201, !dbg !430
  br label %set_vpsel.exit211, !dbg !430

set_vpsel.exit211:                                ; preds = %sw.default.i209, %sw.epilog.i210
  %83 = load i32* %retval.i201, !dbg !431
  store i32 0, i32* %j, align 4, !dbg !432
  br label %for.cond68, !dbg !432

for.cond68:                                       ; preds = %for.inc77, %set_vpsel.exit211
  %84 = load i32* %j, align 4, !dbg !432
  %85 = load i32* %nx.addr, align 4, !dbg !432
  %cmp69 = icmp slt i32 %84, %85, !dbg !432
  br i1 %cmp69, label %for.body70, label %for.end79, !dbg !432

for.body70:                                       ; preds = %for.cond68
  %86 = load i32* %j, align 4, !dbg !434
  %add71 = add nsw i32 %86, 16, !dbg !434
  store i32 %add71, i32* %l, align 4, !dbg !434
  %87 = load i32* %j, align 4, !dbg !436
  %mul72 = mul nsw i32 2, %87, !dbg !436
  %88 = load i16** %x.addr, align 4, !dbg !436
  %arrayidx73 = getelementptr inbounds i16* %88, i32 %mul72, !dbg !436
  %89 = load i32* %l, align 4, !dbg !436
  %mul74 = mul nsw i32 2, %89, !dbg !436
  %90 = load i16** %x.addr, align 4, !dbg !436
  %arrayidx75 = getelementptr inbounds i16* %90, i32 %mul74, !dbg !436
  %91 = load i16** %w.addr, align 4, !dbg !436
  %call76 = call signext i16 @vmac_shuffle(i16* %arrayidx73, i16* %arrayidx75, i16* %91, i16* getelementptr inbounds ([128 x i16]* @idx_4, i32 0, i32 0), i16* getelementptr inbounds ([128 x i16]* @idx_4, i32 0, i32 32), i16* getelementptr inbounds ([128 x i16]* @idx_4, i32 0, i32 64), i16* getelementptr inbounds ([128 x i16]* @idx_4, i32 0, i32 96)), !dbg !436
  br label %for.inc77, !dbg !437

for.inc77:                                        ; preds = %for.body70
  %92 = load i32* %j, align 4, !dbg !438
  %add78 = add nsw i32 %92, 32, !dbg !438
  store i32 %add78, i32* %j, align 4, !dbg !438
  br label %for.cond68, !dbg !438

for.end79:                                        ; preds = %for.cond68
  br label %if.end110, !dbg !439

if.else80:                                        ; preds = %if.else64
  %93 = load i32* %n2, align 4, !dbg !440
  %cmp81 = icmp eq i32 %93, 2, !dbg !440
  br i1 %cmp81, label %if.then82, label %if.else96, !dbg !440

if.then82:                                        ; preds = %if.else80
  store i32 1, i32* %vpnum.addr.i191, align 4, !dbg !258
  call void @llvm.dbg.declare(metadata !{i32* %vpnum.addr.i191}, metadata !312), !dbg !441
  call void @llvm.dbg.declare(metadata !{i32** %vpsel.i192}, metadata !314), !dbg !442
  store i32* inttoptr (i32 8336896 to i32*), i32** %vpsel.i192, align 4, !dbg !443
  %94 = load i32* %vpnum.addr.i191, align 4, !dbg !444
  switch i32 %94, label %sw.default.i198 [
    i32 0, label %sw.bb.i193
    i32 1, label %sw.bb1.i194
    i32 2, label %sw.bb2.i195
    i32 3, label %sw.bb3.i196
    i32 4, label %sw.bb4.i197
  ], !dbg !444

sw.bb.i193:                                       ; preds = %if.then82
  %95 = load i32** %vpsel.i192, align 4, !dbg !445
  store i32 0, i32* %95, align 4, !dbg !445
  br label %sw.epilog.i199, !dbg !446

sw.bb1.i194:                                      ; preds = %if.then82
  %96 = load i32** %vpsel.i192, align 4, !dbg !447
  store i32 1, i32* %96, align 4, !dbg !447
  br label %sw.epilog.i199, !dbg !448

sw.bb2.i195:                                      ; preds = %if.then82
  %97 = load i32** %vpsel.i192, align 4, !dbg !449
  store i32 3, i32* %97, align 4, !dbg !449
  br label %sw.epilog.i199, !dbg !450

sw.bb3.i196:                                      ; preds = %if.then82
  %98 = load i32** %vpsel.i192, align 4, !dbg !451
  store i32 7, i32* %98, align 4, !dbg !451
  br label %sw.epilog.i199, !dbg !452

sw.bb4.i197:                                      ; preds = %if.then82
  %99 = load i32** %vpsel.i192, align 4, !dbg !453
  store i32 15, i32* %99, align 4, !dbg !453
  br label %sw.epilog.i199, !dbg !454

sw.default.i198:                                  ; preds = %if.then82
  store i32 -1, i32* %retval.i190, !dbg !455
  br label %set_vpsel.exit200, !dbg !455

sw.epilog.i199:                                   ; preds = %sw.bb4.i197, %sw.bb3.i196, %sw.bb2.i195, %sw.bb1.i194, %sw.bb.i193
  store i32 1, i32* %retval.i190, !dbg !456
  br label %set_vpsel.exit200, !dbg !456

set_vpsel.exit200:                                ; preds = %sw.default.i198, %sw.epilog.i199
  %100 = load i32* %retval.i190, !dbg !457
  store i32 0, i32* %j, align 4, !dbg !458
  br label %for.cond84, !dbg !458

for.cond84:                                       ; preds = %for.inc93, %set_vpsel.exit200
  %101 = load i32* %j, align 4, !dbg !458
  %102 = load i32* %nx.addr, align 4, !dbg !458
  %cmp85 = icmp slt i32 %101, %102, !dbg !458
  br i1 %cmp85, label %for.body86, label %for.end95, !dbg !458

for.body86:                                       ; preds = %for.cond84
  %103 = load i32* %j, align 4, !dbg !460
  %add87 = add nsw i32 %103, 16, !dbg !460
  store i32 %add87, i32* %l, align 4, !dbg !460
  %104 = load i32* %j, align 4, !dbg !462
  %mul88 = mul nsw i32 2, %104, !dbg !462
  %105 = load i16** %x.addr, align 4, !dbg !462
  %arrayidx89 = getelementptr inbounds i16* %105, i32 %mul88, !dbg !462
  %106 = load i32* %l, align 4, !dbg !462
  %mul90 = mul nsw i32 2, %106, !dbg !462
  %107 = load i16** %x.addr, align 4, !dbg !462
  %arrayidx91 = getelementptr inbounds i16* %107, i32 %mul90, !dbg !462
  %108 = load i16** %w.addr, align 4, !dbg !462
  %call92 = call signext i16 @vmac_shuffle(i16* %arrayidx89, i16* %arrayidx91, i16* %108, i16* getelementptr inbounds ([128 x i16]* @idx_2, i32 0, i32 0), i16* getelementptr inbounds ([128 x i16]* @idx_2, i32 0, i32 32), i16* getelementptr inbounds ([128 x i16]* @idx_2, i32 0, i32 64), i16* getelementptr inbounds ([128 x i16]* @idx_2, i32 0, i32 96)), !dbg !462
  br label %for.inc93, !dbg !463

for.inc93:                                        ; preds = %for.body86
  %109 = load i32* %j, align 4, !dbg !464
  %add94 = add nsw i32 %109, 32, !dbg !464
  store i32 %add94, i32* %j, align 4, !dbg !464
  br label %for.cond84, !dbg !464

for.end95:                                        ; preds = %for.cond84
  br label %if.end, !dbg !465

if.else96:                                        ; preds = %if.else80
  store i32 1, i32* %vpnum.addr.i180, align 4, !dbg !261
  call void @llvm.dbg.declare(metadata !{i32* %vpnum.addr.i180}, metadata !312), !dbg !466
  call void @llvm.dbg.declare(metadata !{i32** %vpsel.i181}, metadata !314), !dbg !467
  store i32* inttoptr (i32 8336896 to i32*), i32** %vpsel.i181, align 4, !dbg !468
  %110 = load i32* %vpnum.addr.i180, align 4, !dbg !469
  switch i32 %110, label %sw.default.i187 [
    i32 0, label %sw.bb.i182
    i32 1, label %sw.bb1.i183
    i32 2, label %sw.bb2.i184
    i32 3, label %sw.bb3.i185
    i32 4, label %sw.bb4.i186
  ], !dbg !469

sw.bb.i182:                                       ; preds = %if.else96
  %111 = load i32** %vpsel.i181, align 4, !dbg !470
  store i32 0, i32* %111, align 4, !dbg !470
  br label %sw.epilog.i188, !dbg !471

sw.bb1.i183:                                      ; preds = %if.else96
  %112 = load i32** %vpsel.i181, align 4, !dbg !472
  store i32 1, i32* %112, align 4, !dbg !472
  br label %sw.epilog.i188, !dbg !473

sw.bb2.i184:                                      ; preds = %if.else96
  %113 = load i32** %vpsel.i181, align 4, !dbg !474
  store i32 3, i32* %113, align 4, !dbg !474
  br label %sw.epilog.i188, !dbg !475

sw.bb3.i185:                                      ; preds = %if.else96
  %114 = load i32** %vpsel.i181, align 4, !dbg !476
  store i32 7, i32* %114, align 4, !dbg !476
  br label %sw.epilog.i188, !dbg !477

sw.bb4.i186:                                      ; preds = %if.else96
  %115 = load i32** %vpsel.i181, align 4, !dbg !478
  store i32 15, i32* %115, align 4, !dbg !478
  br label %sw.epilog.i188, !dbg !479

sw.default.i187:                                  ; preds = %if.else96
  store i32 -1, i32* %retval.i179, !dbg !480
  br label %set_vpsel.exit189, !dbg !480

sw.epilog.i188:                                   ; preds = %sw.bb4.i186, %sw.bb3.i185, %sw.bb2.i184, %sw.bb1.i183, %sw.bb.i182
  store i32 1, i32* %retval.i179, !dbg !481
  br label %set_vpsel.exit189, !dbg !481

set_vpsel.exit189:                                ; preds = %sw.default.i187, %sw.epilog.i188
  %116 = load i32* %retval.i179, !dbg !482
  store i32 0, i32* %j, align 4, !dbg !483
  br label %for.cond98, !dbg !483

for.cond98:                                       ; preds = %for.inc107, %set_vpsel.exit189
  %117 = load i32* %j, align 4, !dbg !483
  %118 = load i32* %nx.addr, align 4, !dbg !483
  %cmp99 = icmp slt i32 %117, %118, !dbg !483
  br i1 %cmp99, label %for.body100, label %for.end109, !dbg !483

for.body100:                                      ; preds = %for.cond98
  %119 = load i32* %j, align 4, !dbg !485
  %add101 = add nsw i32 %119, 16, !dbg !485
  store i32 %add101, i32* %l, align 4, !dbg !485
  %120 = load i32* %j, align 4, !dbg !487
  %mul102 = mul nsw i32 2, %120, !dbg !487
  %121 = load i16** %x.addr, align 4, !dbg !487
  %arrayidx103 = getelementptr inbounds i16* %121, i32 %mul102, !dbg !487
  %122 = load i32* %l, align 4, !dbg !487
  %mul104 = mul nsw i32 2, %122, !dbg !487
  %123 = load i16** %x.addr, align 4, !dbg !487
  %arrayidx105 = getelementptr inbounds i16* %123, i32 %mul104, !dbg !487
  %124 = load i16** %w.addr, align 4, !dbg !487
  %call106 = call signext i16 @vmac_shuffle(i16* %arrayidx103, i16* %arrayidx105, i16* %124, i16* getelementptr inbounds ([128 x i16]* @idx_1, i32 0, i32 0), i16* getelementptr inbounds ([128 x i16]* @idx_1, i32 0, i32 32), i16* getelementptr inbounds ([128 x i16]* @idx_1, i32 0, i32 64), i16* getelementptr inbounds ([128 x i16]* @idx_1, i32 0, i32 96)), !dbg !487
  br label %for.inc107, !dbg !488

for.inc107:                                       ; preds = %for.body100
  %125 = load i32* %j, align 4, !dbg !489
  %add108 = add nsw i32 %125, 32, !dbg !489
  store i32 %add108, i32* %j, align 4, !dbg !489
  br label %for.cond98, !dbg !489

for.end109:                                       ; preds = %for.cond98
  br label %if.end

if.end:                                           ; preds = %for.end109, %for.end95
  br label %if.end110

if.end110:                                        ; preds = %if.end, %for.end79
  br label %if.end111

if.end111:                                        ; preds = %if.end110, %for.end63
  br label %if.end112

if.end112:                                        ; preds = %if.end111, %for.end47
  br label %if.end113

if.end113:                                        ; preds = %if.end112, %for.end19
  %126 = load i32* %n2, align 4, !dbg !490
  %cmp114 = icmp sge i32 %126, 16, !dbg !490
  br i1 %cmp114, label %if.then115, label %if.else128, !dbg !490

if.then115:                                       ; preds = %if.end113
  call void @llvm.dbg.declare(metadata !{i32* %step}, metadata !491), !dbg !492
  store i32 0, i32* %step, align 4, !dbg !493
  store i32 1, i32* %vpnum.addr.i169, align 4, !dbg !263
  call void @llvm.dbg.declare(metadata !{i32* %vpnum.addr.i169}, metadata !312), !dbg !494
  call void @llvm.dbg.declare(metadata !{i32** %vpsel.i170}, metadata !314), !dbg !495
  store i32* inttoptr (i32 8336896 to i32*), i32** %vpsel.i170, align 4, !dbg !496
  %127 = load i32* %vpnum.addr.i169, align 4, !dbg !497
  switch i32 %127, label %sw.default.i176 [
    i32 0, label %sw.bb.i171
    i32 1, label %sw.bb1.i172
    i32 2, label %sw.bb2.i173
    i32 3, label %sw.bb3.i174
    i32 4, label %sw.bb4.i175
  ], !dbg !497

sw.bb.i171:                                       ; preds = %if.then115
  %128 = load i32** %vpsel.i170, align 4, !dbg !498
  store i32 0, i32* %128, align 4, !dbg !498
  br label %sw.epilog.i177, !dbg !499

sw.bb1.i172:                                      ; preds = %if.then115
  %129 = load i32** %vpsel.i170, align 4, !dbg !500
  store i32 1, i32* %129, align 4, !dbg !500
  br label %sw.epilog.i177, !dbg !501

sw.bb2.i173:                                      ; preds = %if.then115
  %130 = load i32** %vpsel.i170, align 4, !dbg !502
  store i32 3, i32* %130, align 4, !dbg !502
  br label %sw.epilog.i177, !dbg !503

sw.bb3.i174:                                      ; preds = %if.then115
  %131 = load i32** %vpsel.i170, align 4, !dbg !504
  store i32 7, i32* %131, align 4, !dbg !504
  br label %sw.epilog.i177, !dbg !505

sw.bb4.i175:                                      ; preds = %if.then115
  %132 = load i32** %vpsel.i170, align 4, !dbg !506
  store i32 15, i32* %132, align 4, !dbg !506
  br label %sw.epilog.i177, !dbg !507

sw.default.i176:                                  ; preds = %if.then115
  store i32 -1, i32* %retval.i168, !dbg !508
  br label %set_vpsel.exit178, !dbg !508

sw.epilog.i177:                                   ; preds = %sw.bb4.i175, %sw.bb3.i174, %sw.bb2.i173, %sw.bb1.i172, %sw.bb.i171
  store i32 1, i32* %retval.i168, !dbg !509
  br label %set_vpsel.exit178, !dbg !509

set_vpsel.exit178:                                ; preds = %sw.default.i176, %sw.epilog.i177
  %133 = load i32* %retval.i168, !dbg !510
  call void @llvm.dbg.declare(metadata !{i32* %p}, metadata !511), !dbg !513
  store i32 0, i32* %p, align 4, !dbg !514
  br label %for.cond117, !dbg !514

for.cond117:                                      ; preds = %for.inc125, %set_vpsel.exit178
  %134 = load i32* %p, align 4, !dbg !514
  %135 = load i32* %n2, align 4, !dbg !514
  %cmp118 = icmp slt i32 %134, %135, !dbg !514
  br i1 %cmp118, label %for.body119, label %for.end127, !dbg !514

for.body119:                                      ; preds = %for.cond117
  %136 = load i32* %p, align 4, !dbg !515
  %mul120 = mul nsw i32 %136, 2, !dbg !515
  %arrayidx121 = getelementptr inbounds [256 x i16]* @f, i32 0, i32 %mul120, !dbg !515
  %137 = load i32* %step, align 4, !dbg !515
  %arrayidx122 = getelementptr inbounds [256 x i16]* @f, i32 0, i32 %137, !dbg !515
  %call123 = call signext i16 @vmac_rotation_factor(i16* %arrayidx121, i16* %arrayidx122, i16* getelementptr inbounds ([32 x i16]* @idx, i32 0, i32 0)), !dbg !515
  %138 = load i32* %step, align 4, !dbg !517
  %add124 = add nsw i32 %138, 16, !dbg !517
  store i32 %add124, i32* %step, align 4, !dbg !517
  br label %for.inc125, !dbg !518

for.inc125:                                       ; preds = %for.body119
  %139 = load i32* %p, align 4, !dbg !519
  %add126 = add nsw i32 %139, 16, !dbg !519
  store i32 %add126, i32* %p, align 4, !dbg !519
  br label %for.cond117, !dbg !519

for.end127:                                       ; preds = %for.cond117
  br label %if.end144, !dbg !520

if.else128:                                       ; preds = %if.end113
  call void @llvm.dbg.declare(metadata !{i32* %p129}, metadata !521), !dbg !524
  store i32 0, i32* %p129, align 4, !dbg !525
  br label %for.cond130, !dbg !525

for.cond130:                                      ; preds = %for.inc141, %if.else128
  %140 = load i32* %p129, align 4, !dbg !525
  %141 = load i32* %n2, align 4, !dbg !525
  %cmp131 = icmp slt i32 %140, %141, !dbg !525
  br i1 %cmp131, label %for.body132, label %for.end143, !dbg !525

for.body132:                                      ; preds = %for.cond130
  %142 = load i32* %p129, align 4, !dbg !526
  %mul133 = mul nsw i32 2, %142, !dbg !526
  %143 = load i16** %w.addr, align 4, !dbg !526
  %arrayidx134 = getelementptr inbounds i16* %143, i32 %mul133, !dbg !526
  %144 = load i16* %arrayidx134, align 2, !dbg !526
  %145 = load i32* %p129, align 4, !dbg !526
  %146 = load i16** %w.addr, align 4, !dbg !526
  %arrayidx135 = getelementptr inbounds i16* %146, i32 %145, !dbg !526
  store i16 %144, i16* %arrayidx135, align 2, !dbg !526
  %147 = load i32* %p129, align 4, !dbg !528
  %mul136 = mul nsw i32 2, %147, !dbg !528
  %add137 = add nsw i32 %mul136, 1, !dbg !528
  %148 = load i16** %w.addr, align 4, !dbg !528
  %arrayidx138 = getelementptr inbounds i16* %148, i32 %add137, !dbg !528
  %149 = load i16* %arrayidx138, align 2, !dbg !528
  %150 = load i32* %p129, align 4, !dbg !528
  %add139 = add nsw i32 %150, 1, !dbg !528
  %151 = load i16** %w.addr, align 4, !dbg !528
  %arrayidx140 = getelementptr inbounds i16* %151, i32 %add139, !dbg !528
  store i16 %149, i16* %arrayidx140, align 2, !dbg !528
  br label %for.inc141, !dbg !529

for.inc141:                                       ; preds = %for.body132
  %152 = load i32* %p129, align 4, !dbg !530
  %add142 = add nsw i32 %152, 2, !dbg !530
  store i32 %add142, i32* %p129, align 4, !dbg !530
  br label %for.cond130, !dbg !530

for.end143:                                       ; preds = %for.cond130
  br label %if.end144

if.end144:                                        ; preds = %for.end143, %for.end127
  call void @llvm.dbg.declare(metadata !{i32* %j145}, metadata !531), !dbg !533
  store i32 0, i32* %j145, align 4, !dbg !534
  br label %for.cond146, !dbg !534

for.cond146:                                      ; preds = %for.inc152, %if.end144
  %153 = load i32* %j145, align 4, !dbg !534
  %cmp147 = icmp slt i32 %153, 512, !dbg !534
  br i1 %cmp147, label %for.body148, label %for.end153, !dbg !534

for.body148:                                      ; preds = %for.cond146
  %154 = load i32* %j145, align 4, !dbg !535
  %arrayidx149 = getelementptr inbounds [512 x i16]* @data, i32 0, i32 %154, !dbg !535
  %155 = load i16* %arrayidx149, align 2, !dbg !535
  %conv = sext i16 %155 to i32, !dbg !535
  %shr150 = ashr i32 %conv, 1, !dbg !535
  %conv151 = trunc i32 %shr150 to i16, !dbg !535
  store i16 %conv151, i16* %arrayidx149, align 2, !dbg !535
  br label %for.inc152, !dbg !537

for.inc152:                                       ; preds = %for.body148
  %156 = load i32* %j145, align 4, !dbg !538
  %inc = add nsw i32 %156, 1, !dbg !538
  store i32 %inc, i32* %j145, align 4, !dbg !538
  br label %for.cond146, !dbg !538

for.end153:                                       ; preds = %for.cond146
  store i16 0, i16* @e_num, align 2, !dbg !539
  br label %for.inc154, !dbg !540

for.inc154:                                       ; preds = %for.end153
  %157 = load i32* %k, align 4, !dbg !541
  %shr155 = ashr i32 %157, 1, !dbg !541
  store i32 %shr155, i32* %k, align 4, !dbg !541
  br label %for.cond, !dbg !541

for.end156:                                       ; preds = %for.cond
  %158 = load i32* %nx.addr, align 4, !dbg !542
  %159 = load i16** %x.addr, align 4, !dbg !542
  call void @bit_reverse(i32 %158, i16* %159), !dbg !542
  ret void, !dbg !543
}

declare signext i16 @vmac_butterfly(i16*, i16*, i16*) #3

declare signext i16 @vmac_shuffle(i16*, i16*, i16*, i16*, i16*, i16*, i16*) #3

declare signext i16 @vmac_rotation_factor(i16*, i16*, i16*) #3

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %ndata = alloca i32, align 4
  store i32 0, i32* %retval
  call void @llvm.dbg.declare(metadata !{i32* %ndata}, metadata !544), !dbg !545
  store i32 256, i32* %ndata, align 4, !dbg !546
  %0 = load i32* %ndata, align 4, !dbg !547
  call void @fft_16x16(i16* getelementptr inbounds ([512 x i16]* @data, i32 0, i32 0), i16* getelementptr inbounds ([256 x i16]* @f, i32 0, i32 0), i32 %0), !dbg !547
  %call = call i32 @dbg_output(i8* bitcast ([512 x i16]* @data to i8*), i32 512, i32 2), !dbg !548
  ret i32 0, !dbg !549
}

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!65, !66}
!llvm.ident = !{!67}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.0 (tags/RELEASE_350/final)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !38, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c] [DW_LANG_C99]
!1 = metadata !{metadata !"..\5Cfft_16x16.c", metadata !"D:\5Ceclipse\5Cworkspace\5Cfft_16x16\5CRelease"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !11, metadata !16, metadata !19, metadata !23, metadata !24, metadata !27, metadata !30, metadata !33}
!4 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"dbg_output", metadata !"dbg_output", metadata !"", i32 12, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i8*, i32, i32)* @dbg_output, null, null, metadata !2, i32 12} ; [ DW_TAG_subprogram ] [line 12] [def] [dbg_output]
!5 = metadata !{metadata !"D:\5CCIC\5CSwift_IDE_Toolchain\5Ctoolchain_8slot\5Cinclude\5Cswift_debug.h", metadata !"D:\5Ceclipse\5Cworkspace\5Cfft_16x16\5CRelease"}
!6 = metadata !{i32 786473, metadata !5}          ; [ DW_TAG_file_type ] [D:\eclipse\workspace\fft_16x16\Release/D:\CIC\Swift_IDE_Toolchain\toolchain_8slot\include\swift_debug.h]
!7 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{metadata !9, metadata !10, metadata !9, metadata !9}
!9 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 32, i64 32, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 32, align 32, offset 0] [from ]
!11 = metadata !{i32 786478, metadata !1, metadata !12, metadata !"abs_q", metadata !"abs_q", metadata !"", i32 25, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i16 (i16)* @abs_q, null, null, metadata !2, i32 25} ; [ DW_TAG_subprogram ] [line 25] [def] [abs_q]
!12 = metadata !{i32 786473, metadata !1}         ; [ DW_TAG_file_type ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{metadata !15, metadata !15}
!15 = metadata !{i32 786468, null, null, metadata !"short", i32 0, i64 16, i64 16, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [short] [line 0, size 16, align 16, offset 0, enc DW_ATE_signed]
!16 = metadata !{i32 786478, metadata !1, metadata !12, metadata !"max_q", metadata !"max_q", metadata !"", i32 33, metadata !17, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i16 (i16, i16)* @max_q, null, null, metadata !2, i32 33} ; [ DW_TAG_subprogram ] [line 33] [def] [max_q]
!17 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !18, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!18 = metadata !{metadata !15, metadata !15, metadata !15}
!19 = metadata !{i32 786478, metadata !1, metadata !12, metadata !"DSP_minval", metadata !"DSP_minval", metadata !"", i32 40, metadata !20, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i16 (i16*, i32)* @DSP_minval, null, null, metadata !2, i32 41} ; [ DW_TAG_subprogram ] [line 40] [def] [scope 41] [DSP_minval]
!20 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !21, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!21 = metadata !{metadata !15, metadata !22, metadata !9}
!22 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 32, i64 32, i64 0, i32 0, metadata !15} ; [ DW_TAG_pointer_type ] [line 0, size 32, align 32, offset 0] [from short]
!23 = metadata !{i32 786478, metadata !1, metadata !12, metadata !"DSP_maxval", metadata !"DSP_maxval", metadata !"", i32 62, metadata !20, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i16 (i16*, i32)* @DSP_maxval, null, null, metadata !2, i32 62} ; [ DW_TAG_subprogram ] [line 62] [def] [DSP_maxval]
!24 = metadata !{i32 786478, metadata !1, metadata !12, metadata !"bit_reverse", metadata !"bit_reverse", metadata !"", i32 99, metadata !25, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32, i16*)* @bit_reverse, null, null, metadata !2, i32 102} ; [ DW_TAG_subprogram ] [line 99] [def] [scope 102] [bit_reverse]
!25 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !26, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!26 = metadata !{null, metadata !9, metadata !22}
!27 = metadata !{i32 786478, metadata !1, metadata !12, metadata !"fft_16x16", metadata !"fft_16x16", metadata !"", i32 116, metadata !28, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i16*, i16*, i32)* @fft_16x16, null, null, metadata !2, i32 116} ; [ DW_TAG_subprogram ] [line 116] [def] [fft_16x16]
!28 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !29, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!29 = metadata !{null, metadata !22, metadata !22, metadata !9}
!30 = metadata !{i32 786478, metadata !1, metadata !12, metadata !"main", metadata !"main", metadata !"", i32 217, metadata !31, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 217} ; [ DW_TAG_subprogram ] [line 217] [def] [main]
!31 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !32, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!32 = metadata !{metadata !9}
!33 = metadata !{i32 786478, metadata !34, metadata !35, metadata !"set_vpsel", metadata !"set_vpsel", metadata !"", i32 13, metadata !36, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !2, i32 13} ; [ DW_TAG_subprogram ] [line 13] [def] [set_vpsel]
!34 = metadata !{metadata !"D:\5CCIC\5CSwift_IDE_Toolchain\5Ctoolchain_8slot\5Cinclude\5Cswift_math.h", metadata !"D:\5Ceclipse\5Cworkspace\5Cfft_16x16\5CRelease"}
!35 = metadata !{i32 786473, metadata !34}        ; [ DW_TAG_file_type ] [D:\eclipse\workspace\fft_16x16\Release/D:\CIC\Swift_IDE_Toolchain\toolchain_8slot\include\swift_math.h]
!36 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !37, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!37 = metadata !{metadata !9, metadata !9}
!38 = metadata !{metadata !39, metadata !43, metadata !47, metadata !51, metadata !55, metadata !56, metadata !57, metadata !58, metadata !62, metadata !63, metadata !64}
!39 = metadata !{i32 786484, i32 0, null, metadata !"dbg_addr", metadata !"dbg_addr", metadata !"", metadata !6, i32 4, metadata !40, i32 0, i32 1, i32** @dbg_addr, null} ; [ DW_TAG_variable ] [dbg_addr] [line 4] [def]
!40 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !41} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!41 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 32, i64 32, i64 0, i32 0, metadata !42} ; [ DW_TAG_pointer_type ] [line 0, size 32, align 32, offset 0] [from unsigned int]
!42 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!43 = metadata !{i32 786484, i32 0, null, metadata !"data", metadata !"data", metadata !"", metadata !12, i32 8, metadata !44, i32 0, i32 1, [512 x i16]* @data, null} ; [ DW_TAG_variable ] [data] [line 8] [def]
!44 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 8192, i64 16, i32 0, i32 0, metadata !15, metadata !45, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 8192, align 16, offset 0] [from short]
!45 = metadata !{metadata !46}
!46 = metadata !{i32 786465, i64 0, i64 512}      ; [ DW_TAG_subrange_type ] [0, 511]
!47 = metadata !{i32 786484, i32 0, null, metadata !"f", metadata !"f", metadata !"", metadata !12, i32 9, metadata !48, i32 0, i32 1, [256 x i16]* @f, null} ; [ DW_TAG_variable ] [f] [line 9] [def]
!48 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 4096, i64 16, i32 0, i32 0, metadata !15, metadata !49, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 4096, align 16, offset 0] [from short]
!49 = metadata !{metadata !50}
!50 = metadata !{i32 786465, i64 0, i64 256}      ; [ DW_TAG_subrange_type ] [0, 255]
!51 = metadata !{i32 786484, i32 0, null, metadata !"idx_8", metadata !"idx_8", metadata !"", metadata !12, i32 10, metadata !52, i32 0, i32 1, [128 x i16]* @idx_8, null} ; [ DW_TAG_variable ] [idx_8] [line 10] [def]
!52 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 2048, i64 16, i32 0, i32 0, metadata !15, metadata !53, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 2048, align 16, offset 0] [from short]
!53 = metadata !{metadata !54}
!54 = metadata !{i32 786465, i64 0, i64 128}      ; [ DW_TAG_subrange_type ] [0, 127]
!55 = metadata !{i32 786484, i32 0, null, metadata !"idx_4", metadata !"idx_4", metadata !"", metadata !12, i32 11, metadata !52, i32 0, i32 1, [128 x i16]* @idx_4, null} ; [ DW_TAG_variable ] [idx_4] [line 11] [def]
!56 = metadata !{i32 786484, i32 0, null, metadata !"idx_2", metadata !"idx_2", metadata !"", metadata !12, i32 12, metadata !52, i32 0, i32 1, [128 x i16]* @idx_2, null} ; [ DW_TAG_variable ] [idx_2] [line 12] [def]
!57 = metadata !{i32 786484, i32 0, null, metadata !"idx_1", metadata !"idx_1", metadata !"", metadata !12, i32 13, metadata !52, i32 0, i32 1, [128 x i16]* @idx_1, null} ; [ DW_TAG_variable ] [idx_1] [line 13] [def]
!58 = metadata !{i32 786484, i32 0, null, metadata !"idx", metadata !"idx", metadata !"", metadata !12, i32 14, metadata !59, i32 0, i32 1, [32 x i16]* @idx, null} ; [ DW_TAG_variable ] [idx] [line 14] [def]
!59 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 512, i64 16, i32 0, i32 0, metadata !15, metadata !60, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 512, align 16, offset 0] [from short]
!60 = metadata !{metadata !61}
!61 = metadata !{i32 786465, i64 0, i64 32}       ; [ DW_TAG_subrange_type ] [0, 31]
!62 = metadata !{i32 786484, i32 0, null, metadata !"e_num", metadata !"e_num", metadata !"", metadata !12, i32 23, metadata !15, i32 0, i32 1, i16* @e_num, null} ; [ DW_TAG_variable ] [e_num] [line 23] [def]
!63 = metadata !{i32 786484, i32 0, null, metadata !"num_max", metadata !"num_max", metadata !"", metadata !12, i32 21, metadata !15, i32 0, i32 1, i16* @num_max, null} ; [ DW_TAG_variable ] [num_max] [line 21] [def]
!64 = metadata !{i32 786484, i32 0, null, metadata !"num_min", metadata !"num_min", metadata !"", metadata !12, i32 22, metadata !15, i32 0, i32 1, i16* @num_min, null} ; [ DW_TAG_variable ] [num_min] [line 22] [def]
!65 = metadata !{i32 2, metadata !"Dwarf Version", i32 2}
!66 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!67 = metadata !{metadata !"clang version 3.5.0 (tags/RELEASE_350/final)"}
!68 = metadata !{i32 786689, metadata !4, metadata !"base", metadata !6, i32 16777228, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [base] [line 12]
!69 = metadata !{i32 12, i32 22, metadata !4, null}
!70 = metadata !{i32 786689, metadata !4, metadata !"num", metadata !6, i32 33554444, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [num] [line 12]
!71 = metadata !{i32 12, i32 32, metadata !4, null}
!72 = metadata !{i32 786689, metadata !4, metadata !"wid", metadata !6, i32 50331660, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wid] [line 12]
!73 = metadata !{i32 12, i32 41, metadata !4, null}
!74 = metadata !{i32 13, i32 2, metadata !4, null}
!75 = metadata !{i32 786688, metadata !76, metadata !"i", metadata !6, i32 15, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 15]
!76 = metadata !{i32 786443, metadata !5, metadata !77, i32 15, i32 3, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/D:\CIC\Swift_IDE_Toolchain\toolchain_8slot\include\swift_debug.h]
!77 = metadata !{i32 786443, metadata !5, metadata !4, i32 13, i32 14, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/D:\CIC\Swift_IDE_Toolchain\toolchain_8slot\include\swift_debug.h]
!78 = metadata !{i32 15, i32 11, metadata !76, null}
!79 = metadata !{i32 15, i32 7, metadata !76, null}
!80 = metadata !{i32 16, i32 4, metadata !76, null}
!81 = metadata !{i32 15, i32 23, metadata !76, null}
!82 = metadata !{i32 17, i32 3, metadata !77, null}
!83 = metadata !{i32 786688, metadata !84, metadata !"i", metadata !6, i32 19, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 19]
!84 = metadata !{i32 786443, metadata !5, metadata !77, i32 19, i32 3, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/D:\CIC\Swift_IDE_Toolchain\toolchain_8slot\include\swift_debug.h]
!85 = metadata !{i32 19, i32 11, metadata !84, null}
!86 = metadata !{i32 19, i32 7, metadata !84, null}
!87 = metadata !{i32 20, i32 4, metadata !84, null}
!88 = metadata !{i32 19, i32 23, metadata !84, null}
!89 = metadata !{i32 21, i32 3, metadata !77, null}
!90 = metadata !{i32 786688, metadata !91, metadata !"i", metadata !6, i32 23, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 23]
!91 = metadata !{i32 786443, metadata !5, metadata !77, i32 23, i32 3, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/D:\CIC\Swift_IDE_Toolchain\toolchain_8slot\include\swift_debug.h]
!92 = metadata !{i32 23, i32 11, metadata !91, null}
!93 = metadata !{i32 23, i32 7, metadata !91, null}
!94 = metadata !{i32 24, i32 4, metadata !91, null}
!95 = metadata !{i32 23, i32 23, metadata !91, null}
!96 = metadata !{i32 25, i32 3, metadata !77, null}
!97 = metadata !{i32 27, i32 3, metadata !77, null}
!98 = metadata !{i32 29, i32 1, metadata !4, null}
!99 = metadata !{i32 786689, metadata !11, metadata !"x", metadata !12, i32 16777241, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 25]
!100 = metadata !{i32 25, i32 19, metadata !11, null}
!101 = metadata !{i32 26, i32 5, metadata !102, null}
!102 = metadata !{i32 786443, metadata !1, metadata !11, i32 26, i32 5, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!103 = metadata !{i32 27, i32 3, metadata !104, null}
!104 = metadata !{i32 786443, metadata !1, metadata !102, i32 26, i32 9, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!105 = metadata !{i32 29, i32 3, metadata !106, null}
!106 = metadata !{i32 786443, metadata !1, metadata !102, i32 28, i32 7, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!107 = metadata !{i32 31, i32 1, metadata !11, null}
!108 = metadata !{i32 786689, metadata !16, metadata !"x", metadata !12, i32 16777249, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 33]
!109 = metadata !{i32 33, i32 19, metadata !16, null}
!110 = metadata !{i32 786689, metadata !16, metadata !"y", metadata !12, i32 33554465, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [y] [line 33]
!111 = metadata !{i32 33, i32 27, metadata !16, null}
!112 = metadata !{i32 34, i32 5, metadata !113, null}
!113 = metadata !{i32 786443, metadata !1, metadata !16, i32 34, i32 5, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!114 = metadata !{i32 35, i32 3, metadata !115, null}
!115 = metadata !{i32 786443, metadata !1, metadata !113, i32 34, i32 11, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!116 = metadata !{i32 37, i32 3, metadata !117, null}
!117 = metadata !{i32 786443, metadata !1, metadata !113, i32 36, i32 7, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!118 = metadata !{i32 39, i32 1, metadata !16, null}
!119 = metadata !{i32 786689, metadata !19, metadata !"x", metadata !12, i32 16777256, metadata !22, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 40]
!120 = metadata !{i32 40, i32 24, metadata !19, null}
!121 = metadata !{i32 786689, metadata !19, metadata !"nx", metadata !12, i32 33554472, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [nx] [line 40]
!122 = metadata !{i32 40, i32 33, metadata !19, null}
!123 = metadata !{i32 786688, metadata !19, metadata !"min", metadata !12, i32 42, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [min] [line 42]
!124 = metadata !{i32 42, i32 6, metadata !19, null}
!125 = metadata !{i32 43, i32 2, metadata !19, null}
!126 = metadata !{i32 786688, metadata !19, metadata !"temp", metadata !12, i32 44, metadata !52, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [temp] [line 44]
!127 = metadata !{i32 44, i32 8, metadata !19, null}
!128 = metadata !{i32 44, i32 2, metadata !19, null}
!129 = metadata !{i32 786688, metadata !19, metadata !"k", metadata !12, i32 45, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 45]
!130 = metadata !{i32 45, i32 6, metadata !19, null}
!131 = metadata !{i32 45, i32 2, metadata !19, null}
!132 = metadata !{i32 46, i32 6, metadata !133, null}
!133 = metadata !{i32 786443, metadata !1, metadata !19, i32 46, i32 6, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!134 = metadata !{i32 786688, metadata !135, metadata !"i", metadata !12, i32 47, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 47]
!135 = metadata !{i32 786443, metadata !1, metadata !136, i32 47, i32 3, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!136 = metadata !{i32 786443, metadata !1, metadata !133, i32 46, i32 17, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!137 = metadata !{i32 47, i32 12, metadata !135, null}
!138 = metadata !{i32 47, i32 8, metadata !135, null}
!139 = metadata !{i32 48, i32 4, metadata !140, null}
!140 = metadata !{i32 786443, metadata !1, metadata !135, i32 47, i32 31, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!141 = metadata !{i32 49, i32 3, metadata !140, null}
!142 = metadata !{i32 47, i32 26, metadata !135, null}
!143 = metadata !{i32 786688, metadata !144, metadata !"i", metadata !12, i32 50, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 50]
!144 = metadata !{i32 786443, metadata !1, metadata !136, i32 50, i32 3, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!145 = metadata !{i32 50, i32 12, metadata !144, null}
!146 = metadata !{i32 50, i32 8, metadata !144, null}
!147 = metadata !{i32 51, i32 8, metadata !148, null}
!148 = metadata !{i32 786443, metadata !1, metadata !144, i32 51, i32 8, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!149 = metadata !{i32 52, i32 5, metadata !148, null}
!150 = metadata !{i32 51, i32 18, metadata !148, null}
!151 = metadata !{i32 50, i32 28, metadata !144, null}
!152 = metadata !{i32 53, i32 2, metadata !136, null}
!153 = metadata !{i32 53, i32 13, metadata !154, null}
!154 = metadata !{i32 786443, metadata !1, metadata !133, i32 53, i32 13, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!155 = metadata !{i32 54, i32 3, metadata !156, null}
!156 = metadata !{i32 786443, metadata !1, metadata !154, i32 53, i32 24, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!157 = metadata !{i32 55, i32 2, metadata !156, null}
!158 = metadata !{i32 786688, metadata !159, metadata !"i", metadata !12, i32 56, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 56]
!159 = metadata !{i32 786443, metadata !1, metadata !19, i32 56, i32 2, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!160 = metadata !{i32 56, i32 11, metadata !159, null}
!161 = metadata !{i32 56, i32 7, metadata !159, null}
!162 = metadata !{i32 57, i32 7, metadata !163, null}
!163 = metadata !{i32 786443, metadata !1, metadata !159, i32 57, i32 7, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!164 = metadata !{i32 58, i32 4, metadata !163, null} ; [ DW_TAG_imported_module ]
!165 = metadata !{i32 57, i32 14, metadata !163, null}
!166 = metadata !{i32 56, i32 32, metadata !159, null}
!167 = metadata !{i32 59, i32 2, metadata !19, null}
!168 = metadata !{i32 786689, metadata !23, metadata !"x", metadata !12, i32 16777278, metadata !22, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 62]
!169 = metadata !{i32 62, i32 24, metadata !23, null}
!170 = metadata !{i32 786689, metadata !23, metadata !"nx", metadata !12, i32 33554494, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [nx] [line 62]
!171 = metadata !{i32 62, i32 33, metadata !23, null}
!172 = metadata !{i32 786688, metadata !23, metadata !"max", metadata !12, i32 63, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [max] [line 63]
!173 = metadata !{i32 63, i32 6, metadata !23, null}
!174 = metadata !{i32 64, i32 2, metadata !23, null}
!175 = metadata !{i32 786688, metadata !23, metadata !"temp", metadata !12, i32 65, metadata !52, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [temp] [line 65]
!176 = metadata !{i32 65, i32 8, metadata !23, null}
!177 = metadata !{i32 65, i32 2, metadata !23, null}
!178 = metadata !{i32 786688, metadata !23, metadata !"k", metadata !12, i32 82, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 82]
!179 = metadata !{i32 82, i32 6, metadata !23, null}
!180 = metadata !{i32 82, i32 2, metadata !23, null}
!181 = metadata !{i32 83, i32 6, metadata !182, null}
!182 = metadata !{i32 786443, metadata !1, metadata !23, i32 83, i32 6, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!183 = metadata !{i32 786688, metadata !184, metadata !"i", metadata !12, i32 84, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 84]
!184 = metadata !{i32 786443, metadata !1, metadata !185, i32 84, i32 3, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!185 = metadata !{i32 786443, metadata !1, metadata !182, i32 83, i32 17, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!186 = metadata !{i32 84, i32 12, metadata !184, null}
!187 = metadata !{i32 84, i32 8, metadata !184, null}
!188 = metadata !{i32 85, i32 4, metadata !189, null}
!189 = metadata !{i32 786443, metadata !1, metadata !184, i32 84, i32 31, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!190 = metadata !{i32 86, i32 3, metadata !189, null}
!191 = metadata !{i32 84, i32 26, metadata !184, null}
!192 = metadata !{i32 786688, metadata !193, metadata !"i", metadata !12, i32 87, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 87]
!193 = metadata !{i32 786443, metadata !1, metadata !185, i32 87, i32 3, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!194 = metadata !{i32 87, i32 12, metadata !193, null}
!195 = metadata !{i32 87, i32 8, metadata !193, null}
!196 = metadata !{i32 88, i32 8, metadata !197, null}
!197 = metadata !{i32 786443, metadata !1, metadata !193, i32 88, i32 8, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!198 = metadata !{i32 89, i32 5, metadata !197, null}
!199 = metadata !{i32 88, i32 18, metadata !197, null}
!200 = metadata !{i32 87, i32 28, metadata !193, null}
!201 = metadata !{i32 90, i32 2, metadata !185, null}
!202 = metadata !{i32 90, i32 13, metadata !203, null}
!203 = metadata !{i32 786443, metadata !1, metadata !182, i32 90, i32 13, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!204 = metadata !{i32 91, i32 3, metadata !205, null}
!205 = metadata !{i32 786443, metadata !1, metadata !203, i32 90, i32 24, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!206 = metadata !{i32 92, i32 2, metadata !205, null}
!207 = metadata !{i32 786688, metadata !208, metadata !"i", metadata !12, i32 93, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 93]
!208 = metadata !{i32 786443, metadata !1, metadata !23, i32 93, i32 2, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!209 = metadata !{i32 93, i32 11, metadata !208, null}
!210 = metadata !{i32 93, i32 7, metadata !208, null}
!211 = metadata !{i32 94, i32 7, metadata !212, null}
!212 = metadata !{i32 786443, metadata !1, metadata !208, i32 94, i32 7, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!213 = metadata !{i32 95, i32 4, metadata !212, null}
!214 = metadata !{i32 94, i32 14, metadata !212, null}
!215 = metadata !{i32 93, i32 32, metadata !208, null}
!216 = metadata !{i32 96, i32 2, metadata !23, null}
!217 = metadata !{i32 786689, metadata !24, metadata !"n", metadata !12, i32 16777315, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 99]
!218 = metadata !{i32 99, i32 22, metadata !24, null}
!219 = metadata !{i32 786689, metadata !24, metadata !"x", metadata !12, i32 33554531, metadata !22, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 99]
!220 = metadata !{i32 99, i32 32, metadata !24, null}
!221 = metadata !{i32 786688, metadata !24, metadata !"temp", metadata !12, i32 103, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [temp] [line 103]
!222 = metadata !{i32 103, i32 9, metadata !24, null}
!223 = metadata !{i32 786688, metadata !224, metadata !"i", metadata !12, i32 104, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 104]
!224 = metadata !{i32 786443, metadata !1, metadata !24, i32 104, i32 3, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!225 = metadata !{i32 104, i32 12, metadata !224, null}
!226 = metadata !{i32 104, i32 8, metadata !224, null}
!227 = metadata !{i32 786688, metadata !224, metadata !"j", metadata !12, i32 104, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 104]
!228 = metadata !{i32 104, i32 19, metadata !224, null}
!229 = metadata !{i32 786688, metadata !230, metadata !"k", metadata !12, i32 105, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 105]
!230 = metadata !{i32 786443, metadata !1, metadata !231, i32 105, i32 5, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!231 = metadata !{i32 786443, metadata !1, metadata !224, i32 104, i32 42, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!232 = metadata !{i32 105, i32 14, metadata !230, null}
!233 = metadata !{i32 105, i32 10, metadata !230, null}
!234 = metadata !{i32 105, i32 39, metadata !230, null}
!235 = metadata !{i32 106, i32 9, metadata !236, null}
!236 = metadata !{i32 786443, metadata !1, metadata !231, i32 106, i32 9, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!237 = metadata !{i32 107, i32 6, metadata !238, null}
!238 = metadata !{i32 786443, metadata !1, metadata !236, i32 106, i32 15, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!239 = metadata !{i32 108, i32 6, metadata !238, null}
!240 = metadata !{i32 109, i32 6, metadata !238, null}
!241 = metadata !{i32 110, i32 6, metadata !238, null}
!242 = metadata !{i32 111, i32 6, metadata !238, null}
!243 = metadata !{i32 112, i32 6, metadata !238, null}
!244 = metadata !{i32 113, i32 5, metadata !238, null}
!245 = metadata !{i32 114, i32 3, metadata !231, null}
!246 = metadata !{i32 104, i32 37, metadata !224, null}
!247 = metadata !{i32 115, i32 1, metadata !24, null}
!248 = metadata !{i32 154, i32 4, metadata !249, null}
!249 = metadata !{i32 786443, metadata !1, metadata !250, i32 153, i32 19, i32 0, i32 50} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!250 = metadata !{i32 786443, metadata !1, metadata !251, i32 153, i32 11, i32 0, i32 49} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!251 = metadata !{i32 786443, metadata !1, metadata !252, i32 140, i32 11, i32 0, i32 43} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!252 = metadata !{i32 786443, metadata !1, metadata !253, i32 126, i32 6, i32 0, i32 37} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!253 = metadata !{i32 786443, metadata !1, metadata !254, i32 123, i32 35, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!254 = metadata !{i32 786443, metadata !1, metadata !27, i32 123, i32 2, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!255 = metadata !{i32 161, i32 4, metadata !256, null}
!256 = metadata !{i32 786443, metadata !1, metadata !257, i32 160, i32 19, i32 0, i32 54} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!257 = metadata !{i32 786443, metadata !1, metadata !250, i32 160, i32 11, i32 0, i32 53} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!258 = metadata !{i32 168, i32 4, metadata !259, null}
!259 = metadata !{i32 786443, metadata !1, metadata !260, i32 167, i32 19, i32 0, i32 58} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!260 = metadata !{i32 786443, metadata !1, metadata !257, i32 167, i32 11, i32 0, i32 57} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!261 = metadata !{i32 175, i32 4, metadata !262, null}
!262 = metadata !{i32 786443, metadata !1, metadata !260, i32 174, i32 7, i32 0, i32 61} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!263 = metadata !{i32 183, i32 4, metadata !264, null}
!264 = metadata !{i32 786443, metadata !1, metadata !265, i32 181, i32 13, i32 0, i32 65} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!265 = metadata !{i32 786443, metadata !1, metadata !253, i32 181, i32 6, i32 0, i32 64} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!266 = metadata !{i32 141, i32 4, metadata !267, null}
!267 = metadata !{i32 786443, metadata !1, metadata !251, i32 140, i32 20, i32 0, i32 44} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!268 = metadata !{i32 127, i32 4, metadata !269, null}
!269 = metadata !{i32 786443, metadata !1, metadata !252, i32 126, i32 15, i32 0, i32 38} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!270 = metadata !{i32 786689, metadata !27, metadata !"x", metadata !12, i32 16777332, metadata !22, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 116]
!271 = metadata !{i32 116, i32 23, metadata !27, null}
!272 = metadata !{i32 786689, metadata !27, metadata !"w", metadata !12, i32 33554548, metadata !22, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [w] [line 116]
!273 = metadata !{i32 116, i32 33, metadata !27, null}
!274 = metadata !{i32 786689, metadata !27, metadata !"nx", metadata !12, i32 50331764, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [nx] [line 116]
!275 = metadata !{i32 116, i32 40, metadata !27, null}
!276 = metadata !{i32 786688, metadata !27, metadata !"n1", metadata !12, i32 117, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n1] [line 117]
!277 = metadata !{i32 117, i32 6, metadata !27, null}
!278 = metadata !{i32 786688, metadata !27, metadata !"n2", metadata !12, i32 117, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n2] [line 117]
!279 = metadata !{i32 117, i32 9, metadata !27, null}
!280 = metadata !{i32 786688, metadata !27, metadata !"ie", metadata !12, i32 117, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ie] [line 117]
!281 = metadata !{i32 117, i32 12, metadata !27, null}
!282 = metadata !{i32 786688, metadata !27, metadata !"ia", metadata !12, i32 117, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ia] [line 117]
!283 = metadata !{i32 117, i32 15, metadata !27, null}
!284 = metadata !{i32 786688, metadata !27, metadata !"i", metadata !12, i32 117, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 117]
!285 = metadata !{i32 117, i32 18, metadata !27, null}
!286 = metadata !{i32 786688, metadata !27, metadata !"j", metadata !12, i32 117, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 117]
!287 = metadata !{i32 117, i32 20, metadata !27, null}
!288 = metadata !{i32 786688, metadata !27, metadata !"k", metadata !12, i32 117, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 117]
!289 = metadata !{i32 117, i32 22, metadata !27, null}
!290 = metadata !{i32 786688, metadata !27, metadata !"l", metadata !12, i32 117, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [l] [line 117]
!291 = metadata !{i32 117, i32 24, metadata !27, null}
!292 = metadata !{i32 786688, metadata !27, metadata !"m", metadata !12, i32 117, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [m] [line 117]
!293 = metadata !{i32 117, i32 26, metadata !27, null}
!294 = metadata !{i32 786688, metadata !27, metadata !"xt", metadata !12, i32 118, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [xt] [line 118]
!295 = metadata !{i32 118, i32 6, metadata !27, null}
!296 = metadata !{i32 786688, metadata !27, metadata !"yt", metadata !12, i32 118, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [yt] [line 118]
!297 = metadata !{i32 118, i32 9, metadata !27, null}
!298 = metadata !{i32 786688, metadata !27, metadata !"c", metadata !12, i32 118, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [c] [line 118]
!299 = metadata !{i32 118, i32 12, metadata !27, null}
!300 = metadata !{i32 786688, metadata !27, metadata !"s", metadata !12, i32 118, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [s] [line 118]
!301 = metadata !{i32 118, i32 14, metadata !27, null}
!302 = metadata !{i32 786688, metadata !27, metadata !"mid_a", metadata !12, i32 119, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mid_a] [line 119]
!303 = metadata !{i32 119, i32 6, metadata !27, null}
!304 = metadata !{i32 786688, metadata !27, metadata !"mid_b", metadata !12, i32 119, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mid_b] [line 119]
!305 = metadata !{i32 119, i32 12, metadata !27, null}
!306 = metadata !{i32 120, i32 2, metadata !27, null}
!307 = metadata !{i32 121, i32 2, metadata !27, null}
!308 = metadata !{i32 123, i32 7, metadata !254, null}
!309 = metadata !{i32 124, i32 3, metadata !253, null}
!310 = metadata !{i32 125, i32 3, metadata !253, null}
!311 = metadata !{i32 126, i32 6, metadata !252, null}
!312 = metadata !{i32 786689, metadata !33, metadata !"vpnum", metadata !35, i32 16777229, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [vpnum] [line 13]
!313 = metadata !{i32 13, i32 26, metadata !33, metadata !268}
!314 = metadata !{i32 786688, metadata !33, metadata !"vpsel", metadata !35, i32 14, metadata !40, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [vpsel] [line 14]
!315 = metadata !{i32 14, i32 23, metadata !33, metadata !268}
!316 = metadata !{i32 14, i32 2, metadata !33, metadata !268}
!317 = metadata !{i32 15, i32 2, metadata !33, metadata !268}
!318 = metadata !{i32 16, i32 10, metadata !319, metadata !268}
!319 = metadata !{i32 786443, metadata !34, metadata !33, i32 15, i32 15, i32 0, i32 73} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/D:\CIC\Swift_IDE_Toolchain\toolchain_8slot\include\swift_math.h]
!320 = metadata !{i32 16, i32 23, metadata !319, metadata !268}
!321 = metadata !{i32 17, i32 10, metadata !319, metadata !268}
!322 = metadata !{i32 17, i32 23, metadata !319, metadata !268}
!323 = metadata !{i32 18, i32 10, metadata !319, metadata !268}
!324 = metadata !{i32 18, i32 23, metadata !319, metadata !268}
!325 = metadata !{i32 19, i32 10, metadata !319, metadata !268}
!326 = metadata !{i32 19, i32 23, metadata !319, metadata !268}
!327 = metadata !{i32 20, i32 10, metadata !319, metadata !268}
!328 = metadata !{i32 20, i32 23, metadata !319, metadata !268}
!329 = metadata !{i32 22, i32 3, metadata !319, metadata !268}
!330 = metadata !{i32 24, i32 2, metadata !33, metadata !268}
!331 = metadata !{i32 25, i32 1, metadata !33, metadata !268}
!332 = metadata !{i32 128, i32 9, metadata !333, null}
!333 = metadata !{i32 786443, metadata !1, metadata !269, i32 128, i32 4, i32 0, i32 39} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!334 = metadata !{i32 129, i32 5, metadata !335, null}
!335 = metadata !{i32 786443, metadata !1, metadata !333, i32 128, i32 29, i32 0, i32 40} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!336 = metadata !{i32 786688, metadata !335, metadata !"time", metadata !12, i32 130, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [time] [line 130]
!337 = metadata !{i32 130, i32 9, metadata !335, null}
!338 = metadata !{i32 131, i32 5, metadata !335, null}
!339 = metadata !{i32 132, i32 10, metadata !340, null}
!340 = metadata !{i32 786443, metadata !1, metadata !335, i32 132, i32 5, i32 0, i32 41} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!341 = metadata !{i32 133, i32 6, metadata !342, null}
!342 = metadata !{i32 786443, metadata !1, metadata !340, i32 132, i32 33, i32 0, i32 42} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!343 = metadata !{i32 134, i32 6, metadata !342, null}
!344 = metadata !{i32 135, i32 6, metadata !342, null}
!345 = metadata !{i32 136, i32 6, metadata !342, null}
!346 = metadata !{i32 137, i32 5, metadata !342, null}
!347 = metadata !{i32 132, i32 25, metadata !340, null}
!348 = metadata !{i32 138, i32 4, metadata !335, null}
!349 = metadata !{i32 128, i32 22, metadata !333, null}
!350 = metadata !{i32 139, i32 3, metadata !269, null}
!351 = metadata !{i32 140, i32 11, metadata !251, null}
!352 = metadata !{i32 13, i32 26, metadata !33, metadata !266}
!353 = metadata !{i32 14, i32 23, metadata !33, metadata !266}
!354 = metadata !{i32 14, i32 2, metadata !33, metadata !266}
!355 = metadata !{i32 15, i32 2, metadata !33, metadata !266}
!356 = metadata !{i32 16, i32 10, metadata !319, metadata !266}
!357 = metadata !{i32 16, i32 23, metadata !319, metadata !266}
!358 = metadata !{i32 17, i32 10, metadata !319, metadata !266}
!359 = metadata !{i32 17, i32 23, metadata !319, metadata !266}
!360 = metadata !{i32 18, i32 10, metadata !319, metadata !266}
!361 = metadata !{i32 18, i32 23, metadata !319, metadata !266}
!362 = metadata !{i32 19, i32 10, metadata !319, metadata !266}
!363 = metadata !{i32 19, i32 23, metadata !319, metadata !266}
!364 = metadata !{i32 20, i32 10, metadata !319, metadata !266}
!365 = metadata !{i32 20, i32 23, metadata !319, metadata !266}
!366 = metadata !{i32 22, i32 3, metadata !319, metadata !266}
!367 = metadata !{i32 24, i32 2, metadata !33, metadata !266}
!368 = metadata !{i32 25, i32 1, metadata !33, metadata !266}
!369 = metadata !{i32 142, i32 9, metadata !370, null}
!370 = metadata !{i32 786443, metadata !1, metadata !267, i32 142, i32 4, i32 0, i32 45} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!371 = metadata !{i32 143, i32 5, metadata !372, null}
!372 = metadata !{i32 786443, metadata !1, metadata !370, i32 142, i32 29, i32 0, i32 46} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!373 = metadata !{i32 786688, metadata !372, metadata !"time", metadata !12, i32 144, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [time] [line 144]
!374 = metadata !{i32 144, i32 9, metadata !372, null}
!375 = metadata !{i32 144, i32 5, metadata !372, null}
!376 = metadata !{i32 145, i32 10, metadata !377, null}
!377 = metadata !{i32 786443, metadata !1, metadata !372, i32 145, i32 5, i32 0, i32 47} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!378 = metadata !{i32 146, i32 6, metadata !379, null}
!379 = metadata !{i32 786443, metadata !1, metadata !377, i32 145, i32 33, i32 0, i32 48} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!380 = metadata !{i32 147, i32 6, metadata !379, null}
!381 = metadata !{i32 148, i32 6, metadata !379, null}
!382 = metadata !{i32 149, i32 6, metadata !379, null}
!383 = metadata !{i32 150, i32 5, metadata !379, null}
!384 = metadata !{i32 145, i32 25, metadata !377, null}
!385 = metadata !{i32 151, i32 4, metadata !372, null}
!386 = metadata !{i32 142, i32 22, metadata !370, null}
!387 = metadata !{i32 152, i32 3, metadata !267, null}
!388 = metadata !{i32 153, i32 11, metadata !250, null}
!389 = metadata !{i32 13, i32 26, metadata !33, metadata !248}
!390 = metadata !{i32 14, i32 23, metadata !33, metadata !248}
!391 = metadata !{i32 14, i32 2, metadata !33, metadata !248}
!392 = metadata !{i32 15, i32 2, metadata !33, metadata !248}
!393 = metadata !{i32 16, i32 10, metadata !319, metadata !248}
!394 = metadata !{i32 16, i32 23, metadata !319, metadata !248}
!395 = metadata !{i32 17, i32 10, metadata !319, metadata !248}
!396 = metadata !{i32 17, i32 23, metadata !319, metadata !248}
!397 = metadata !{i32 18, i32 10, metadata !319, metadata !248}
!398 = metadata !{i32 18, i32 23, metadata !319, metadata !248}
!399 = metadata !{i32 19, i32 10, metadata !319, metadata !248}
!400 = metadata !{i32 19, i32 23, metadata !319, metadata !248}
!401 = metadata !{i32 20, i32 10, metadata !319, metadata !248}
!402 = metadata !{i32 20, i32 23, metadata !319, metadata !248}
!403 = metadata !{i32 22, i32 3, metadata !319, metadata !248}
!404 = metadata !{i32 24, i32 2, metadata !33, metadata !248}
!405 = metadata !{i32 25, i32 1, metadata !33, metadata !248}
!406 = metadata !{i32 155, i32 9, metadata !407, null}
!407 = metadata !{i32 786443, metadata !1, metadata !249, i32 155, i32 4, i32 0, i32 51} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!408 = metadata !{i32 156, i32 5, metadata !409, null}
!409 = metadata !{i32 786443, metadata !1, metadata !407, i32 155, i32 29, i32 0, i32 52} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!410 = metadata !{i32 157, i32 5, metadata !409, null}
!411 = metadata !{i32 158, i32 5, metadata !409, null}
!412 = metadata !{i32 155, i32 22, metadata !407, null}
!413 = metadata !{i32 159, i32 3, metadata !249, null}
!414 = metadata !{i32 160, i32 11, metadata !257, null}
!415 = metadata !{i32 13, i32 26, metadata !33, metadata !255}
!416 = metadata !{i32 14, i32 23, metadata !33, metadata !255}
!417 = metadata !{i32 14, i32 2, metadata !33, metadata !255}
!418 = metadata !{i32 15, i32 2, metadata !33, metadata !255}
!419 = metadata !{i32 16, i32 10, metadata !319, metadata !255}
!420 = metadata !{i32 16, i32 23, metadata !319, metadata !255}
!421 = metadata !{i32 17, i32 10, metadata !319, metadata !255}
!422 = metadata !{i32 17, i32 23, metadata !319, metadata !255}
!423 = metadata !{i32 18, i32 10, metadata !319, metadata !255}
!424 = metadata !{i32 18, i32 23, metadata !319, metadata !255}
!425 = metadata !{i32 19, i32 10, metadata !319, metadata !255}
!426 = metadata !{i32 19, i32 23, metadata !319, metadata !255}
!427 = metadata !{i32 20, i32 10, metadata !319, metadata !255}
!428 = metadata !{i32 20, i32 23, metadata !319, metadata !255}
!429 = metadata !{i32 22, i32 3, metadata !319, metadata !255}
!430 = metadata !{i32 24, i32 2, metadata !33, metadata !255}
!431 = metadata !{i32 25, i32 1, metadata !33, metadata !255}
!432 = metadata !{i32 162, i32 8, metadata !433, null}
!433 = metadata !{i32 786443, metadata !1, metadata !256, i32 162, i32 4, i32 0, i32 55} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!434 = metadata !{i32 163, i32 5, metadata !435, null}
!435 = metadata !{i32 786443, metadata !1, metadata !433, i32 162, i32 28, i32 0, i32 56} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!436 = metadata !{i32 164, i32 5, metadata !435, null}
!437 = metadata !{i32 165, i32 4, metadata !435, null}
!438 = metadata !{i32 162, i32 22, metadata !433, null}
!439 = metadata !{i32 166, i32 3, metadata !256, null}
!440 = metadata !{i32 167, i32 11, metadata !260, null}
!441 = metadata !{i32 13, i32 26, metadata !33, metadata !258}
!442 = metadata !{i32 14, i32 23, metadata !33, metadata !258}
!443 = metadata !{i32 14, i32 2, metadata !33, metadata !258}
!444 = metadata !{i32 15, i32 2, metadata !33, metadata !258}
!445 = metadata !{i32 16, i32 10, metadata !319, metadata !258}
!446 = metadata !{i32 16, i32 23, metadata !319, metadata !258}
!447 = metadata !{i32 17, i32 10, metadata !319, metadata !258}
!448 = metadata !{i32 17, i32 23, metadata !319, metadata !258}
!449 = metadata !{i32 18, i32 10, metadata !319, metadata !258}
!450 = metadata !{i32 18, i32 23, metadata !319, metadata !258}
!451 = metadata !{i32 19, i32 10, metadata !319, metadata !258}
!452 = metadata !{i32 19, i32 23, metadata !319, metadata !258}
!453 = metadata !{i32 20, i32 10, metadata !319, metadata !258}
!454 = metadata !{i32 20, i32 23, metadata !319, metadata !258}
!455 = metadata !{i32 22, i32 3, metadata !319, metadata !258}
!456 = metadata !{i32 24, i32 2, metadata !33, metadata !258}
!457 = metadata !{i32 25, i32 1, metadata !33, metadata !258}
!458 = metadata !{i32 169, i32 8, metadata !459, null}
!459 = metadata !{i32 786443, metadata !1, metadata !259, i32 169, i32 4, i32 0, i32 59} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!460 = metadata !{i32 170, i32 5, metadata !461, null}
!461 = metadata !{i32 786443, metadata !1, metadata !459, i32 169, i32 28, i32 0, i32 60} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!462 = metadata !{i32 171, i32 5, metadata !461, null}
!463 = metadata !{i32 172, i32 4, metadata !461, null}
!464 = metadata !{i32 169, i32 22, metadata !459, null}
!465 = metadata !{i32 173, i32 3, metadata !259, null}
!466 = metadata !{i32 13, i32 26, metadata !33, metadata !261}
!467 = metadata !{i32 14, i32 23, metadata !33, metadata !261}
!468 = metadata !{i32 14, i32 2, metadata !33, metadata !261}
!469 = metadata !{i32 15, i32 2, metadata !33, metadata !261}
!470 = metadata !{i32 16, i32 10, metadata !319, metadata !261}
!471 = metadata !{i32 16, i32 23, metadata !319, metadata !261}
!472 = metadata !{i32 17, i32 10, metadata !319, metadata !261}
!473 = metadata !{i32 17, i32 23, metadata !319, metadata !261}
!474 = metadata !{i32 18, i32 10, metadata !319, metadata !261}
!475 = metadata !{i32 18, i32 23, metadata !319, metadata !261}
!476 = metadata !{i32 19, i32 10, metadata !319, metadata !261}
!477 = metadata !{i32 19, i32 23, metadata !319, metadata !261}
!478 = metadata !{i32 20, i32 10, metadata !319, metadata !261}
!479 = metadata !{i32 20, i32 23, metadata !319, metadata !261}
!480 = metadata !{i32 22, i32 3, metadata !319, metadata !261}
!481 = metadata !{i32 24, i32 2, metadata !33, metadata !261}
!482 = metadata !{i32 25, i32 1, metadata !33, metadata !261}
!483 = metadata !{i32 176, i32 8, metadata !484, null}
!484 = metadata !{i32 786443, metadata !1, metadata !262, i32 176, i32 4, i32 0, i32 62} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!485 = metadata !{i32 177, i32 5, metadata !486, null}
!486 = metadata !{i32 786443, metadata !1, metadata !484, i32 176, i32 28, i32 0, i32 63} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!487 = metadata !{i32 178, i32 5, metadata !486, null}
!488 = metadata !{i32 179, i32 4, metadata !486, null}
!489 = metadata !{i32 176, i32 22, metadata !484, null}
!490 = metadata !{i32 181, i32 6, metadata !265, null}
!491 = metadata !{i32 786688, metadata !264, metadata !"step", metadata !12, i32 182, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [step] [line 182]
!492 = metadata !{i32 182, i32 8, metadata !264, null}
!493 = metadata !{i32 182, i32 4, metadata !264, null}
!494 = metadata !{i32 13, i32 26, metadata !33, metadata !263}
!495 = metadata !{i32 14, i32 23, metadata !33, metadata !263}
!496 = metadata !{i32 14, i32 2, metadata !33, metadata !263}
!497 = metadata !{i32 15, i32 2, metadata !33, metadata !263}
!498 = metadata !{i32 16, i32 10, metadata !319, metadata !263}
!499 = metadata !{i32 16, i32 23, metadata !319, metadata !263}
!500 = metadata !{i32 17, i32 10, metadata !319, metadata !263}
!501 = metadata !{i32 17, i32 23, metadata !319, metadata !263}
!502 = metadata !{i32 18, i32 10, metadata !319, metadata !263}
!503 = metadata !{i32 18, i32 23, metadata !319, metadata !263}
!504 = metadata !{i32 19, i32 10, metadata !319, metadata !263}
!505 = metadata !{i32 19, i32 23, metadata !319, metadata !263}
!506 = metadata !{i32 20, i32 10, metadata !319, metadata !263}
!507 = metadata !{i32 20, i32 23, metadata !319, metadata !263}
!508 = metadata !{i32 22, i32 3, metadata !319, metadata !263}
!509 = metadata !{i32 24, i32 2, metadata !33, metadata !263}
!510 = metadata !{i32 25, i32 1, metadata !33, metadata !263}
!511 = metadata !{i32 786688, metadata !512, metadata !"p", metadata !12, i32 184, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [p] [line 184]
!512 = metadata !{i32 786443, metadata !1, metadata !264, i32 184, i32 4, i32 0, i32 66} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!513 = metadata !{i32 184, i32 12, metadata !512, null}
!514 = metadata !{i32 184, i32 8, metadata !512, null}
!515 = metadata !{i32 185, i32 5, metadata !516, null}
!516 = metadata !{i32 786443, metadata !1, metadata !512, i32 184, i32 35, i32 0, i32 67} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!517 = metadata !{i32 186, i32 5, metadata !516, null}
!518 = metadata !{i32 187, i32 4, metadata !516, null}
!519 = metadata !{i32 184, i32 27, metadata !512, null}
!520 = metadata !{i32 188, i32 3, metadata !264, null}
!521 = metadata !{i32 786688, metadata !522, metadata !"p", metadata !12, i32 190, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [p] [line 190]
!522 = metadata !{i32 786443, metadata !1, metadata !523, i32 190, i32 5, i32 0, i32 69} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!523 = metadata !{i32 786443, metadata !1, metadata !265, i32 189, i32 7, i32 0, i32 68} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!524 = metadata !{i32 190, i32 13, metadata !522, null}
!525 = metadata !{i32 190, i32 9, metadata !522, null}
!526 = metadata !{i32 191, i32 7, metadata !527, null}
!527 = metadata !{i32 786443, metadata !1, metadata !522, i32 190, i32 33, i32 0, i32 70} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!528 = metadata !{i32 192, i32 7, metadata !527, null}
!529 = metadata !{i32 193, i32 6, metadata !527, null}
!530 = metadata !{i32 190, i32 28, metadata !522, null}
!531 = metadata !{i32 786688, metadata !532, metadata !"j", metadata !12, i32 207, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 207]
!532 = metadata !{i32 786443, metadata !1, metadata !253, i32 207, i32 4, i32 0, i32 71} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!533 = metadata !{i32 207, i32 12, metadata !532, null}
!534 = metadata !{i32 207, i32 8, metadata !532, null}
!535 = metadata !{i32 208, i32 5, metadata !536, null}
!536 = metadata !{i32 786443, metadata !1, metadata !532, i32 207, i32 33, i32 0, i32 72} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_16x16\Release/..\fft_16x16.c]
!537 = metadata !{i32 209, i32 4, metadata !536, null}
!538 = metadata !{i32 207, i32 28, metadata !532, null}
!539 = metadata !{i32 211, i32 3, metadata !253, null}
!540 = metadata !{i32 212, i32 2, metadata !253, null}
!541 = metadata !{i32 123, i32 21, metadata !254, null}
!542 = metadata !{i32 214, i32 2, metadata !27, null}
!543 = metadata !{i32 215, i32 1, metadata !27, null}
!544 = metadata !{i32 786688, metadata !30, metadata !"ndata", metadata !12, i32 219, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ndata] [line 219]
!545 = metadata !{i32 219, i32 6, metadata !30, null}
!546 = metadata !{i32 219, i32 2, metadata !30, null}
!547 = metadata !{i32 220, i32 2, metadata !30, null}
!548 = metadata !{i32 221, i32 2, metadata !30, null}
!549 = metadata !{i32 222, i32 2, metadata !30, null}
