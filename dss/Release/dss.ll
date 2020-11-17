; ModuleID = '..\dss.c'
target datalayout = "e-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
target triple = "dsp"

%struct.cmplx16ImRe_t_ = type { i16, i16 }

@dbg_addr = constant i32* inttoptr (i64 2684354560 to i32*), align 4
@window = global [256 x i16] [i16 5, i16 20, i16 44, i16 78, i16 122, i16 176, i16 239, i16 312, i16 395, i16 487, i16 589, i16 700, i16 821, i16 950, i16 1089, i16 1238, i16 1395, i16 1561, i16 1736, i16 1920, i16 2112, i16 2313, i16 2523, i16 2740, i16 2966, i16 3200, i16 3442, i16 3691, i16 3948, i16 4213, i16 4484, i16 4763, i16 5049, i16 5342, i16 5641, i16 5946, i16 6258, i16 6576, i16 6900, i16 7229, i16 7564, i16 7904, i16 8250, i16 8600, i16 8954, i16 9314, i16 9677, i16 10044, i16 10416, i16 10790, i16 11169, i16 11550, i16 11934, i16 12321, i16 12710, i16 13101, i16 13495, i16 13890, i16 14286, i16 14684, i16 15083, i16 15483, i16 15883, i16 16283, i16 16684, i16 17084, i16 17484, i16 17883, i16 18282, i16 18679, i16 19075, i16 19469, i16 19862, i16 20252, i16 20640, i16 21025, i16 21408, i16 21788, i16 22164, i16 22537, i16 22907, i16 23272, i16 23633, i16 23990, i16 24343, i16 24691, i16 25033, i16 25371, i16 25703, i16 26030, i16 26351, i16 26665, i16 26974, i16 27277, i16 27572, i16 27862, i16 28144, i16 28419, i16 28688, i16 28948, i16 29202, i16 29447, i16 29685, i16 29915, i16 30137, i16 30350, i16 30555, i16 30752, i16 30940, i16 31120, i16 31290, i16 31452, i16 31605, i16 31748, i16 31883, i16 32008, i16 32124, i16 32230, i16 32327, i16 32415, i16 32492, i16 32561, i16 32619, i16 32668, i16 32707, i16 32736, i16 32756, i16 32766, i16 32766, i16 32756, i16 32736, i16 32707, i16 32668, i16 32619, i16 32561, i16 32492, i16 32415, i16 32327, i16 32230, i16 32124, i16 32008, i16 31883, i16 31748, i16 31605, i16 31452, i16 31290, i16 31120, i16 30940, i16 30752, i16 30555, i16 30350, i16 30137, i16 29915, i16 29685, i16 29447, i16 29202, i16 28948, i16 28688, i16 28419, i16 28144, i16 27862, i16 27572, i16 27277, i16 26974, i16 26665, i16 26351, i16 26030, i16 25703, i16 25371, i16 25033, i16 24691, i16 24343, i16 23990, i16 23633, i16 23272, i16 22907, i16 22537, i16 22164, i16 21788, i16 21408, i16 21025, i16 20640, i16 20252, i16 19862, i16 19469, i16 19075, i16 18679, i16 18282, i16 17883, i16 17484, i16 17084, i16 16684, i16 16283, i16 15883, i16 15483, i16 15083, i16 14684, i16 14286, i16 13890, i16 13495, i16 13101, i16 12710, i16 12321, i16 11934, i16 11550, i16 11169, i16 10790, i16 10416, i16 10044, i16 9677, i16 9314, i16 8954, i16 8600, i16 8250, i16 7904, i16 7564, i16 7229, i16 6900, i16 6576, i16 6258, i16 5946, i16 5641, i16 5342, i16 5049, i16 4763, i16 4484, i16 4213, i16 3948, i16 3691, i16 3442, i16 3200, i16 2966, i16 2740, i16 2523, i16 2313, i16 2112, i16 1920, i16 1736, i16 1561, i16 1395, i16 1238, i16 1089, i16 950, i16 821, i16 700, i16 589, i16 487, i16 395, i16 312, i16 239, i16 176, i16 122, i16 78, i16 44, i16 20, i16 5], align 2
@adcDataBuf = common global [4096 x %struct.cmplx16ImRe_t_] zeroinitializer, align 2
@adcDataIn = common global [512 x %struct.cmplx16ImRe_t_] zeroinitializer, align 2
@fftOut1D = common global [2048 x %struct.cmplx16ImRe_t_] zeroinitializer, align 2
@main.twiddle16x16 = private unnamed_addr constant [256 x i16] [i16 0, i16 32767, i16 -804, i16 32757, i16 -1608, i16 32728, i16 -2410, i16 32678, i16 -3212, i16 32609, i16 -4011, i16 32521, i16 -4808, i16 32412, i16 -5602, i16 32285, i16 -6393, i16 32137, i16 -7179, i16 31971, i16 -7962, i16 31785, i16 -8739, i16 31580, i16 -9512, i16 31356, i16 -10278, i16 31113, i16 -11039, i16 30852, i16 -11793, i16 30571, i16 -12539, i16 30273, i16 -13279, i16 29956, i16 -14010, i16 29621, i16 -14732, i16 29268, i16 -15446, i16 28898, i16 -16151, i16 28510, i16 -16846, i16 28105, i16 -17530, i16 27683, i16 -18204, i16 27245, i16 -18868, i16 26790, i16 -19519, i16 26319, i16 -20159, i16 25832, i16 -20787, i16 25329, i16 -21403, i16 24811, i16 -22005, i16 24279, i16 -22594, i16 23731, i16 -23170, i16 23170, i16 -23731, i16 22594, i16 -24279, i16 22005, i16 -24811, i16 21403, i16 -25329, i16 20787, i16 -25832, i16 20159, i16 -26319, i16 19519, i16 -26790, i16 18868, i16 -27245, i16 18204, i16 -27683, i16 17530, i16 -28105, i16 16846, i16 -28510, i16 16151, i16 -28898, i16 15446, i16 -29268, i16 14732, i16 -29621, i16 14010, i16 -29956, i16 13279, i16 -30273, i16 12539, i16 -30571, i16 11793, i16 -30852, i16 11039, i16 -31113, i16 10278, i16 -31356, i16 9512, i16 -31580, i16 8739, i16 -31785, i16 7962, i16 -31971, i16 7179, i16 -32137, i16 6393, i16 -32285, i16 5602, i16 -32412, i16 4808, i16 -32521, i16 4011, i16 -32609, i16 3212, i16 -32678, i16 2410, i16 -32728, i16 1608, i16 -32757, i16 804, i16 -32767, i16 0, i16 -32757, i16 -804, i16 -32728, i16 -1608, i16 -32678, i16 -2410, i16 -32609, i16 -3212, i16 -32521, i16 -4011, i16 -32412, i16 -4808, i16 -32285, i16 -5602, i16 -32137, i16 -6393, i16 -31971, i16 -7179, i16 -31785, i16 -7962, i16 -31580, i16 -8739, i16 -31356, i16 -9512, i16 -31113, i16 -10278, i16 -30852, i16 -11039, i16 -30571, i16 -11793, i16 -30273, i16 -12539, i16 -29956, i16 -13279, i16 -29621, i16 -14010, i16 -29268, i16 -14732, i16 -28898, i16 -15446, i16 -28510, i16 -16151, i16 -28105, i16 -16846, i16 -27683, i16 -17530, i16 -27245, i16 -18204, i16 -26790, i16 -18868, i16 -26319, i16 -19519, i16 -25832, i16 -20159, i16 -25329, i16 -20787, i16 -24811, i16 -21403, i16 -24279, i16 -22005, i16 -23731, i16 -22594, i16 -23170, i16 -23170, i16 -22594, i16 -23731, i16 -22005, i16 -24279, i16 -21403, i16 -24811, i16 -20787, i16 -25329, i16 -20159, i16 -25832, i16 -19519, i16 -26319, i16 -18868, i16 -26790, i16 -18204, i16 -27245, i16 -17530, i16 -27683, i16 -16846, i16 -28105, i16 -16151, i16 -28510, i16 -15446, i16 -28898, i16 -14732, i16 -29268, i16 -14010, i16 -29621, i16 -13279, i16 -29956, i16 -12539, i16 -30273, i16 -11793, i16 -30571, i16 -11039, i16 -30852, i16 -10278, i16 -31113, i16 -9512, i16 -31356, i16 -8739, i16 -31580, i16 -7962, i16 -31785, i16 -7179, i16 -31971, i16 -6393, i16 -32137, i16 -5602, i16 -32285, i16 -4808, i16 -32412, i16 -4011, i16 -32521, i16 -3212, i16 -32609, i16 -2410, i16 -32678, i16 -1608, i16 -32728, i16 -804, i16 -32757], align 2
@radarCubeBuf = common global [98304 x %struct.cmplx16ImRe_t_] zeroinitializer, align 2

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
  call void @llvm.dbg.declare(metadata !{i8** %base.addr}, metadata !61), !dbg !62
  store i32 %num, i32* %num.addr, align 4
  call void @llvm.dbg.declare(metadata !{i32* %num.addr}, metadata !63), !dbg !64
  store i32 %wid, i32* %wid.addr, align 4
  call void @llvm.dbg.declare(metadata !{i32* %wid.addr}, metadata !65), !dbg !66
  %0 = load i32* %wid.addr, align 4, !dbg !67
  switch i32 %0, label %sw.default [
    i32 1, label %sw.bb
    i32 2, label %sw.bb1
    i32 4, label %sw.bb12
  ], !dbg !67

sw.bb:                                            ; preds = %entry
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !68), !dbg !71
  store i32 0, i32* %i, align 4, !dbg !72
  br label %for.cond, !dbg !72

for.cond:                                         ; preds = %for.inc, %sw.bb
  %1 = load i32* %i, align 4, !dbg !72
  %2 = load i32* %num.addr, align 4, !dbg !72
  %cmp = icmp slt i32 %1, %2, !dbg !72
  br i1 %cmp, label %for.body, label %for.end, !dbg !72

for.body:                                         ; preds = %for.cond
  %3 = load i32* %i, align 4, !dbg !73
  %4 = load i8** %base.addr, align 4, !dbg !73
  %arrayidx = getelementptr inbounds i8* %4, i32 %3, !dbg !73
  %5 = load i8* %arrayidx, align 1, !dbg !73
  %conv = sext i8 %5 to i32, !dbg !73
  %6 = load i32** @dbg_addr, align 4, !dbg !73
  store i32 %conv, i32* %6, align 4, !dbg !73
  br label %for.inc, !dbg !73

for.inc:                                          ; preds = %for.body
  %7 = load i32* %i, align 4, !dbg !74
  %inc = add nsw i32 %7, 1, !dbg !74
  store i32 %inc, i32* %i, align 4, !dbg !74
  br label %for.cond, !dbg !74

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %retval, !dbg !75
  br label %return, !dbg !75

sw.bb1:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata !{i32* %i2}, metadata !76), !dbg !78
  store i32 0, i32* %i2, align 4, !dbg !79
  br label %for.cond3, !dbg !79

for.cond3:                                        ; preds = %for.inc9, %sw.bb1
  %8 = load i32* %i2, align 4, !dbg !79
  %9 = load i32* %num.addr, align 4, !dbg !79
  %cmp4 = icmp slt i32 %8, %9, !dbg !79
  br i1 %cmp4, label %for.body6, label %for.end11, !dbg !79

for.body6:                                        ; preds = %for.cond3
  %10 = load i32* %i2, align 4, !dbg !80
  %11 = load i8** %base.addr, align 4, !dbg !80
  %12 = bitcast i8* %11 to i16*, !dbg !80
  %arrayidx7 = getelementptr inbounds i16* %12, i32 %10, !dbg !80
  %13 = load i16* %arrayidx7, align 2, !dbg !80
  %conv8 = sext i16 %13 to i32, !dbg !80
  %14 = load i32** @dbg_addr, align 4, !dbg !80
  store i32 %conv8, i32* %14, align 4, !dbg !80
  br label %for.inc9, !dbg !80

for.inc9:                                         ; preds = %for.body6
  %15 = load i32* %i2, align 4, !dbg !81
  %inc10 = add nsw i32 %15, 1, !dbg !81
  store i32 %inc10, i32* %i2, align 4, !dbg !81
  br label %for.cond3, !dbg !81

for.end11:                                        ; preds = %for.cond3
  store i32 0, i32* %retval, !dbg !82
  br label %return, !dbg !82

sw.bb12:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata !{i32* %i13}, metadata !83), !dbg !85
  store i32 0, i32* %i13, align 4, !dbg !86
  br label %for.cond14, !dbg !86

for.cond14:                                       ; preds = %for.inc19, %sw.bb12
  %16 = load i32* %i13, align 4, !dbg !86
  %17 = load i32* %num.addr, align 4, !dbg !86
  %cmp15 = icmp slt i32 %16, %17, !dbg !86
  br i1 %cmp15, label %for.body17, label %for.end21, !dbg !86

for.body17:                                       ; preds = %for.cond14
  %18 = load i32* %i13, align 4, !dbg !87
  %19 = load i8** %base.addr, align 4, !dbg !87
  %20 = bitcast i8* %19 to i32*, !dbg !87
  %arrayidx18 = getelementptr inbounds i32* %20, i32 %18, !dbg !87
  %21 = load i32* %arrayidx18, align 4, !dbg !87
  %22 = load i32** @dbg_addr, align 4, !dbg !87
  store i32 %21, i32* %22, align 4, !dbg !87
  br label %for.inc19, !dbg !87

for.inc19:                                        ; preds = %for.body17
  %23 = load i32* %i13, align 4, !dbg !88
  %inc20 = add nsw i32 %23, 1, !dbg !88
  store i32 %inc20, i32* %i13, align 4, !dbg !88
  br label %for.cond14, !dbg !88

for.end21:                                        ; preds = %for.cond14
  store i32 0, i32* %retval, !dbg !89
  br label %return, !dbg !89

sw.default:                                       ; preds = %entry
  store i32 -1, i32* %retval, !dbg !90
  br label %return, !dbg !90

return:                                           ; preds = %sw.default, %for.end21, %for.end11, %for.end
  %24 = load i32* %retval, !dbg !91
  ret i32 %24, !dbg !91
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %retval.i = alloca i32, align 4, !dbg !92
  %vpnum.addr.i = alloca i32, align 4, !dbg !92
  %vpsel.i = alloca i32*, align 4, !dbg !92
  %retval = alloca i32, align 4
  %chirpCount = alloca i32, align 4
  %chirpIdx = alloca i32, align 4
  %totalChirpIndex = alloca i32, align 4
  %totalRxChirps = alloca i32, align 4
  %txChirpIdx = alloca i32, align 4
  %totalTxChirps = alloca i32, align 4
  %rxChanId = alloca i32, align 4
  %txChanId = alloca i32, align 4
  %fftSrcAddr = alloca i16*, align 4
  %fftDestAddr = alloca i16*, align 4
  %fftSrcAddrC = alloca %struct.cmplx16ImRe_t_*, align 4
  %twiddle16x16 = alloca [256 x i16], align 2
  %radarCubeAddr = alloca %struct.cmplx16ImRe_t_*, align 4
  %radaDataInpAddr = alloca %struct.cmplx16ImRe_t_*, align 4
  store i32 0, i32* %retval
  store i32 4, i32* %vpnum.addr.i, align 4, !dbg !92
  call void @llvm.dbg.declare(metadata !{i32* %vpnum.addr.i}, metadata !93), !dbg !94
  call void @llvm.dbg.declare(metadata !{i32** %vpsel.i}, metadata !95), !dbg !96
  store i32* inttoptr (i32 8336896 to i32*), i32** %vpsel.i, align 4, !dbg !97
  %0 = load i32* %vpnum.addr.i, align 4, !dbg !98
  switch i32 %0, label %sw.default.i [
    i32 0, label %sw.bb.i
    i32 1, label %sw.bb1.i
    i32 2, label %sw.bb2.i
    i32 3, label %sw.bb3.i
    i32 4, label %sw.bb4.i
  ], !dbg !98

sw.bb.i:                                          ; preds = %entry
  %1 = load i32** %vpsel.i, align 4, !dbg !99
  store i32 0, i32* %1, align 4, !dbg !99
  br label %sw.epilog.i, !dbg !101

sw.bb1.i:                                         ; preds = %entry
  %2 = load i32** %vpsel.i, align 4, !dbg !102
  store i32 1, i32* %2, align 4, !dbg !102
  br label %sw.epilog.i, !dbg !103

sw.bb2.i:                                         ; preds = %entry
  %3 = load i32** %vpsel.i, align 4, !dbg !104
  store i32 3, i32* %3, align 4, !dbg !104
  br label %sw.epilog.i, !dbg !105

sw.bb3.i:                                         ; preds = %entry
  %4 = load i32** %vpsel.i, align 4, !dbg !106
  store i32 7, i32* %4, align 4, !dbg !106
  br label %sw.epilog.i, !dbg !107

sw.bb4.i:                                         ; preds = %entry
  %5 = load i32** %vpsel.i, align 4, !dbg !108
  store i32 15, i32* %5, align 4, !dbg !108
  br label %sw.epilog.i, !dbg !109

sw.default.i:                                     ; preds = %entry
  store i32 -1, i32* %retval.i, !dbg !110
  br label %set_vpsel.exit, !dbg !110

sw.epilog.i:                                      ; preds = %sw.bb4.i, %sw.bb3.i, %sw.bb2.i, %sw.bb1.i, %sw.bb.i
  store i32 1, i32* %retval.i, !dbg !111
  br label %set_vpsel.exit, !dbg !111

set_vpsel.exit:                                   ; preds = %sw.default.i, %sw.epilog.i
  %6 = load i32* %retval.i, !dbg !112
  call void @llvm.dbg.declare(metadata !{i32* %chirpCount}, metadata !113), !dbg !114
  store i32 0, i32* %chirpCount, align 4, !dbg !115
  call void @llvm.dbg.declare(metadata !{i32* %chirpIdx}, metadata !116), !dbg !117
  store i32 0, i32* %chirpIdx, align 4, !dbg !115
  call void @llvm.dbg.declare(metadata !{i32* %totalChirpIndex}, metadata !118), !dbg !119
  store i32 0, i32* %totalChirpIndex, align 4, !dbg !115
  call void @llvm.dbg.declare(metadata !{i32* %totalRxChirps}, metadata !120), !dbg !121
  store i32 0, i32* %totalRxChirps, align 4, !dbg !115
  call void @llvm.dbg.declare(metadata !{i32* %txChirpIdx}, metadata !122), !dbg !123
  store i32 0, i32* %txChirpIdx, align 4, !dbg !124
  call void @llvm.dbg.declare(metadata !{i32* %totalTxChirps}, metadata !125), !dbg !126
  store i32 32, i32* %totalTxChirps, align 4, !dbg !124
  call void @llvm.dbg.declare(metadata !{i32* %rxChanId}, metadata !127), !dbg !128
  store i32 0, i32* %rxChanId, align 4, !dbg !129
  call void @llvm.dbg.declare(metadata !{i32* %txChanId}, metadata !130), !dbg !131
  store i32 0, i32* %txChanId, align 4, !dbg !129
  store i32 0, i32* %txChirpIdx, align 4, !dbg !132
  br label %for.cond, !dbg !132

for.cond:                                         ; preds = %for.inc59, %set_vpsel.exit
  %7 = load i32* %txChirpIdx, align 4, !dbg !132
  %8 = load i32* %totalTxChirps, align 4, !dbg !132
  %cmp = icmp slt i32 %7, %8, !dbg !132
  br i1 %cmp, label %for.body, label %for.end61, !dbg !132

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %txChanId, align 4, !dbg !134
  br label %for.cond1, !dbg !134

for.cond1:                                        ; preds = %for.inc56, %for.body
  %9 = load i32* %txChanId, align 4, !dbg !134
  %cmp2 = icmp slt i32 %9, 3, !dbg !134
  br i1 %cmp2, label %for.body3, label %for.end58, !dbg !134

for.body3:                                        ; preds = %for.cond1
  store i32 0, i32* %rxChanId, align 4, !dbg !137
  br label %for.cond4, !dbg !137

for.cond4:                                        ; preds = %for.inc, %for.body3
  %10 = load i32* %rxChanId, align 4, !dbg !137
  %cmp5 = icmp slt i32 %10, 4, !dbg !137
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !137

for.body6:                                        ; preds = %for.cond4
  call void @llvm.dbg.declare(metadata !{i16** %fftSrcAddr}, metadata !140), !dbg !143
  call void @llvm.dbg.declare(metadata !{i16** %fftDestAddr}, metadata !144), !dbg !145
  %11 = load i32* %totalChirpIndex, align 4, !dbg !146
  %rem = srem i32 %11, 8, !dbg !146
  %cmp7 = icmp eq i32 %rem, 0, !dbg !146
  br i1 %cmp7, label %if.then, label %if.end, !dbg !146

if.then:                                          ; preds = %for.body6
  %12 = load i32* %totalChirpIndex, align 4, !dbg !148
  %div = sdiv i32 %12, 8, !dbg !148
  %and = and i32 %div, 1, !dbg !148
  %mul = mul i32 %and, 256, !dbg !148
  %mul8 = mul i32 %mul, 8, !dbg !148
  %add.ptr = getelementptr inbounds %struct.cmplx16ImRe_t_* getelementptr inbounds ([4096 x %struct.cmplx16ImRe_t_]* @adcDataBuf, i32 0, i32 0), i32 %mul8, !dbg !148
  %13 = bitcast %struct.cmplx16ImRe_t_* %add.ptr to i8*, !dbg !148
  %14 = load i32* %totalChirpIndex, align 4, !dbg !148
  %div9 = sdiv i32 %14, 8, !dbg !148
  %mul10 = mul nsw i32 %div9, 256, !dbg !148
  %mul11 = mul nsw i32 %mul10, 8, !dbg !148
  %mul12 = mul nsw i32 %mul11, 2, !dbg !148
  %add.ptr13 = getelementptr inbounds i16* getelementptr inbounds ([196608 x i16]* @dataMem, i32 0, i32 0), i32 %mul12, !dbg !148
  %15 = bitcast i16* %add.ptr13 to i8*, !dbg !148
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %13, i8* %15, i32 8192, i32 2, i1 false), !dbg !148
  br label %if.end, !dbg !150

if.end:                                           ; preds = %if.then, %for.body6
  %16 = load i32* %totalChirpIndex, align 4, !dbg !151
  %and14 = and i32 %16, 1, !dbg !151
  %mul15 = mul i32 %and14, 256, !dbg !151
  %add.ptr16 = getelementptr inbounds %struct.cmplx16ImRe_t_* getelementptr inbounds ([512 x %struct.cmplx16ImRe_t_]* @adcDataIn, i32 0, i32 0), i32 %mul15, !dbg !151
  %17 = bitcast %struct.cmplx16ImRe_t_* %add.ptr16 to i8*, !dbg !151
  %18 = load i32* %totalChirpIndex, align 4, !dbg !151
  %div17 = sdiv i32 %18, 8, !dbg !151
  %and18 = and i32 %div17, 1, !dbg !151
  %mul19 = mul i32 %and18, 256, !dbg !151
  %mul20 = mul i32 %mul19, 8, !dbg !151
  %add.ptr21 = getelementptr inbounds %struct.cmplx16ImRe_t_* getelementptr inbounds ([4096 x %struct.cmplx16ImRe_t_]* @adcDataBuf, i32 0, i32 0), i32 %mul20, !dbg !151
  %19 = load i32* %totalChirpIndex, align 4, !dbg !151
  %rem22 = srem i32 %19, 8, !dbg !151
  %mul23 = mul nsw i32 %rem22, 256, !dbg !151
  %add.ptr24 = getelementptr inbounds %struct.cmplx16ImRe_t_* %add.ptr21, i32 %mul23, !dbg !151
  %20 = bitcast %struct.cmplx16ImRe_t_* %add.ptr24 to i8*, !dbg !151
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %17, i8* %20, i32 1024, i32 2, i1 false), !dbg !151
  call void @llvm.dbg.declare(metadata !{%struct.cmplx16ImRe_t_** %fftSrcAddrC}, metadata !152), !dbg !154
  %21 = load i32* %totalChirpIndex, align 4, !dbg !155
  %and25 = and i32 %21, 1, !dbg !155
  %mul26 = mul i32 %and25, 256, !dbg !155
  %arrayidx = getelementptr inbounds [512 x %struct.cmplx16ImRe_t_]* @adcDataIn, i32 0, i32 %mul26, !dbg !155
  store %struct.cmplx16ImRe_t_* %arrayidx, %struct.cmplx16ImRe_t_** %fftSrcAddrC, align 4, !dbg !155
  %22 = load i32* %totalChirpIndex, align 4, !dbg !156
  %and27 = and i32 %22, 1, !dbg !156
  %mul28 = mul i32 %and27, 256, !dbg !156
  %arrayidx29 = getelementptr inbounds [512 x %struct.cmplx16ImRe_t_]* @adcDataIn, i32 0, i32 %mul28, !dbg !156
  %23 = bitcast %struct.cmplx16ImRe_t_* %arrayidx29 to i16*, !dbg !156
  store i16* %23, i16** %fftSrcAddr, align 4, !dbg !156
  %24 = load i32* %totalChirpIndex, align 4, !dbg !157
  %div30 = sdiv i32 %24, 4, !dbg !157
  %and31 = and i32 %div30, 1, !dbg !157
  %mul32 = mul i32 %and31, 4, !dbg !157
  %mul33 = mul i32 %mul32, 256, !dbg !157
  %25 = load i32* %rxChanId, align 4, !dbg !157
  %mul34 = mul nsw i32 256, %25, !dbg !157
  %add = add i32 %mul33, %mul34, !dbg !157
  %arrayidx35 = getelementptr inbounds [2048 x %struct.cmplx16ImRe_t_]* @fftOut1D, i32 0, i32 %add, !dbg !157
  %26 = bitcast %struct.cmplx16ImRe_t_* %arrayidx35 to i16*, !dbg !157
  store i16* %26, i16** %fftDestAddr, align 4, !dbg !157
  %27 = load i32* %rxChanId, align 4, !dbg !158
  %cmp36 = icmp ult i32 %27, 3, !dbg !158
  br i1 %cmp36, label %if.then37, label %if.end38, !dbg !158

if.then37:                                        ; preds = %if.end
  br label %if.end38, !dbg !160

if.end38:                                         ; preds = %if.then37, %if.end
  call void @llvm.dbg.declare(metadata !{[256 x i16]* %twiddle16x16}, metadata !162), !dbg !163
  %28 = bitcast [256 x i16]* %twiddle16x16 to i8*, !dbg !164
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %28, i8* bitcast ([256 x i16]* @main.twiddle16x16 to i8*), i32 512, i32 2, i1 false), !dbg !164
  %29 = load i16** %fftSrcAddr, align 4, !dbg !165
  %arraydecay = getelementptr inbounds [256 x i16]* %twiddle16x16, i32 0, i32 0, !dbg !165
  call void @fft_16x16(i16* %29, i16* %arraydecay, i32 256), !dbg !165
  %30 = load i16** %fftDestAddr, align 4, !dbg !166
  %31 = bitcast i16* %30 to i8*, !dbg !166
  %32 = load i16** %fftSrcAddr, align 4, !dbg !166
  %33 = bitcast i16* %32 to i8*, !dbg !166
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %31, i8* %33, i32 1024, i32 2, i1 false), !dbg !166
  %34 = load i32* %rxChanId, align 4, !dbg !167
  %cmp39 = icmp eq i32 %34, 3, !dbg !167
  br i1 %cmp39, label %if.then40, label %if.end54, !dbg !167

if.then40:                                        ; preds = %if.end38
  call void @llvm.dbg.declare(metadata !{%struct.cmplx16ImRe_t_** %radarCubeAddr}, metadata !169), !dbg !171
  call void @llvm.dbg.declare(metadata !{%struct.cmplx16ImRe_t_** %radaDataInpAddr}, metadata !172), !dbg !173
  %35 = load i32* %totalChirpIndex, align 4, !dbg !174
  %div41 = sdiv i32 %35, 4, !dbg !174
  %and42 = and i32 %div41, 1, !dbg !174
  %mul43 = mul i32 %and42, 4, !dbg !174
  %mul44 = mul i32 %mul43, 256, !dbg !174
  %add.ptr45 = getelementptr inbounds %struct.cmplx16ImRe_t_* getelementptr inbounds ([2048 x %struct.cmplx16ImRe_t_]* @fftOut1D, i32 0, i32 0), i32 %mul44, !dbg !174
  store %struct.cmplx16ImRe_t_* %add.ptr45, %struct.cmplx16ImRe_t_** %radaDataInpAddr, align 4, !dbg !174
  %36 = load i32* %txChanId, align 4, !dbg !175
  %mul46 = mul nsw i32 %36, 4, !dbg !175
  %mul47 = mul nsw i32 %mul46, 256, !dbg !175
  %mul48 = mul nsw i32 %mul47, 32, !dbg !175
  %add.ptr49 = getelementptr inbounds %struct.cmplx16ImRe_t_* getelementptr inbounds ([98304 x %struct.cmplx16ImRe_t_]* @radarCubeBuf, i32 0, i32 0), i32 %mul48, !dbg !175
  %37 = load i32* %totalChirpIndex, align 4, !dbg !175
  %div50 = sdiv i32 %37, 12, !dbg !175
  %mul51 = mul nsw i32 %div50, 256, !dbg !175
  %mul52 = mul nsw i32 %mul51, 4, !dbg !175
  %add.ptr53 = getelementptr inbounds %struct.cmplx16ImRe_t_* %add.ptr49, i32 %mul52, !dbg !175
  store %struct.cmplx16ImRe_t_* %add.ptr53, %struct.cmplx16ImRe_t_** %radarCubeAddr, align 4, !dbg !175
  %38 = load %struct.cmplx16ImRe_t_** %radarCubeAddr, align 4, !dbg !176
  %39 = bitcast %struct.cmplx16ImRe_t_* %38 to i8*, !dbg !176
  %40 = load %struct.cmplx16ImRe_t_** %radaDataInpAddr, align 4, !dbg !176
  %41 = bitcast %struct.cmplx16ImRe_t_* %40 to i8*, !dbg !176
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %39, i8* %41, i32 4096, i32 2, i1 false), !dbg !176
  br label %if.end54, !dbg !177

if.end54:                                         ; preds = %if.then40, %if.end38
  %42 = load i32* %totalChirpIndex, align 4, !dbg !178
  %inc = add nsw i32 %42, 1, !dbg !178
  store i32 %inc, i32* %totalChirpIndex, align 4, !dbg !178
  br label %for.inc, !dbg !179

for.inc:                                          ; preds = %if.end54
  %43 = load i32* %rxChanId, align 4, !dbg !180
  %inc55 = add nsw i32 %43, 1, !dbg !180
  store i32 %inc55, i32* %rxChanId, align 4, !dbg !180
  br label %for.cond4, !dbg !180

for.end:                                          ; preds = %for.cond4
  br label %for.inc56, !dbg !181

for.inc56:                                        ; preds = %for.end
  %44 = load i32* %txChanId, align 4, !dbg !182
  %inc57 = add nsw i32 %44, 1, !dbg !182
  store i32 %inc57, i32* %txChanId, align 4, !dbg !182
  br label %for.cond1, !dbg !182

for.end58:                                        ; preds = %for.cond1
  br label %for.inc59, !dbg !183

for.inc59:                                        ; preds = %for.end58
  %45 = load i32* %txChirpIdx, align 4, !dbg !184
  %inc60 = add nsw i32 %45, 1, !dbg !184
  store i32 %inc60, i32* %txChirpIdx, align 4, !dbg !184
  br label %for.cond, !dbg !184

for.end61:                                        ; preds = %for.cond
  call void @dopplerandcfar(%struct.cmplx16ImRe_t_* getelementptr inbounds ([98304 x %struct.cmplx16ImRe_t_]* @radarCubeBuf, i32 0, i32 0)), !dbg !185
  ret i32 0, !dbg !186
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture, i8* nocapture readonly, i32, i32, i1) #2

declare void @fft_16x16(i16*, i16*, i32) #3

declare void @dopplerandcfar(%struct.cmplx16ImRe_t_*) #3

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!58, !59}
!llvm.ident = !{!60}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.0 (tags/RELEASE_350/final)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !20, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [D:\eclipse\workspace\dss\Release/..\dss.c] [DW_LANG_C99]
!1 = metadata !{metadata !"..\5Cdss.c", metadata !"D:\5Ceclipse\5Cworkspace\5Cdss\5CRelease"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !11, metadata !15}
!4 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"dbg_output", metadata !"dbg_output", metadata !"", i32 12, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i8*, i32, i32)* @dbg_output, null, null, metadata !2, i32 12} ; [ DW_TAG_subprogram ] [line 12] [def] [dbg_output]
!5 = metadata !{metadata !"D:\5CCIC\5CSwift_IDE_Toolchain\5Ctoolchain_8slot\5Cinclude\5Cswift_debug.h", metadata !"D:\5Ceclipse\5Cworkspace\5Cdss\5CRelease"}
!6 = metadata !{i32 786473, metadata !5}          ; [ DW_TAG_file_type ] [D:\eclipse\workspace\dss\Release/D:\CIC\Swift_IDE_Toolchain\toolchain_8slot\include\swift_debug.h]
!7 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{metadata !9, metadata !10, metadata !9, metadata !9}
!9 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 32, i64 32, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 32, align 32, offset 0] [from ]
!11 = metadata !{i32 786478, metadata !1, metadata !12, metadata !"main", metadata !"main", metadata !"", i32 60, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 60} ; [ DW_TAG_subprogram ] [line 60] [def] [main]
!12 = metadata !{i32 786473, metadata !1}         ; [ DW_TAG_file_type ] [D:\eclipse\workspace\dss\Release/..\dss.c]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{metadata !9}
!15 = metadata !{i32 786478, metadata !16, metadata !17, metadata !"set_vpsel", metadata !"set_vpsel", metadata !"", i32 13, metadata !18, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !2, i32 13} ; [ DW_TAG_subprogram ] [line 13] [def] [set_vpsel]
!16 = metadata !{metadata !"D:\5CCIC\5CSwift_IDE_Toolchain\5Ctoolchain_8slot\5Cinclude\5Cswift_math.h", metadata !"D:\5Ceclipse\5Cworkspace\5Cdss\5CRelease"}
!17 = metadata !{i32 786473, metadata !16}        ; [ DW_TAG_file_type ] [D:\eclipse\workspace\dss\Release/D:\CIC\Swift_IDE_Toolchain\toolchain_8slot\include\swift_math.h]
!18 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !19, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!19 = metadata !{metadata !9, metadata !9}
!20 = metadata !{metadata !21, metadata !25, metadata !30, metadata !34, metadata !46, metadata !50, metadata !54}
!21 = metadata !{i32 786484, i32 0, null, metadata !"dbg_addr", metadata !"dbg_addr", metadata !"", metadata !6, i32 4, metadata !22, i32 0, i32 1, i32** @dbg_addr, null} ; [ DW_TAG_variable ] [dbg_addr] [line 4] [def]
!22 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !23} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!23 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 32, i64 32, i64 0, i32 0, metadata !24} ; [ DW_TAG_pointer_type ] [line 0, size 32, align 32, offset 0] [from unsigned int]
!24 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!25 = metadata !{i32 786484, i32 0, null, metadata !"dataMem", metadata !"dataMem", metadata !"", metadata !12, i32 51, metadata !26, i32 0, i32 1, [196608 x i16]* @dataMem, null} ; [ DW_TAG_variable ] [dataMem] [line 51] [def]
!26 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 3145728, i64 16, i32 0, i32 0, metadata !27, metadata !28, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 3145728, align 16, offset 0] [from short]
!27 = metadata !{i32 786468, null, null, metadata !"short", i32 0, i64 16, i64 16, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [short] [line 0, size 16, align 16, offset 0, enc DW_ATE_signed]
!28 = metadata !{metadata !29}
!29 = metadata !{i32 786465, i64 0, i64 196608}   ; [ DW_TAG_subrange_type ] [0, 196607]
!30 = metadata !{i32 786484, i32 0, null, metadata !"window", metadata !"window", metadata !"", metadata !12, i32 55, metadata !31, i32 0, i32 1, [256 x i16]* @window, null} ; [ DW_TAG_variable ] [window] [line 55] [def]
!31 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 4096, i64 16, i32 0, i32 0, metadata !27, metadata !32, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 4096, align 16, offset 0] [from short]
!32 = metadata !{metadata !33}
!33 = metadata !{i32 786465, i64 0, i64 256}      ; [ DW_TAG_subrange_type ] [0, 255]
!34 = metadata !{i32 786484, i32 0, null, metadata !"adcDataBuf", metadata !"adcDataBuf", metadata !"", metadata !12, i32 40, metadata !35, i32 0, i32 1, [4096 x %struct.cmplx16ImRe_t_]* @adcDataBuf, null} ; [ DW_TAG_variable ] [adcDataBuf] [line 40] [def]
!35 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 131072, i64 16, i32 0, i32 0, metadata !36, metadata !44, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 131072, align 16, offset 0] [from cmplx16ImRe_t]
!36 = metadata !{i32 786454, metadata !37, null, metadata !"cmplx16ImRe_t", i32 9, i64 0, i64 0, i64 0, i32 0, metadata !38} ; [ DW_TAG_typedef ] [cmplx16ImRe_t] [line 9, size 0, align 0, offset 0] [from cmplx16ImRe_t_]
!37 = metadata !{metadata !"../mmwave_lib.h", metadata !"D:\5Ceclipse\5Cworkspace\5Cdss\5CRelease"}
!38 = metadata !{i32 786451, metadata !37, null, metadata !"cmplx16ImRe_t_", i32 5, i64 32, i64 16, i32 0, i32 0, null, metadata !39, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [cmplx16ImRe_t_] [line 5, size 32, align 16, offset 0] [def] [from ]
!39 = metadata !{metadata !40, metadata !43}
!40 = metadata !{i32 786445, metadata !37, metadata !38, metadata !"imag", i32 7, i64 16, i64 16, i64 0, i32 0, metadata !41} ; [ DW_TAG_member ] [imag] [line 7, size 16, align 16, offset 0] [from int16_t]
!41 = metadata !{i32 786454, metadata !42, null, metadata !"int16_t", i32 31, i64 0, i64 0, i64 0, i32 0, metadata !27} ; [ DW_TAG_typedef ] [int16_t] [line 31, size 0, align 0, offset 0] [from short]
!42 = metadata !{metadata !"D:\5CCIC\5CSwift_IDE_Toolchain\5Ctoolchain_8slot\5Cinclude\5Ctypes/int16_t.h", metadata !"D:\5Ceclipse\5Cworkspace\5Cdss\5CRelease"}
!43 = metadata !{i32 786445, metadata !37, metadata !38, metadata !"real", i32 8, i64 16, i64 16, i64 16, i32 0, metadata !41} ; [ DW_TAG_member ] [real] [line 8, size 16, align 16, offset 16] [from int16_t]
!44 = metadata !{metadata !45}
!45 = metadata !{i32 786465, i64 0, i64 4096}     ; [ DW_TAG_subrange_type ] [0, 4095]
!46 = metadata !{i32 786484, i32 0, null, metadata !"adcDataIn", metadata !"adcDataIn", metadata !"", metadata !12, i32 41, metadata !47, i32 0, i32 1, [512 x %struct.cmplx16ImRe_t_]* @adcDataIn, null} ; [ DW_TAG_variable ] [adcDataIn] [line 41] [def]
!47 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 16384, i64 16, i32 0, i32 0, metadata !36, metadata !48, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16384, align 16, offset 0] [from cmplx16ImRe_t]
!48 = metadata !{metadata !49}
!49 = metadata !{i32 786465, i64 0, i64 512}      ; [ DW_TAG_subrange_type ] [0, 511]
!50 = metadata !{i32 786484, i32 0, null, metadata !"fftOut1D", metadata !"fftOut1D", metadata !"", metadata !12, i32 42, metadata !51, i32 0, i32 1, [2048 x %struct.cmplx16ImRe_t_]* @fftOut1D, null} ; [ DW_TAG_variable ] [fftOut1D] [line 42] [def]
!51 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 65536, i64 16, i32 0, i32 0, metadata !36, metadata !52, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 65536, align 16, offset 0] [from cmplx16ImRe_t]
!52 = metadata !{metadata !53}
!53 = metadata !{i32 786465, i64 0, i64 2048}     ; [ DW_TAG_subrange_type ] [0, 2047]
!54 = metadata !{i32 786484, i32 0, null, metadata !"radarCubeBuf", metadata !"radarCubeBuf", metadata !"", metadata !12, i32 43, metadata !55, i32 0, i32 1, [98304 x %struct.cmplx16ImRe_t_]* @radarCubeBuf, null} ; [ DW_TAG_variable ] [radarCubeBuf] [line 43] [def]
!55 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 3145728, i64 16, i32 0, i32 0, metadata !36, metadata !56, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 3145728, align 16, offset 0] [from cmplx16ImRe_t]
!56 = metadata !{metadata !57}
!57 = metadata !{i32 786465, i64 0, i64 98304}    ; [ DW_TAG_subrange_type ] [0, 98303]
!58 = metadata !{i32 2, metadata !"Dwarf Version", i32 2}
!59 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!60 = metadata !{metadata !"clang version 3.5.0 (tags/RELEASE_350/final)"}
!61 = metadata !{i32 786689, metadata !4, metadata !"base", metadata !6, i32 16777228, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [base] [line 12]
!62 = metadata !{i32 12, i32 22, metadata !4, null}
!63 = metadata !{i32 786689, metadata !4, metadata !"num", metadata !6, i32 33554444, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [num] [line 12]
!64 = metadata !{i32 12, i32 32, metadata !4, null}
!65 = metadata !{i32 786689, metadata !4, metadata !"wid", metadata !6, i32 50331660, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wid] [line 12]
!66 = metadata !{i32 12, i32 41, metadata !4, null}
!67 = metadata !{i32 13, i32 2, metadata !4, null}
!68 = metadata !{i32 786688, metadata !69, metadata !"i", metadata !6, i32 15, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 15]
!69 = metadata !{i32 786443, metadata !5, metadata !70, i32 15, i32 3, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/D:\CIC\Swift_IDE_Toolchain\toolchain_8slot\include\swift_debug.h]
!70 = metadata !{i32 786443, metadata !5, metadata !4, i32 13, i32 14, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/D:\CIC\Swift_IDE_Toolchain\toolchain_8slot\include\swift_debug.h]
!71 = metadata !{i32 15, i32 11, metadata !69, null}
!72 = metadata !{i32 15, i32 7, metadata !69, null}
!73 = metadata !{i32 16, i32 4, metadata !69, null}
!74 = metadata !{i32 15, i32 23, metadata !69, null}
!75 = metadata !{i32 17, i32 3, metadata !70, null}
!76 = metadata !{i32 786688, metadata !77, metadata !"i", metadata !6, i32 19, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 19]
!77 = metadata !{i32 786443, metadata !5, metadata !70, i32 19, i32 3, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/D:\CIC\Swift_IDE_Toolchain\toolchain_8slot\include\swift_debug.h]
!78 = metadata !{i32 19, i32 11, metadata !77, null}
!79 = metadata !{i32 19, i32 7, metadata !77, null}
!80 = metadata !{i32 20, i32 4, metadata !77, null}
!81 = metadata !{i32 19, i32 23, metadata !77, null}
!82 = metadata !{i32 21, i32 3, metadata !70, null}
!83 = metadata !{i32 786688, metadata !84, metadata !"i", metadata !6, i32 23, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 23]
!84 = metadata !{i32 786443, metadata !5, metadata !70, i32 23, i32 3, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/D:\CIC\Swift_IDE_Toolchain\toolchain_8slot\include\swift_debug.h]
!85 = metadata !{i32 23, i32 11, metadata !84, null}
!86 = metadata !{i32 23, i32 7, metadata !84, null}
!87 = metadata !{i32 24, i32 4, metadata !84, null}
!88 = metadata !{i32 23, i32 23, metadata !84, null}
!89 = metadata !{i32 25, i32 3, metadata !70, null}
!90 = metadata !{i32 27, i32 3, metadata !70, null}
!91 = metadata !{i32 29, i32 1, metadata !4, null}
!92 = metadata !{i32 61, i32 2, metadata !11, null}
!93 = metadata !{i32 786689, metadata !15, metadata !"vpnum", metadata !17, i32 16777229, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [vpnum] [line 13]
!94 = metadata !{i32 13, i32 26, metadata !15, metadata !92}
!95 = metadata !{i32 786688, metadata !15, metadata !"vpsel", metadata !17, i32 14, metadata !22, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [vpsel] [line 14]
!96 = metadata !{i32 14, i32 23, metadata !15, metadata !92}
!97 = metadata !{i32 14, i32 2, metadata !15, metadata !92}
!98 = metadata !{i32 15, i32 2, metadata !15, metadata !92}
!99 = metadata !{i32 16, i32 10, metadata !100, metadata !92}
!100 = metadata !{i32 786443, metadata !16, metadata !15, i32 15, i32 15, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/D:\CIC\Swift_IDE_Toolchain\toolchain_8slot\include\swift_math.h]
!101 = metadata !{i32 16, i32 23, metadata !100, metadata !92}
!102 = metadata !{i32 17, i32 10, metadata !100, metadata !92}
!103 = metadata !{i32 17, i32 23, metadata !100, metadata !92}
!104 = metadata !{i32 18, i32 10, metadata !100, metadata !92}
!105 = metadata !{i32 18, i32 23, metadata !100, metadata !92}
!106 = metadata !{i32 19, i32 10, metadata !100, metadata !92}
!107 = metadata !{i32 19, i32 23, metadata !100, metadata !92}
!108 = metadata !{i32 20, i32 10, metadata !100, metadata !92}
!109 = metadata !{i32 20, i32 23, metadata !100, metadata !92}
!110 = metadata !{i32 22, i32 3, metadata !100, metadata !92}
!111 = metadata !{i32 24, i32 2, metadata !15, metadata !92}
!112 = metadata !{i32 25, i32 1, metadata !15, metadata !92}
!113 = metadata !{i32 786688, metadata !11, metadata !"chirpCount", metadata !12, i32 62, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [chirpCount] [line 62]
!114 = metadata !{i32 62, i32 6, metadata !11, null}
!115 = metadata !{i32 62, i32 2, metadata !11, null}
!116 = metadata !{i32 786688, metadata !11, metadata !"chirpIdx", metadata !12, i32 62, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [chirpIdx] [line 62]
!117 = metadata !{i32 62, i32 22, metadata !11, null}
!118 = metadata !{i32 786688, metadata !11, metadata !"totalChirpIndex", metadata !12, i32 62, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [totalChirpIndex] [line 62]
!119 = metadata !{i32 62, i32 36, metadata !11, null}
!120 = metadata !{i32 786688, metadata !11, metadata !"totalRxChirps", metadata !12, i32 62, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [totalRxChirps] [line 62]
!121 = metadata !{i32 62, i32 57, metadata !11, null}
!122 = metadata !{i32 786688, metadata !11, metadata !"txChirpIdx", metadata !12, i32 63, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [txChirpIdx] [line 63]
!123 = metadata !{i32 63, i32 6, metadata !11, null}
!124 = metadata !{i32 63, i32 2, metadata !11, null}
!125 = metadata !{i32 786688, metadata !11, metadata !"totalTxChirps", metadata !12, i32 63, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [totalTxChirps] [line 63]
!126 = metadata !{i32 63, i32 22, metadata !11, null}
!127 = metadata !{i32 786688, metadata !11, metadata !"rxChanId", metadata !12, i32 66, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [rxChanId] [line 66]
!128 = metadata !{i32 66, i32 6, metadata !11, null}
!129 = metadata !{i32 66, i32 2, metadata !11, null}
!130 = metadata !{i32 786688, metadata !11, metadata !"txChanId", metadata !12, i32 66, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [txChanId] [line 66]
!131 = metadata !{i32 66, i32 20, metadata !11, null}
!132 = metadata !{i32 68, i32 7, metadata !133, null}
!133 = metadata !{i32 786443, metadata !1, metadata !11, i32 68, i32 2, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dss.c]
!134 = metadata !{i32 69, i32 7, metadata !135, null}
!135 = metadata !{i32 786443, metadata !1, metadata !136, i32 69, i32 3, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dss.c]
!136 = metadata !{i32 786443, metadata !1, metadata !133, i32 68, i32 65, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dss.c]
!137 = metadata !{i32 71, i32 9, metadata !138, null}
!138 = metadata !{i32 786443, metadata !1, metadata !139, i32 71, i32 4, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dss.c]
!139 = metadata !{i32 786443, metadata !1, metadata !135, i32 69, i32 50, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dss.c]
!140 = metadata !{i32 786688, metadata !141, metadata !"fftSrcAddr", metadata !12, i32 72, metadata !142, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [fftSrcAddr] [line 72]
!141 = metadata !{i32 786443, metadata !1, metadata !138, i32 71, i32 53, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dss.c]
!142 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 32, i64 32, i64 0, i32 0, metadata !41} ; [ DW_TAG_pointer_type ] [line 0, size 32, align 32, offset 0] [from int16_t]
!143 = metadata !{i32 72, i32 14, metadata !141, null}
!144 = metadata !{i32 786688, metadata !141, metadata !"fftDestAddr", metadata !12, i32 73, metadata !142, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [fftDestAddr] [line 73]
!145 = metadata !{i32 73, i32 14, metadata !141, null}
!146 = metadata !{i32 80, i32 8, metadata !147, null}
!147 = metadata !{i32 786443, metadata !1, metadata !141, i32 80, i32 8, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dss.c]
!148 = metadata !{i32 81, i32 6, metadata !149, null}
!149 = metadata !{i32 786443, metadata !1, metadata !147, i32 80, i32 41, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dss.c]
!150 = metadata !{i32 82, i32 5, metadata !149, null}
!151 = metadata !{i32 85, i32 5, metadata !141, null}
!152 = metadata !{i32 786688, metadata !141, metadata !"fftSrcAddrC", metadata !12, i32 88, metadata !153, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [fftSrcAddrC] [line 88]
!153 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 32, i64 32, i64 0, i32 0, metadata !36} ; [ DW_TAG_pointer_type ] [line 0, size 32, align 32, offset 0] [from cmplx16ImRe_t]
!154 = metadata !{i32 88, i32 20, metadata !141, null}
!155 = metadata !{i32 88, i32 5, metadata !141, null}
!156 = metadata !{i32 89, i32 5, metadata !141, null}
!157 = metadata !{i32 90, i32 5, metadata !141, null}
!158 = metadata !{i32 92, i32 8, metadata !159, null}
!159 = metadata !{i32 786443, metadata !1, metadata !141, i32 92, i32 8, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dss.c]
!160 = metadata !{i32 96, i32 5, metadata !161, null}
!161 = metadata !{i32 786443, metadata !1, metadata !159, i32 93, i32 5, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dss.c]
!162 = metadata !{i32 786688, metadata !141, metadata !"twiddle16x16", metadata !12, i32 112, metadata !31, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [twiddle16x16] [line 112]
!163 = metadata !{i32 112, i32 11, metadata !141, null}
!164 = metadata !{i32 112, i32 5, metadata !141, null}
!165 = metadata !{i32 116, i32 5, metadata !141, null}
!166 = metadata !{i32 120, i32 5, metadata !141, null}
!167 = metadata !{i32 134, i32 8, metadata !168, null}
!168 = metadata !{i32 786443, metadata !1, metadata !141, i32 134, i32 8, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dss.c]
!169 = metadata !{i32 786688, metadata !170, metadata !"radarCubeAddr", metadata !12, i32 135, metadata !153, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [radarCubeAddr] [line 135]
!170 = metadata !{i32 786443, metadata !1, metadata !168, i32 134, i32 30, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dss.c]
!171 = metadata !{i32 135, i32 21, metadata !170, null}
!172 = metadata !{i32 786688, metadata !170, metadata !"radaDataInpAddr", metadata !12, i32 136, metadata !153, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [radaDataInpAddr] [line 136]
!173 = metadata !{i32 136, i32 21, metadata !170, null}
!174 = metadata !{i32 140, i32 6, metadata !170, null}
!175 = metadata !{i32 141, i32 6, metadata !170, null}
!176 = metadata !{i32 142, i32 6, metadata !170, null}
!177 = metadata !{i32 143, i32 5, metadata !170, null}
!178 = metadata !{i32 146, i32 5, metadata !141, null}
!179 = metadata !{i32 147, i32 4, metadata !141, null}
!180 = metadata !{i32 71, i32 41, metadata !138, null}
!181 = metadata !{i32 148, i32 3, metadata !139, null}
!182 = metadata !{i32 69, i32 39, metadata !135, null}
!183 = metadata !{i32 149, i32 2, metadata !136, null}
!184 = metadata !{i32 68, i32 51, metadata !133, null}
!185 = metadata !{i32 151, i32 2, metadata !11, null}
!186 = metadata !{i32 153, i32 2, metadata !11, null}