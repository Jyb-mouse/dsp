; ModuleID = '..\fft_16x16.c'
target datalayout = "e-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
target triple = "dsp"

@dbg_addr = constant i32* inttoptr (i64 2684354560 to i32*), align 4
@data = global [512 x i16] [i16 0, i16 25, i16 16, i16 18, i16 24, i16 2, i16 20, i16 -14, i16 4, i16 -24, i16 -12, i16 -21, i16 -23, i16 -7, i16 -22, i16 10, i16 -9, i16 23, i16 8, i16 23, i16 22, i16 11, i16 24, i16 -6, i16 13, i16 -20, i16 -3, i16 -24, i16 -19, i16 -15, i16 -24, i16 1, i16 -17, i16 17, i16 -1, i16 24, i16 15, i16 19, i16 24, i16 3, i16 20, i16 -13, i16 6, i16 -24, i16 -11, i16 -22, i16 -23, i16 -8, i16 -23, i16 9, i16 -10, i16 22, i16 7, i16 23, i16 21, i16 12, i16 24, i16 -4, i16 14, i16 -20, i16 -2, i16 -24, i16 -18, i16 -16, i16 -25, i16 0, i16 -18, i16 16, i16 -2, i16 24, i16 14, i16 20, i16 24, i16 4, i16 21, i16 -12, i16 7, i16 -23, i16 -10, i16 -22, i16 -23, i16 -9, i16 -23, i16 8, i16 -11, i16 22, i16 6, i16 24, i16 20, i16 13, i16 24, i16 -3, i16 15, i16 -19, i16 -1, i16 -24, i16 -17, i16 -17, i16 -24, i16 -1, i16 -19, i16 15, i16 -3, i16 24, i16 13, i16 20, i16 24, i16 6, i16 22, i16 -11, i16 8, i16 -23, i16 -9, i16 -23, i16 -22, i16 -10, i16 -23, i16 7, i16 -12, i16 21, i16 4, i16 24, i16 20, i16 14, i16 24, i16 -2, i16 16, i16 -18, i16 0, i16 -25, i16 -16, i16 -18, i16 -24, i16 -2, i16 -20, i16 14, i16 -4, i16 24, i16 12, i16 21, i16 23, i16 7, i16 22, i16 -10, i16 9, i16 -23, i16 -8, i16 -23, i16 -22, i16 -11, i16 -24, i16 6, i16 -13, i16 20, i16 3, i16 24, i16 19, i16 15, i16 24, i16 -1, i16 17, i16 -17, i16 1, i16 -24, i16 -15, i16 -19, i16 -24, i16 -3, i16 -20, i16 13, i16 -6, i16 24, i16 11, i16 22, i16 23, i16 8, i16 23, i16 -9, i16 10, i16 -22, i16 -7, i16 -23, i16 -21, i16 -12, i16 -24, i16 4, i16 -14, i16 20, i16 2, i16 24, i16 18, i16 16, i16 25, i16 0, i16 18, i16 -16, i16 2, i16 -24, i16 -14, i16 -20, i16 -24, i16 -4, i16 -21, i16 12, i16 -7, i16 23, i16 10, i16 22, i16 23, i16 9, i16 23, i16 -8, i16 11, i16 -22, i16 -6, i16 -24, i16 -20, i16 -13, i16 -24, i16 3, i16 -15, i16 19, i16 1, i16 24, i16 17, i16 17, i16 24, i16 1, i16 19, i16 -15, i16 3, i16 -24, i16 -13, i16 -20, i16 -24, i16 -6, i16 -22, i16 11, i16 -8, i16 23, i16 9, i16 23, i16 22, i16 10, i16 23, i16 -7, i16 12, i16 -21, i16 -4, i16 -24, i16 -20, i16 -14, i16 -24, i16 2, i16 -16, i16 18, i16 0, i16 25, i16 16, i16 18, i16 24, i16 2, i16 20, i16 -14, i16 4, i16 -24, i16 -12, i16 -21, i16 -23, i16 -7, i16 -22, i16 10, i16 -9, i16 23, i16 8, i16 23, i16 22, i16 11, i16 24, i16 -6, i16 13, i16 -20, i16 -3, i16 -24, i16 -19, i16 -15, i16 -24, i16 1, i16 -17, i16 17, i16 -1, i16 24, i16 15, i16 19, i16 24, i16 3, i16 20, i16 -13, i16 6, i16 -24, i16 -11, i16 -22, i16 -23, i16 -8, i16 -23, i16 9, i16 -10, i16 22, i16 7, i16 23, i16 21, i16 12, i16 24, i16 -4, i16 14, i16 -20, i16 -2, i16 -24, i16 -18, i16 -16, i16 -25, i16 0, i16 -18, i16 16, i16 -2, i16 24, i16 14, i16 20, i16 24, i16 4, i16 21, i16 -12, i16 7, i16 -23, i16 -10, i16 -22, i16 -23, i16 -9, i16 -23, i16 8, i16 -11, i16 22, i16 6, i16 24, i16 20, i16 13, i16 24, i16 -3, i16 15, i16 -19, i16 -1, i16 -24, i16 -17, i16 -17, i16 -24, i16 -1, i16 -19, i16 15, i16 -3, i16 24, i16 13, i16 20, i16 24, i16 6, i16 22, i16 -11, i16 8, i16 -23, i16 -9, i16 -23, i16 -22, i16 -10, i16 -23, i16 7, i16 -12, i16 21, i16 4, i16 24, i16 20, i16 14, i16 24, i16 -2, i16 16, i16 -18, i16 0, i16 -25, i16 -16, i16 -18, i16 -24, i16 -2, i16 -20, i16 14, i16 -4, i16 24, i16 12, i16 21, i16 23, i16 7, i16 22, i16 -10, i16 9, i16 -23, i16 -8, i16 -23, i16 -22, i16 -11, i16 -24, i16 6, i16 -13, i16 20, i16 3, i16 24, i16 19, i16 15, i16 24, i16 -1, i16 17, i16 -17, i16 1, i16 -24, i16 -15, i16 -19, i16 -24, i16 -3, i16 -20, i16 13, i16 -6, i16 24, i16 11, i16 22, i16 23, i16 8, i16 23, i16 -9, i16 10, i16 -22, i16 -7, i16 -23, i16 -21, i16 -12, i16 -24, i16 4, i16 -14, i16 20, i16 2, i16 24, i16 18, i16 16, i16 25, i16 0, i16 18, i16 -16, i16 2, i16 -24, i16 -14, i16 -20, i16 -24, i16 -4, i16 -21, i16 12, i16 -7, i16 23, i16 10, i16 22, i16 23, i16 9, i16 23, i16 -8, i16 11, i16 -22, i16 -6, i16 -24, i16 -20, i16 -13, i16 -24, i16 3, i16 -15, i16 19, i16 1, i16 24, i16 17, i16 17, i16 24, i16 1, i16 19, i16 -15, i16 3, i16 -24, i16 -13, i16 -20, i16 -24, i16 -6, i16 -22, i16 11, i16 -8, i16 23, i16 9, i16 23, i16 22, i16 10, i16 23, i16 -7, i16 12, i16 -21, i16 -4, i16 -24, i16 -20, i16 -14, i16 -24, i16 2, i16 -16, i16 18], align 2
@f = global [256 x i16] [i16 0, i16 32767, i16 -804, i16 32757, i16 -1607, i16 32727, i16 -2410, i16 32678, i16 -3211, i16 32609, i16 -4011, i16 32520, i16 -4807, i16 32412, i16 -5601, i16 32284, i16 -6392, i16 32137, i16 -7179, i16 31970, i16 -7961, i16 31785, i16 -8739, i16 31580, i16 -9511, i16 31356, i16 -10278, i16 31113, i16 -11038, i16 30851, i16 -11792, i16 30571, i16 -12539, i16 30272, i16 -13278, i16 29955, i16 -14009, i16 29621, i16 -14732, i16 29268, i16 -15446, i16 28897, i16 -16150, i16 28510, i16 -16845, i16 28105, i16 -17530, i16 27683, i16 -18204, i16 27244, i16 -18867, i16 26789, i16 -19519, i16 26318, i16 -20159, i16 25831, i16 -20787, i16 25329, i16 -21402, i16 24811, i16 -22004, i16 24278, i16 -22594, i16 23731, i16 -23169, i16 23169, i16 -23731, i16 22594, i16 -24278, i16 22004, i16 -24811, i16 21402, i16 -25329, i16 20787, i16 -25831, i16 20159, i16 -26318, i16 19519, i16 -26789, i16 18867, i16 -27244, i16 18204, i16 -27683, i16 17530, i16 -28105, i16 16845, i16 -28510, i16 16150, i16 -28897, i16 15446, i16 -29268, i16 14732, i16 -29621, i16 14009, i16 -29955, i16 13278, i16 -30272, i16 12539, i16 -30571, i16 11792, i16 -30851, i16 11038, i16 -31113, i16 10278, i16 -31356, i16 9511, i16 -31580, i16 8739, i16 -31785, i16 7961, i16 -31970, i16 7179, i16 -32137, i16 6392, i16 -32284, i16 5601, i16 -32412, i16 4807, i16 -32520, i16 4011, i16 -32609, i16 3211, i16 -32678, i16 2410, i16 -32727, i16 1607, i16 -32757, i16 804, i16 -32767, i16 0, i16 -32757, i16 -804, i16 -32727, i16 -1607, i16 -32678, i16 -2410, i16 -32609, i16 -3211, i16 -32520, i16 -4011, i16 -32412, i16 -4807, i16 -32284, i16 -5601, i16 -32137, i16 -6392, i16 -31970, i16 -7179, i16 -31785, i16 -7961, i16 -31580, i16 -8739, i16 -31356, i16 -9511, i16 -31113, i16 -10278, i16 -30851, i16 -11038, i16 -30571, i16 -11792, i16 -30272, i16 -12539, i16 -29955, i16 -13278, i16 -29621, i16 -14009, i16 -29268, i16 -14732, i16 -28897, i16 -15446, i16 -28510, i16 -16150, i16 -28105, i16 -16845, i16 -27683, i16 -17530, i16 -27244, i16 -18204, i16 -26789, i16 -18867, i16 -26318, i16 -19519, i16 -25831, i16 -20159, i16 -25329, i16 -20787, i16 -24811, i16 -21402, i16 -24278, i16 -22004, i16 -23731, i16 -22594, i16 -23169, i16 -23169, i16 -22594, i16 -23731, i16 -22004, i16 -24278, i16 -21402, i16 -24811, i16 -20787, i16 -25329, i16 -20159, i16 -25831, i16 -19519, i16 -26318, i16 -18867, i16 -26789, i16 -18204, i16 -27244, i16 -17530, i16 -27683, i16 -16845, i16 -28105, i16 -16150, i16 -28510, i16 -15446, i16 -28897, i16 -14732, i16 -29268, i16 -14009, i16 -29621, i16 -13278, i16 -29955, i16 -12539, i16 -30272, i16 -11792, i16 -30571, i16 -11038, i16 -30851, i16 -10278, i16 -31113, i16 -9511, i16 -31356, i16 -8739, i16 -31580, i16 -7961, i16 -31785, i16 -7179, i16 -31970, i16 -6392, i16 -32137, i16 -5601, i16 -32284, i16 -4807, i16 -32412, i16 -4011, i16 -32520, i16 -3211, i16 -32609, i16 -2410, i16 -32678, i16 -1607, i16 -32727, i16 -804, i16 -32757], align 2

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
  call void @llvm.dbg.declare(metadata !{i8** %base.addr}, metadata !44), !dbg !45
  store i32 %num, i32* %num.addr, align 4
  call void @llvm.dbg.declare(metadata !{i32* %num.addr}, metadata !46), !dbg !47
  store i32 %wid, i32* %wid.addr, align 4
  call void @llvm.dbg.declare(metadata !{i32* %wid.addr}, metadata !48), !dbg !49
  %0 = load i32* %wid.addr, align 4, !dbg !50
  switch i32 %0, label %sw.default [
    i32 1, label %sw.bb
    i32 2, label %sw.bb1
    i32 4, label %sw.bb12
  ], !dbg !50

sw.bb:                                            ; preds = %entry
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !51), !dbg !54
  store i32 0, i32* %i, align 4, !dbg !55
  br label %for.cond, !dbg !55

for.cond:                                         ; preds = %for.inc, %sw.bb
  %1 = load i32* %i, align 4, !dbg !55
  %2 = load i32* %num.addr, align 4, !dbg !55
  %cmp = icmp slt i32 %1, %2, !dbg !55
  br i1 %cmp, label %for.body, label %for.end, !dbg !55

for.body:                                         ; preds = %for.cond
  %3 = load i32* %i, align 4, !dbg !56
  %4 = load i8** %base.addr, align 4, !dbg !56
  %arrayidx = getelementptr inbounds i8* %4, i32 %3, !dbg !56
  %5 = load i8* %arrayidx, align 1, !dbg !56
  %conv = sext i8 %5 to i32, !dbg !56
  %6 = load i32** @dbg_addr, align 4, !dbg !56
  store i32 %conv, i32* %6, align 4, !dbg !56
  br label %for.inc, !dbg !56

for.inc:                                          ; preds = %for.body
  %7 = load i32* %i, align 4, !dbg !57
  %inc = add nsw i32 %7, 1, !dbg !57
  store i32 %inc, i32* %i, align 4, !dbg !57
  br label %for.cond, !dbg !57

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %retval, !dbg !58
  br label %return, !dbg !58

sw.bb1:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata !{i32* %i2}, metadata !59), !dbg !61
  store i32 0, i32* %i2, align 4, !dbg !62
  br label %for.cond3, !dbg !62

for.cond3:                                        ; preds = %for.inc9, %sw.bb1
  %8 = load i32* %i2, align 4, !dbg !62
  %9 = load i32* %num.addr, align 4, !dbg !62
  %cmp4 = icmp slt i32 %8, %9, !dbg !62
  br i1 %cmp4, label %for.body6, label %for.end11, !dbg !62

for.body6:                                        ; preds = %for.cond3
  %10 = load i32* %i2, align 4, !dbg !63
  %11 = load i8** %base.addr, align 4, !dbg !63
  %12 = bitcast i8* %11 to i16*, !dbg !63
  %arrayidx7 = getelementptr inbounds i16* %12, i32 %10, !dbg !63
  %13 = load i16* %arrayidx7, align 2, !dbg !63
  %conv8 = sext i16 %13 to i32, !dbg !63
  %14 = load i32** @dbg_addr, align 4, !dbg !63
  store i32 %conv8, i32* %14, align 4, !dbg !63
  br label %for.inc9, !dbg !63

for.inc9:                                         ; preds = %for.body6
  %15 = load i32* %i2, align 4, !dbg !64
  %inc10 = add nsw i32 %15, 1, !dbg !64
  store i32 %inc10, i32* %i2, align 4, !dbg !64
  br label %for.cond3, !dbg !64

for.end11:                                        ; preds = %for.cond3
  store i32 0, i32* %retval, !dbg !65
  br label %return, !dbg !65

sw.bb12:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata !{i32* %i13}, metadata !66), !dbg !68
  store i32 0, i32* %i13, align 4, !dbg !69
  br label %for.cond14, !dbg !69

for.cond14:                                       ; preds = %for.inc19, %sw.bb12
  %16 = load i32* %i13, align 4, !dbg !69
  %17 = load i32* %num.addr, align 4, !dbg !69
  %cmp15 = icmp slt i32 %16, %17, !dbg !69
  br i1 %cmp15, label %for.body17, label %for.end21, !dbg !69

for.body17:                                       ; preds = %for.cond14
  %18 = load i32* %i13, align 4, !dbg !70
  %19 = load i8** %base.addr, align 4, !dbg !70
  %20 = bitcast i8* %19 to i32*, !dbg !70
  %arrayidx18 = getelementptr inbounds i32* %20, i32 %18, !dbg !70
  %21 = load i32* %arrayidx18, align 4, !dbg !70
  %22 = load i32** @dbg_addr, align 4, !dbg !70
  store i32 %21, i32* %22, align 4, !dbg !70
  br label %for.inc19, !dbg !70

for.inc19:                                        ; preds = %for.body17
  %23 = load i32* %i13, align 4, !dbg !71
  %inc20 = add nsw i32 %23, 1, !dbg !71
  store i32 %inc20, i32* %i13, align 4, !dbg !71
  br label %for.cond14, !dbg !71

for.end21:                                        ; preds = %for.cond14
  store i32 0, i32* %retval, !dbg !72
  br label %return, !dbg !72

sw.default:                                       ; preds = %entry
  store i32 -1, i32* %retval, !dbg !73
  br label %return, !dbg !73

return:                                           ; preds = %sw.default, %for.end21, %for.end11, %for.end
  %24 = load i32* %retval, !dbg !74
  ret i32 %24, !dbg !74
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

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
  call void @llvm.dbg.declare(metadata !{i32* %n.addr}, metadata !75), !dbg !76
  store i16* %x, i16** %x.addr, align 4
  call void @llvm.dbg.declare(metadata !{i16** %x.addr}, metadata !77), !dbg !78
  call void @llvm.dbg.declare(metadata !{i16* %temp}, metadata !79), !dbg !80
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !81), !dbg !83
  store i32 0, i32* %i, align 4, !dbg !84
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !85), !dbg !86
  store i32 1, i32* %j, align 4, !dbg !84
  br label %for.cond, !dbg !84

for.cond:                                         ; preds = %for.inc23, %entry
  %0 = load i32* %j, align 4, !dbg !84
  %1 = load i32* %n.addr, align 4, !dbg !84
  %sub = sub nsw i32 %1, 1, !dbg !84
  %cmp = icmp slt i32 %0, %sub, !dbg !84
  br i1 %cmp, label %for.body, label %for.end24, !dbg !84

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata !{i32* %k}, metadata !87), !dbg !90
  %2 = load i32* %n.addr, align 4, !dbg !91
  %shr = ashr i32 %2, 1, !dbg !91
  store i32 %shr, i32* %k, align 4, !dbg !91
  br label %for.cond1, !dbg !91

for.cond1:                                        ; preds = %for.inc, %for.body
  %3 = load i32* %k, align 4, !dbg !91
  %4 = load i32* %k, align 4, !dbg !91
  %5 = load i32* %i, align 4, !dbg !91
  %xor = xor i32 %5, %4, !dbg !91
  store i32 %xor, i32* %i, align 4, !dbg !91
  %cmp2 = icmp sgt i32 %3, %xor, !dbg !91
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !91

for.body3:                                        ; preds = %for.cond1
  br label %for.inc, !dbg !91

for.inc:                                          ; preds = %for.body3
  %6 = load i32* %k, align 4, !dbg !92
  %shr4 = ashr i32 %6, 1, !dbg !92
  store i32 %shr4, i32* %k, align 4, !dbg !92
  br label %for.cond1, !dbg !92

for.end:                                          ; preds = %for.cond1
  %7 = load i32* %i, align 4, !dbg !93
  %8 = load i32* %j, align 4, !dbg !93
  %cmp5 = icmp slt i32 %7, %8, !dbg !93
  br i1 %cmp5, label %if.then, label %if.end, !dbg !93

if.then:                                          ; preds = %for.end
  %9 = load i32* %i, align 4, !dbg !95
  %mul = mul nsw i32 2, %9, !dbg !95
  %10 = load i16** %x.addr, align 4, !dbg !95
  %arrayidx = getelementptr inbounds i16* %10, i32 %mul, !dbg !95
  %11 = load i16* %arrayidx, align 2, !dbg !95
  store i16 %11, i16* %temp, align 2, !dbg !95
  %12 = load i32* %j, align 4, !dbg !97
  %mul6 = mul nsw i32 2, %12, !dbg !97
  %13 = load i16** %x.addr, align 4, !dbg !97
  %arrayidx7 = getelementptr inbounds i16* %13, i32 %mul6, !dbg !97
  %14 = load i16* %arrayidx7, align 2, !dbg !97
  %15 = load i32* %i, align 4, !dbg !97
  %mul8 = mul nsw i32 2, %15, !dbg !97
  %16 = load i16** %x.addr, align 4, !dbg !97
  %arrayidx9 = getelementptr inbounds i16* %16, i32 %mul8, !dbg !97
  store i16 %14, i16* %arrayidx9, align 2, !dbg !97
  %17 = load i16* %temp, align 2, !dbg !98
  %18 = load i32* %j, align 4, !dbg !98
  %mul10 = mul nsw i32 2, %18, !dbg !98
  %19 = load i16** %x.addr, align 4, !dbg !98
  %arrayidx11 = getelementptr inbounds i16* %19, i32 %mul10, !dbg !98
  store i16 %17, i16* %arrayidx11, align 2, !dbg !98
  %20 = load i32* %i, align 4, !dbg !99
  %mul12 = mul nsw i32 2, %20, !dbg !99
  %add = add nsw i32 %mul12, 1, !dbg !99
  %21 = load i16** %x.addr, align 4, !dbg !99
  %arrayidx13 = getelementptr inbounds i16* %21, i32 %add, !dbg !99
  %22 = load i16* %arrayidx13, align 2, !dbg !99
  store i16 %22, i16* %temp, align 2, !dbg !99
  %23 = load i32* %j, align 4, !dbg !100
  %mul14 = mul nsw i32 2, %23, !dbg !100
  %add15 = add nsw i32 %mul14, 1, !dbg !100
  %24 = load i16** %x.addr, align 4, !dbg !100
  %arrayidx16 = getelementptr inbounds i16* %24, i32 %add15, !dbg !100
  %25 = load i16* %arrayidx16, align 2, !dbg !100
  %26 = load i32* %i, align 4, !dbg !100
  %mul17 = mul nsw i32 2, %26, !dbg !100
  %add18 = add nsw i32 %mul17, 1, !dbg !100
  %27 = load i16** %x.addr, align 4, !dbg !100
  %arrayidx19 = getelementptr inbounds i16* %27, i32 %add18, !dbg !100
  store i16 %25, i16* %arrayidx19, align 2, !dbg !100
  %28 = load i16* %temp, align 2, !dbg !101
  %29 = load i32* %j, align 4, !dbg !101
  %mul20 = mul nsw i32 2, %29, !dbg !101
  %add21 = add nsw i32 %mul20, 1, !dbg !101
  %30 = load i16** %x.addr, align 4, !dbg !101
  %arrayidx22 = getelementptr inbounds i16* %30, i32 %add21, !dbg !101
  store i16 %28, i16* %arrayidx22, align 2, !dbg !101
  br label %if.end, !dbg !102

if.end:                                           ; preds = %if.then, %for.end
  br label %for.inc23, !dbg !103

for.inc23:                                        ; preds = %if.end
  %31 = load i32* %j, align 4, !dbg !104
  %inc = add nsw i32 %31, 1, !dbg !104
  store i32 %inc, i32* %j, align 4, !dbg !104
  br label %for.cond, !dbg !104

for.end24:                                        ; preds = %for.cond
  ret void, !dbg !105
}

; Function Attrs: nounwind
define void @fft_16x16(i16* %x, i16* %w, i32 %nx) #0 {
entry:
  %retval.i142 = alloca i32, align 4, !dbg !106
  %vpnum.addr.i143 = alloca i32, align 4, !dbg !106
  %vpsel.i144 = alloca i32*, align 4, !dbg !106
  %retval.i = alloca i32, align 4, !dbg !112
  %vpnum.addr.i = alloca i32, align 4, !dbg !112
  %vpsel.i = alloca i32*, align 4, !dbg !112
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
  %p = alloca i32, align 4
  store i16* %x, i16** %x.addr, align 4
  call void @llvm.dbg.declare(metadata !{i16** %x.addr}, metadata !114), !dbg !115
  store i16* %w, i16** %w.addr, align 4
  call void @llvm.dbg.declare(metadata !{i16** %w.addr}, metadata !116), !dbg !117
  store i32 %nx, i32* %nx.addr, align 4
  call void @llvm.dbg.declare(metadata !{i32* %nx.addr}, metadata !118), !dbg !119
  call void @llvm.dbg.declare(metadata !{i32* %n1}, metadata !120), !dbg !121
  call void @llvm.dbg.declare(metadata !{i32* %n2}, metadata !122), !dbg !123
  call void @llvm.dbg.declare(metadata !{i32* %ie}, metadata !124), !dbg !125
  call void @llvm.dbg.declare(metadata !{i32* %ia}, metadata !126), !dbg !127
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !128), !dbg !129
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !130), !dbg !131
  call void @llvm.dbg.declare(metadata !{i32* %k}, metadata !132), !dbg !133
  call void @llvm.dbg.declare(metadata !{i32* %l}, metadata !134), !dbg !135
  call void @llvm.dbg.declare(metadata !{i32* %m}, metadata !136), !dbg !137
  call void @llvm.dbg.declare(metadata !{i32* %xt}, metadata !138), !dbg !139
  call void @llvm.dbg.declare(metadata !{i32* %yt}, metadata !140), !dbg !141
  call void @llvm.dbg.declare(metadata !{i32* %c}, metadata !142), !dbg !143
  call void @llvm.dbg.declare(metadata !{i32* %s}, metadata !144), !dbg !145
  call void @llvm.dbg.declare(metadata !{i32* %mid_a}, metadata !146), !dbg !147
  call void @llvm.dbg.declare(metadata !{i32* %mid_b}, metadata !148), !dbg !149
  %0 = load i32* %nx.addr, align 4, !dbg !150
  store i32 %0, i32* %n2, align 4, !dbg !150
  store i32 1, i32* %ie, align 4, !dbg !151
  %1 = load i32* %nx.addr, align 4, !dbg !152
  store i32 %1, i32* %k, align 4, !dbg !152
  br label %for.cond, !dbg !152

for.cond:                                         ; preds = %for.inc139, %entry
  %2 = load i32* %k, align 4, !dbg !152
  %cmp = icmp sgt i32 %2, 1, !dbg !152
  br i1 %cmp, label %for.body, label %for.end141, !dbg !152

for.body:                                         ; preds = %for.cond
  %3 = load i32* %n2, align 4, !dbg !153
  store i32 %3, i32* %n1, align 4, !dbg !153
  %4 = load i32* %n2, align 4, !dbg !154
  %shr = ashr i32 %4, 1, !dbg !154
  store i32 %shr, i32* %n2, align 4, !dbg !154
  %5 = load i32* %n2, align 4, !dbg !155
  %cmp1 = icmp sge i32 %5, 64, !dbg !155
  br i1 %cmp1, label %if.then, label %if.else, !dbg !155

if.then:                                          ; preds = %for.body
  store i32 4, i32* %vpnum.addr.i, align 4, !dbg !112
  call void @llvm.dbg.declare(metadata !{i32* %vpnum.addr.i}, metadata !156), !dbg !157
  call void @llvm.dbg.declare(metadata !{i32** %vpsel.i}, metadata !158), !dbg !159
  store i32* inttoptr (i32 8336896 to i32*), i32** %vpsel.i, align 4, !dbg !160
  %6 = load i32* %vpnum.addr.i, align 4, !dbg !161
  switch i32 %6, label %sw.default.i [
    i32 0, label %sw.bb.i
    i32 1, label %sw.bb1.i
    i32 2, label %sw.bb2.i
    i32 3, label %sw.bb3.i
    i32 4, label %sw.bb4.i
  ], !dbg !161

sw.bb.i:                                          ; preds = %if.then
  %7 = load i32** %vpsel.i, align 4, !dbg !162
  store i32 0, i32* %7, align 4, !dbg !162
  br label %sw.epilog.i, !dbg !164

sw.bb1.i:                                         ; preds = %if.then
  %8 = load i32** %vpsel.i, align 4, !dbg !165
  store i32 1, i32* %8, align 4, !dbg !165
  br label %sw.epilog.i, !dbg !166

sw.bb2.i:                                         ; preds = %if.then
  %9 = load i32** %vpsel.i, align 4, !dbg !167
  store i32 3, i32* %9, align 4, !dbg !167
  br label %sw.epilog.i, !dbg !168

sw.bb3.i:                                         ; preds = %if.then
  %10 = load i32** %vpsel.i, align 4, !dbg !169
  store i32 7, i32* %10, align 4, !dbg !169
  br label %sw.epilog.i, !dbg !170

sw.bb4.i:                                         ; preds = %if.then
  %11 = load i32** %vpsel.i, align 4, !dbg !171
  store i32 15, i32* %11, align 4, !dbg !171
  br label %sw.epilog.i, !dbg !172

sw.default.i:                                     ; preds = %if.then
  store i32 -1, i32* %retval.i, !dbg !173
  br label %set_vpsel.exit, !dbg !173

sw.epilog.i:                                      ; preds = %sw.bb4.i, %sw.bb3.i, %sw.bb2.i, %sw.bb1.i, %sw.bb.i
  store i32 1, i32* %retval.i, !dbg !174
  br label %set_vpsel.exit, !dbg !174

set_vpsel.exit:                                   ; preds = %sw.default.i, %sw.epilog.i
  %12 = load i32* %retval.i, !dbg !175
  store i32 0, i32* %j, align 4, !dbg !176
  br label %for.cond2, !dbg !176

for.cond2:                                        ; preds = %for.inc17, %set_vpsel.exit
  %13 = load i32* %j, align 4, !dbg !176
  %14 = load i32* %nx.addr, align 4, !dbg !176
  %cmp3 = icmp slt i32 %13, %14, !dbg !176
  br i1 %cmp3, label %for.body4, label %for.end19, !dbg !176

for.body4:                                        ; preds = %for.cond2
  store i32 0, i32* %ia, align 4, !dbg !178
  call void @llvm.dbg.declare(metadata !{i32* %time}, metadata !180), !dbg !181
  %15 = load i32* %n2, align 4, !dbg !182
  %div = sdiv i32 %15, 64, !dbg !182
  store i32 %div, i32* %time, align 4, !dbg !182
  store i32 0, i32* %i, align 4, !dbg !183
  br label %for.cond5, !dbg !183

for.cond5:                                        ; preds = %for.inc, %for.body4
  %16 = load i32* %i, align 4, !dbg !183
  %17 = load i32* %time, align 4, !dbg !183
  %cmp6 = icmp slt i32 %16, %17, !dbg !183
  br i1 %cmp6, label %for.body7, label %for.end, !dbg !183

for.body7:                                        ; preds = %for.cond5
  %18 = load i32* %i, align 4, !dbg !185
  %mul = mul nsw i32 %18, 64, !dbg !185
  %19 = load i32* %j, align 4, !dbg !185
  %add = add nsw i32 %mul, %19, !dbg !185
  store i32 %add, i32* %m, align 4, !dbg !185
  %20 = load i32* %m, align 4, !dbg !187
  %21 = load i32* %n2, align 4, !dbg !187
  %add8 = add nsw i32 %20, %21, !dbg !187
  store i32 %add8, i32* %l, align 4, !dbg !187
  %22 = load i32* %m, align 4, !dbg !188
  %mul9 = mul nsw i32 2, %22, !dbg !188
  %23 = load i16** %x.addr, align 4, !dbg !188
  %arrayidx = getelementptr inbounds i16* %23, i32 %mul9, !dbg !188
  %24 = load i32* %l, align 4, !dbg !188
  %mul10 = mul nsw i32 2, %24, !dbg !188
  %25 = load i16** %x.addr, align 4, !dbg !188
  %arrayidx11 = getelementptr inbounds i16* %25, i32 %mul10, !dbg !188
  %26 = load i32* %ia, align 4, !dbg !188
  %mul12 = mul nsw i32 2, %26, !dbg !188
  %27 = load i16** %w.addr, align 4, !dbg !188
  %arrayidx13 = getelementptr inbounds i16* %27, i32 %mul12, !dbg !188
  %call14 = call signext i16 @vmac_butterfly(i16* %arrayidx, i16* %arrayidx11, i16* %arrayidx13), !dbg !188
  %28 = load i32* %ia, align 4, !dbg !189
  %add15 = add nsw i32 %28, 64, !dbg !189
  store i32 %add15, i32* %ia, align 4, !dbg !189
  br label %for.inc, !dbg !190

for.inc:                                          ; preds = %for.body7
  %29 = load i32* %i, align 4, !dbg !191
  %add16 = add nsw i32 %29, 1, !dbg !191
  store i32 %add16, i32* %i, align 4, !dbg !191
  br label %for.cond5, !dbg !191

for.end:                                          ; preds = %for.cond5
  br label %for.inc17, !dbg !192

for.inc17:                                        ; preds = %for.end
  %30 = load i32* %n1, align 4, !dbg !193
  %31 = load i32* %j, align 4, !dbg !193
  %add18 = add nsw i32 %31, %30, !dbg !193
  store i32 %add18, i32* %j, align 4, !dbg !193
  br label %for.cond2, !dbg !193

for.end19:                                        ; preds = %for.cond2
  br label %if.end123, !dbg !194

if.else:                                          ; preds = %for.body
  %32 = load i32* %n2, align 4, !dbg !195
  %cmp20 = icmp sge i32 %32, 16, !dbg !195
  br i1 %cmp20, label %if.then21, label %if.else48, !dbg !195

if.then21:                                        ; preds = %if.else
  store i32 1, i32* %vpnum.addr.i143, align 4, !dbg !106
  call void @llvm.dbg.declare(metadata !{i32* %vpnum.addr.i143}, metadata !156), !dbg !196
  call void @llvm.dbg.declare(metadata !{i32** %vpsel.i144}, metadata !158), !dbg !197
  store i32* inttoptr (i32 8336896 to i32*), i32** %vpsel.i144, align 4, !dbg !198
  %33 = load i32* %vpnum.addr.i143, align 4, !dbg !199
  switch i32 %33, label %sw.default.i150 [
    i32 0, label %sw.bb.i145
    i32 1, label %sw.bb1.i146
    i32 2, label %sw.bb2.i147
    i32 3, label %sw.bb3.i148
    i32 4, label %sw.bb4.i149
  ], !dbg !199

sw.bb.i145:                                       ; preds = %if.then21
  %34 = load i32** %vpsel.i144, align 4, !dbg !200
  store i32 0, i32* %34, align 4, !dbg !200
  br label %sw.epilog.i151, !dbg !201

sw.bb1.i146:                                      ; preds = %if.then21
  %35 = load i32** %vpsel.i144, align 4, !dbg !202
  store i32 1, i32* %35, align 4, !dbg !202
  br label %sw.epilog.i151, !dbg !203

sw.bb2.i147:                                      ; preds = %if.then21
  %36 = load i32** %vpsel.i144, align 4, !dbg !204
  store i32 3, i32* %36, align 4, !dbg !204
  br label %sw.epilog.i151, !dbg !205

sw.bb3.i148:                                      ; preds = %if.then21
  %37 = load i32** %vpsel.i144, align 4, !dbg !206
  store i32 7, i32* %37, align 4, !dbg !206
  br label %sw.epilog.i151, !dbg !207

sw.bb4.i149:                                      ; preds = %if.then21
  %38 = load i32** %vpsel.i144, align 4, !dbg !208
  store i32 15, i32* %38, align 4, !dbg !208
  br label %sw.epilog.i151, !dbg !209

sw.default.i150:                                  ; preds = %if.then21
  store i32 -1, i32* %retval.i142, !dbg !210
  br label %set_vpsel.exit152, !dbg !210

sw.epilog.i151:                                   ; preds = %sw.bb4.i149, %sw.bb3.i148, %sw.bb2.i147, %sw.bb1.i146, %sw.bb.i145
  store i32 1, i32* %retval.i142, !dbg !211
  br label %set_vpsel.exit152, !dbg !211

set_vpsel.exit152:                                ; preds = %sw.default.i150, %sw.epilog.i151
  %39 = load i32* %retval.i142, !dbg !212
  store i32 0, i32* %j, align 4, !dbg !213
  br label %for.cond23, !dbg !213

for.cond23:                                       ; preds = %for.inc45, %set_vpsel.exit152
  %40 = load i32* %j, align 4, !dbg !213
  %41 = load i32* %nx.addr, align 4, !dbg !213
  %cmp24 = icmp slt i32 %40, %41, !dbg !213
  br i1 %cmp24, label %for.body25, label %for.end47, !dbg !213

for.body25:                                       ; preds = %for.cond23
  store i32 0, i32* %ia, align 4, !dbg !215
  call void @llvm.dbg.declare(metadata !{i32* %time26}, metadata !217), !dbg !218
  %42 = load i32* %n2, align 4, !dbg !219
  %div27 = sdiv i32 %42, 16, !dbg !219
  store i32 %div27, i32* %time26, align 4, !dbg !219
  store i32 0, i32* %i, align 4, !dbg !220
  br label %for.cond28, !dbg !220

for.cond28:                                       ; preds = %for.inc42, %for.body25
  %43 = load i32* %i, align 4, !dbg !220
  %44 = load i32* %time26, align 4, !dbg !220
  %cmp29 = icmp slt i32 %43, %44, !dbg !220
  br i1 %cmp29, label %for.body30, label %for.end44, !dbg !220

for.body30:                                       ; preds = %for.cond28
  %45 = load i32* %i, align 4, !dbg !222
  %mul31 = mul nsw i32 %45, 16, !dbg !222
  %46 = load i32* %j, align 4, !dbg !222
  %add32 = add nsw i32 %mul31, %46, !dbg !222
  store i32 %add32, i32* %m, align 4, !dbg !222
  %47 = load i32* %m, align 4, !dbg !224
  %48 = load i32* %n2, align 4, !dbg !224
  %add33 = add nsw i32 %47, %48, !dbg !224
  store i32 %add33, i32* %l, align 4, !dbg !224
  %49 = load i32* %m, align 4, !dbg !225
  %mul34 = mul nsw i32 2, %49, !dbg !225
  %50 = load i16** %x.addr, align 4, !dbg !225
  %arrayidx35 = getelementptr inbounds i16* %50, i32 %mul34, !dbg !225
  %51 = load i32* %l, align 4, !dbg !225
  %mul36 = mul nsw i32 2, %51, !dbg !225
  %52 = load i16** %x.addr, align 4, !dbg !225
  %arrayidx37 = getelementptr inbounds i16* %52, i32 %mul36, !dbg !225
  %53 = load i32* %ia, align 4, !dbg !225
  %mul38 = mul nsw i32 2, %53, !dbg !225
  %54 = load i16** %w.addr, align 4, !dbg !225
  %arrayidx39 = getelementptr inbounds i16* %54, i32 %mul38, !dbg !225
  %call40 = call signext i16 @vmac_butterfly(i16* %arrayidx35, i16* %arrayidx37, i16* %arrayidx39), !dbg !225
  %55 = load i32* %ia, align 4, !dbg !226
  %add41 = add nsw i32 %55, 16, !dbg !226
  store i32 %add41, i32* %ia, align 4, !dbg !226
  br label %for.inc42, !dbg !227

for.inc42:                                        ; preds = %for.body30
  %56 = load i32* %i, align 4, !dbg !228
  %add43 = add nsw i32 %56, 1, !dbg !228
  store i32 %add43, i32* %i, align 4, !dbg !228
  br label %for.cond28, !dbg !228

for.end44:                                        ; preds = %for.cond28
  br label %for.inc45, !dbg !229

for.inc45:                                        ; preds = %for.end44
  %57 = load i32* %n1, align 4, !dbg !230
  %58 = load i32* %j, align 4, !dbg !230
  %add46 = add nsw i32 %58, %57, !dbg !230
  store i32 %add46, i32* %j, align 4, !dbg !230
  br label %for.cond23, !dbg !230

for.end47:                                        ; preds = %for.cond23
  br label %if.end, !dbg !231

if.else48:                                        ; preds = %if.else
  store i32 0, i32* %j, align 4, !dbg !232
  br label %for.cond49, !dbg !232

for.cond49:                                       ; preds = %for.inc120, %if.else48
  %59 = load i32* %j, align 4, !dbg !232
  %60 = load i32* %nx.addr, align 4, !dbg !232
  %cmp50 = icmp slt i32 %59, %60, !dbg !232
  br i1 %cmp50, label %for.body51, label %for.end122, !dbg !232

for.body51:                                       ; preds = %for.cond49
  store i32 0, i32* %ia, align 4, !dbg !235
  store i32 0, i32* %i, align 4, !dbg !237
  br label %for.cond52, !dbg !237

for.cond52:                                       ; preds = %for.inc117, %for.body51
  %61 = load i32* %i, align 4, !dbg !237
  %62 = load i32* %n2, align 4, !dbg !237
  %cmp53 = icmp slt i32 %61, %62, !dbg !237
  br i1 %cmp53, label %for.body54, label %for.end119, !dbg !237

for.body54:                                       ; preds = %for.cond52
  %63 = load i32* %ia, align 4, !dbg !239
  %mul55 = mul nsw i32 2, %63, !dbg !239
  %64 = load i16** %w.addr, align 4, !dbg !239
  %arrayidx56 = getelementptr inbounds i16* %64, i32 %mul55, !dbg !239
  %65 = load i16* %arrayidx56, align 2, !dbg !239
  %conv = sext i16 %65 to i32, !dbg !239
  store i32 %conv, i32* %c, align 4, !dbg !239
  %66 = load i32* %ia, align 4, !dbg !241
  %mul57 = mul nsw i32 2, %66, !dbg !241
  %add58 = add nsw i32 %mul57, 1, !dbg !241
  %67 = load i16** %w.addr, align 4, !dbg !241
  %arrayidx59 = getelementptr inbounds i16* %67, i32 %add58, !dbg !241
  %68 = load i16* %arrayidx59, align 2, !dbg !241
  %conv60 = sext i16 %68 to i32, !dbg !241
  store i32 %conv60, i32* %s, align 4, !dbg !241
  %69 = load i32* %ia, align 4, !dbg !242
  %add61 = add nsw i32 %69, 1, !dbg !242
  store i32 %add61, i32* %ia, align 4, !dbg !242
  %70 = load i32* %i, align 4, !dbg !243
  %71 = load i32* %j, align 4, !dbg !243
  %add62 = add nsw i32 %70, %71, !dbg !243
  store i32 %add62, i32* %m, align 4, !dbg !243
  %72 = load i32* %m, align 4, !dbg !244
  %73 = load i32* %n2, align 4, !dbg !244
  %add63 = add nsw i32 %72, %73, !dbg !244
  store i32 %add63, i32* %l, align 4, !dbg !244
  %74 = load i32* %m, align 4, !dbg !245
  %mul64 = mul nsw i32 2, %74, !dbg !245
  %75 = load i16** %x.addr, align 4, !dbg !245
  %arrayidx65 = getelementptr inbounds i16* %75, i32 %mul64, !dbg !245
  %76 = load i16* %arrayidx65, align 2, !dbg !245
  %conv66 = sext i16 %76 to i32, !dbg !245
  %77 = load i32* %l, align 4, !dbg !245
  %mul67 = mul nsw i32 2, %77, !dbg !245
  %78 = load i16** %x.addr, align 4, !dbg !245
  %arrayidx68 = getelementptr inbounds i16* %78, i32 %mul67, !dbg !245
  %79 = load i16* %arrayidx68, align 2, !dbg !245
  %conv69 = sext i16 %79 to i32, !dbg !245
  %sub = sub nsw i32 %conv66, %conv69, !dbg !245
  store i32 %sub, i32* %xt, align 4, !dbg !245
  %80 = load i32* %m, align 4, !dbg !246
  %mul70 = mul nsw i32 2, %80, !dbg !246
  %81 = load i16** %x.addr, align 4, !dbg !246
  %arrayidx71 = getelementptr inbounds i16* %81, i32 %mul70, !dbg !246
  %82 = load i16* %arrayidx71, align 2, !dbg !246
  %conv72 = sext i16 %82 to i32, !dbg !246
  %83 = load i32* %l, align 4, !dbg !246
  %mul73 = mul nsw i32 2, %83, !dbg !246
  %84 = load i16** %x.addr, align 4, !dbg !246
  %arrayidx74 = getelementptr inbounds i16* %84, i32 %mul73, !dbg !246
  %85 = load i16* %arrayidx74, align 2, !dbg !246
  %conv75 = sext i16 %85 to i32, !dbg !246
  %add76 = add nsw i32 %conv72, %conv75, !dbg !246
  %conv77 = trunc i32 %add76 to i16, !dbg !246
  %86 = load i32* %m, align 4, !dbg !246
  %mul78 = mul nsw i32 2, %86, !dbg !246
  %87 = load i16** %x.addr, align 4, !dbg !246
  %arrayidx79 = getelementptr inbounds i16* %87, i32 %mul78, !dbg !246
  store i16 %conv77, i16* %arrayidx79, align 2, !dbg !246
  %88 = load i32* %m, align 4, !dbg !247
  %mul80 = mul nsw i32 2, %88, !dbg !247
  %add81 = add nsw i32 %mul80, 1, !dbg !247
  %89 = load i16** %x.addr, align 4, !dbg !247
  %arrayidx82 = getelementptr inbounds i16* %89, i32 %add81, !dbg !247
  %90 = load i16* %arrayidx82, align 2, !dbg !247
  %conv83 = sext i16 %90 to i32, !dbg !247
  %91 = load i32* %l, align 4, !dbg !247
  %mul84 = mul nsw i32 2, %91, !dbg !247
  %add85 = add nsw i32 %mul84, 1, !dbg !247
  %92 = load i16** %x.addr, align 4, !dbg !247
  %arrayidx86 = getelementptr inbounds i16* %92, i32 %add85, !dbg !247
  %93 = load i16* %arrayidx86, align 2, !dbg !247
  %conv87 = sext i16 %93 to i32, !dbg !247
  %sub88 = sub nsw i32 %conv83, %conv87, !dbg !247
  store i32 %sub88, i32* %yt, align 4, !dbg !247
  %94 = load i32* %m, align 4, !dbg !248
  %mul89 = mul nsw i32 2, %94, !dbg !248
  %add90 = add nsw i32 %mul89, 1, !dbg !248
  %95 = load i16** %x.addr, align 4, !dbg !248
  %arrayidx91 = getelementptr inbounds i16* %95, i32 %add90, !dbg !248
  %96 = load i16* %arrayidx91, align 2, !dbg !248
  %conv92 = sext i16 %96 to i32, !dbg !248
  %97 = load i32* %l, align 4, !dbg !248
  %mul93 = mul nsw i32 2, %97, !dbg !248
  %add94 = add nsw i32 %mul93, 1, !dbg !248
  %98 = load i16** %x.addr, align 4, !dbg !248
  %arrayidx95 = getelementptr inbounds i16* %98, i32 %add94, !dbg !248
  %99 = load i16* %arrayidx95, align 2, !dbg !248
  %conv96 = sext i16 %99 to i32, !dbg !248
  %add97 = add nsw i32 %conv92, %conv96, !dbg !248
  %conv98 = trunc i32 %add97 to i16, !dbg !248
  %100 = load i32* %m, align 4, !dbg !248
  %mul99 = mul nsw i32 2, %100, !dbg !248
  %add100 = add nsw i32 %mul99, 1, !dbg !248
  %101 = load i16** %x.addr, align 4, !dbg !248
  %arrayidx101 = getelementptr inbounds i16* %101, i32 %add100, !dbg !248
  store i16 %conv98, i16* %arrayidx101, align 2, !dbg !248
  %102 = load i32* %c, align 4, !dbg !249
  %103 = load i32* %yt, align 4, !dbg !249
  %mul102 = mul nsw i32 %102, %103, !dbg !249
  %104 = load i32* %s, align 4, !dbg !249
  %105 = load i32* %xt, align 4, !dbg !249
  %mul103 = mul nsw i32 %104, %105, !dbg !249
  %add104 = add nsw i32 %mul102, %mul103, !dbg !249
  store i32 %add104, i32* %mid_a, align 4, !dbg !249
  %106 = load i32* %s, align 4, !dbg !250
  %107 = load i32* %yt, align 4, !dbg !250
  %mul105 = mul nsw i32 %106, %107, !dbg !250
  %108 = load i32* %c, align 4, !dbg !250
  %109 = load i32* %xt, align 4, !dbg !250
  %mul106 = mul nsw i32 %108, %109, !dbg !250
  %sub107 = sub nsw i32 %mul105, %mul106, !dbg !250
  store i32 %sub107, i32* %mid_b, align 4, !dbg !250
  %110 = load i32* %mid_a, align 4, !dbg !251
  %shr108 = ashr i32 %110, 15, !dbg !251
  %conv109 = trunc i32 %shr108 to i16, !dbg !251
  %111 = load i32* %l, align 4, !dbg !251
  %mul110 = mul nsw i32 2, %111, !dbg !251
  %112 = load i16** %x.addr, align 4, !dbg !251
  %arrayidx111 = getelementptr inbounds i16* %112, i32 %mul110, !dbg !251
  store i16 %conv109, i16* %arrayidx111, align 2, !dbg !251
  %113 = load i32* %mid_b, align 4, !dbg !252
  %shr112 = ashr i32 %113, 15, !dbg !252
  %conv113 = trunc i32 %shr112 to i16, !dbg !252
  %114 = load i32* %l, align 4, !dbg !252
  %mul114 = mul nsw i32 2, %114, !dbg !252
  %add115 = add nsw i32 %mul114, 1, !dbg !252
  %115 = load i16** %x.addr, align 4, !dbg !252
  %arrayidx116 = getelementptr inbounds i16* %115, i32 %add115, !dbg !252
  store i16 %conv113, i16* %arrayidx116, align 2, !dbg !252
  br label %for.inc117, !dbg !253

for.inc117:                                       ; preds = %for.body54
  %116 = load i32* %i, align 4, !dbg !254
  %add118 = add nsw i32 %116, 1, !dbg !254
  store i32 %add118, i32* %i, align 4, !dbg !254
  br label %for.cond52, !dbg !254

for.end119:                                       ; preds = %for.cond52
  br label %for.inc120, !dbg !255

for.inc120:                                       ; preds = %for.end119
  %117 = load i32* %n1, align 4, !dbg !256
  %118 = load i32* %j, align 4, !dbg !256
  %add121 = add nsw i32 %118, %117, !dbg !256
  store i32 %add121, i32* %j, align 4, !dbg !256
  br label %for.cond49, !dbg !256

for.end122:                                       ; preds = %for.cond49
  br label %if.end

if.end:                                           ; preds = %for.end122, %for.end47
  br label %if.end123

if.end123:                                        ; preds = %if.end, %for.end19
  call void @llvm.dbg.declare(metadata !{i32* %p}, metadata !257), !dbg !259
  store i32 0, i32* %p, align 4, !dbg !260
  br label %for.cond124, !dbg !260

for.cond124:                                      ; preds = %for.inc136, %if.end123
  %119 = load i32* %p, align 4, !dbg !260
  %120 = load i32* %n2, align 4, !dbg !260
  %cmp125 = icmp slt i32 %119, %120, !dbg !260
  br i1 %cmp125, label %for.body127, label %for.end138, !dbg !260

for.body127:                                      ; preds = %for.cond124
  %121 = load i32* %p, align 4, !dbg !261
  %mul128 = mul nsw i32 2, %121, !dbg !261
  %122 = load i16** %w.addr, align 4, !dbg !261
  %arrayidx129 = getelementptr inbounds i16* %122, i32 %mul128, !dbg !261
  %123 = load i16* %arrayidx129, align 2, !dbg !261
  %124 = load i32* %p, align 4, !dbg !261
  %125 = load i16** %w.addr, align 4, !dbg !261
  %arrayidx130 = getelementptr inbounds i16* %125, i32 %124, !dbg !261
  store i16 %123, i16* %arrayidx130, align 2, !dbg !261
  %126 = load i32* %p, align 4, !dbg !263
  %mul131 = mul nsw i32 2, %126, !dbg !263
  %add132 = add nsw i32 %mul131, 1, !dbg !263
  %127 = load i16** %w.addr, align 4, !dbg !263
  %arrayidx133 = getelementptr inbounds i16* %127, i32 %add132, !dbg !263
  %128 = load i16* %arrayidx133, align 2, !dbg !263
  %129 = load i32* %p, align 4, !dbg !263
  %add134 = add nsw i32 %129, 1, !dbg !263
  %130 = load i16** %w.addr, align 4, !dbg !263
  %arrayidx135 = getelementptr inbounds i16* %130, i32 %add134, !dbg !263
  store i16 %128, i16* %arrayidx135, align 2, !dbg !263
  br label %for.inc136, !dbg !264

for.inc136:                                       ; preds = %for.body127
  %131 = load i32* %p, align 4, !dbg !265
  %add137 = add nsw i32 %131, 2, !dbg !265
  store i32 %add137, i32* %p, align 4, !dbg !265
  br label %for.cond124, !dbg !265

for.end138:                                       ; preds = %for.cond124
  br label %for.inc139, !dbg !266

for.inc139:                                       ; preds = %for.end138
  %132 = load i32* %k, align 4, !dbg !267
  %shr140 = ashr i32 %132, 1, !dbg !267
  store i32 %shr140, i32* %k, align 4, !dbg !267
  br label %for.cond, !dbg !267

for.end141:                                       ; preds = %for.cond
  %133 = load i32* %nx.addr, align 4, !dbg !268
  %134 = load i16** %x.addr, align 4, !dbg !268
  call void @bit_reverse(i32 %133, i16* %134), !dbg !268
  ret void, !dbg !269
}

declare signext i16 @vmac_butterfly(i16*, i16*, i16*) #2

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %ndata = alloca i32, align 4
  store i32 0, i32* %retval
  call void @llvm.dbg.declare(metadata !{i32* %ndata}, metadata !270), !dbg !271
  store i32 256, i32* %ndata, align 4, !dbg !272
  %0 = load i32* %ndata, align 4, !dbg !273
  call void @fft_16x16(i16* getelementptr inbounds ([512 x i16]* @data, i32 0, i32 0), i16* getelementptr inbounds ([256 x i16]* @f, i32 0, i32 0), i32 %0), !dbg !273
  %call = call i32 @dbg_output(i8* bitcast ([512 x i16]* @data to i8*), i32 512, i32 2), !dbg !274
  ret i32 0, !dbg !275
}

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!41, !42}
!llvm.ident = !{!43}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.0 (tags/RELEASE_350/final)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !28, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [C:\eclipse\Swift_IDE_Toolchain\eclipse\DIF-FFT-radix2\Release/..\fft_16x16.c] [DW_LANG_C99]
!1 = metadata !{metadata !"..\5Cfft_16x16.c", metadata !"C:\5Ceclipse\5CSwift_IDE_Toolchain\5Ceclipse\5CDIF-FFT-radix2\5CRelease"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !11, metadata !17, metadata !20, metadata !23}
!4 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"dbg_output", metadata !"dbg_output", metadata !"", i32 12, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i8*, i32, i32)* @dbg_output, null, null, metadata !2, i32 12} ; [ DW_TAG_subprogram ] [line 12] [def] [dbg_output]
!5 = metadata !{metadata !"C:\5Ceclipse\5CSwift_IDE_Toolchain\5Ctoolchain_8slot\5Cinclude\5Cswift_debug.h", metadata !"C:\5Ceclipse\5CSwift_IDE_Toolchain\5Ceclipse\5CDIF-FFT-radix2\5CRelease"}
!6 = metadata !{i32 786473, metadata !5}          ; [ DW_TAG_file_type ] [C:\eclipse\Swift_IDE_Toolchain\eclipse\DIF-FFT-radix2\Release/C:\eclipse\Swift_IDE_Toolchain\toolchain_8slot\include\swift_debug.h]
!7 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{metadata !9, metadata !10, metadata !9, metadata !9}
!9 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 32, i64 32, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 32, align 32, offset 0] [from ]
!11 = metadata !{i32 786478, metadata !1, metadata !12, metadata !"bit_reverse", metadata !"bit_reverse", metadata !"", i32 9, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32, i16*)* @bit_reverse, null, null, metadata !2, i32 12} ; [ DW_TAG_subprogram ] [line 9] [def] [scope 12] [bit_reverse]
!12 = metadata !{i32 786473, metadata !1}         ; [ DW_TAG_file_type ] [C:\eclipse\Swift_IDE_Toolchain\eclipse\DIF-FFT-radix2\Release/..\fft_16x16.c]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{null, metadata !9, metadata !15}
!15 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 32, i64 32, i64 0, i32 0, metadata !16} ; [ DW_TAG_pointer_type ] [line 0, size 32, align 32, offset 0] [from short]
!16 = metadata !{i32 786468, null, null, metadata !"short", i32 0, i64 16, i64 16, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [short] [line 0, size 16, align 16, offset 0, enc DW_ATE_signed]
!17 = metadata !{i32 786478, metadata !1, metadata !12, metadata !"fft_16x16", metadata !"fft_16x16", metadata !"", i32 26, metadata !18, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i16*, i16*, i32)* @fft_16x16, null, null, metadata !2, i32 26} ; [ DW_TAG_subprogram ] [line 26] [def] [fft_16x16]
!18 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !19, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!19 = metadata !{null, metadata !15, metadata !15, metadata !9}
!20 = metadata !{i32 786478, metadata !1, metadata !12, metadata !"main", metadata !"main", metadata !"", i32 89, metadata !21, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 89} ; [ DW_TAG_subprogram ] [line 89] [def] [main]
!21 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !22, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!22 = metadata !{metadata !9}
!23 = metadata !{i32 786478, metadata !24, metadata !25, metadata !"set_vpsel", metadata !"set_vpsel", metadata !"", i32 13, metadata !26, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !2, i32 13} ; [ DW_TAG_subprogram ] [line 13] [def] [set_vpsel]
!24 = metadata !{metadata !"C:\5Ceclipse\5CSwift_IDE_Toolchain\5Ctoolchain_8slot\5Cinclude\5Cswift_math.h", metadata !"C:\5Ceclipse\5CSwift_IDE_Toolchain\5Ceclipse\5CDIF-FFT-radix2\5CRelease"}
!25 = metadata !{i32 786473, metadata !24}        ; [ DW_TAG_file_type ] [C:\eclipse\Swift_IDE_Toolchain\eclipse\DIF-FFT-radix2\Release/C:\eclipse\Swift_IDE_Toolchain\toolchain_8slot\include\swift_math.h]
!26 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !27, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!27 = metadata !{metadata !9, metadata !9}
!28 = metadata !{metadata !29, metadata !33, metadata !37}
!29 = metadata !{i32 786484, i32 0, null, metadata !"dbg_addr", metadata !"dbg_addr", metadata !"", metadata !6, i32 4, metadata !30, i32 0, i32 1, i32** @dbg_addr, null} ; [ DW_TAG_variable ] [dbg_addr] [line 4] [def]
!30 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !31} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!31 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 32, i64 32, i64 0, i32 0, metadata !32} ; [ DW_TAG_pointer_type ] [line 0, size 32, align 32, offset 0] [from unsigned int]
!32 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!33 = metadata !{i32 786484, i32 0, null, metadata !"data", metadata !"data", metadata !"", metadata !12, i32 6, metadata !34, i32 0, i32 1, [512 x i16]* @data, null} ; [ DW_TAG_variable ] [data] [line 6] [def]
!34 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 8192, i64 16, i32 0, i32 0, metadata !16, metadata !35, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 8192, align 16, offset 0] [from short]
!35 = metadata !{metadata !36}
!36 = metadata !{i32 786465, i64 0, i64 512}      ; [ DW_TAG_subrange_type ] [0, 511]
!37 = metadata !{i32 786484, i32 0, null, metadata !"f", metadata !"f", metadata !"", metadata !12, i32 7, metadata !38, i32 0, i32 1, [256 x i16]* @f, null} ; [ DW_TAG_variable ] [f] [line 7] [def]
!38 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 4096, i64 16, i32 0, i32 0, metadata !16, metadata !39, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 4096, align 16, offset 0] [from short]
!39 = metadata !{metadata !40}
!40 = metadata !{i32 786465, i64 0, i64 256}      ; [ DW_TAG_subrange_type ] [0, 255]
!41 = metadata !{i32 2, metadata !"Dwarf Version", i32 2}
!42 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!43 = metadata !{metadata !"clang version 3.5.0 (tags/RELEASE_350/final)"}
!44 = metadata !{i32 786689, metadata !4, metadata !"base", metadata !6, i32 16777228, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [base] [line 12]
!45 = metadata !{i32 12, i32 22, metadata !4, null}
!46 = metadata !{i32 786689, metadata !4, metadata !"num", metadata !6, i32 33554444, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [num] [line 12]
!47 = metadata !{i32 12, i32 32, metadata !4, null}
!48 = metadata !{i32 786689, metadata !4, metadata !"wid", metadata !6, i32 50331660, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wid] [line 12]
!49 = metadata !{i32 12, i32 41, metadata !4, null}
!50 = metadata !{i32 13, i32 2, metadata !4, null}
!51 = metadata !{i32 786688, metadata !52, metadata !"i", metadata !6, i32 15, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 15]
!52 = metadata !{i32 786443, metadata !5, metadata !53, i32 15, i32 3, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [C:\eclipse\Swift_IDE_Toolchain\eclipse\DIF-FFT-radix2\Release/C:\eclipse\Swift_IDE_Toolchain\toolchain_8slot\include\swift_debug.h]
!53 = metadata !{i32 786443, metadata !5, metadata !4, i32 13, i32 14, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [C:\eclipse\Swift_IDE_Toolchain\eclipse\DIF-FFT-radix2\Release/C:\eclipse\Swift_IDE_Toolchain\toolchain_8slot\include\swift_debug.h]
!54 = metadata !{i32 15, i32 11, metadata !52, null}
!55 = metadata !{i32 15, i32 7, metadata !52, null}
!56 = metadata !{i32 16, i32 4, metadata !52, null}
!57 = metadata !{i32 15, i32 23, metadata !52, null}
!58 = metadata !{i32 17, i32 3, metadata !53, null}
!59 = metadata !{i32 786688, metadata !60, metadata !"i", metadata !6, i32 19, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 19]
!60 = metadata !{i32 786443, metadata !5, metadata !53, i32 19, i32 3, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [C:\eclipse\Swift_IDE_Toolchain\eclipse\DIF-FFT-radix2\Release/C:\eclipse\Swift_IDE_Toolchain\toolchain_8slot\include\swift_debug.h]
!61 = metadata !{i32 19, i32 11, metadata !60, null}
!62 = metadata !{i32 19, i32 7, metadata !60, null}
!63 = metadata !{i32 20, i32 4, metadata !60, null}
!64 = metadata !{i32 19, i32 23, metadata !60, null}
!65 = metadata !{i32 21, i32 3, metadata !53, null}
!66 = metadata !{i32 786688, metadata !67, metadata !"i", metadata !6, i32 23, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 23]
!67 = metadata !{i32 786443, metadata !5, metadata !53, i32 23, i32 3, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [C:\eclipse\Swift_IDE_Toolchain\eclipse\DIF-FFT-radix2\Release/C:\eclipse\Swift_IDE_Toolchain\toolchain_8slot\include\swift_debug.h]
!68 = metadata !{i32 23, i32 11, metadata !67, null}
!69 = metadata !{i32 23, i32 7, metadata !67, null}
!70 = metadata !{i32 24, i32 4, metadata !67, null}
!71 = metadata !{i32 23, i32 23, metadata !67, null}
!72 = metadata !{i32 25, i32 3, metadata !53, null}
!73 = metadata !{i32 27, i32 3, metadata !53, null}
!74 = metadata !{i32 29, i32 1, metadata !4, null}
!75 = metadata !{i32 786689, metadata !11, metadata !"n", metadata !12, i32 16777225, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 9]
!76 = metadata !{i32 9, i32 22, metadata !11, null}
!77 = metadata !{i32 786689, metadata !11, metadata !"x", metadata !12, i32 33554441, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 9]
!78 = metadata !{i32 9, i32 32, metadata !11, null}
!79 = metadata !{i32 786688, metadata !11, metadata !"temp", metadata !12, i32 13, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [temp] [line 13]
!80 = metadata !{i32 13, i32 9, metadata !11, null}
!81 = metadata !{i32 786688, metadata !82, metadata !"i", metadata !12, i32 14, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 14]
!82 = metadata !{i32 786443, metadata !1, metadata !11, i32 14, i32 3, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [C:\eclipse\Swift_IDE_Toolchain\eclipse\DIF-FFT-radix2\Release/..\fft_16x16.c]
!83 = metadata !{i32 14, i32 12, metadata !82, null}
!84 = metadata !{i32 14, i32 8, metadata !82, null}
!85 = metadata !{i32 786688, metadata !82, metadata !"j", metadata !12, i32 14, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 14]
!86 = metadata !{i32 14, i32 19, metadata !82, null}
!87 = metadata !{i32 786688, metadata !88, metadata !"k", metadata !12, i32 15, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 15]
!88 = metadata !{i32 786443, metadata !1, metadata !89, i32 15, i32 5, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [C:\eclipse\Swift_IDE_Toolchain\eclipse\DIF-FFT-radix2\Release/..\fft_16x16.c]
!89 = metadata !{i32 786443, metadata !1, metadata !82, i32 14, i32 42, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [C:\eclipse\Swift_IDE_Toolchain\eclipse\DIF-FFT-radix2\Release/..\fft_16x16.c]
!90 = metadata !{i32 15, i32 14, metadata !88, null}
!91 = metadata !{i32 15, i32 10, metadata !88, null}
!92 = metadata !{i32 15, i32 39, metadata !88, null}
!93 = metadata !{i32 16, i32 9, metadata !94, null}
!94 = metadata !{i32 786443, metadata !1, metadata !89, i32 16, i32 9, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [C:\eclipse\Swift_IDE_Toolchain\eclipse\DIF-FFT-radix2\Release/..\fft_16x16.c]
!95 = metadata !{i32 17, i32 6, metadata !96, null}
!96 = metadata !{i32 786443, metadata !1, metadata !94, i32 16, i32 15, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [C:\eclipse\Swift_IDE_Toolchain\eclipse\DIF-FFT-radix2\Release/..\fft_16x16.c]
!97 = metadata !{i32 18, i32 6, metadata !96, null}
!98 = metadata !{i32 19, i32 6, metadata !96, null}
!99 = metadata !{i32 20, i32 6, metadata !96, null}
!100 = metadata !{i32 21, i32 6, metadata !96, null}
!101 = metadata !{i32 22, i32 6, metadata !96, null}
!102 = metadata !{i32 23, i32 5, metadata !96, null}
!103 = metadata !{i32 24, i32 3, metadata !89, null}
!104 = metadata !{i32 14, i32 37, metadata !82, null}
!105 = metadata !{i32 25, i32 1, metadata !11, null}
!106 = metadata !{i32 50, i32 4, metadata !107, null}
!107 = metadata !{i32 786443, metadata !1, metadata !108, i32 49, i32 20, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [C:\eclipse\Swift_IDE_Toolchain\eclipse\DIF-FFT-radix2\Release/..\fft_16x16.c]
!108 = metadata !{i32 786443, metadata !1, metadata !109, i32 49, i32 11, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [C:\eclipse\Swift_IDE_Toolchain\eclipse\DIF-FFT-radix2\Release/..\fft_16x16.c]
!109 = metadata !{i32 786443, metadata !1, metadata !110, i32 35, i32 6, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [C:\eclipse\Swift_IDE_Toolchain\eclipse\DIF-FFT-radix2\Release/..\fft_16x16.c]
!110 = metadata !{i32 786443, metadata !1, metadata !111, i32 32, i32 35, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [C:\eclipse\Swift_IDE_Toolchain\eclipse\DIF-FFT-radix2\Release/..\fft_16x16.c]
!111 = metadata !{i32 786443, metadata !1, metadata !17, i32 32, i32 2, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [C:\eclipse\Swift_IDE_Toolchain\eclipse\DIF-FFT-radix2\Release/..\fft_16x16.c]
!112 = metadata !{i32 36, i32 4, metadata !113, null}
!113 = metadata !{i32 786443, metadata !1, metadata !109, i32 35, i32 15, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [C:\eclipse\Swift_IDE_Toolchain\eclipse\DIF-FFT-radix2\Release/..\fft_16x16.c]
!114 = metadata !{i32 786689, metadata !17, metadata !"x", metadata !12, i32 16777242, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 26]
!115 = metadata !{i32 26, i32 23, metadata !17, null}
!116 = metadata !{i32 786689, metadata !17, metadata !"w", metadata !12, i32 33554458, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [w] [line 26]
!117 = metadata !{i32 26, i32 33, metadata !17, null}
!118 = metadata !{i32 786689, metadata !17, metadata !"nx", metadata !12, i32 50331674, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [nx] [line 26]
!119 = metadata !{i32 26, i32 40, metadata !17, null}
!120 = metadata !{i32 786688, metadata !17, metadata !"n1", metadata !12, i32 27, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n1] [line 27]
!121 = metadata !{i32 27, i32 6, metadata !17, null}
!122 = metadata !{i32 786688, metadata !17, metadata !"n2", metadata !12, i32 27, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n2] [line 27]
!123 = metadata !{i32 27, i32 9, metadata !17, null}
!124 = metadata !{i32 786688, metadata !17, metadata !"ie", metadata !12, i32 27, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ie] [line 27]
!125 = metadata !{i32 27, i32 12, metadata !17, null}
!126 = metadata !{i32 786688, metadata !17, metadata !"ia", metadata !12, i32 27, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ia] [line 27]
!127 = metadata !{i32 27, i32 15, metadata !17, null}
!128 = metadata !{i32 786688, metadata !17, metadata !"i", metadata !12, i32 27, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 27]
!129 = metadata !{i32 27, i32 18, metadata !17, null}
!130 = metadata !{i32 786688, metadata !17, metadata !"j", metadata !12, i32 27, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 27]
!131 = metadata !{i32 27, i32 20, metadata !17, null}
!132 = metadata !{i32 786688, metadata !17, metadata !"k", metadata !12, i32 27, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 27]
!133 = metadata !{i32 27, i32 22, metadata !17, null}
!134 = metadata !{i32 786688, metadata !17, metadata !"l", metadata !12, i32 27, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [l] [line 27]
!135 = metadata !{i32 27, i32 24, metadata !17, null}
!136 = metadata !{i32 786688, metadata !17, metadata !"m", metadata !12, i32 27, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [m] [line 27]
!137 = metadata !{i32 27, i32 26, metadata !17, null}
!138 = metadata !{i32 786688, metadata !17, metadata !"xt", metadata !12, i32 28, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [xt] [line 28]
!139 = metadata !{i32 28, i32 6, metadata !17, null}
!140 = metadata !{i32 786688, metadata !17, metadata !"yt", metadata !12, i32 28, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [yt] [line 28]
!141 = metadata !{i32 28, i32 9, metadata !17, null}
!142 = metadata !{i32 786688, metadata !17, metadata !"c", metadata !12, i32 28, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [c] [line 28]
!143 = metadata !{i32 28, i32 12, metadata !17, null}
!144 = metadata !{i32 786688, metadata !17, metadata !"s", metadata !12, i32 28, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [s] [line 28]
!145 = metadata !{i32 28, i32 14, metadata !17, null}
!146 = metadata !{i32 786688, metadata !17, metadata !"mid_a", metadata !12, i32 29, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mid_a] [line 29]
!147 = metadata !{i32 29, i32 6, metadata !17, null}
!148 = metadata !{i32 786688, metadata !17, metadata !"mid_b", metadata !12, i32 29, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mid_b] [line 29]
!149 = metadata !{i32 29, i32 12, metadata !17, null}
!150 = metadata !{i32 30, i32 2, metadata !17, null}
!151 = metadata !{i32 31, i32 2, metadata !17, null}
!152 = metadata !{i32 32, i32 7, metadata !111, null}
!153 = metadata !{i32 33, i32 3, metadata !110, null}
!154 = metadata !{i32 34, i32 3, metadata !110, null}
!155 = metadata !{i32 35, i32 6, metadata !109, null}
!156 = metadata !{i32 786689, metadata !23, metadata !"vpnum", metadata !25, i32 16777229, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [vpnum] [line 13]
!157 = metadata !{i32 13, i32 26, metadata !23, metadata !112}
!158 = metadata !{i32 786688, metadata !23, metadata !"vpsel", metadata !25, i32 14, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [vpsel] [line 14]
!159 = metadata !{i32 14, i32 23, metadata !23, metadata !112}
!160 = metadata !{i32 14, i32 2, metadata !23, metadata !112}
!161 = metadata !{i32 15, i32 2, metadata !23, metadata !112}
!162 = metadata !{i32 16, i32 10, metadata !163, metadata !112}
!163 = metadata !{i32 786443, metadata !24, metadata !23, i32 15, i32 15, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [C:\eclipse\Swift_IDE_Toolchain\eclipse\DIF-FFT-radix2\Release/C:\eclipse\Swift_IDE_Toolchain\toolchain_8slot\include\swift_math.h]
!164 = metadata !{i32 16, i32 23, metadata !163, metadata !112}
!165 = metadata !{i32 17, i32 10, metadata !163, metadata !112}
!166 = metadata !{i32 17, i32 23, metadata !163, metadata !112}
!167 = metadata !{i32 18, i32 10, metadata !163, metadata !112}
!168 = metadata !{i32 18, i32 23, metadata !163, metadata !112}
!169 = metadata !{i32 19, i32 10, metadata !163, metadata !112}
!170 = metadata !{i32 19, i32 23, metadata !163, metadata !112}
!171 = metadata !{i32 20, i32 10, metadata !163, metadata !112}
!172 = metadata !{i32 20, i32 23, metadata !163, metadata !112}
!173 = metadata !{i32 22, i32 3, metadata !163, metadata !112}
!174 = metadata !{i32 24, i32 2, metadata !23, metadata !112}
!175 = metadata !{i32 25, i32 1, metadata !23, metadata !112}
!176 = metadata !{i32 37, i32 9, metadata !177, null}
!177 = metadata !{i32 786443, metadata !1, metadata !113, i32 37, i32 4, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [C:\eclipse\Swift_IDE_Toolchain\eclipse\DIF-FFT-radix2\Release/..\fft_16x16.c]
!178 = metadata !{i32 38, i32 5, metadata !179, null}
!179 = metadata !{i32 786443, metadata !1, metadata !177, i32 37, i32 29, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [C:\eclipse\Swift_IDE_Toolchain\eclipse\DIF-FFT-radix2\Release/..\fft_16x16.c]
!180 = metadata !{i32 786688, metadata !179, metadata !"time", metadata !12, i32 39, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [time] [line 39]
!181 = metadata !{i32 39, i32 9, metadata !179, null}
!182 = metadata !{i32 40, i32 5, metadata !179, null}
!183 = metadata !{i32 41, i32 10, metadata !184, null}
!184 = metadata !{i32 786443, metadata !1, metadata !179, i32 41, i32 5, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [C:\eclipse\Swift_IDE_Toolchain\eclipse\DIF-FFT-radix2\Release/..\fft_16x16.c]
!185 = metadata !{i32 42, i32 6, metadata !186, null}
!186 = metadata !{i32 786443, metadata !1, metadata !184, i32 41, i32 33, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [C:\eclipse\Swift_IDE_Toolchain\eclipse\DIF-FFT-radix2\Release/..\fft_16x16.c]
!187 = metadata !{i32 43, i32 6, metadata !186, null}
!188 = metadata !{i32 44, i32 6, metadata !186, null}
!189 = metadata !{i32 45, i32 6, metadata !186, null}
!190 = metadata !{i32 46, i32 5, metadata !186, null}
!191 = metadata !{i32 41, i32 25, metadata !184, null}
!192 = metadata !{i32 47, i32 4, metadata !179, null}
!193 = metadata !{i32 37, i32 22, metadata !177, null}
!194 = metadata !{i32 48, i32 3, metadata !113, null}
!195 = metadata !{i32 49, i32 11, metadata !108, null}
!196 = metadata !{i32 13, i32 26, metadata !23, metadata !106}
!197 = metadata !{i32 14, i32 23, metadata !23, metadata !106}
!198 = metadata !{i32 14, i32 2, metadata !23, metadata !106}
!199 = metadata !{i32 15, i32 2, metadata !23, metadata !106}
!200 = metadata !{i32 16, i32 10, metadata !163, metadata !106}
!201 = metadata !{i32 16, i32 23, metadata !163, metadata !106}
!202 = metadata !{i32 17, i32 10, metadata !163, metadata !106}
!203 = metadata !{i32 17, i32 23, metadata !163, metadata !106}
!204 = metadata !{i32 18, i32 10, metadata !163, metadata !106}
!205 = metadata !{i32 18, i32 23, metadata !163, metadata !106}
!206 = metadata !{i32 19, i32 10, metadata !163, metadata !106}
!207 = metadata !{i32 19, i32 23, metadata !163, metadata !106}
!208 = metadata !{i32 20, i32 10, metadata !163, metadata !106}
!209 = metadata !{i32 20, i32 23, metadata !163, metadata !106}
!210 = metadata !{i32 22, i32 3, metadata !163, metadata !106}
!211 = metadata !{i32 24, i32 2, metadata !23, metadata !106}
!212 = metadata !{i32 25, i32 1, metadata !23, metadata !106}
!213 = metadata !{i32 51, i32 9, metadata !214, null}
!214 = metadata !{i32 786443, metadata !1, metadata !107, i32 51, i32 4, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [C:\eclipse\Swift_IDE_Toolchain\eclipse\DIF-FFT-radix2\Release/..\fft_16x16.c]
!215 = metadata !{i32 52, i32 5, metadata !216, null}
!216 = metadata !{i32 786443, metadata !1, metadata !214, i32 51, i32 29, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [C:\eclipse\Swift_IDE_Toolchain\eclipse\DIF-FFT-radix2\Release/..\fft_16x16.c]
!217 = metadata !{i32 786688, metadata !216, metadata !"time", metadata !12, i32 53, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [time] [line 53]
!218 = metadata !{i32 53, i32 9, metadata !216, null}
!219 = metadata !{i32 53, i32 5, metadata !216, null}
!220 = metadata !{i32 54, i32 10, metadata !221, null}
!221 = metadata !{i32 786443, metadata !1, metadata !216, i32 54, i32 5, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [C:\eclipse\Swift_IDE_Toolchain\eclipse\DIF-FFT-radix2\Release/..\fft_16x16.c]
!222 = metadata !{i32 55, i32 6, metadata !223, null}
!223 = metadata !{i32 786443, metadata !1, metadata !221, i32 54, i32 33, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [C:\eclipse\Swift_IDE_Toolchain\eclipse\DIF-FFT-radix2\Release/..\fft_16x16.c]
!224 = metadata !{i32 56, i32 6, metadata !223, null}
!225 = metadata !{i32 57, i32 6, metadata !223, null}
!226 = metadata !{i32 58, i32 6, metadata !223, null} ; [ DW_TAG_imported_module ]
!227 = metadata !{i32 59, i32 5, metadata !223, null}
!228 = metadata !{i32 54, i32 25, metadata !221, null}
!229 = metadata !{i32 60, i32 4, metadata !216, null}
!230 = metadata !{i32 51, i32 22, metadata !214, null}
!231 = metadata !{i32 61, i32 3, metadata !107, null}
!232 = metadata !{i32 63, i32 9, metadata !233, null}
!233 = metadata !{i32 786443, metadata !1, metadata !234, i32 63, i32 4, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [C:\eclipse\Swift_IDE_Toolchain\eclipse\DIF-FFT-radix2\Release/..\fft_16x16.c]
!234 = metadata !{i32 786443, metadata !1, metadata !108, i32 62, i32 7, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [C:\eclipse\Swift_IDE_Toolchain\eclipse\DIF-FFT-radix2\Release/..\fft_16x16.c]
!235 = metadata !{i32 64, i32 5, metadata !236, null}
!236 = metadata !{i32 786443, metadata !1, metadata !233, i32 63, i32 29, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [C:\eclipse\Swift_IDE_Toolchain\eclipse\DIF-FFT-radix2\Release/..\fft_16x16.c]
!237 = metadata !{i32 65, i32 10, metadata !238, null}
!238 = metadata !{i32 786443, metadata !1, metadata !236, i32 65, i32 5, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [C:\eclipse\Swift_IDE_Toolchain\eclipse\DIF-FFT-radix2\Release/..\fft_16x16.c]
!239 = metadata !{i32 66, i32 6, metadata !240, null}
!240 = metadata !{i32 786443, metadata !1, metadata !238, i32 65, i32 31, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [C:\eclipse\Swift_IDE_Toolchain\eclipse\DIF-FFT-radix2\Release/..\fft_16x16.c]
!241 = metadata !{i32 67, i32 6, metadata !240, null}
!242 = metadata !{i32 68, i32 6, metadata !240, null}
!243 = metadata !{i32 69, i32 6, metadata !240, null}
!244 = metadata !{i32 70, i32 6, metadata !240, null}
!245 = metadata !{i32 71, i32 6, metadata !240, null}
!246 = metadata !{i32 72, i32 6, metadata !240, null}
!247 = metadata !{i32 73, i32 6, metadata !240, null}
!248 = metadata !{i32 74, i32 6, metadata !240, null}
!249 = metadata !{i32 75, i32 6, metadata !240, null}
!250 = metadata !{i32 76, i32 6, metadata !240, null}
!251 = metadata !{i32 77, i32 6, metadata !240, null}
!252 = metadata !{i32 78, i32 6, metadata !240, null}
!253 = metadata !{i32 79, i32 5, metadata !240, null}
!254 = metadata !{i32 65, i32 23, metadata !238, null}
!255 = metadata !{i32 80, i32 4, metadata !236, null}
!256 = metadata !{i32 63, i32 22, metadata !233, null}
!257 = metadata !{i32 786688, metadata !258, metadata !"p", metadata !12, i32 82, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [p] [line 82]
!258 = metadata !{i32 786443, metadata !1, metadata !110, i32 82, i32 4, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [C:\eclipse\Swift_IDE_Toolchain\eclipse\DIF-FFT-radix2\Release/..\fft_16x16.c]
!259 = metadata !{i32 82, i32 12, metadata !258, null}
!260 = metadata !{i32 82, i32 8, metadata !258, null}
!261 = metadata !{i32 83, i32 5, metadata !262, null}
!262 = metadata !{i32 786443, metadata !1, metadata !258, i32 82, i32 32, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [C:\eclipse\Swift_IDE_Toolchain\eclipse\DIF-FFT-radix2\Release/..\fft_16x16.c]
!263 = metadata !{i32 84, i32 5, metadata !262, null}
!264 = metadata !{i32 85, i32 4, metadata !262, null}
!265 = metadata !{i32 82, i32 27, metadata !258, null}
!266 = metadata !{i32 86, i32 2, metadata !110, null}
!267 = metadata !{i32 32, i32 21, metadata !111, null}
!268 = metadata !{i32 87, i32 2, metadata !17, null}
!269 = metadata !{i32 88, i32 1, metadata !17, null}
!270 = metadata !{i32 786688, metadata !20, metadata !"ndata", metadata !12, i32 90, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ndata] [line 90]
!271 = metadata !{i32 90, i32 6, metadata !20, null}
!272 = metadata !{i32 90, i32 2, metadata !20, null}
!273 = metadata !{i32 91, i32 2, metadata !20, null}
!274 = metadata !{i32 92, i32 2, metadata !20, null}
!275 = metadata !{i32 93, i32 2, metadata !20, null}
