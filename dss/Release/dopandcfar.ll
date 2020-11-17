; ModuleID = '..\dopandcfar.c'
target datalayout = "e-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
target triple = "dsp"

%struct.cmplx32ImRe_t_ = type { i32, i32 }
%struct.cfarpList_ = type { i16, i16, i16 }
%struct.cmplx16ImRe_t_ = type { i16, i16 }
%struct.cmplx32ReIm_t_ = type { i32, i32 }

@cfarDopplerDetOutBitMask = global [32 x i16] zeroinitializer, align 2
@Log2AbsBuf1 = common global [32 x i16] zeroinitializer, align 2
@Log2AbsBuf = global i16* getelementptr inbounds ([32 x i16]* @Log2AbsBuf1, i32 0, i32 0), align 4
@sumAbsBuf = global [32 x i16] zeroinitializer, align 2
@detMartrix1 = global [8192 x i16] zeroinitializer, align 2
@detMartrix = global i16* getelementptr inbounds ([8192 x i16]* @detMartrix1, i32 0, i32 0), align 4
@fftOutBuf1 = global [32 x %struct.cmplx32ImRe_t_] zeroinitializer, align 4
@window1 = global [64 x i32] [i32 2621, i32 2696, i32 2920, i32 3291, i32 3805, i32 4457, i32 5240, i32 6148, i32 7170, i32 8296, i32 9516, i32 10818, i32 12187, i32 13612, i32 15077, i32 16568, i32 18070, i32 19568, i32 21048, i32 22495, i32 23893, i32 25231, i32 26493, i32 27668, i32 28743, i32 29709, i32 30556, i32 31274, i32 31858, i32 32301, i32 32599, i32 32748, i32 32748, i32 32599, i32 32301, i32 31858, i32 31274, i32 30556, i32 29709, i32 28743, i32 27668, i32 26493, i32 25231, i32 23893, i32 22495, i32 21048, i32 19568, i32 18070, i32 16568, i32 15077, i32 13612, i32 12187, i32 10818, i32 9516, i32 8296, i32 7170, i32 6148, i32 5240, i32 4457, i32 3805, i32 3291, i32 2920, i32 2696, i32 2621], align 4
@localDetMatrixBuffer = common global [32 x i16] zeroinitializer, align 2
@cfarDetOut = common global [256 x i16] zeroinitializer, align 2
@cfardetect = common global [256 x %struct.cfarpList_] zeroinitializer, align 2
@pingPongBuf = common global [64 x %struct.cmplx16ImRe_t_] zeroinitializer, align 2
@sum = common global %struct.cmplx32ImRe_t_* null, align 4
@dcoutBuf = common global [32 x %struct.cmplx16ImRe_t_] zeroinitializer, align 2
@fftinBuf = common global [32 x %struct.cmplx32ImRe_t_] zeroinitializer, align 4
@fftOutBuf = common global %struct.cmplx32ImRe_t_* null, align 4
@cfarDetOutBuffer = common global [32 x i16] zeroinitializer, align 2
@radarCubeBase = common global %struct.cmplx16ImRe_t_* null, align 4
@windowingOutBuf = common global [64 x %struct.cmplx32ReIm_t_] zeroinitializer, align 4
@H = common global [256 x %struct.cmplx16ImRe_t_] zeroinitializer, align 2

; Function Attrs: nounwind
define signext i16 @cfar_doppler(i16* %detectmatrix) #0 {
entry:
  %detectmatrix.addr = alloca i16*, align 4
  %numDetObjPerCfar = alloca i16, align 2
  %numDetObjDoppler = alloca i16, align 2
  %detIndex = alloca i16, align 2
  %rangeIdx = alloca i16, align 2
  %Channel = alloca i16, align 2
  %thresholdScale = alloca i16, align 2
  %noiseDivShift = alloca i16, align 2
  %DopguardLen = alloca i16, align 2
  %DopwinLen = alloca i16, align 2
  %cfarDetOutBuffer = alloca [32 x i16], align 2
  %i = alloca i32, align 4
  %currDetMatrixBuffer = alloca i16*, align 4
  %edmaChannel = alloca i8, align 1
  %dopplerIndex = alloca i16, align 2
  %i18 = alloca i32, align 4
  store i16* %detectmatrix, i16** %detectmatrix.addr, align 4
  call void @llvm.dbg.declare(metadata !{i16** %detectmatrix.addr}, metadata !90), !dbg !91
  call void @llvm.dbg.declare(metadata !{i16* %numDetObjPerCfar}, metadata !92), !dbg !93
  call void @llvm.dbg.declare(metadata !{i16* %numDetObjDoppler}, metadata !94), !dbg !95
  store i16 0, i16* %numDetObjDoppler, align 2, !dbg !96
  call void @llvm.dbg.declare(metadata !{i16* %detIndex}, metadata !97), !dbg !98
  call void @llvm.dbg.declare(metadata !{i16* %rangeIdx}, metadata !99), !dbg !100
  call void @llvm.dbg.declare(metadata !{i16* %Channel}, metadata !101), !dbg !102
  call void @llvm.dbg.declare(metadata !{i16* %thresholdScale}, metadata !103), !dbg !104
  store i16 3000, i16* %thresholdScale, align 2, !dbg !105
  call void @llvm.dbg.declare(metadata !{i16* %noiseDivShift}, metadata !106), !dbg !107
  store i16 3, i16* %noiseDivShift, align 2, !dbg !108
  call void @llvm.dbg.declare(metadata !{i16* %DopguardLen}, metadata !109), !dbg !110
  store i16 4, i16* %DopguardLen, align 2, !dbg !111
  call void @llvm.dbg.declare(metadata !{i16* %DopwinLen}, metadata !112), !dbg !113
  store i16 8, i16* %DopwinLen, align 2, !dbg !114
  call void @llvm.dbg.declare(metadata !{[32 x i16]* %cfarDetOutBuffer}, metadata !115), !dbg !116
  store i16 0, i16* %rangeIdx, align 2, !dbg !117
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !118), !dbg !120
  store i32 0, i32* %i, align 4, !dbg !121
  br label %for.cond, !dbg !121

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4, !dbg !121
  %cmp = icmp slt i32 %0, 32, !dbg !121
  br i1 %cmp, label %for.body, label %for.end, !dbg !121

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4, !dbg !122
  %2 = load i16* %rangeIdx, align 2, !dbg !122
  %conv = zext i16 %2 to i32, !dbg !122
  %mul = mul nsw i32 %conv, 32, !dbg !122
  %add = add nsw i32 %1, %mul, !dbg !122
  %3 = load i16** %detectmatrix.addr, align 4, !dbg !122
  %arrayidx = getelementptr inbounds i16* %3, i32 %add, !dbg !122
  %4 = load i16* %arrayidx, align 2, !dbg !122
  %5 = load i32* %i, align 4, !dbg !122
  %arrayidx1 = getelementptr inbounds [32 x i16]* @localDetMatrixBuffer, i32 0, i32 %5, !dbg !122
  store i16 %4, i16* %arrayidx1, align 2, !dbg !122
  br label %for.inc, !dbg !124

for.inc:                                          ; preds = %for.body
  %6 = load i32* %i, align 4, !dbg !125
  %inc = add nsw i32 %6, 1, !dbg !125
  store i32 %inc, i32* %i, align 4, !dbg !125
  br label %for.cond, !dbg !125

for.end:                                          ; preds = %for.cond
  br label %do.body, !dbg !126

do.body:                                          ; preds = %do.cond, %for.end
  call void @llvm.dbg.declare(metadata !{i16** %currDetMatrixBuffer}, metadata !127), !dbg !129
  call void @llvm.dbg.declare(metadata !{i8* %edmaChannel}, metadata !130), !dbg !134
  store i16* getelementptr inbounds ([32 x i16]* @localDetMatrixBuffer, i32 0, i32 0), i16** %currDetMatrixBuffer, align 4, !dbg !135
  %7 = load i16** %currDetMatrixBuffer, align 4, !dbg !136
  %arraydecay = getelementptr inbounds [32 x i16]* %cfarDetOutBuffer, i32 0, i32 0, !dbg !136
  %8 = load i16* %thresholdScale, align 2, !dbg !136
  %9 = load i16* %noiseDivShift, align 2, !dbg !136
  %10 = load i16* %DopguardLen, align 2, !dbg !136
  %11 = load i16* %DopwinLen, align 2, !dbg !136
  %call = call zeroext i16 @cfarCa(i16* %7, i16* %arraydecay, i16 signext 32, i16 signext %8, i16 signext %9, i16 signext %10, i16 signext %11), !dbg !136
  store i16 %call, i16* %numDetObjPerCfar, align 2, !dbg !136
  store i16 0, i16* %detIndex, align 2, !dbg !137
  br label %for.cond2, !dbg !137

for.cond2:                                        ; preds = %for.inc11, %do.body
  %12 = load i16* %detIndex, align 2, !dbg !137
  %conv3 = zext i16 %12 to i32, !dbg !137
  %13 = load i16* %numDetObjPerCfar, align 2, !dbg !137
  %conv4 = zext i16 %13 to i32, !dbg !137
  %cmp5 = icmp slt i32 %conv3, %conv4, !dbg !137
  br i1 %cmp5, label %for.body7, label %for.end13, !dbg !137

for.body7:                                        ; preds = %for.cond2
  call void @llvm.dbg.declare(metadata !{i16* %dopplerIndex}, metadata !139), !dbg !141
  %14 = load i16* %detIndex, align 2, !dbg !142
  %idxprom = zext i16 %14 to i32, !dbg !142
  %arrayidx8 = getelementptr inbounds [32 x i16]* %cfarDetOutBuffer, i32 0, i32 %idxprom, !dbg !142
  %15 = load i16* %arrayidx8, align 2, !dbg !142
  store i16 %15, i16* %dopplerIndex, align 2, !dbg !142
  %16 = load i16* %dopplerIndex, align 2, !dbg !143
  %idxprom9 = zext i16 %16 to i32, !dbg !143
  %arrayidx10 = getelementptr inbounds [32 x i16]* @cfarDopplerDetOutBitMask, i32 0, i32 %idxprom9, !dbg !143
  store i16 1, i16* %arrayidx10, align 2, !dbg !143
  br label %for.inc11, !dbg !144

for.inc11:                                        ; preds = %for.body7
  %17 = load i16* %detIndex, align 2, !dbg !145
  %inc12 = add i16 %17, 1, !dbg !145
  store i16 %inc12, i16* %detIndex, align 2, !dbg !145
  br label %for.cond2, !dbg !145

for.end13:                                        ; preds = %for.cond2
  %18 = load i16* %rangeIdx, align 2, !dbg !146
  %inc14 = add i16 %18, 1, !dbg !146
  store i16 %inc14, i16* %rangeIdx, align 2, !dbg !146
  %19 = load i16* %rangeIdx, align 2, !dbg !147
  %conv15 = zext i16 %19 to i32, !dbg !147
  %cmp16 = icmp slt i32 %conv15, 255, !dbg !147
  br i1 %cmp16, label %if.then, label %if.end, !dbg !147

if.then:                                          ; preds = %for.end13
  call void @llvm.dbg.declare(metadata !{i32* %i18}, metadata !149), !dbg !152
  store i32 0, i32* %i18, align 4, !dbg !153
  br label %for.cond19, !dbg !153

for.cond19:                                       ; preds = %for.inc28, %if.then
  %20 = load i32* %i18, align 4, !dbg !153
  %cmp20 = icmp slt i32 %20, 32, !dbg !153
  br i1 %cmp20, label %for.body22, label %for.end30, !dbg !153

for.body22:                                       ; preds = %for.cond19
  %21 = load i32* %i18, align 4, !dbg !154
  %22 = load i16* %rangeIdx, align 2, !dbg !154
  %conv23 = zext i16 %22 to i32, !dbg !154
  %mul24 = mul nsw i32 %conv23, 32, !dbg !154
  %add25 = add nsw i32 %21, %mul24, !dbg !154
  %23 = load i16** %detectmatrix.addr, align 4, !dbg !154
  %arrayidx26 = getelementptr inbounds i16* %23, i32 %add25, !dbg !154
  %24 = load i16* %arrayidx26, align 2, !dbg !154
  %25 = load i32* %i18, align 4, !dbg !154
  %arrayidx27 = getelementptr inbounds [32 x i16]* @localDetMatrixBuffer, i32 0, i32 %25, !dbg !154
  store i16 %24, i16* %arrayidx27, align 2, !dbg !154
  br label %for.inc28, !dbg !156

for.inc28:                                        ; preds = %for.body22
  %26 = load i32* %i18, align 4, !dbg !157
  %inc29 = add nsw i32 %26, 1, !dbg !157
  store i32 %inc29, i32* %i18, align 4, !dbg !157
  br label %for.cond19, !dbg !157

for.end30:                                        ; preds = %for.cond19
  br label %if.end, !dbg !158

if.end:                                           ; preds = %for.end30, %for.end13
  br label %do.cond, !dbg !159

do.cond:                                          ; preds = %if.end
  %27 = load i16* %rangeIdx, align 2, !dbg !159
  %conv31 = zext i16 %27 to i32, !dbg !159
  %cmp32 = icmp slt i32 %conv31, 256, !dbg !159
  br i1 %cmp32, label %do.body, label %do.end, !dbg !159

do.end:                                           ; preds = %do.cond
  %28 = load i16* %numDetObjPerCfar, align 2, !dbg !160
  ret i16 %28, !dbg !160
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

declare zeroext i16 @cfarCa(i16*, i16*, i16 signext, i16 signext, i16 signext, i16 signext, i16 signext) #2

; Function Attrs: nounwind
define void @cfar_rang(i16* %detectmatrix, i16* %cfarDopplerDetOutBitMask) #0 {
entry:
  %detectmatrix.addr = alloca i16*, align 4
  %cfarDopplerDetOutBitMask.addr = alloca i16*, align 4
  %detIdx = alloca i32, align 4
  %numDetObjIndex = alloca i32, align 4
  %dopplerLine = alloca i32, align 4
  %numDetObj = alloca i32, align 4
  %srcAddr = alloca i32, align 4
  %localBufferAddr = alloca i32, align 4
  %loopIndex = alloca i16, align 2
  %oneDopplerBinSize = alloca i16, align 2
  %dopplerSgnIdx = alloca i16, align 2
  %numDetObjPerCfar = alloca i16, align 2
  %thresholdScale = alloca i16, align 2
  %noiseDivShift = alloca i16, align 2
  %DopguardLen = alloca i16, align 2
  %DopwinLen = alloca i16, align 2
  %cfar_rangdetect = alloca [256 x i16], align 2
  %cfarDetOutBuffer = alloca [32 x i16], align 2
  %flag = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %detIndex = alloca i32, align 4
  %rangIndex = alloca i16, align 2
  store i16* %detectmatrix, i16** %detectmatrix.addr, align 4
  call void @llvm.dbg.declare(metadata !{i16** %detectmatrix.addr}, metadata !161), !dbg !162
  store i16* %cfarDopplerDetOutBitMask, i16** %cfarDopplerDetOutBitMask.addr, align 4
  call void @llvm.dbg.declare(metadata !{i16** %cfarDopplerDetOutBitMask.addr}, metadata !163), !dbg !164
  call void @llvm.dbg.declare(metadata !{i32* %detIdx}, metadata !165), !dbg !169
  call void @llvm.dbg.declare(metadata !{i32* %numDetObjIndex}, metadata !170), !dbg !171
  store i32 0, i32* %numDetObjIndex, align 4, !dbg !172
  call void @llvm.dbg.declare(metadata !{i32* %dopplerLine}, metadata !173), !dbg !174
  call void @llvm.dbg.declare(metadata !{i32* %numDetObj}, metadata !175), !dbg !176
  call void @llvm.dbg.declare(metadata !{i32* %srcAddr}, metadata !177), !dbg !178
  call void @llvm.dbg.declare(metadata !{i32* %localBufferAddr}, metadata !179), !dbg !180
  call void @llvm.dbg.declare(metadata !{i16* %loopIndex}, metadata !181), !dbg !182
  store i16 0, i16* %loopIndex, align 2, !dbg !183
  call void @llvm.dbg.declare(metadata !{i16* %oneDopplerBinSize}, metadata !184), !dbg !185
  call void @llvm.dbg.declare(metadata !{i16* %dopplerSgnIdx}, metadata !186), !dbg !187
  call void @llvm.dbg.declare(metadata !{i16* %numDetObjPerCfar}, metadata !188), !dbg !189
  call void @llvm.dbg.declare(metadata !{i16* %thresholdScale}, metadata !190), !dbg !191
  store i16 1000, i16* %thresholdScale, align 2, !dbg !192
  call void @llvm.dbg.declare(metadata !{i16* %noiseDivShift}, metadata !193), !dbg !194
  store i16 3, i16* %noiseDivShift, align 2, !dbg !195
  call void @llvm.dbg.declare(metadata !{i16* %DopguardLen}, metadata !196), !dbg !197
  store i16 4, i16* %DopguardLen, align 2, !dbg !198
  call void @llvm.dbg.declare(metadata !{i16* %DopwinLen}, metadata !199), !dbg !200
  store i16 8, i16* %DopwinLen, align 2, !dbg !201
  call void @llvm.dbg.declare(metadata !{[256 x i16]* %cfar_rangdetect}, metadata !202), !dbg !203
  call void @llvm.dbg.declare(metadata !{[32 x i16]* %cfarDetOutBuffer}, metadata !204), !dbg !205
  %0 = bitcast [32 x i16]* %cfarDetOutBuffer to i8*, !dbg !206
  call void @llvm.memset.p0i8.i32(i8* %0, i8 0, i32 64, i32 2, i1 false), !dbg !206
  call void @llvm.dbg.declare(metadata !{i32* %flag}, metadata !207), !dbg !208
  store i32 0, i32* %flag, align 4, !dbg !209
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !210), !dbg !212
  store i32 0, i32* %i, align 4, !dbg !213
  br label %for.cond, !dbg !213

for.cond:                                         ; preds = %for.inc45, %entry
  %1 = load i32* %i, align 4, !dbg !213
  %cmp = icmp slt i32 %1, 32, !dbg !213
  br i1 %cmp, label %for.body, label %for.end47, !dbg !213

for.body:                                         ; preds = %for.cond
  %2 = load i32* %i, align 4, !dbg !214
  %3 = load i16** %cfarDopplerDetOutBitMask.addr, align 4, !dbg !214
  %arrayidx = getelementptr inbounds i16* %3, i32 %2, !dbg !214
  %4 = load i16* %arrayidx, align 2, !dbg !214
  %conv = zext i16 %4 to i32, !dbg !214
  %and = and i32 %conv, 1, !dbg !214
  %tobool = icmp ne i32 %and, 0, !dbg !214
  br i1 %tobool, label %if.then, label %if.end44, !dbg !214

if.then:                                          ; preds = %for.body
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !217), !dbg !220
  store i32 0, i32* %j, align 4, !dbg !221
  br label %for.cond1, !dbg !221

for.cond1:                                        ; preds = %for.inc, %if.then
  %5 = load i32* %j, align 4, !dbg !221
  %cmp2 = icmp slt i32 %5, 256, !dbg !221
  br i1 %cmp2, label %for.body4, label %for.end, !dbg !221

for.body4:                                        ; preds = %for.cond1
  %6 = load i32* %i, align 4, !dbg !222
  %7 = load i32* %j, align 4, !dbg !222
  %mul = mul nsw i32 %7, 32, !dbg !222
  %add = add nsw i32 %6, %mul, !dbg !222
  %8 = load i16** %detectmatrix.addr, align 4, !dbg !222
  %arrayidx5 = getelementptr inbounds i16* %8, i32 %add, !dbg !222
  %9 = load i16* %arrayidx5, align 2, !dbg !222
  %10 = load i32* %j, align 4, !dbg !222
  %arrayidx6 = getelementptr inbounds [256 x i16]* %cfar_rangdetect, i32 0, i32 %10, !dbg !222
  store i16 %9, i16* %arrayidx6, align 2, !dbg !222
  br label %for.inc, !dbg !224

for.inc:                                          ; preds = %for.body4
  %11 = load i32* %j, align 4, !dbg !225
  %inc = add nsw i32 %11, 1, !dbg !225
  store i32 %inc, i32* %j, align 4, !dbg !225
  br label %for.cond1, !dbg !225

for.end:                                          ; preds = %for.cond1
  %arraydecay = getelementptr inbounds [256 x i16]* %cfar_rangdetect, i32 0, i32 0, !dbg !226
  %arraydecay7 = getelementptr inbounds [32 x i16]* %cfarDetOutBuffer, i32 0, i32 0, !dbg !226
  %12 = load i16* %thresholdScale, align 2, !dbg !226
  %13 = load i16* %noiseDivShift, align 2, !dbg !226
  %14 = load i16* %DopguardLen, align 2, !dbg !226
  %15 = load i16* %DopwinLen, align 2, !dbg !226
  %call = call zeroext i16 @cfarCa(i16* %arraydecay, i16* %arraydecay7, i16 signext 256, i16 signext %12, i16 signext %13, i16 signext %14, i16 signext %15), !dbg !226
  store i16 %call, i16* %numDetObjPerCfar, align 2, !dbg !226
  %16 = load i16* %numDetObjPerCfar, align 2, !dbg !227
  %conv8 = zext i16 %16 to i32, !dbg !227
  %cmp9 = icmp sgt i32 %conv8, 0, !dbg !227
  br i1 %cmp9, label %if.then11, label %if.end43, !dbg !227

if.then11:                                        ; preds = %for.end
  call void @llvm.dbg.declare(metadata !{i32* %detIndex}, metadata !229), !dbg !232
  store i32 0, i32* %detIndex, align 4, !dbg !233
  br label %for.cond12, !dbg !233

for.cond12:                                       ; preds = %for.inc39, %if.then11
  %17 = load i32* %detIndex, align 4, !dbg !233
  %18 = load i16* %numDetObjPerCfar, align 2, !dbg !233
  %conv13 = zext i16 %18 to i32, !dbg !233
  %cmp14 = icmp slt i32 %17, %conv13, !dbg !233
  br i1 %cmp14, label %for.body16, label %for.end41, !dbg !233

for.body16:                                       ; preds = %for.cond12
  call void @llvm.dbg.declare(metadata !{i16* %rangIndex}, metadata !234), !dbg !236
  %19 = load i32* %detIndex, align 4, !dbg !237
  %arrayidx17 = getelementptr inbounds [32 x i16]* %cfarDetOutBuffer, i32 0, i32 %19, !dbg !237
  %20 = load i16* %arrayidx17, align 2, !dbg !237
  store i16 %20, i16* %rangIndex, align 2, !dbg !237
  %21 = load i16* %rangIndex, align 2, !dbg !238
  %conv18 = zext i16 %21 to i32, !dbg !238
  %cmp19 = icmp slt i32 %conv18, 256, !dbg !238
  br i1 %cmp19, label %land.lhs.true, label %if.else, !dbg !238

land.lhs.true:                                    ; preds = %for.body16
  %22 = load i16* %rangIndex, align 2, !dbg !238
  %conv21 = zext i16 %22 to i32, !dbg !238
  %cmp22 = icmp sgt i32 %conv21, 0, !dbg !238
  br i1 %cmp22, label %land.lhs.true24, label %if.else, !dbg !238

land.lhs.true24:                                  ; preds = %land.lhs.true
  %23 = load i32* %i, align 4, !dbg !238
  %cmp25 = icmp sgt i32 %23, 0, !dbg !238
  br i1 %cmp25, label %if.then27, label %if.else, !dbg !238

if.then27:                                        ; preds = %land.lhs.true24
  %24 = load i16* %rangIndex, align 2, !dbg !240
  %25 = load i32* %flag, align 4, !dbg !240
  %mul28 = mul nsw i32 2, %25, !dbg !240
  %arrayidx29 = getelementptr inbounds [256 x i16]* @cfarDetOut, i32 0, i32 %mul28, !dbg !240
  store i16 %24, i16* %arrayidx29, align 2, !dbg !240
  %26 = load i32* %i, align 4, !dbg !242
  %conv30 = trunc i32 %26 to i16, !dbg !242
  %27 = load i32* %flag, align 4, !dbg !242
  %mul31 = mul nsw i32 2, %27, !dbg !242
  %add32 = add nsw i32 %mul31, 1, !dbg !242
  %arrayidx33 = getelementptr inbounds [256 x i16]* @cfarDetOut, i32 0, i32 %add32, !dbg !242
  store i16 %conv30, i16* %arrayidx33, align 2, !dbg !242
  %28 = load i16* %rangIndex, align 2, !dbg !243
  %29 = load i32* %flag, align 4, !dbg !243
  %arrayidx34 = getelementptr inbounds [256 x %struct.cfarpList_]* @cfardetect, i32 0, i32 %29, !dbg !243
  %rangeIdx = getelementptr inbounds %struct.cfarpList_* %arrayidx34, i32 0, i32 0, !dbg !243
  store i16 %28, i16* %rangeIdx, align 2, !dbg !243
  %30 = load i32* %i, align 4, !dbg !244
  %conv35 = trunc i32 %30 to i16, !dbg !244
  %31 = load i32* %flag, align 4, !dbg !244
  %arrayidx36 = getelementptr inbounds [256 x %struct.cfarpList_]* @cfardetect, i32 0, i32 %31, !dbg !244
  %dopplerIdx = getelementptr inbounds %struct.cfarpList_* %arrayidx36, i32 0, i32 1, !dbg !244
  store i16 %conv35, i16* %dopplerIdx, align 2, !dbg !244
  %32 = load i16* %numDetObjPerCfar, align 2, !dbg !245
  %33 = load i32* %flag, align 4, !dbg !245
  %arrayidx37 = getelementptr inbounds [256 x %struct.cfarpList_]* @cfardetect, i32 0, i32 %33, !dbg !245
  %numObjsIn = getelementptr inbounds %struct.cfarpList_* %arrayidx37, i32 0, i32 2, !dbg !245
  store i16 %32, i16* %numObjsIn, align 2, !dbg !245
  %34 = load i32* %flag, align 4, !dbg !246
  %inc38 = add nsw i32 %34, 1, !dbg !246
  store i32 %inc38, i32* %flag, align 4, !dbg !246
  br label %if.end, !dbg !247

if.else:                                          ; preds = %land.lhs.true24, %land.lhs.true, %for.body16
  store i16 0, i16* %rangIndex, align 2, !dbg !248
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then27
  br label %for.inc39, !dbg !250

for.inc39:                                        ; preds = %if.end
  %35 = load i32* %detIndex, align 4, !dbg !251
  %inc40 = add nsw i32 %35, 1, !dbg !251
  store i32 %inc40, i32* %detIndex, align 4, !dbg !251
  br label %for.cond12, !dbg !251

for.end41:                                        ; preds = %for.cond12
  %arraydecay42 = getelementptr inbounds [32 x i16]* %cfarDetOutBuffer, i32 0, i32 0, !dbg !252
  %36 = bitcast i16* %arraydecay42 to i8*, !dbg !252
  call void @llvm.memset.p0i8.i32(i8* %36, i8 0, i32 64, i32 2, i1 false), !dbg !252
  br label %if.end43, !dbg !253

if.end43:                                         ; preds = %for.end41, %for.end
  br label %if.end44, !dbg !254

if.end44:                                         ; preds = %if.end43, %for.body
  br label %for.inc45, !dbg !255

for.inc45:                                        ; preds = %if.end44
  %37 = load i32* %i, align 4, !dbg !256
  %inc46 = add nsw i32 %37, 1, !dbg !256
  store i32 %inc46, i32* %i, align 4, !dbg !256
  br label %for.cond, !dbg !256

for.end47:                                        ; preds = %for.cond
  ret void, !dbg !257
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture, i8, i32, i32, i1) #3

; Function Attrs: nounwind
define void @dopplerandcfar(%struct.cmplx16ImRe_t_* %radarCubeBuf1) #0 {
entry:
  %radarCubeBuf1.addr = alloca %struct.cmplx16ImRe_t_*, align 4
  %log2VirtAnt = alloca i16, align 2
  %rxAntIdx = alloca i16, align 2
  %rangeIdx = alloca i16, align 2
  %txAntIdx = alloca i16, align 2
  %idx = alloca i16, align 2
  %nextTransferRxIdx = alloca i16, align 2
  %nextTransferRangeIdx = alloca i16, align 2
  %nextTransferTxIdx = alloca i16, align 2
  %rxAntIdxBPMPreviousBuffer = alloca i16, align 2
  %txAntIdxBPMPreviousBuffer = alloca i16, align 2
  %nextTransferIdx = alloca i32, align 4
  %waitingTime = alloca i32, align 4
  %pingPongIdx = alloca i32, align 4
  %channel = alloca i8, align 1
  %inpDoppFftBuf = alloca %struct.cmplx16ImRe_t_*, align 4
  %radarCubeBuf = alloca [98304 x %struct.cmplx16ImRe_t_], align 2
  %i = alloca i32, align 4
  %i1 = alloca i32, align 4
  %i53 = alloca i32, align 4
  %sumvalue = alloca i16, align 2
  %p = alloca i16, align 2
  %detMartrixAddr = alloca i32, align 4
  store %struct.cmplx16ImRe_t_* %radarCubeBuf1, %struct.cmplx16ImRe_t_** %radarCubeBuf1.addr, align 4
  call void @llvm.dbg.declare(metadata !{%struct.cmplx16ImRe_t_** %radarCubeBuf1.addr}, metadata !258), !dbg !259
  call void @llvm.dbg.declare(metadata !{i16* %log2VirtAnt}, metadata !260), !dbg !261
  store i16 2, i16* %log2VirtAnt, align 2, !dbg !262
  call void @llvm.dbg.declare(metadata !{i16* %rxAntIdx}, metadata !263), !dbg !264
  call void @llvm.dbg.declare(metadata !{i16* %rangeIdx}, metadata !265), !dbg !266
  call void @llvm.dbg.declare(metadata !{i16* %txAntIdx}, metadata !267), !dbg !268
  call void @llvm.dbg.declare(metadata !{i16* %idx}, metadata !269), !dbg !270
  call void @llvm.dbg.declare(metadata !{i16* %nextTransferRxIdx}, metadata !271), !dbg !272
  call void @llvm.dbg.declare(metadata !{i16* %nextTransferRangeIdx}, metadata !273), !dbg !274
  call void @llvm.dbg.declare(metadata !{i16* %nextTransferTxIdx}, metadata !275), !dbg !276
  call void @llvm.dbg.declare(metadata !{i16* %rxAntIdxBPMPreviousBuffer}, metadata !277), !dbg !278
  call void @llvm.dbg.declare(metadata !{i16* %txAntIdxBPMPreviousBuffer}, metadata !279), !dbg !280
  call void @llvm.dbg.declare(metadata !{i32* %nextTransferIdx}, metadata !281), !dbg !282
  call void @llvm.dbg.declare(metadata !{i32* %waitingTime}, metadata !283), !dbg !284
  call void @llvm.dbg.declare(metadata !{i32* %pingPongIdx}, metadata !285), !dbg !286
  call void @llvm.dbg.declare(metadata !{i8* %channel}, metadata !287), !dbg !288
  call void @llvm.dbg.declare(metadata !{%struct.cmplx16ImRe_t_** %inpDoppFftBuf}, metadata !289), !dbg !290
  call void @llvm.dbg.declare(metadata !{[98304 x %struct.cmplx16ImRe_t_]* %radarCubeBuf}, metadata !291), !dbg !295
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !296), !dbg !298
  store i32 0, i32* %i, align 4, !dbg !299
  br label %for.cond, !dbg !299

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4, !dbg !299
  %cmp = icmp slt i32 %0, 98304, !dbg !299
  br i1 %cmp, label %for.body, label %for.end, !dbg !299

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4, !dbg !300
  %arrayidx = getelementptr inbounds [98304 x %struct.cmplx16ImRe_t_]* %radarCubeBuf, i32 0, i32 %1, !dbg !300
  %2 = load %struct.cmplx16ImRe_t_** %radarCubeBuf1.addr, align 4, !dbg !300
  %3 = load i32* %i, align 4, !dbg !300
  %add.ptr = getelementptr inbounds %struct.cmplx16ImRe_t_* %2, i32 %3, !dbg !300
  %4 = bitcast %struct.cmplx16ImRe_t_* %arrayidx to i8*, !dbg !300
  %5 = bitcast %struct.cmplx16ImRe_t_* %add.ptr to i8*, !dbg !300
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %4, i8* %5, i32 4, i32 2, i1 false), !dbg !300
  br label %for.inc, !dbg !302

for.inc:                                          ; preds = %for.body
  %6 = load i32* %i, align 4, !dbg !303
  %inc = add nsw i32 %6, 1, !dbg !303
  store i32 %inc, i32* %i, align 4, !dbg !303
  br label %for.cond, !dbg !303

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %pingPongIdx, align 4, !dbg !304
  call void @llvm.dbg.declare(metadata !{i32* %i1}, metadata !305), !dbg !307
  store i32 0, i32* %i1, align 4, !dbg !308
  br label %for.cond2, !dbg !308

for.cond2:                                        ; preds = %for.inc8, %for.end
  %7 = load i32* %i1, align 4, !dbg !308
  %cmp3 = icmp slt i32 %7, 32, !dbg !308
  br i1 %cmp3, label %for.body4, label %for.end10, !dbg !308

for.body4:                                        ; preds = %for.cond2
  %8 = load i32* %i1, align 4, !dbg !309
  %arrayidx5 = getelementptr inbounds [64 x %struct.cmplx16ImRe_t_]* @pingPongBuf, i32 0, i32 %8, !dbg !309
  %9 = load i32* %i1, align 4, !dbg !309
  %mul = mul nsw i32 %9, 256, !dbg !309
  %mul6 = mul nsw i32 %mul, 4, !dbg !309
  %arrayidx7 = getelementptr inbounds [98304 x %struct.cmplx16ImRe_t_]* %radarCubeBuf, i32 0, i32 %mul6, !dbg !309
  %10 = bitcast %struct.cmplx16ImRe_t_* %arrayidx5 to i8*, !dbg !309
  %11 = bitcast %struct.cmplx16ImRe_t_* %arrayidx7 to i8*, !dbg !309
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %10, i8* %11, i32 4, i32 2, i1 false), !dbg !309
  br label %for.inc8, !dbg !311

for.inc8:                                         ; preds = %for.body4
  %12 = load i32* %i1, align 4, !dbg !312
  %inc9 = add nsw i32 %12, 1, !dbg !312
  store i32 %inc9, i32* %i1, align 4, !dbg !312
  br label %for.cond2, !dbg !312

for.end10:                                        ; preds = %for.cond2
  store i16 0, i16* %rangeIdx, align 2, !dbg !313
  br label %for.cond11, !dbg !313

for.cond11:                                       ; preds = %for.inc131, %for.end10
  %13 = load i16* %rangeIdx, align 2, !dbg !313
  %conv = zext i16 %13 to i32, !dbg !313
  %cmp12 = icmp slt i32 %conv, 256, !dbg !313
  br i1 %cmp12, label %for.body14, label %for.end133, !dbg !313

for.body14:                                       ; preds = %for.cond11
  store i16 0, i16* %rxAntIdx, align 2, !dbg !315
  br label %for.cond15, !dbg !315

for.cond15:                                       ; preds = %for.inc125, %for.body14
  %14 = load i16* %rxAntIdx, align 2, !dbg !315
  %conv16 = zext i16 %14 to i32, !dbg !315
  %cmp17 = icmp slt i32 %conv16, 4, !dbg !315
  br i1 %cmp17, label %for.body19, label %for.end127, !dbg !315

for.body19:                                       ; preds = %for.cond15
  store i16 0, i16* %txAntIdx, align 2, !dbg !318
  br label %for.cond20, !dbg !318

for.cond20:                                       ; preds = %for.inc122, %for.body19
  %15 = load i16* %txAntIdx, align 2, !dbg !318
  %conv21 = zext i16 %15 to i32, !dbg !318
  %cmp22 = icmp slt i32 %conv21, 3, !dbg !318
  br i1 %cmp22, label %for.body24, label %for.end124, !dbg !318

for.body24:                                       ; preds = %for.cond20
  %16 = load i16* %txAntIdx, align 2, !dbg !321
  %conv25 = zext i16 %16 to i32, !dbg !321
  %add = add nsw i32 %conv25, 1, !dbg !321
  %conv26 = trunc i32 %add to i16, !dbg !321
  store i16 %conv26, i16* %nextTransferTxIdx, align 2, !dbg !321
  %17 = load i16* %rxAntIdx, align 2, !dbg !323
  store i16 %17, i16* %nextTransferRxIdx, align 2, !dbg !323
  %18 = load i16* %rangeIdx, align 2, !dbg !324
  store i16 %18, i16* %nextTransferRangeIdx, align 2, !dbg !324
  %19 = load i16* %nextTransferTxIdx, align 2, !dbg !325
  %conv27 = zext i16 %19 to i32, !dbg !325
  %cmp28 = icmp eq i32 %conv27, 3, !dbg !325
  br i1 %cmp28, label %if.then, label %if.end36, !dbg !325

if.then:                                          ; preds = %for.body24
  store i16 0, i16* %nextTransferTxIdx, align 2, !dbg !327
  %20 = load i16* %nextTransferRxIdx, align 2, !dbg !329
  %inc30 = add i16 %20, 1, !dbg !329
  store i16 %inc30, i16* %nextTransferRxIdx, align 2, !dbg !329
  %21 = load i16* %nextTransferRxIdx, align 2, !dbg !330
  %conv31 = zext i16 %21 to i32, !dbg !330
  %cmp32 = icmp eq i32 %conv31, 4, !dbg !330
  br i1 %cmp32, label %if.then34, label %if.end, !dbg !330

if.then34:                                        ; preds = %if.then
  store i16 0, i16* %nextTransferRxIdx, align 2, !dbg !332
  %22 = load i16* %nextTransferRangeIdx, align 2, !dbg !334
  %inc35 = add i16 %22, 1, !dbg !334
  store i16 %inc35, i16* %nextTransferRangeIdx, align 2, !dbg !334
  br label %if.end, !dbg !335

if.end:                                           ; preds = %if.then34, %if.then
  br label %if.end36, !dbg !336

if.end36:                                         ; preds = %if.end, %for.body24
  %23 = load i16* %nextTransferTxIdx, align 2, !dbg !337
  %conv37 = zext i16 %23 to i32, !dbg !337
  %mul38 = mul nsw i32 %conv37, 4, !dbg !337
  %mul39 = mul nsw i32 %mul38, 32, !dbg !337
  %24 = load i16* %nextTransferRxIdx, align 2, !dbg !337
  %conv40 = zext i16 %24 to i32, !dbg !337
  %add41 = add nsw i32 %mul39, %conv40, !dbg !337
  %mul42 = mul nsw i32 %add41, 256, !dbg !337
  %25 = load i16* %nextTransferRangeIdx, align 2, !dbg !337
  %conv43 = zext i16 %25 to i32, !dbg !337
  %add44 = add nsw i32 %mul42, %conv43, !dbg !337
  store i32 %add44, i32* %nextTransferIdx, align 4, !dbg !337
  %26 = load i16* %nextTransferRangeIdx, align 2, !dbg !338
  %conv45 = zext i16 %26 to i32, !dbg !338
  %cmp46 = icmp slt i32 %conv45, 256, !dbg !338
  br i1 %cmp46, label %if.then48, label %if.end69, !dbg !338

if.then48:                                        ; preds = %if.end36
  %27 = load i32* %pingPongIdx, align 4, !dbg !340
  %cmp49 = icmp eq i32 %27, 1, !dbg !340
  br i1 %cmp49, label %if.then51, label %if.else, !dbg !340

if.then51:                                        ; preds = %if.then48
  store i8 0, i8* %channel, align 1, !dbg !343
  br label %if.end52, !dbg !345

if.else:                                          ; preds = %if.then48
  store i8 1, i8* %channel, align 1, !dbg !346
  br label %if.end52

if.end52:                                         ; preds = %if.else, %if.then51
  call void @llvm.dbg.declare(metadata !{i32* %i53}, metadata !348), !dbg !350
  store i32 0, i32* %i53, align 4, !dbg !351
  br label %for.cond54, !dbg !351

for.cond54:                                       ; preds = %for.inc66, %if.end52
  %28 = load i32* %i53, align 4, !dbg !351
  %cmp55 = icmp slt i32 %28, 32, !dbg !351
  br i1 %cmp55, label %for.body57, label %for.end68, !dbg !351

for.body57:                                       ; preds = %for.cond54
  %29 = load i8* %channel, align 1, !dbg !352
  %conv58 = zext i8 %29 to i32, !dbg !352
  %mul59 = mul nsw i32 %conv58, 32, !dbg !352
  %30 = load i32* %i53, align 4, !dbg !352
  %add60 = add nsw i32 %mul59, %30, !dbg !352
  %arrayidx61 = getelementptr inbounds [64 x %struct.cmplx16ImRe_t_]* @pingPongBuf, i32 0, i32 %add60, !dbg !352
  %31 = load i32* %i53, align 4, !dbg !352
  %mul62 = mul nsw i32 %31, 256, !dbg !352
  %mul63 = mul nsw i32 %mul62, 4, !dbg !352
  %32 = load i32* %nextTransferIdx, align 4, !dbg !352
  %add64 = add i32 %mul63, %32, !dbg !352
  %arrayidx65 = getelementptr inbounds [98304 x %struct.cmplx16ImRe_t_]* %radarCubeBuf, i32 0, i32 %add64, !dbg !352
  %33 = bitcast %struct.cmplx16ImRe_t_* %arrayidx61 to i8*, !dbg !352
  %34 = bitcast %struct.cmplx16ImRe_t_* %arrayidx65 to i8*, !dbg !352
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %33, i8* %34, i32 4, i32 2, i1 false), !dbg !352
  br label %for.inc66, !dbg !354

for.inc66:                                        ; preds = %for.body57
  %35 = load i32* %i53, align 4, !dbg !355
  %inc67 = add nsw i32 %35, 1, !dbg !355
  store i32 %inc67, i32* %i53, align 4, !dbg !355
  br label %for.cond54, !dbg !355

for.end68:                                        ; preds = %for.cond54
  br label %if.end69, !dbg !356

if.end69:                                         ; preds = %for.end68, %if.end36
  %36 = load i32* %pingPongIdx, align 4, !dbg !357
  %mul70 = mul i32 %36, 32, !dbg !357
  %arrayidx71 = getelementptr inbounds [64 x %struct.cmplx16ImRe_t_]* @pingPongBuf, i32 0, i32 %mul70, !dbg !357
  store %struct.cmplx16ImRe_t_* %arrayidx71, %struct.cmplx16ImRe_t_** %inpDoppFftBuf, align 4, !dbg !357
  call void @llvm.dbg.declare(metadata !{i16* %sumvalue}, metadata !358), !dbg !359
  store i16 0, i16* %sumvalue, align 2, !dbg !360
  %37 = bitcast i16* %sumvalue to %struct.cmplx32ImRe_t_*, !dbg !361
  store %struct.cmplx32ImRe_t_* %37, %struct.cmplx32ImRe_t_** @sum, align 4, !dbg !361
  %38 = load %struct.cmplx16ImRe_t_** %inpDoppFftBuf, align 4, !dbg !362
  %39 = load %struct.cmplx32ImRe_t_** @sum, align 4, !dbg !362
  call void @dcremove(i32 32, %struct.cmplx16ImRe_t_* %38, %struct.cmplx32ImRe_t_* %39), !dbg !362
  %40 = load %struct.cmplx16ImRe_t_** %inpDoppFftBuf, align 4, !dbg !363
  %41 = bitcast %struct.cmplx16ImRe_t_* %40 to i8*, !dbg !363
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* bitcast ([32 x %struct.cmplx16ImRe_t_]* @dcoutBuf to i8*), i8* %41, i32 128, i32 2, i1 false), !dbg !363
  call void @windowing_16x32(%struct.cmplx16ImRe_t_* getelementptr inbounds ([32 x %struct.cmplx16ImRe_t_]* @dcoutBuf, i32 0, i32 0), i32* getelementptr inbounds ([64 x i32]* @window1, i32 0, i32 0), %struct.cmplx32ImRe_t_* getelementptr inbounds ([32 x %struct.cmplx32ImRe_t_]* @fftinBuf, i32 0, i32 0), i32 32), !dbg !364
  store %struct.cmplx32ImRe_t_* getelementptr inbounds ([32 x %struct.cmplx32ImRe_t_]* @fftOutBuf1, i32 0, i32 0), %struct.cmplx32ImRe_t_** @fftOutBuf, align 4, !dbg !365
  %42 = load %struct.cmplx32ImRe_t_** @fftOutBuf, align 4, !dbg !366
  call void @fft_32x32(%struct.cmplx32ImRe_t_* getelementptr inbounds ([32 x %struct.cmplx32ImRe_t_]* @fftinBuf, i32 0, i32 0), %struct.cmplx32ImRe_t_* %42, i32 32), !dbg !366
  call void @llvm.dbg.declare(metadata !{i16* %p}, metadata !367), !dbg !369
  store i16 0, i16* %p, align 2, !dbg !370
  br label %for.cond72, !dbg !370

for.cond72:                                       ; preds = %for.inc80, %if.end69
  %43 = load i16* %p, align 2, !dbg !370
  %conv73 = sext i16 %43 to i32, !dbg !370
  %cmp74 = icmp slt i32 %conv73, 1, !dbg !370
  br i1 %cmp74, label %for.body76, label %for.end82, !dbg !370

for.body76:                                       ; preds = %for.cond72
  %44 = load i16* %p, align 2, !dbg !371
  %idxprom = sext i16 %44 to i32, !dbg !371
  %arrayidx77 = getelementptr inbounds [32 x %struct.cmplx32ImRe_t_]* @fftOutBuf1, i32 0, i32 %idxprom, !dbg !371
  %real = getelementptr inbounds %struct.cmplx32ImRe_t_* %arrayidx77, i32 0, i32 1, !dbg !371
  store i32 0, i32* %real, align 4, !dbg !371
  %45 = load i16* %p, align 2, !dbg !373
  %idxprom78 = sext i16 %45 to i32, !dbg !373
  %arrayidx79 = getelementptr inbounds [32 x %struct.cmplx32ImRe_t_]* @fftOutBuf1, i32 0, i32 %idxprom78, !dbg !373
  %imag = getelementptr inbounds %struct.cmplx32ImRe_t_* %arrayidx79, i32 0, i32 0, !dbg !373
  store i32 0, i32* %imag, align 4, !dbg !373
  br label %for.inc80, !dbg !374

for.inc80:                                        ; preds = %for.body76
  %46 = load i16* %p, align 2, !dbg !375
  %inc81 = add i16 %46, 1, !dbg !375
  store i16 %inc81, i16* %p, align 2, !dbg !375
  br label %for.cond72, !dbg !375

for.end82:                                        ; preds = %for.cond72
  %47 = load %struct.cmplx32ImRe_t_** @fftOutBuf, align 4, !dbg !376
  %48 = load i16** @Log2AbsBuf, align 4, !dbg !376
  call void @log2abs32(%struct.cmplx32ImRe_t_* %47, i16* %48, i32 32), !dbg !376
  %49 = load i16* %rxAntIdx, align 2, !dbg !377
  %conv83 = zext i16 %49 to i32, !dbg !377
  %cmp84 = icmp eq i32 %conv83, 0, !dbg !377
  br i1 %cmp84, label %if.then86, label %if.else104, !dbg !377

if.then86:                                        ; preds = %for.end82
  %50 = load i16* %txAntIdx, align 2, !dbg !379
  %conv87 = zext i16 %50 to i32, !dbg !379
  %cmp88 = icmp eq i32 %conv87, 0, !dbg !379
  br i1 %cmp88, label %if.then90, label %if.end103, !dbg !379

if.then90:                                        ; preds = %if.then86
  store i16 0, i16* %idx, align 2, !dbg !382
  br label %for.cond91, !dbg !382

for.cond91:                                       ; preds = %for.inc100, %if.then90
  %51 = load i16* %idx, align 2, !dbg !382
  %conv92 = zext i16 %51 to i32, !dbg !382
  %cmp93 = icmp slt i32 %conv92, 32, !dbg !382
  br i1 %cmp93, label %for.body95, label %for.end102, !dbg !382

for.body95:                                       ; preds = %for.cond91
  %52 = load i16** @Log2AbsBuf, align 4, !dbg !385
  %53 = load i16* %idx, align 2, !dbg !385
  %conv96 = zext i16 %53 to i32, !dbg !385
  %add.ptr97 = getelementptr inbounds i16* %52, i32 %conv96, !dbg !385
  %54 = load i16* %add.ptr97, align 2, !dbg !385
  %55 = load i16* %idx, align 2, !dbg !385
  %idxprom98 = zext i16 %55 to i32, !dbg !385
  %arrayidx99 = getelementptr inbounds [32 x i16]* @sumAbsBuf, i32 0, i32 %idxprom98, !dbg !385
  store i16 %54, i16* %arrayidx99, align 2, !dbg !385
  br label %for.inc100, !dbg !387

for.inc100:                                       ; preds = %for.body95
  %56 = load i16* %idx, align 2, !dbg !388
  %inc101 = add i16 %56, 1, !dbg !388
  store i16 %inc101, i16* %idx, align 2, !dbg !388
  br label %for.cond91, !dbg !388

for.end102:                                       ; preds = %for.cond91
  br label %if.end103, !dbg !389

if.end103:                                        ; preds = %for.end102, %if.then86
  br label %if.end121, !dbg !390

if.else104:                                       ; preds = %for.end82
  store i16 0, i16* %idx, align 2, !dbg !391
  br label %for.cond105, !dbg !391

for.cond105:                                      ; preds = %for.inc118, %if.else104
  %57 = load i16* %idx, align 2, !dbg !391
  %conv106 = zext i16 %57 to i32, !dbg !391
  %cmp107 = icmp slt i32 %conv106, 32, !dbg !391
  br i1 %cmp107, label %for.body109, label %for.end120, !dbg !391

for.body109:                                      ; preds = %for.cond105
  %58 = load i16** @Log2AbsBuf, align 4, !dbg !394
  %59 = load i16* %idx, align 2, !dbg !394
  %conv110 = zext i16 %59 to i32, !dbg !394
  %add.ptr111 = getelementptr inbounds i16* %58, i32 %conv110, !dbg !394
  %60 = load i16* %add.ptr111, align 2, !dbg !394
  %conv112 = zext i16 %60 to i32, !dbg !394
  %61 = load i16* %idx, align 2, !dbg !394
  %idxprom113 = zext i16 %61 to i32, !dbg !394
  %arrayidx114 = getelementptr inbounds [32 x i16]* @sumAbsBuf, i32 0, i32 %idxprom113, !dbg !394
  %62 = load i16* %arrayidx114, align 2, !dbg !394
  %conv115 = zext i16 %62 to i32, !dbg !394
  %add116 = add nsw i32 %conv115, %conv112, !dbg !394
  %conv117 = trunc i32 %add116 to i16, !dbg !394
  store i16 %conv117, i16* %arrayidx114, align 2, !dbg !394
  br label %for.inc118, !dbg !396

for.inc118:                                       ; preds = %for.body109
  %63 = load i16* %idx, align 2, !dbg !397
  %inc119 = add i16 %63, 1, !dbg !397
  store i16 %inc119, i16* %idx, align 2, !dbg !397
  br label %for.cond105, !dbg !397

for.end120:                                       ; preds = %for.cond105
  br label %if.end121

if.end121:                                        ; preds = %for.end120, %if.end103
  %64 = load i32* %pingPongIdx, align 4, !dbg !398
  %xor = xor i32 %64, 1, !dbg !398
  store i32 %xor, i32* %pingPongIdx, align 4, !dbg !398
  br label %for.inc122, !dbg !399

for.inc122:                                       ; preds = %if.end121
  %65 = load i16* %txAntIdx, align 2, !dbg !400
  %inc123 = add i16 %65, 1, !dbg !400
  store i16 %inc123, i16* %txAntIdx, align 2, !dbg !400
  br label %for.cond20, !dbg !400

for.end124:                                       ; preds = %for.cond20
  br label %for.inc125, !dbg !401

for.inc125:                                       ; preds = %for.end124
  %66 = load i16* %rxAntIdx, align 2, !dbg !402
  %inc126 = add i16 %66, 1, !dbg !402
  store i16 %inc126, i16* %rxAntIdx, align 2, !dbg !402
  br label %for.cond15, !dbg !402

for.end127:                                       ; preds = %for.cond15
  call void @llvm.dbg.declare(metadata !{i32* %detMartrixAddr}, metadata !403), !dbg !404
  %67 = load i16* %rangeIdx, align 2, !dbg !405
  %conv128 = zext i16 %67 to i32, !dbg !405
  %mul129 = mul nsw i32 %conv128, 32, !dbg !405
  %add.ptr130 = getelementptr inbounds i16* getelementptr inbounds ([8192 x i16]* @detMartrix1, i32 0, i32 0), i32 %mul129, !dbg !405
  %68 = ptrtoint i16* %add.ptr130 to i32, !dbg !405
  store i32 %68, i32* %detMartrixAddr, align 4, !dbg !405
  %69 = load i32* %detMartrixAddr, align 4, !dbg !406
  %70 = inttoptr i32 %69 to i8*, !dbg !406
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %70, i8* bitcast ([32 x i16]* @sumAbsBuf to i8*), i32 64, i32 1, i1 false), !dbg !406
  br label %for.inc131, !dbg !407

for.inc131:                                       ; preds = %for.end127
  %71 = load i16* %rangeIdx, align 2, !dbg !408
  %inc132 = add i16 %71, 1, !dbg !408
  store i16 %inc132, i16* %rangeIdx, align 2, !dbg !408
  br label %for.cond11, !dbg !408

for.end133:                                       ; preds = %for.cond11
  %72 = load i16** @detMartrix, align 4, !dbg !409
  %call = call signext i16 @cfar_doppler(i16* %72), !dbg !409
  %73 = load i16** @detMartrix, align 4, !dbg !410
  call void @cfar_rang(i16* %73, i16* getelementptr inbounds ([32 x i16]* @cfarDopplerDetOutBitMask, i32 0, i32 0)), !dbg !410
  ret void, !dbg !411
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture, i8* nocapture readonly, i32, i32, i1) #3

declare void @dcremove(i32, %struct.cmplx16ImRe_t_*, %struct.cmplx32ImRe_t_*) #2

declare void @windowing_16x32(%struct.cmplx16ImRe_t_*, i32*, %struct.cmplx32ImRe_t_*, i32) #2

declare void @fft_32x32(%struct.cmplx32ImRe_t_*, %struct.cmplx32ImRe_t_*, i32) #2

declare void @log2abs32(%struct.cmplx32ImRe_t_*, i16*, i32) #2

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!87, !88}
!llvm.ident = !{!89}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.0 (tags/RELEASE_350/final)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !28, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c] [DW_LANG_C99]
!1 = metadata !{metadata !"..\5Cdopandcfar.c", metadata !"D:\5Ceclipse\5Cworkspace\5Cdss\5CRelease"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !13, metadata !16}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"cfar_doppler", metadata !"cfar_doppler", metadata !"", i32 38, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i16 (i16*)* @cfar_doppler, null, null, metadata !2, i32 39} ; [ DW_TAG_subprogram ] [line 38] [def] [scope 39] [cfar_doppler]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !9}
!8 = metadata !{i32 786468, null, null, metadata !"short", i32 0, i64 16, i64 16, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [short] [line 0, size 16, align 16, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 32, i64 32, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 32, align 32, offset 0] [from uint16_t]
!10 = metadata !{i32 786454, metadata !11, null, metadata !"uint16_t", i32 31, i64 0, i64 0, i64 0, i32 0, metadata !12} ; [ DW_TAG_typedef ] [uint16_t] [line 31, size 0, align 0, offset 0] [from unsigned short]
!11 = metadata !{metadata !"D:\5CCIC\5CSwift_IDE_Toolchain\5Ctoolchain_8slot\5Cinclude\5Ctypes/uint16_t.h", metadata !"D:\5Ceclipse\5Cworkspace\5Cdss\5CRelease"}
!12 = metadata !{i32 786468, null, null, metadata !"unsigned short", i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned short] [line 0, size 16, align 16, offset 0, enc DW_ATE_unsigned]
!13 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"cfar_rang", metadata !"cfar_rang", metadata !"", i32 119, metadata !14, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i16*, i16*)* @cfar_rang, null, null, metadata !2, i32 120} ; [ DW_TAG_subprogram ] [line 119] [def] [scope 120] [cfar_rang]
!14 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !15, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!15 = metadata !{null, metadata !9, metadata !9}
!16 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"dopplerandcfar", metadata !"dopplerandcfar", metadata !"", i32 185, metadata !17, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.cmplx16ImRe_t_*)* @dopplerandcfar, null, null, metadata !2, i32 186} ; [ DW_TAG_subprogram ] [line 185] [def] [scope 186] [dopplerandcfar]
!17 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !18, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!18 = metadata !{null, metadata !19}
!19 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 32, i64 32, i64 0, i32 0, metadata !20} ; [ DW_TAG_pointer_type ] [line 0, size 32, align 32, offset 0] [from cmplx16ImRe_t]
!20 = metadata !{i32 786454, metadata !21, null, metadata !"cmplx16ImRe_t", i32 9, i64 0, i64 0, i64 0, i32 0, metadata !22} ; [ DW_TAG_typedef ] [cmplx16ImRe_t] [line 9, size 0, align 0, offset 0] [from cmplx16ImRe_t_]
!21 = metadata !{metadata !"../mmwave_lib.h", metadata !"D:\5Ceclipse\5Cworkspace\5Cdss\5CRelease"}
!22 = metadata !{i32 786451, metadata !21, null, metadata !"cmplx16ImRe_t_", i32 5, i64 32, i64 16, i32 0, i32 0, null, metadata !23, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [cmplx16ImRe_t_] [line 5, size 32, align 16, offset 0] [def] [from ]
!23 = metadata !{metadata !24, metadata !27}
!24 = metadata !{i32 786445, metadata !21, metadata !22, metadata !"imag", i32 7, i64 16, i64 16, i64 0, i32 0, metadata !25} ; [ DW_TAG_member ] [imag] [line 7, size 16, align 16, offset 0] [from int16_t]
!25 = metadata !{i32 786454, metadata !26, null, metadata !"int16_t", i32 31, i64 0, i64 0, i64 0, i32 0, metadata !8} ; [ DW_TAG_typedef ] [int16_t] [line 31, size 0, align 0, offset 0] [from short]
!26 = metadata !{metadata !"D:\5CCIC\5CSwift_IDE_Toolchain\5Ctoolchain_8slot\5Cinclude\5Ctypes/int16_t.h", metadata !"D:\5Ceclipse\5Cworkspace\5Cdss\5CRelease"}
!27 = metadata !{i32 786445, metadata !21, metadata !22, metadata !"real", i32 8, i64 16, i64 16, i64 16, i32 0, metadata !25} ; [ DW_TAG_member ] [real] [line 8, size 16, align 16, offset 16] [from int16_t]
!28 = metadata !{metadata !29, metadata !33, metadata !34, metadata !35, metadata !39, metadata !40, metadata !50, metadata !54, metadata !58, metadata !59, metadata !60, metadata !61, metadata !63, metadata !64, metadata !71, metadata !73, metadata !75, metadata !77, metadata !78, metadata !79}
!29 = metadata !{i32 786484, i32 0, null, metadata !"cfarDopplerDetOutBitMask", metadata !"cfarDopplerDetOutBitMask", metadata !"", metadata !5, i32 14, metadata !30, i32 0, i32 1, [32 x i16]* @cfarDopplerDetOutBitMask, null} ; [ DW_TAG_variable ] [cfarDopplerDetOutBitMask] [line 14] [def]
!30 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 512, i64 16, i32 0, i32 0, metadata !10, metadata !31, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 512, align 16, offset 0] [from uint16_t]
!31 = metadata !{metadata !32}
!32 = metadata !{i32 786465, i64 0, i64 32}       ; [ DW_TAG_subrange_type ] [0, 31]
!33 = metadata !{i32 786484, i32 0, null, metadata !"Log2AbsBuf", metadata !"Log2AbsBuf", metadata !"", metadata !5, i32 18, metadata !9, i32 0, i32 1, i16** @Log2AbsBuf, null} ; [ DW_TAG_variable ] [Log2AbsBuf] [line 18] [def]
!34 = metadata !{i32 786484, i32 0, null, metadata !"sumAbsBuf", metadata !"sumAbsBuf", metadata !"", metadata !5, i32 19, metadata !30, i32 0, i32 1, [32 x i16]* @sumAbsBuf, null} ; [ DW_TAG_variable ] [sumAbsBuf] [line 19] [def]
!35 = metadata !{i32 786484, i32 0, null, metadata !"detMartrix1", metadata !"detMartrix1", metadata !"", metadata !5, i32 20, metadata !36, i32 0, i32 1, [8192 x i16]* @detMartrix1, null} ; [ DW_TAG_variable ] [detMartrix1] [line 20] [def]
!36 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 131072, i64 16, i32 0, i32 0, metadata !10, metadata !37, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 131072, align 16, offset 0] [from uint16_t]
!37 = metadata !{metadata !38}
!38 = metadata !{i32 786465, i64 0, i64 8192}     ; [ DW_TAG_subrange_type ] [0, 8191]
!39 = metadata !{i32 786484, i32 0, null, metadata !"detMartrix", metadata !"detMartrix", metadata !"", metadata !5, i32 21, metadata !9, i32 0, i32 1, i16** @detMartrix, null} ; [ DW_TAG_variable ] [detMartrix] [line 21] [def]
!40 = metadata !{i32 786484, i32 0, null, metadata !"fftOutBuf1", metadata !"fftOutBuf1", metadata !"", metadata !5, i32 28, metadata !41, i32 0, i32 1, [32 x %struct.cmplx32ImRe_t_]* @fftOutBuf1, null} ; [ DW_TAG_variable ] [fftOutBuf1] [line 28] [def]
!41 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 2048, i64 32, i32 0, i32 0, metadata !42, metadata !31, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 2048, align 32, offset 0] [from cmplx32ImRe_t]
!42 = metadata !{i32 786454, metadata !21, null, metadata !"cmplx32ImRe_t", i32 19, i64 0, i64 0, i64 0, i32 0, metadata !43} ; [ DW_TAG_typedef ] [cmplx32ImRe_t] [line 19, size 0, align 0, offset 0] [from cmplx32ImRe_t_]
!43 = metadata !{i32 786451, metadata !21, null, metadata !"cmplx32ImRe_t_", i32 15, i64 64, i64 32, i32 0, i32 0, null, metadata !44, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [cmplx32ImRe_t_] [line 15, size 64, align 32, offset 0] [def] [from ]
!44 = metadata !{metadata !45, metadata !49}
!45 = metadata !{i32 786445, metadata !21, metadata !43, metadata !"imag", i32 17, i64 32, i64 32, i64 0, i32 0, metadata !46} ; [ DW_TAG_member ] [imag] [line 17, size 32, align 32, offset 0] [from int32_t]
!46 = metadata !{i32 786454, metadata !47, null, metadata !"int32_t", i32 31, i64 0, i64 0, i64 0, i32 0, metadata !48} ; [ DW_TAG_typedef ] [int32_t] [line 31, size 0, align 0, offset 0] [from int]
!47 = metadata !{metadata !"D:\5CCIC\5CSwift_IDE_Toolchain\5Ctoolchain_8slot\5Cinclude\5Ctypes/int32_t.h", metadata !"D:\5Ceclipse\5Cworkspace\5Cdss\5CRelease"}
!48 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!49 = metadata !{i32 786445, metadata !21, metadata !43, metadata !"real", i32 18, i64 32, i64 32, i64 32, i32 0, metadata !46} ; [ DW_TAG_member ] [real] [line 18, size 32, align 32, offset 32] [from int32_t]
!50 = metadata !{i32 786484, i32 0, null, metadata !"window1", metadata !"window1", metadata !"", metadata !5, i32 34, metadata !51, i32 0, i32 1, [64 x i32]* @window1, null} ; [ DW_TAG_variable ] [window1] [line 34] [def]
!51 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 2048, i64 32, i32 0, i32 0, metadata !48, metadata !52, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 2048, align 32, offset 0] [from int]
!52 = metadata !{metadata !53}
!53 = metadata !{i32 786465, i64 0, i64 64}       ; [ DW_TAG_subrange_type ] [0, 63]
!54 = metadata !{i32 786484, i32 0, null, metadata !"cfarDetOut", metadata !"cfarDetOut", metadata !"", metadata !5, i32 13, metadata !55, i32 0, i32 1, [256 x i16]* @cfarDetOut, null} ; [ DW_TAG_variable ] [cfarDetOut] [line 13] [def]
!55 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 4096, i64 16, i32 0, i32 0, metadata !10, metadata !56, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 4096, align 16, offset 0] [from uint16_t]
!56 = metadata !{metadata !57}
!57 = metadata !{i32 786465, i64 0, i64 256}      ; [ DW_TAG_subrange_type ] [0, 255]
!58 = metadata !{i32 786484, i32 0, null, metadata !"cfarDetOutBuffer", metadata !"cfarDetOutBuffer", metadata !"", metadata !5, i32 15, metadata !30, i32 0, i32 1, [32 x i16]* @cfarDetOutBuffer, null} ; [ DW_TAG_variable ] [cfarDetOutBuffer] [line 15] [def]
!59 = metadata !{i32 786484, i32 0, null, metadata !"localDetMatrixBuffer", metadata !"localDetMatrixBuffer", metadata !"", metadata !5, i32 16, metadata !30, i32 0, i32 1, [32 x i16]* @localDetMatrixBuffer, null} ; [ DW_TAG_variable ] [localDetMatrixBuffer] [line 16] [def]
!60 = metadata !{i32 786484, i32 0, null, metadata !"Log2AbsBuf1", metadata !"Log2AbsBuf1", metadata !"", metadata !5, i32 17, metadata !30, i32 0, i32 1, [32 x i16]* @Log2AbsBuf1, null} ; [ DW_TAG_variable ] [Log2AbsBuf1] [line 17] [def]
!61 = metadata !{i32 786484, i32 0, null, metadata !"sum", metadata !"sum", metadata !"", metadata !5, i32 22, metadata !62, i32 0, i32 1, %struct.cmplx32ImRe_t_** @sum, null} ; [ DW_TAG_variable ] [sum] [line 22] [def]
!62 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 32, i64 32, i64 0, i32 0, metadata !42} ; [ DW_TAG_pointer_type ] [line 0, size 32, align 32, offset 0] [from cmplx32ImRe_t]
!63 = metadata !{i32 786484, i32 0, null, metadata !"radarCubeBase", metadata !"radarCubeBase", metadata !"", metadata !5, i32 23, metadata !19, i32 0, i32 1, %struct.cmplx16ImRe_t_** @radarCubeBase, null} ; [ DW_TAG_variable ] [radarCubeBase] [line 23] [def]
!64 = metadata !{i32 786484, i32 0, null, metadata !"windowingOutBuf", metadata !"windowingOutBuf", metadata !"", metadata !5, i32 24, metadata !65, i32 0, i32 1, [64 x %struct.cmplx32ReIm_t_]* @windowingOutBuf, null} ; [ DW_TAG_variable ] [windowingOutBuf] [line 24] [def]
!65 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 4096, i64 32, i32 0, i32 0, metadata !66, metadata !52, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 4096, align 32, offset 0] [from cmplx32ReIm_t]
!66 = metadata !{i32 786454, metadata !21, null, metadata !"cmplx32ReIm_t", i32 14, i64 0, i64 0, i64 0, i32 0, metadata !67} ; [ DW_TAG_typedef ] [cmplx32ReIm_t] [line 14, size 0, align 0, offset 0] [from cmplx32ReIm_t_]
!67 = metadata !{i32 786451, metadata !21, null, metadata !"cmplx32ReIm_t_", i32 10, i64 64, i64 32, i32 0, i32 0, null, metadata !68, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [cmplx32ReIm_t_] [line 10, size 64, align 32, offset 0] [def] [from ]
!68 = metadata !{metadata !69, metadata !70}
!69 = metadata !{i32 786445, metadata !21, metadata !67, metadata !"real", i32 12, i64 32, i64 32, i64 0, i32 0, metadata !46} ; [ DW_TAG_member ] [real] [line 12, size 32, align 32, offset 0] [from int32_t]
!70 = metadata !{i32 786445, metadata !21, metadata !67, metadata !"imag", i32 13, i64 32, i64 32, i64 32, i32 0, metadata !46} ; [ DW_TAG_member ] [imag] [line 13, size 32, align 32, offset 32] [from int32_t]
!71 = metadata !{i32 786484, i32 0, null, metadata !"H", metadata !"H", metadata !"", metadata !5, i32 25, metadata !72, i32 0, i32 1, [256 x %struct.cmplx16ImRe_t_]* @H, null} ; [ DW_TAG_variable ] [H] [line 25] [def]
!72 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 8192, i64 16, i32 0, i32 0, metadata !20, metadata !56, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 8192, align 16, offset 0] [from cmplx16ImRe_t]
!73 = metadata !{i32 786484, i32 0, null, metadata !"pingPongBuf", metadata !"pingPongBuf", metadata !"", metadata !5, i32 26, metadata !74, i32 0, i32 1, [64 x %struct.cmplx16ImRe_t_]* @pingPongBuf, null} ; [ DW_TAG_variable ] [pingPongBuf] [line 26] [def]
!74 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 2048, i64 16, i32 0, i32 0, metadata !20, metadata !52, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 2048, align 16, offset 0] [from cmplx16ImRe_t]
!75 = metadata !{i32 786484, i32 0, null, metadata !"dcoutBuf", metadata !"dcoutBuf", metadata !"", metadata !5, i32 27, metadata !76, i32 0, i32 1, [32 x %struct.cmplx16ImRe_t_]* @dcoutBuf, null} ; [ DW_TAG_variable ] [dcoutBuf] [line 27] [def]
!76 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 1024, i64 16, i32 0, i32 0, metadata !20, metadata !31, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1024, align 16, offset 0] [from cmplx16ImRe_t]
!77 = metadata !{i32 786484, i32 0, null, metadata !"fftOutBuf", metadata !"fftOutBuf", metadata !"", metadata !5, i32 29, metadata !62, i32 0, i32 1, %struct.cmplx32ImRe_t_** @fftOutBuf, null} ; [ DW_TAG_variable ] [fftOutBuf] [line 29] [def]
!78 = metadata !{i32 786484, i32 0, null, metadata !"fftinBuf", metadata !"fftinBuf", metadata !"", metadata !5, i32 30, metadata !41, i32 0, i32 1, [32 x %struct.cmplx32ImRe_t_]* @fftinBuf, null} ; [ DW_TAG_variable ] [fftinBuf] [line 30] [def]
!79 = metadata !{i32 786484, i32 0, null, metadata !"cfardetect", metadata !"cfardetect", metadata !"", metadata !5, i32 32, metadata !80, i32 0, i32 1, [256 x %struct.cfarpList_]* @cfardetect, null} ; [ DW_TAG_variable ] [cfardetect] [line 32] [def]
!80 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 12288, i64 16, i32 0, i32 0, metadata !81, metadata !56, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 12288, align 16, offset 0] [from cfarList]
!81 = metadata !{i32 786454, metadata !21, null, metadata !"cfarList", i32 32, i64 0, i64 0, i64 0, i32 0, metadata !82} ; [ DW_TAG_typedef ] [cfarList] [line 32, size 0, align 0, offset 0] [from cfarpList_]
!82 = metadata !{i32 786451, metadata !21, null, metadata !"cfarpList_", i32 28, i64 48, i64 16, i32 0, i32 0, null, metadata !83, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [cfarpList_] [line 28, size 48, align 16, offset 0] [def] [from ]
!83 = metadata !{metadata !84, metadata !85, metadata !86}
!84 = metadata !{i32 786445, metadata !21, metadata !82, metadata !"rangeIdx", i32 29, i64 16, i64 16, i64 0, i32 0, metadata !25} ; [ DW_TAG_member ] [rangeIdx] [line 29, size 16, align 16, offset 0] [from int16_t]
!85 = metadata !{i32 786445, metadata !21, metadata !82, metadata !"dopplerIdx", i32 30, i64 16, i64 16, i64 16, i32 0, metadata !25} ; [ DW_TAG_member ] [dopplerIdx] [line 30, size 16, align 16, offset 16] [from int16_t]
!86 = metadata !{i32 786445, metadata !21, metadata !82, metadata !"numObjsIn", i32 31, i64 16, i64 16, i64 32, i32 0, metadata !25} ; [ DW_TAG_member ] [numObjsIn] [line 31, size 16, align 16, offset 32] [from int16_t]
!87 = metadata !{i32 2, metadata !"Dwarf Version", i32 2}
!88 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!89 = metadata !{metadata !"clang version 3.5.0 (tags/RELEASE_350/final)"}
!90 = metadata !{i32 786689, metadata !4, metadata !"detectmatrix", metadata !5, i32 16777254, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [detectmatrix] [line 38]
!91 = metadata !{i32 38, i32 32, metadata !4, null}
!92 = metadata !{i32 786688, metadata !4, metadata !"numDetObjPerCfar", metadata !5, i32 40, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [numDetObjPerCfar] [line 40]
!93 = metadata !{i32 40, i32 14, metadata !4, null}
!94 = metadata !{i32 786688, metadata !4, metadata !"numDetObjDoppler", metadata !5, i32 41, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [numDetObjDoppler] [line 41]
!95 = metadata !{i32 41, i32 17, metadata !4, null}
!96 = metadata !{i32 41, i32 5, metadata !4, null}
!97 = metadata !{i32 786688, metadata !4, metadata !"detIndex", metadata !5, i32 42, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [detIndex] [line 42]
!98 = metadata !{i32 42, i32 17, metadata !4, null}
!99 = metadata !{i32 786688, metadata !4, metadata !"rangeIdx", metadata !5, i32 43, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [rangeIdx] [line 43]
!100 = metadata !{i32 43, i32 17, metadata !4, null}
!101 = metadata !{i32 786688, metadata !4, metadata !"Channel", metadata !5, i32 43, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Channel] [line 43]
!102 = metadata !{i32 43, i32 26, metadata !4, null}
!103 = metadata !{i32 786688, metadata !4, metadata !"thresholdScale", metadata !5, i32 44, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [thresholdScale] [line 44]
!104 = metadata !{i32 44, i32 14, metadata !4, null}
!105 = metadata !{i32 44, i32 5, metadata !4, null}
!106 = metadata !{i32 786688, metadata !4, metadata !"noiseDivShift", metadata !5, i32 45, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [noiseDivShift] [line 45]
!107 = metadata !{i32 45, i32 11, metadata !4, null}
!108 = metadata !{i32 45, i32 2, metadata !4, null}
!109 = metadata !{i32 786688, metadata !4, metadata !"DopguardLen", metadata !5, i32 46, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [DopguardLen] [line 46]
!110 = metadata !{i32 46, i32 11, metadata !4, null}
!111 = metadata !{i32 46, i32 2, metadata !4, null}
!112 = metadata !{i32 786688, metadata !4, metadata !"DopwinLen", metadata !5, i32 47, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [DopwinLen] [line 47]
!113 = metadata !{i32 47, i32 11, metadata !4, null}
!114 = metadata !{i32 47, i32 2, metadata !4, null}
!115 = metadata !{i32 786688, metadata !4, metadata !"cfarDetOutBuffer", metadata !5, i32 49, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cfarDetOutBuffer] [line 49]
!116 = metadata !{i32 49, i32 11, metadata !4, null}
!117 = metadata !{i32 53, i32 5, metadata !4, null}
!118 = metadata !{i32 786688, metadata !119, metadata !"i", metadata !5, i32 54, metadata !48, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 54]
!119 = metadata !{i32 786443, metadata !1, metadata !4, i32 54, i32 5, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!120 = metadata !{i32 54, i32 13, metadata !119, null}
!121 = metadata !{i32 54, i32 9, metadata !119, null}
!122 = metadata !{i32 56, i32 5, metadata !123, null}
!123 = metadata !{i32 786443, metadata !1, metadata !119, i32 55, i32 5, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!124 = metadata !{i32 56, i32 69, metadata !123, null}
!125 = metadata !{i32 54, i32 36, metadata !119, null}
!126 = metadata !{i32 60, i32 8, metadata !4, null}
!127 = metadata !{i32 786688, metadata !128, metadata !"currDetMatrixBuffer", metadata !5, i32 62, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [currDetMatrixBuffer] [line 62]
!128 = metadata !{i32 786443, metadata !1, metadata !4, i32 61, i32 8, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!129 = metadata !{i32 62, i32 22, metadata !128, null}
!130 = metadata !{i32 786688, metadata !128, metadata !"edmaChannel", metadata !5, i32 63, metadata !131, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [edmaChannel] [line 63]
!131 = metadata !{i32 786454, metadata !132, null, metadata !"uint8_t", i32 31, i64 0, i64 0, i64 0, i32 0, metadata !133} ; [ DW_TAG_typedef ] [uint8_t] [line 31, size 0, align 0, offset 0] [from unsigned char]
!132 = metadata !{metadata !"D:\5CCIC\5CSwift_IDE_Toolchain\5Ctoolchain_8slot\5Cinclude\5Ctypes/uint8_t.h", metadata !"D:\5Ceclipse\5Cworkspace\5Cdss\5CRelease"}
!133 = metadata !{i32 786468, null, null, metadata !"unsigned char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ] [unsigned char] [line 0, size 8, align 8, offset 0, enc DW_ATE_unsigned_char]
!134 = metadata !{i32 63, i32 20, metadata !128, null}
!135 = metadata !{i32 75, i32 12, metadata !128, null}
!136 = metadata !{i32 80, i32 31, metadata !128, null}
!137 = metadata !{i32 89, i32 17, metadata !138, null}
!138 = metadata !{i32 786443, metadata !1, metadata !128, i32 89, i32 12, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!139 = metadata !{i32 786688, metadata !140, metadata !"dopplerIndex", metadata !5, i32 91, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dopplerIndex] [line 91]
!140 = metadata !{i32 786443, metadata !1, metadata !138, i32 90, i32 12, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!141 = metadata !{i32 91, i32 25, metadata !140, null}
!142 = metadata !{i32 93, i32 16, metadata !140, null}
!143 = metadata !{i32 96, i32 16, metadata !140, null}
!144 = metadata !{i32 99, i32 12, metadata !140, null}
!145 = metadata !{i32 89, i32 60, metadata !138, null}
!146 = metadata !{i32 100, i32 12, metadata !128, null}
!147 = metadata !{i32 103, i32 15, metadata !148, null}
!148 = metadata !{i32 786443, metadata !1, metadata !128, i32 103, i32 15, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!149 = metadata !{i32 786688, metadata !150, metadata !"i", metadata !5, i32 105, metadata !48, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 105]
!150 = metadata !{i32 786443, metadata !1, metadata !151, i32 105, i32 13, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!151 = metadata !{i32 786443, metadata !1, metadata !148, i32 104, i32 12, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!152 = metadata !{i32 105, i32 21, metadata !150, null}
!153 = metadata !{i32 105, i32 17, metadata !150, null}
!154 = metadata !{i32 107, i32 17, metadata !155, null}
!155 = metadata !{i32 786443, metadata !1, metadata !150, i32 106, i32 17, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!156 = metadata !{i32 107, i32 83, metadata !155, null}
!157 = metadata !{i32 105, i32 44, metadata !150, null}
!158 = metadata !{i32 108, i32 12, metadata !151, null}
!159 = metadata !{i32 109, i32 8, metadata !128, null}
!160 = metadata !{i32 111, i32 8, metadata !4, null}
!161 = metadata !{i32 786689, metadata !13, metadata !"detectmatrix", metadata !5, i32 16777335, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [detectmatrix] [line 119]
!162 = metadata !{i32 119, i32 27, metadata !13, null}
!163 = metadata !{i32 786689, metadata !13, metadata !"cfarDopplerDetOutBitMask", metadata !5, i32 33554551, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [cfarDopplerDetOutBitMask] [line 119]
!164 = metadata !{i32 119, i32 50, metadata !13, null}
!165 = metadata !{i32 786688, metadata !13, metadata !"detIdx", metadata !5, i32 121, metadata !166, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [detIdx] [line 121]
!166 = metadata !{i32 786454, metadata !167, null, metadata !"uint32_t", i32 31, i64 0, i64 0, i64 0, i32 0, metadata !168} ; [ DW_TAG_typedef ] [uint32_t] [line 31, size 0, align 0, offset 0] [from unsigned int]
!167 = metadata !{metadata !"D:\5CCIC\5CSwift_IDE_Toolchain\5Ctoolchain_8slot\5Cinclude\5Ctypes/uint32_t.h", metadata !"D:\5Ceclipse\5Cworkspace\5Cdss\5CRelease"}
!168 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!169 = metadata !{i32 121, i32 21, metadata !13, null}
!170 = metadata !{i32 786688, metadata !13, metadata !"numDetObjIndex", metadata !5, i32 122, metadata !166, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [numDetObjIndex] [line 122]
!171 = metadata !{i32 122, i32 21, metadata !13, null}
!172 = metadata !{i32 122, i32 1, metadata !13, null}
!173 = metadata !{i32 786688, metadata !13, metadata !"dopplerLine", metadata !5, i32 123, metadata !166, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dopplerLine] [line 123]
!174 = metadata !{i32 123, i32 21, metadata !13, null}
!175 = metadata !{i32 786688, metadata !13, metadata !"numDetObj", metadata !5, i32 124, metadata !166, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [numDetObj] [line 124]
!176 = metadata !{i32 124, i32 21, metadata !13, null}
!177 = metadata !{i32 786688, metadata !13, metadata !"srcAddr", metadata !5, i32 125, metadata !46, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [srcAddr] [line 125]
!178 = metadata !{i32 125, i32 20, metadata !13, null}
!179 = metadata !{i32 786688, metadata !13, metadata !"localBufferAddr", metadata !5, i32 126, metadata !46, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [localBufferAddr] [line 126]
!180 = metadata !{i32 126, i32 20, metadata !13, null}
!181 = metadata !{i32 786688, metadata !13, metadata !"loopIndex", metadata !5, i32 127, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [loopIndex] [line 127]
!182 = metadata !{i32 127, i32 21, metadata !13, null}
!183 = metadata !{i32 127, i32 1, metadata !13, null}
!184 = metadata !{i32 786688, metadata !13, metadata !"oneDopplerBinSize", metadata !5, i32 128, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [oneDopplerBinSize] [line 128]
!185 = metadata !{i32 128, i32 21, metadata !13, null}
!186 = metadata !{i32 786688, metadata !13, metadata !"dopplerSgnIdx", metadata !5, i32 129, metadata !25, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dopplerSgnIdx] [line 129]
!187 = metadata !{i32 129, i32 21, metadata !13, null}
!188 = metadata !{i32 786688, metadata !13, metadata !"numDetObjPerCfar", metadata !5, i32 130, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [numDetObjPerCfar] [line 130]
!189 = metadata !{i32 130, i32 21, metadata !13, null}
!190 = metadata !{i32 786688, metadata !13, metadata !"thresholdScale", metadata !5, i32 132, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [thresholdScale] [line 132]
!191 = metadata !{i32 132, i32 10, metadata !13, null}
!192 = metadata !{i32 132, i32 1, metadata !13, null}
!193 = metadata !{i32 786688, metadata !13, metadata !"noiseDivShift", metadata !5, i32 133, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [noiseDivShift] [line 133]
!194 = metadata !{i32 133, i32 10, metadata !13, null}
!195 = metadata !{i32 133, i32 1, metadata !13, null}
!196 = metadata !{i32 786688, metadata !13, metadata !"DopguardLen", metadata !5, i32 134, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [DopguardLen] [line 134]
!197 = metadata !{i32 134, i32 10, metadata !13, null}
!198 = metadata !{i32 134, i32 1, metadata !13, null}
!199 = metadata !{i32 786688, metadata !13, metadata !"DopwinLen", metadata !5, i32 135, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [DopwinLen] [line 135]
!200 = metadata !{i32 135, i32 10, metadata !13, null}
!201 = metadata !{i32 135, i32 1, metadata !13, null}
!202 = metadata !{i32 786688, metadata !13, metadata !"cfar_rangdetect", metadata !5, i32 137, metadata !55, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cfar_rangdetect] [line 137]
!203 = metadata !{i32 137, i32 10, metadata !13, null}
!204 = metadata !{i32 786688, metadata !13, metadata !"cfarDetOutBuffer", metadata !5, i32 138, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cfarDetOutBuffer] [line 138]
!205 = metadata !{i32 138, i32 10, metadata !13, null}
!206 = metadata !{i32 138, i32 1, metadata !13, null}
!207 = metadata !{i32 786688, metadata !13, metadata !"flag", metadata !5, i32 141, metadata !48, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [flag] [line 141]
!208 = metadata !{i32 141, i32 5, metadata !13, null}
!209 = metadata !{i32 141, i32 1, metadata !13, null}
!210 = metadata !{i32 786688, metadata !211, metadata !"i", metadata !5, i32 142, metadata !48, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 142]
!211 = metadata !{i32 786443, metadata !1, metadata !13, i32 142, i32 1, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!212 = metadata !{i32 142, i32 9, metadata !211, null}
!213 = metadata !{i32 142, i32 5, metadata !211, null}
!214 = metadata !{i32 143, i32 8, metadata !215, null}
!215 = metadata !{i32 786443, metadata !1, metadata !216, i32 143, i32 8, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!216 = metadata !{i32 786443, metadata !1, metadata !211, i32 143, i32 3, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!217 = metadata !{i32 786688, metadata !218, metadata !"j", metadata !5, i32 144, metadata !48, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 144]
!218 = metadata !{i32 786443, metadata !1, metadata !219, i32 144, i32 11, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!219 = metadata !{i32 786443, metadata !1, metadata !215, i32 144, i32 6, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!220 = metadata !{i32 144, i32 19, metadata !218, null}
!221 = metadata !{i32 144, i32 15, metadata !218, null}
!222 = metadata !{i32 145, i32 7, metadata !223, null}
!223 = metadata !{i32 786443, metadata !1, metadata !218, i32 145, i32 6, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!224 = metadata !{i32 145, i32 61, metadata !223, null}
!225 = metadata !{i32 144, i32 38, metadata !218, null}
!226 = metadata !{i32 147, i32 27, metadata !219, null}
!227 = metadata !{i32 156, i32 14, metadata !228, null}
!228 = metadata !{i32 786443, metadata !1, metadata !219, i32 156, i32 14, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!229 = metadata !{i32 786688, metadata !230, metadata !"detIndex", metadata !5, i32 157, metadata !48, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [detIndex] [line 157]
!230 = metadata !{i32 786443, metadata !1, metadata !231, i32 157, i32 16, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!231 = metadata !{i32 786443, metadata !1, metadata !228, i32 157, i32 11, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!232 = metadata !{i32 157, i32 25, metadata !230, null}
!233 = metadata !{i32 157, i32 21, metadata !230, null}
!234 = metadata !{i32 786688, metadata !235, metadata !"rangIndex", metadata !5, i32 159, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [rangIndex] [line 159]
!235 = metadata !{i32 786443, metadata !1, metadata !230, i32 158, i32 17, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!236 = metadata !{i32 159, i32 30, metadata !235, null}
!237 = metadata !{i32 161, i32 21, metadata !235, null}
!238 = metadata !{i32 162, i32 26, metadata !239, null}
!239 = metadata !{i32 786443, metadata !1, metadata !235, i32 162, i32 26, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!240 = metadata !{i32 163, i32 23, metadata !241, null}
!241 = metadata !{i32 786443, metadata !1, metadata !239, i32 163, i32 22, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!242 = metadata !{i32 164, i32 23, metadata !241, null}
!243 = metadata !{i32 165, i32 23, metadata !241, null}
!244 = metadata !{i32 166, i32 23, metadata !241, null}
!245 = metadata !{i32 167, i32 23, metadata !241, null}
!246 = metadata !{i32 168, i32 23, metadata !241, null}
!247 = metadata !{i32 168, i32 44, metadata !241, null}
!248 = metadata !{i32 172, i32 24, metadata !249, null}
!249 = metadata !{i32 786443, metadata !1, metadata !239, i32 172, i32 22, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!250 = metadata !{i32 174, i32 17, metadata !235, null}
!251 = metadata !{i32 157, i32 68, metadata !230, null}
!252 = metadata !{i32 175, i32 17, metadata !231, null}
!253 = metadata !{i32 176, i32 11, metadata !231, null}
!254 = metadata !{i32 177, i32 9, metadata !219, null}
!255 = metadata !{i32 178, i32 6, metadata !216, null}
!256 = metadata !{i32 142, i32 32, metadata !211, null}
!257 = metadata !{i32 181, i32 1, metadata !13, null}
!258 = metadata !{i32 786689, metadata !16, metadata !"radarCubeBuf1", metadata !5, i32 16777401, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [radarCubeBuf1] [line 185]
!259 = metadata !{i32 185, i32 35, metadata !16, null}
!260 = metadata !{i32 786688, metadata !16, metadata !"log2VirtAnt", metadata !5, i32 190, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [log2VirtAnt] [line 190]
!261 = metadata !{i32 190, i32 10, metadata !16, null}
!262 = metadata !{i32 190, i32 1, metadata !16, null}
!263 = metadata !{i32 786688, metadata !16, metadata !"rxAntIdx", metadata !5, i32 191, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [rxAntIdx] [line 191]
!264 = metadata !{i32 191, i32 10, metadata !16, null}
!265 = metadata !{i32 786688, metadata !16, metadata !"rangeIdx", metadata !5, i32 191, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [rangeIdx] [line 191]
!266 = metadata !{i32 191, i32 20, metadata !16, null}
!267 = metadata !{i32 786688, metadata !16, metadata !"txAntIdx", metadata !5, i32 191, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [txAntIdx] [line 191]
!268 = metadata !{i32 191, i32 30, metadata !16, null}
!269 = metadata !{i32 786688, metadata !16, metadata !"idx", metadata !5, i32 191, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [idx] [line 191]
!270 = metadata !{i32 191, i32 39, metadata !16, null}
!271 = metadata !{i32 786688, metadata !16, metadata !"nextTransferRxIdx", metadata !5, i32 192, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [nextTransferRxIdx] [line 192]
!272 = metadata !{i32 192, i32 10, metadata !16, null}
!273 = metadata !{i32 786688, metadata !16, metadata !"nextTransferRangeIdx", metadata !5, i32 192, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [nextTransferRangeIdx] [line 192]
!274 = metadata !{i32 192, i32 29, metadata !16, null}
!275 = metadata !{i32 786688, metadata !16, metadata !"nextTransferTxIdx", metadata !5, i32 192, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [nextTransferTxIdx] [line 192]
!276 = metadata !{i32 192, i32 51, metadata !16, null}
!277 = metadata !{i32 786688, metadata !16, metadata !"rxAntIdxBPMPreviousBuffer", metadata !5, i32 193, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [rxAntIdxBPMPreviousBuffer] [line 193]
!278 = metadata !{i32 193, i32 10, metadata !16, null}
!279 = metadata !{i32 786688, metadata !16, metadata !"txAntIdxBPMPreviousBuffer", metadata !5, i32 193, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [txAntIdxBPMPreviousBuffer] [line 193]
!280 = metadata !{i32 193, i32 37, metadata !16, null}
!281 = metadata !{i32 786688, metadata !16, metadata !"nextTransferIdx", metadata !5, i32 194, metadata !166, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [nextTransferIdx] [line 194]
!282 = metadata !{i32 194, i32 10, metadata !16, null}
!283 = metadata !{i32 786688, metadata !16, metadata !"waitingTime", metadata !5, i32 194, metadata !166, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [waitingTime] [line 194]
!284 = metadata !{i32 194, i32 27, metadata !16, null}
!285 = metadata !{i32 786688, metadata !16, metadata !"pingPongIdx", metadata !5, i32 194, metadata !166, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pingPongIdx] [line 194]
!286 = metadata !{i32 194, i32 40, metadata !16, null}
!287 = metadata !{i32 786688, metadata !16, metadata !"channel", metadata !5, i32 195, metadata !131, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [channel] [line 195]
!288 = metadata !{i32 195, i32 10, metadata !16, null}
!289 = metadata !{i32 786688, metadata !16, metadata !"inpDoppFftBuf", metadata !5, i32 197, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [inpDoppFftBuf] [line 197]
!290 = metadata !{i32 197, i32 17, metadata !16, null}
!291 = metadata !{i32 786688, metadata !16, metadata !"radarCubeBuf", metadata !5, i32 198, metadata !292, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [radarCubeBuf] [line 198]
!292 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 3145728, i64 16, i32 0, i32 0, metadata !20, metadata !293, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 3145728, align 16, offset 0] [from cmplx16ImRe_t]
!293 = metadata !{metadata !294}
!294 = metadata !{i32 786465, i64 0, i64 98304}   ; [ DW_TAG_subrange_type ] [0, 98303]
!295 = metadata !{i32 198, i32 15, metadata !16, null}
!296 = metadata !{i32 786688, metadata !297, metadata !"i", metadata !5, i32 202, metadata !48, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 202]
!297 = metadata !{i32 786443, metadata !1, metadata !16, i32 202, i32 1, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!298 = metadata !{i32 202, i32 10, metadata !297, null}
!299 = metadata !{i32 202, i32 6, metadata !297, null}
!300 = metadata !{i32 203, i32 3, metadata !301, null}
!301 = metadata !{i32 786443, metadata !1, metadata !297, i32 203, i32 1, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!302 = metadata !{i32 203, i32 40, metadata !301, null}
!303 = metadata !{i32 202, i32 78, metadata !297, null}
!304 = metadata !{i32 209, i32 1, metadata !16, null}
!305 = metadata !{i32 786688, metadata !306, metadata !"i", metadata !5, i32 211, metadata !48, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 211]
!306 = metadata !{i32 786443, metadata !1, metadata !16, i32 211, i32 1, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!307 = metadata !{i32 211, i32 10, metadata !306, null}
!308 = metadata !{i32 211, i32 6, metadata !306, null}
!309 = metadata !{i32 212, i32 5, metadata !310, null}
!310 = metadata !{i32 786443, metadata !1, metadata !306, i32 212, i32 1, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!311 = metadata !{i32 214, i32 1, metadata !310, null}
!312 = metadata !{i32 211, i32 33, metadata !306, null}
!313 = metadata !{i32 220, i32 6, metadata !314, null}
!314 = metadata !{i32 786443, metadata !1, metadata !16, i32 220, i32 1, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!315 = metadata !{i32 223, i32 14, metadata !316, null}
!316 = metadata !{i32 786443, metadata !1, metadata !317, i32 223, i32 9, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!317 = metadata !{i32 786443, metadata !1, metadata !314, i32 221, i32 5, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!318 = metadata !{i32 225, i32 18, metadata !319, null}
!319 = metadata !{i32 786443, metadata !1, metadata !320, i32 225, i32 13, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!320 = metadata !{i32 786443, metadata !1, metadata !316, i32 224, i32 9, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!321 = metadata !{i32 227, i32 14, metadata !322, null}
!322 = metadata !{i32 786443, metadata !1, metadata !319, i32 226, i32 13, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!323 = metadata !{i32 228, i32 14, metadata !322, null}
!324 = metadata !{i32 229, i32 14, metadata !322, null}
!325 = metadata !{i32 231, i32 17, metadata !326, null}
!326 = metadata !{i32 786443, metadata !1, metadata !322, i32 231, i32 17, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!327 = metadata !{i32 233, i32 16, metadata !328, null}
!328 = metadata !{i32 786443, metadata !1, metadata !326, i32 232, i32 14, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!329 = metadata !{i32 234, i32 16, metadata !328, null}
!330 = metadata !{i32 235, i32 19, metadata !331, null}
!331 = metadata !{i32 786443, metadata !1, metadata !328, i32 235, i32 19, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!332 = metadata !{i32 237, i32 20, metadata !333, null}
!333 = metadata !{i32 786443, metadata !1, metadata !331, i32 236, i32 16, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!334 = metadata !{i32 238, i32 20, metadata !333, null}
!335 = metadata !{i32 239, i32 16, metadata !333, null}
!336 = metadata !{i32 240, i32 14, metadata !328, null}
!337 = metadata !{i32 243, i32 7, metadata !322, null}
!338 = metadata !{i32 246, i32 10, metadata !339, null}
!339 = metadata !{i32 786443, metadata !1, metadata !322, i32 246, i32 10, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!340 = metadata !{i32 249, i32 31, metadata !341, null}
!341 = metadata !{i32 786443, metadata !1, metadata !342, i32 249, i32 31, i32 0, i32 38} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!342 = metadata !{i32 786443, metadata !1, metadata !339, i32 247, i32 23, i32 0, i32 37} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!343 = metadata !{i32 251, i32 31, metadata !344, null}
!344 = metadata !{i32 786443, metadata !1, metadata !341, i32 250, i32 27, i32 0, i32 39} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!345 = metadata !{i32 252, i32 27, metadata !344, null}
!346 = metadata !{i32 255, i32 31, metadata !347, null}
!347 = metadata !{i32 786443, metadata !1, metadata !341, i32 254, i32 27, i32 0, i32 40} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!348 = metadata !{i32 786688, metadata !349, metadata !"i", metadata !5, i32 259, metadata !48, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 259]
!349 = metadata !{i32 786443, metadata !1, metadata !342, i32 259, i32 27, i32 0, i32 41} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!350 = metadata !{i32 259, i32 36, metadata !349, null}
!351 = metadata !{i32 259, i32 32, metadata !349, null}
!352 = metadata !{i32 260, i32 31, metadata !353, null}
!353 = metadata !{i32 786443, metadata !1, metadata !349, i32 260, i32 27, i32 0, i32 42} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!354 = metadata !{i32 262, i32 27, metadata !353, null}
!355 = metadata !{i32 259, i32 59, metadata !349, null}
!356 = metadata !{i32 264, i32 23, metadata !342, null}
!357 = metadata !{i32 265, i32 7, metadata !322, null}
!358 = metadata !{i32 786688, metadata !322, metadata !"sumvalue", metadata !5, i32 271, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sumvalue] [line 271]
!359 = metadata !{i32 271, i32 16, metadata !322, null}
!360 = metadata !{i32 271, i32 7, metadata !322, null}
!361 = metadata !{i32 272, i32 8, metadata !322, null}
!362 = metadata !{i32 274, i32 6, metadata !322, null}
!363 = metadata !{i32 276, i32 7, metadata !322, null}
!364 = metadata !{i32 279, i32 10, metadata !322, null}
!365 = metadata !{i32 281, i32 10, metadata !322, null}
!366 = metadata !{i32 285, i32 10, metadata !322, null}
!367 = metadata !{i32 786688, metadata !368, metadata !"p", metadata !5, i32 286, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [p] [line 286]
!368 = metadata !{i32 786443, metadata !1, metadata !322, i32 286, i32 10, i32 0, i32 43} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!369 = metadata !{i32 286, i32 20, metadata !368, null}
!370 = metadata !{i32 286, i32 14, metadata !368, null}
!371 = metadata !{i32 287, i32 11, metadata !372, null}
!372 = metadata !{i32 786443, metadata !1, metadata !368, i32 287, i32 10, i32 0, i32 44} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!373 = metadata !{i32 288, i32 10, metadata !372, null}
!374 = metadata !{i32 288, i32 31, metadata !372, null}
!375 = metadata !{i32 286, i32 28, metadata !368, null}
!376 = metadata !{i32 292, i32 7, metadata !322, null}
!377 = metadata !{i32 296, i32 15, metadata !378, null}
!378 = metadata !{i32 786443, metadata !1, metadata !322, i32 296, i32 15, i32 0, i32 45} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!379 = metadata !{i32 297, i32 15, metadata !380, null}
!380 = metadata !{i32 786443, metadata !1, metadata !381, i32 297, i32 15, i32 0, i32 47} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!381 = metadata !{i32 786443, metadata !1, metadata !378, i32 297, i32 11, i32 0, i32 46} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!382 = metadata !{i32 299, i32 20, metadata !383, null}
!383 = metadata !{i32 786443, metadata !1, metadata !384, i32 299, i32 15, i32 0, i32 49} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!384 = metadata !{i32 786443, metadata !1, metadata !380, i32 298, i32 13, i32 0, i32 48} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!385 = metadata !{i32 301, i32 19, metadata !386, null}
!386 = metadata !{i32 786443, metadata !1, metadata !383, i32 300, i32 15, i32 0, i32 50} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!387 = metadata !{i32 302, i32 15, metadata !386, null}
!388 = metadata !{i32 299, i32 53, metadata !383, null}
!389 = metadata !{i32 303, i32 13, metadata !384, null}
!390 = metadata !{i32 304, i32 11, metadata !381, null}
!391 = metadata !{i32 308, i32 18, metadata !392, null}
!392 = metadata !{i32 786443, metadata !1, metadata !393, i32 308, i32 12, i32 0, i32 52} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!393 = metadata !{i32 786443, metadata !1, metadata !378, i32 306, i32 11, i32 0, i32 51} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!394 = metadata !{i32 310, i32 15, metadata !395, null}
!395 = metadata !{i32 786443, metadata !1, metadata !392, i32 309, i32 19, i32 0, i32 53} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\dopandcfar.c]
!396 = metadata !{i32 310, i32 50, metadata !395, null}
!397 = metadata !{i32 308, i32 47, metadata !392, null}
!398 = metadata !{i32 315, i32 11, metadata !322, null}
!399 = metadata !{i32 316, i32 10, metadata !322, null}
!400 = metadata !{i32 225, i32 58, metadata !319, null}
!401 = metadata !{i32 318, i32 7, metadata !320, null}
!402 = metadata !{i32 223, i32 54, metadata !316, null}
!403 = metadata !{i32 786688, metadata !317, metadata !"detMartrixAddr", metadata !5, i32 328, metadata !166, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [detMartrixAddr] [line 328]
!404 = metadata !{i32 328, i32 18, metadata !317, null}
!405 = metadata !{i32 329, i32 9, metadata !317, null}
!406 = metadata !{i32 330, i32 9, metadata !317, null}
!407 = metadata !{i32 332, i32 5, metadata !317, null}
!408 = metadata !{i32 220, i32 44, metadata !314, null}
!409 = metadata !{i32 337, i32 2, metadata !16, null}
!410 = metadata !{i32 339, i32 2, metadata !16, null}
!411 = metadata !{i32 344, i32 1, metadata !16, null}
