; ModuleID = '..\fft_16x16.c'
target datalayout = "e-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
target triple = "dsp"

; Function Attrs: nounwind
define void @bit_reverse1(i32 %n, i16* %x) #0 {
entry:
  %n.addr = alloca i32, align 4
  %x.addr = alloca i16*, align 4
  %temp = alloca i16, align 2
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata !{i32* %n.addr}, metadata !17), !dbg !18
  store i16* %x, i16** %x.addr, align 4
  call void @llvm.dbg.declare(metadata !{i16** %x.addr}, metadata !19), !dbg !20
  call void @llvm.dbg.declare(metadata !{i16* %temp}, metadata !21), !dbg !22
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !23), !dbg !25
  store i32 0, i32* %i, align 4, !dbg !26
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !27), !dbg !28
  store i32 1, i32* %j, align 4, !dbg !26
  br label %for.cond, !dbg !26

for.cond:                                         ; preds = %for.inc23, %entry
  %0 = load i32* %j, align 4, !dbg !26
  %1 = load i32* %n.addr, align 4, !dbg !26
  %sub = sub nsw i32 %1, 1, !dbg !26
  %cmp = icmp slt i32 %0, %sub, !dbg !26
  br i1 %cmp, label %for.body, label %for.end24, !dbg !26

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata !{i32* %k}, metadata !29), !dbg !32
  %2 = load i32* %n.addr, align 4, !dbg !33
  %shr = ashr i32 %2, 1, !dbg !33
  store i32 %shr, i32* %k, align 4, !dbg !33
  br label %for.cond1, !dbg !33

for.cond1:                                        ; preds = %for.inc, %for.body
  %3 = load i32* %k, align 4, !dbg !33
  %4 = load i32* %k, align 4, !dbg !33
  %5 = load i32* %i, align 4, !dbg !33
  %xor = xor i32 %5, %4, !dbg !33
  store i32 %xor, i32* %i, align 4, !dbg !33
  %cmp2 = icmp sgt i32 %3, %xor, !dbg !33
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !33

for.body3:                                        ; preds = %for.cond1
  br label %for.inc, !dbg !33

for.inc:                                          ; preds = %for.body3
  %6 = load i32* %k, align 4, !dbg !34
  %shr4 = ashr i32 %6, 1, !dbg !34
  store i32 %shr4, i32* %k, align 4, !dbg !34
  br label %for.cond1, !dbg !34

for.end:                                          ; preds = %for.cond1
  %7 = load i32* %i, align 4, !dbg !35
  %8 = load i32* %j, align 4, !dbg !35
  %cmp5 = icmp slt i32 %7, %8, !dbg !35
  br i1 %cmp5, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %for.end
  %9 = load i32* %i, align 4, !dbg !37
  %mul = mul nsw i32 2, %9, !dbg !37
  %10 = load i16** %x.addr, align 4, !dbg !37
  %arrayidx = getelementptr inbounds i16* %10, i32 %mul, !dbg !37
  %11 = load i16* %arrayidx, align 2, !dbg !37
  store i16 %11, i16* %temp, align 2, !dbg !37
  %12 = load i32* %j, align 4, !dbg !39
  %mul6 = mul nsw i32 2, %12, !dbg !39
  %13 = load i16** %x.addr, align 4, !dbg !39
  %arrayidx7 = getelementptr inbounds i16* %13, i32 %mul6, !dbg !39
  %14 = load i16* %arrayidx7, align 2, !dbg !39
  %15 = load i32* %i, align 4, !dbg !39
  %mul8 = mul nsw i32 2, %15, !dbg !39
  %16 = load i16** %x.addr, align 4, !dbg !39
  %arrayidx9 = getelementptr inbounds i16* %16, i32 %mul8, !dbg !39
  store i16 %14, i16* %arrayidx9, align 2, !dbg !39
  %17 = load i16* %temp, align 2, !dbg !40
  %18 = load i32* %j, align 4, !dbg !40
  %mul10 = mul nsw i32 2, %18, !dbg !40
  %19 = load i16** %x.addr, align 4, !dbg !40
  %arrayidx11 = getelementptr inbounds i16* %19, i32 %mul10, !dbg !40
  store i16 %17, i16* %arrayidx11, align 2, !dbg !40
  %20 = load i32* %i, align 4, !dbg !41
  %mul12 = mul nsw i32 2, %20, !dbg !41
  %add = add nsw i32 %mul12, 1, !dbg !41
  %21 = load i16** %x.addr, align 4, !dbg !41
  %arrayidx13 = getelementptr inbounds i16* %21, i32 %add, !dbg !41
  %22 = load i16* %arrayidx13, align 2, !dbg !41
  store i16 %22, i16* %temp, align 2, !dbg !41
  %23 = load i32* %j, align 4, !dbg !42
  %mul14 = mul nsw i32 2, %23, !dbg !42
  %add15 = add nsw i32 %mul14, 1, !dbg !42
  %24 = load i16** %x.addr, align 4, !dbg !42
  %arrayidx16 = getelementptr inbounds i16* %24, i32 %add15, !dbg !42
  %25 = load i16* %arrayidx16, align 2, !dbg !42
  %26 = load i32* %i, align 4, !dbg !42
  %mul17 = mul nsw i32 2, %26, !dbg !42
  %add18 = add nsw i32 %mul17, 1, !dbg !42
  %27 = load i16** %x.addr, align 4, !dbg !42
  %arrayidx19 = getelementptr inbounds i16* %27, i32 %add18, !dbg !42
  store i16 %25, i16* %arrayidx19, align 2, !dbg !42
  %28 = load i16* %temp, align 2, !dbg !43
  %29 = load i32* %j, align 4, !dbg !43
  %mul20 = mul nsw i32 2, %29, !dbg !43
  %add21 = add nsw i32 %mul20, 1, !dbg !43
  %30 = load i16** %x.addr, align 4, !dbg !43
  %arrayidx22 = getelementptr inbounds i16* %30, i32 %add21, !dbg !43
  store i16 %28, i16* %arrayidx22, align 2, !dbg !43
  br label %if.end, !dbg !44

if.end:                                           ; preds = %if.then, %for.end
  br label %for.inc23, !dbg !45

for.inc23:                                        ; preds = %if.end
  %31 = load i32* %j, align 4, !dbg !46
  %inc = add nsw i32 %31, 1, !dbg !46
  store i32 %inc, i32* %j, align 4, !dbg !46
  br label %for.cond, !dbg !46

for.end24:                                        ; preds = %for.cond
  ret void, !dbg !47
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind
define void @fft_16x16(i16* %x, i16* %w, i32 %nx) #0 {
entry:
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
  %p = alloca i32, align 4
  %j108 = alloca i32, align 4
  store i16* %x, i16** %x.addr, align 4
  call void @llvm.dbg.declare(metadata !{i16** %x.addr}, metadata !48), !dbg !49
  store i16* %w, i16** %w.addr, align 4
  call void @llvm.dbg.declare(metadata !{i16** %w.addr}, metadata !50), !dbg !51
  store i32 %nx, i32* %nx.addr, align 4
  call void @llvm.dbg.declare(metadata !{i32* %nx.addr}, metadata !52), !dbg !53
  call void @llvm.dbg.declare(metadata !{i32* %n1}, metadata !54), !dbg !55
  call void @llvm.dbg.declare(metadata !{i32* %n2}, metadata !56), !dbg !57
  call void @llvm.dbg.declare(metadata !{i32* %ie}, metadata !58), !dbg !59
  call void @llvm.dbg.declare(metadata !{i32* %ia}, metadata !60), !dbg !61
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !62), !dbg !63
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !64), !dbg !65
  call void @llvm.dbg.declare(metadata !{i32* %k}, metadata !66), !dbg !67
  call void @llvm.dbg.declare(metadata !{i32* %l}, metadata !68), !dbg !69
  call void @llvm.dbg.declare(metadata !{i32* %m}, metadata !70), !dbg !71
  call void @llvm.dbg.declare(metadata !{i32* %xt}, metadata !72), !dbg !73
  call void @llvm.dbg.declare(metadata !{i32* %yt}, metadata !74), !dbg !75
  call void @llvm.dbg.declare(metadata !{i32* %c}, metadata !76), !dbg !77
  call void @llvm.dbg.declare(metadata !{i32* %s}, metadata !78), !dbg !79
  call void @llvm.dbg.declare(metadata !{i32* %mid_a}, metadata !80), !dbg !81
  call void @llvm.dbg.declare(metadata !{i32* %mid_b}, metadata !82), !dbg !83
  %0 = load i32* %nx.addr, align 4, !dbg !84
  store i32 %0, i32* %n2, align 4, !dbg !84
  store i32 1, i32* %ie, align 4, !dbg !85
  %1 = load i32* %nx.addr, align 4, !dbg !86
  store i32 %1, i32* %k, align 4, !dbg !86
  br label %for.cond, !dbg !86

for.cond:                                         ; preds = %for.inc119, %entry
  %2 = load i32* %k, align 4, !dbg !86
  %cmp = icmp sgt i32 %2, 1, !dbg !86
  br i1 %cmp, label %for.body, label %for.end121, !dbg !86

for.body:                                         ; preds = %for.cond
  %3 = load i32* %n2, align 4, !dbg !88
  store i32 %3, i32* %n1, align 4, !dbg !88
  %4 = load i32* %n2, align 4, !dbg !90
  %shr = ashr i32 %4, 1, !dbg !90
  store i32 %shr, i32* %n2, align 4, !dbg !90
  %5 = load i32* %n2, align 4, !dbg !91
  %cmp1 = icmp sge i32 %5, 64, !dbg !91
  br i1 %cmp1, label %if.then, label %if.else, !dbg !91

if.then:                                          ; preds = %for.body
  store i32 0, i32* %j, align 4, !dbg !93
  br label %for.cond2, !dbg !93

for.cond2:                                        ; preds = %for.inc16, %if.then
  %6 = load i32* %j, align 4, !dbg !93
  %7 = load i32* %nx.addr, align 4, !dbg !93
  %cmp3 = icmp slt i32 %6, %7, !dbg !93
  br i1 %cmp3, label %for.body4, label %for.end18, !dbg !93

for.body4:                                        ; preds = %for.cond2
  store i32 0, i32* %ia, align 4, !dbg !96
  call void @llvm.dbg.declare(metadata !{i32* %time}, metadata !98), !dbg !99
  %8 = load i32* %n2, align 4, !dbg !100
  %div = sdiv i32 %8, 64, !dbg !100
  store i32 %div, i32* %time, align 4, !dbg !100
  store i32 0, i32* %i, align 4, !dbg !101
  br label %for.cond5, !dbg !101

for.cond5:                                        ; preds = %for.inc, %for.body4
  %9 = load i32* %i, align 4, !dbg !101
  %10 = load i32* %time, align 4, !dbg !101
  %cmp6 = icmp slt i32 %9, %10, !dbg !101
  br i1 %cmp6, label %for.body7, label %for.end, !dbg !101

for.body7:                                        ; preds = %for.cond5
  %11 = load i32* %i, align 4, !dbg !103
  %mul = mul nsw i32 %11, 64, !dbg !103
  %12 = load i32* %j, align 4, !dbg !103
  %add = add nsw i32 %mul, %12, !dbg !103
  store i32 %add, i32* %m, align 4, !dbg !103
  %13 = load i32* %m, align 4, !dbg !105
  %14 = load i32* %n2, align 4, !dbg !105
  %add8 = add nsw i32 %13, %14, !dbg !105
  store i32 %add8, i32* %l, align 4, !dbg !105
  %15 = load i32* %m, align 4, !dbg !106
  %mul9 = mul nsw i32 2, %15, !dbg !106
  %16 = load i16** %x.addr, align 4, !dbg !106
  %arrayidx = getelementptr inbounds i16* %16, i32 %mul9, !dbg !106
  %17 = load i32* %l, align 4, !dbg !106
  %mul10 = mul nsw i32 2, %17, !dbg !106
  %18 = load i16** %x.addr, align 4, !dbg !106
  %arrayidx11 = getelementptr inbounds i16* %18, i32 %mul10, !dbg !106
  %19 = load i32* %ia, align 4, !dbg !106
  %mul12 = mul nsw i32 2, %19, !dbg !106
  %20 = load i16** %w.addr, align 4, !dbg !106
  %arrayidx13 = getelementptr inbounds i16* %20, i32 %mul12, !dbg !106
  %call = call signext i16 @vmac_butterfly(i16* %arrayidx, i16* %arrayidx11, i16* %arrayidx13), !dbg !106
  %21 = load i32* %ia, align 4, !dbg !107
  %add14 = add nsw i32 %21, 64, !dbg !107
  store i32 %add14, i32* %ia, align 4, !dbg !107
  br label %for.inc, !dbg !108

for.inc:                                          ; preds = %for.body7
  %22 = load i32* %i, align 4, !dbg !109
  %add15 = add nsw i32 %22, 1, !dbg !109
  store i32 %add15, i32* %i, align 4, !dbg !109
  br label %for.cond5, !dbg !109

for.end:                                          ; preds = %for.cond5
  br label %for.inc16, !dbg !110

for.inc16:                                        ; preds = %for.end
  %23 = load i32* %n1, align 4, !dbg !111
  %24 = load i32* %j, align 4, !dbg !111
  %add17 = add nsw i32 %24, %23, !dbg !111
  store i32 %add17, i32* %j, align 4, !dbg !111
  br label %for.cond2, !dbg !111

for.end18:                                        ; preds = %for.cond2
  br label %if.end, !dbg !112

if.else:                                          ; preds = %for.body
  store i32 0, i32* %j, align 4, !dbg !113
  br label %for.cond19, !dbg !113

for.cond19:                                       ; preds = %for.inc90, %if.else
  %25 = load i32* %j, align 4, !dbg !113
  %26 = load i32* %nx.addr, align 4, !dbg !113
  %cmp20 = icmp slt i32 %25, %26, !dbg !113
  br i1 %cmp20, label %for.body21, label %for.end92, !dbg !113

for.body21:                                       ; preds = %for.cond19
  store i32 0, i32* %ia, align 4, !dbg !116
  store i32 0, i32* %i, align 4, !dbg !118
  br label %for.cond22, !dbg !118

for.cond22:                                       ; preds = %for.inc87, %for.body21
  %27 = load i32* %i, align 4, !dbg !118
  %28 = load i32* %n2, align 4, !dbg !118
  %cmp23 = icmp slt i32 %27, %28, !dbg !118
  br i1 %cmp23, label %for.body24, label %for.end89, !dbg !118

for.body24:                                       ; preds = %for.cond22
  %29 = load i32* %ia, align 4, !dbg !120
  %mul25 = mul nsw i32 2, %29, !dbg !120
  %30 = load i16** %w.addr, align 4, !dbg !120
  %arrayidx26 = getelementptr inbounds i16* %30, i32 %mul25, !dbg !120
  %31 = load i16* %arrayidx26, align 2, !dbg !120
  %conv = sext i16 %31 to i32, !dbg !120
  store i32 %conv, i32* %c, align 4, !dbg !120
  %32 = load i32* %ia, align 4, !dbg !122
  %mul27 = mul nsw i32 2, %32, !dbg !122
  %add28 = add nsw i32 %mul27, 1, !dbg !122
  %33 = load i16** %w.addr, align 4, !dbg !122
  %arrayidx29 = getelementptr inbounds i16* %33, i32 %add28, !dbg !122
  %34 = load i16* %arrayidx29, align 2, !dbg !122
  %conv30 = sext i16 %34 to i32, !dbg !122
  store i32 %conv30, i32* %s, align 4, !dbg !122
  %35 = load i32* %ia, align 4, !dbg !123
  %add31 = add nsw i32 %35, 1, !dbg !123
  store i32 %add31, i32* %ia, align 4, !dbg !123
  %36 = load i32* %i, align 4, !dbg !124
  %37 = load i32* %j, align 4, !dbg !124
  %add32 = add nsw i32 %36, %37, !dbg !124
  store i32 %add32, i32* %m, align 4, !dbg !124
  %38 = load i32* %m, align 4, !dbg !125
  %39 = load i32* %n2, align 4, !dbg !125
  %add33 = add nsw i32 %38, %39, !dbg !125
  store i32 %add33, i32* %l, align 4, !dbg !125
  %40 = load i32* %m, align 4, !dbg !126
  %mul34 = mul nsw i32 2, %40, !dbg !126
  %41 = load i16** %x.addr, align 4, !dbg !126
  %arrayidx35 = getelementptr inbounds i16* %41, i32 %mul34, !dbg !126
  %42 = load i16* %arrayidx35, align 2, !dbg !126
  %conv36 = sext i16 %42 to i32, !dbg !126
  %43 = load i32* %l, align 4, !dbg !126
  %mul37 = mul nsw i32 2, %43, !dbg !126
  %44 = load i16** %x.addr, align 4, !dbg !126
  %arrayidx38 = getelementptr inbounds i16* %44, i32 %mul37, !dbg !126
  %45 = load i16* %arrayidx38, align 2, !dbg !126
  %conv39 = sext i16 %45 to i32, !dbg !126
  %sub = sub nsw i32 %conv36, %conv39, !dbg !126
  store i32 %sub, i32* %xt, align 4, !dbg !126
  %46 = load i32* %m, align 4, !dbg !127
  %mul40 = mul nsw i32 2, %46, !dbg !127
  %47 = load i16** %x.addr, align 4, !dbg !127
  %arrayidx41 = getelementptr inbounds i16* %47, i32 %mul40, !dbg !127
  %48 = load i16* %arrayidx41, align 2, !dbg !127
  %conv42 = sext i16 %48 to i32, !dbg !127
  %49 = load i32* %l, align 4, !dbg !127
  %mul43 = mul nsw i32 2, %49, !dbg !127
  %50 = load i16** %x.addr, align 4, !dbg !127
  %arrayidx44 = getelementptr inbounds i16* %50, i32 %mul43, !dbg !127
  %51 = load i16* %arrayidx44, align 2, !dbg !127
  %conv45 = sext i16 %51 to i32, !dbg !127
  %add46 = add nsw i32 %conv42, %conv45, !dbg !127
  %conv47 = trunc i32 %add46 to i16, !dbg !127
  %52 = load i32* %m, align 4, !dbg !127
  %mul48 = mul nsw i32 2, %52, !dbg !127
  %53 = load i16** %x.addr, align 4, !dbg !127
  %arrayidx49 = getelementptr inbounds i16* %53, i32 %mul48, !dbg !127
  store i16 %conv47, i16* %arrayidx49, align 2, !dbg !127
  %54 = load i32* %m, align 4, !dbg !128
  %mul50 = mul nsw i32 2, %54, !dbg !128
  %add51 = add nsw i32 %mul50, 1, !dbg !128
  %55 = load i16** %x.addr, align 4, !dbg !128
  %arrayidx52 = getelementptr inbounds i16* %55, i32 %add51, !dbg !128
  %56 = load i16* %arrayidx52, align 2, !dbg !128
  %conv53 = sext i16 %56 to i32, !dbg !128
  %57 = load i32* %l, align 4, !dbg !128
  %mul54 = mul nsw i32 2, %57, !dbg !128
  %add55 = add nsw i32 %mul54, 1, !dbg !128
  %58 = load i16** %x.addr, align 4, !dbg !128
  %arrayidx56 = getelementptr inbounds i16* %58, i32 %add55, !dbg !128
  %59 = load i16* %arrayidx56, align 2, !dbg !128
  %conv57 = sext i16 %59 to i32, !dbg !128
  %sub58 = sub nsw i32 %conv53, %conv57, !dbg !128
  store i32 %sub58, i32* %yt, align 4, !dbg !128
  %60 = load i32* %m, align 4, !dbg !129
  %mul59 = mul nsw i32 2, %60, !dbg !129
  %add60 = add nsw i32 %mul59, 1, !dbg !129
  %61 = load i16** %x.addr, align 4, !dbg !129
  %arrayidx61 = getelementptr inbounds i16* %61, i32 %add60, !dbg !129
  %62 = load i16* %arrayidx61, align 2, !dbg !129
  %conv62 = sext i16 %62 to i32, !dbg !129
  %63 = load i32* %l, align 4, !dbg !129
  %mul63 = mul nsw i32 2, %63, !dbg !129
  %add64 = add nsw i32 %mul63, 1, !dbg !129
  %64 = load i16** %x.addr, align 4, !dbg !129
  %arrayidx65 = getelementptr inbounds i16* %64, i32 %add64, !dbg !129
  %65 = load i16* %arrayidx65, align 2, !dbg !129
  %conv66 = sext i16 %65 to i32, !dbg !129
  %add67 = add nsw i32 %conv62, %conv66, !dbg !129
  %conv68 = trunc i32 %add67 to i16, !dbg !129
  %66 = load i32* %m, align 4, !dbg !129
  %mul69 = mul nsw i32 2, %66, !dbg !129
  %add70 = add nsw i32 %mul69, 1, !dbg !129
  %67 = load i16** %x.addr, align 4, !dbg !129
  %arrayidx71 = getelementptr inbounds i16* %67, i32 %add70, !dbg !129
  store i16 %conv68, i16* %arrayidx71, align 2, !dbg !129
  %68 = load i32* %c, align 4, !dbg !130
  %69 = load i32* %yt, align 4, !dbg !130
  %mul72 = mul nsw i32 %68, %69, !dbg !130
  %70 = load i32* %s, align 4, !dbg !130
  %71 = load i32* %xt, align 4, !dbg !130
  %mul73 = mul nsw i32 %70, %71, !dbg !130
  %add74 = add nsw i32 %mul72, %mul73, !dbg !130
  store i32 %add74, i32* %mid_a, align 4, !dbg !130
  %72 = load i32* %s, align 4, !dbg !131
  %73 = load i32* %yt, align 4, !dbg !131
  %mul75 = mul nsw i32 %72, %73, !dbg !131
  %74 = load i32* %c, align 4, !dbg !131
  %75 = load i32* %xt, align 4, !dbg !131
  %mul76 = mul nsw i32 %74, %75, !dbg !131
  %sub77 = sub nsw i32 %mul75, %mul76, !dbg !131
  store i32 %sub77, i32* %mid_b, align 4, !dbg !131
  %76 = load i32* %mid_a, align 4, !dbg !132
  %shr78 = ashr i32 %76, 15, !dbg !132
  %conv79 = trunc i32 %shr78 to i16, !dbg !132
  %77 = load i32* %l, align 4, !dbg !132
  %mul80 = mul nsw i32 2, %77, !dbg !132
  %78 = load i16** %x.addr, align 4, !dbg !132
  %arrayidx81 = getelementptr inbounds i16* %78, i32 %mul80, !dbg !132
  store i16 %conv79, i16* %arrayidx81, align 2, !dbg !132
  %79 = load i32* %mid_b, align 4, !dbg !133
  %shr82 = ashr i32 %79, 15, !dbg !133
  %conv83 = trunc i32 %shr82 to i16, !dbg !133
  %80 = load i32* %l, align 4, !dbg !133
  %mul84 = mul nsw i32 2, %80, !dbg !133
  %add85 = add nsw i32 %mul84, 1, !dbg !133
  %81 = load i16** %x.addr, align 4, !dbg !133
  %arrayidx86 = getelementptr inbounds i16* %81, i32 %add85, !dbg !133
  store i16 %conv83, i16* %arrayidx86, align 2, !dbg !133
  br label %for.inc87, !dbg !134

for.inc87:                                        ; preds = %for.body24
  %82 = load i32* %i, align 4, !dbg !135
  %add88 = add nsw i32 %82, 1, !dbg !135
  store i32 %add88, i32* %i, align 4, !dbg !135
  br label %for.cond22, !dbg !135

for.end89:                                        ; preds = %for.cond22
  br label %for.inc90, !dbg !136

for.inc90:                                        ; preds = %for.end89
  %83 = load i32* %n1, align 4, !dbg !137
  %84 = load i32* %j, align 4, !dbg !137
  %add91 = add nsw i32 %84, %83, !dbg !137
  store i32 %add91, i32* %j, align 4, !dbg !137
  br label %for.cond19, !dbg !137

for.end92:                                        ; preds = %for.cond19
  br label %if.end

if.end:                                           ; preds = %for.end92, %for.end18
  call void @llvm.dbg.declare(metadata !{i32* %p}, metadata !138), !dbg !140
  store i32 0, i32* %p, align 4, !dbg !141
  br label %for.cond93, !dbg !141

for.cond93:                                       ; preds = %for.inc105, %if.end
  %85 = load i32* %p, align 4, !dbg !141
  %86 = load i32* %n2, align 4, !dbg !141
  %cmp94 = icmp slt i32 %85, %86, !dbg !141
  br i1 %cmp94, label %for.body96, label %for.end107, !dbg !141

for.body96:                                       ; preds = %for.cond93
  %87 = load i32* %p, align 4, !dbg !142
  %mul97 = mul nsw i32 2, %87, !dbg !142
  %88 = load i16** %w.addr, align 4, !dbg !142
  %arrayidx98 = getelementptr inbounds i16* %88, i32 %mul97, !dbg !142
  %89 = load i16* %arrayidx98, align 2, !dbg !142
  %90 = load i32* %p, align 4, !dbg !142
  %91 = load i16** %w.addr, align 4, !dbg !142
  %arrayidx99 = getelementptr inbounds i16* %91, i32 %90, !dbg !142
  store i16 %89, i16* %arrayidx99, align 2, !dbg !142
  %92 = load i32* %p, align 4, !dbg !144
  %mul100 = mul nsw i32 2, %92, !dbg !144
  %add101 = add nsw i32 %mul100, 1, !dbg !144
  %93 = load i16** %w.addr, align 4, !dbg !144
  %arrayidx102 = getelementptr inbounds i16* %93, i32 %add101, !dbg !144
  %94 = load i16* %arrayidx102, align 2, !dbg !144
  %95 = load i32* %p, align 4, !dbg !144
  %add103 = add nsw i32 %95, 1, !dbg !144
  %96 = load i16** %w.addr, align 4, !dbg !144
  %arrayidx104 = getelementptr inbounds i16* %96, i32 %add103, !dbg !144
  store i16 %94, i16* %arrayidx104, align 2, !dbg !144
  br label %for.inc105, !dbg !145

for.inc105:                                       ; preds = %for.body96
  %97 = load i32* %p, align 4, !dbg !146
  %add106 = add nsw i32 %97, 2, !dbg !146
  store i32 %add106, i32* %p, align 4, !dbg !146
  br label %for.cond93, !dbg !146

for.end107:                                       ; preds = %for.cond93
  call void @llvm.dbg.declare(metadata !{i32* %j108}, metadata !147), !dbg !149
  store i32 0, i32* %j108, align 4, !dbg !150
  br label %for.cond109, !dbg !150

for.cond109:                                      ; preds = %for.inc117, %for.end107
  %98 = load i32* %j108, align 4, !dbg !150
  %cmp110 = icmp slt i32 %98, 512, !dbg !150
  br i1 %cmp110, label %for.body112, label %for.end118, !dbg !150

for.body112:                                      ; preds = %for.cond109
  %99 = load i32* %j108, align 4, !dbg !151
  %100 = load i16** %x.addr, align 4, !dbg !151
  %arrayidx113 = getelementptr inbounds i16* %100, i32 %99, !dbg !151
  %101 = load i16* %arrayidx113, align 2, !dbg !151
  %conv114 = sext i16 %101 to i32, !dbg !151
  %shr115 = ashr i32 %conv114, 1, !dbg !151
  %conv116 = trunc i32 %shr115 to i16, !dbg !151
  store i16 %conv116, i16* %arrayidx113, align 2, !dbg !151
  br label %for.inc117, !dbg !153

for.inc117:                                       ; preds = %for.body112
  %102 = load i32* %j108, align 4, !dbg !154
  %inc = add nsw i32 %102, 1, !dbg !154
  store i32 %inc, i32* %j108, align 4, !dbg !154
  br label %for.cond109, !dbg !154

for.end118:                                       ; preds = %for.cond109
  br label %for.inc119, !dbg !155

for.inc119:                                       ; preds = %for.end118
  %103 = load i32* %k, align 4, !dbg !156
  %shr120 = ashr i32 %103, 1, !dbg !156
  store i32 %shr120, i32* %k, align 4, !dbg !156
  br label %for.cond, !dbg !156

for.end121:                                       ; preds = %for.cond
  %104 = load i32* %nx.addr, align 4, !dbg !157
  %105 = load i16** %x.addr, align 4, !dbg !157
  call void @bit_reverse1(i32 %104, i16* %105), !dbg !157
  ret void, !dbg !158
}

declare signext i16 @vmac_butterfly(i16*, i16*, i16*) #2

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!14, !15}
!llvm.ident = !{!16}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.0 (tags/RELEASE_350/final)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [D:\eclipse\workspace\dss\Release/..\fft_16x16.c] [DW_LANG_C99]
!1 = metadata !{metadata !"..\5Cfft_16x16.c", metadata !"D:\5Ceclipse\5Cworkspace\5Cdss\5CRelease"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !11}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"bit_reverse1", metadata !"bit_reverse1", metadata !"", i32 11, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32, i16*)* @bit_reverse1, null, null, metadata !2, i32 14} ; [ DW_TAG_subprogram ] [line 11] [def] [scope 14] [bit_reverse1]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [D:\eclipse\workspace\dss\Release/..\fft_16x16.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{null, metadata !8, metadata !9}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 32, i64 32, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 32, align 32, offset 0] [from short]
!10 = metadata !{i32 786468, null, null, metadata !"short", i32 0, i64 16, i64 16, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [short] [line 0, size 16, align 16, offset 0, enc DW_ATE_signed]
!11 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"fft_16x16", metadata !"fft_16x16", metadata !"", i32 29, metadata !12, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i16*, i16*, i32)* @fft_16x16, null, null, metadata !2, i32 29} ; [ DW_TAG_subprogram ] [line 29] [def] [fft_16x16]
!12 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !13, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!13 = metadata !{null, metadata !9, metadata !9, metadata !8}
!14 = metadata !{i32 2, metadata !"Dwarf Version", i32 2}
!15 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!16 = metadata !{metadata !"clang version 3.5.0 (tags/RELEASE_350/final)"}
!17 = metadata !{i32 786689, metadata !4, metadata !"n", metadata !5, i32 16777227, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 11]
!18 = metadata !{i32 11, i32 23, metadata !4, null}
!19 = metadata !{i32 786689, metadata !4, metadata !"x", metadata !5, i32 33554443, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 11]
!20 = metadata !{i32 11, i32 33, metadata !4, null}
!21 = metadata !{i32 786688, metadata !4, metadata !"temp", metadata !5, i32 15, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [temp] [line 15]
!22 = metadata !{i32 15, i32 9, metadata !4, null}
!23 = metadata !{i32 786688, metadata !24, metadata !"i", metadata !5, i32 16, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 16]
!24 = metadata !{i32 786443, metadata !1, metadata !4, i32 16, i32 3, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\fft_16x16.c]
!25 = metadata !{i32 16, i32 12, metadata !24, null}
!26 = metadata !{i32 16, i32 8, metadata !24, null}
!27 = metadata !{i32 786688, metadata !24, metadata !"j", metadata !5, i32 16, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 16]
!28 = metadata !{i32 16, i32 19, metadata !24, null}
!29 = metadata !{i32 786688, metadata !30, metadata !"k", metadata !5, i32 17, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 17]
!30 = metadata !{i32 786443, metadata !1, metadata !31, i32 17, i32 5, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\fft_16x16.c]
!31 = metadata !{i32 786443, metadata !1, metadata !24, i32 16, i32 42, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\fft_16x16.c]
!32 = metadata !{i32 17, i32 14, metadata !30, null}
!33 = metadata !{i32 17, i32 10, metadata !30, null}
!34 = metadata !{i32 17, i32 39, metadata !30, null}
!35 = metadata !{i32 18, i32 9, metadata !36, null}
!36 = metadata !{i32 786443, metadata !1, metadata !31, i32 18, i32 9, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\fft_16x16.c]
!37 = metadata !{i32 19, i32 6, metadata !38, null}
!38 = metadata !{i32 786443, metadata !1, metadata !36, i32 18, i32 15, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\fft_16x16.c]
!39 = metadata !{i32 20, i32 6, metadata !38, null}
!40 = metadata !{i32 21, i32 6, metadata !38, null}
!41 = metadata !{i32 22, i32 6, metadata !38, null}
!42 = metadata !{i32 23, i32 6, metadata !38, null}
!43 = metadata !{i32 24, i32 6, metadata !38, null}
!44 = metadata !{i32 25, i32 5, metadata !38, null}
!45 = metadata !{i32 26, i32 3, metadata !31, null}
!46 = metadata !{i32 16, i32 37, metadata !24, null}
!47 = metadata !{i32 27, i32 1, metadata !4, null}
!48 = metadata !{i32 786689, metadata !11, metadata !"x", metadata !5, i32 16777245, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 29]
!49 = metadata !{i32 29, i32 23, metadata !11, null}
!50 = metadata !{i32 786689, metadata !11, metadata !"w", metadata !5, i32 33554461, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [w] [line 29]
!51 = metadata !{i32 29, i32 33, metadata !11, null}
!52 = metadata !{i32 786689, metadata !11, metadata !"nx", metadata !5, i32 50331677, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [nx] [line 29]
!53 = metadata !{i32 29, i32 40, metadata !11, null}
!54 = metadata !{i32 786688, metadata !11, metadata !"n1", metadata !5, i32 30, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n1] [line 30]
!55 = metadata !{i32 30, i32 6, metadata !11, null}
!56 = metadata !{i32 786688, metadata !11, metadata !"n2", metadata !5, i32 30, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n2] [line 30]
!57 = metadata !{i32 30, i32 9, metadata !11, null}
!58 = metadata !{i32 786688, metadata !11, metadata !"ie", metadata !5, i32 30, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ie] [line 30]
!59 = metadata !{i32 30, i32 12, metadata !11, null}
!60 = metadata !{i32 786688, metadata !11, metadata !"ia", metadata !5, i32 30, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ia] [line 30]
!61 = metadata !{i32 30, i32 15, metadata !11, null}
!62 = metadata !{i32 786688, metadata !11, metadata !"i", metadata !5, i32 30, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 30]
!63 = metadata !{i32 30, i32 18, metadata !11, null}
!64 = metadata !{i32 786688, metadata !11, metadata !"j", metadata !5, i32 30, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 30]
!65 = metadata !{i32 30, i32 20, metadata !11, null}
!66 = metadata !{i32 786688, metadata !11, metadata !"k", metadata !5, i32 30, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 30]
!67 = metadata !{i32 30, i32 22, metadata !11, null}
!68 = metadata !{i32 786688, metadata !11, metadata !"l", metadata !5, i32 30, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [l] [line 30]
!69 = metadata !{i32 30, i32 24, metadata !11, null}
!70 = metadata !{i32 786688, metadata !11, metadata !"m", metadata !5, i32 30, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [m] [line 30]
!71 = metadata !{i32 30, i32 26, metadata !11, null}
!72 = metadata !{i32 786688, metadata !11, metadata !"xt", metadata !5, i32 31, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [xt] [line 31]
!73 = metadata !{i32 31, i32 6, metadata !11, null}
!74 = metadata !{i32 786688, metadata !11, metadata !"yt", metadata !5, i32 31, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [yt] [line 31]
!75 = metadata !{i32 31, i32 9, metadata !11, null}
!76 = metadata !{i32 786688, metadata !11, metadata !"c", metadata !5, i32 31, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [c] [line 31]
!77 = metadata !{i32 31, i32 12, metadata !11, null}
!78 = metadata !{i32 786688, metadata !11, metadata !"s", metadata !5, i32 31, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [s] [line 31]
!79 = metadata !{i32 31, i32 14, metadata !11, null}
!80 = metadata !{i32 786688, metadata !11, metadata !"mid_a", metadata !5, i32 32, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mid_a] [line 32]
!81 = metadata !{i32 32, i32 6, metadata !11, null}
!82 = metadata !{i32 786688, metadata !11, metadata !"mid_b", metadata !5, i32 32, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mid_b] [line 32]
!83 = metadata !{i32 32, i32 12, metadata !11, null}
!84 = metadata !{i32 33, i32 2, metadata !11, null}
!85 = metadata !{i32 34, i32 2, metadata !11, null}
!86 = metadata !{i32 35, i32 7, metadata !87, null}
!87 = metadata !{i32 786443, metadata !1, metadata !11, i32 35, i32 2, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\fft_16x16.c]
!88 = metadata !{i32 36, i32 3, metadata !89, null}
!89 = metadata !{i32 786443, metadata !1, metadata !87, i32 35, i32 35, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\fft_16x16.c]
!90 = metadata !{i32 37, i32 3, metadata !89, null}
!91 = metadata !{i32 38, i32 6, metadata !92, null}
!92 = metadata !{i32 786443, metadata !1, metadata !89, i32 38, i32 6, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\fft_16x16.c]
!93 = metadata !{i32 39, i32 9, metadata !94, null}
!94 = metadata !{i32 786443, metadata !1, metadata !95, i32 39, i32 4, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\fft_16x16.c]
!95 = metadata !{i32 786443, metadata !1, metadata !92, i32 38, i32 13, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\fft_16x16.c]
!96 = metadata !{i32 40, i32 5, metadata !97, null}
!97 = metadata !{i32 786443, metadata !1, metadata !94, i32 39, i32 29, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\fft_16x16.c]
!98 = metadata !{i32 786688, metadata !97, metadata !"time", metadata !5, i32 41, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [time] [line 41]
!99 = metadata !{i32 41, i32 9, metadata !97, null}
!100 = metadata !{i32 42, i32 5, metadata !97, null}
!101 = metadata !{i32 43, i32 10, metadata !102, null}
!102 = metadata !{i32 786443, metadata !1, metadata !97, i32 43, i32 5, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\fft_16x16.c]
!103 = metadata !{i32 44, i32 6, metadata !104, null}
!104 = metadata !{i32 786443, metadata !1, metadata !102, i32 43, i32 33, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\fft_16x16.c]
!105 = metadata !{i32 45, i32 6, metadata !104, null}
!106 = metadata !{i32 46, i32 6, metadata !104, null}
!107 = metadata !{i32 47, i32 6, metadata !104, null}
!108 = metadata !{i32 48, i32 5, metadata !104, null}
!109 = metadata !{i32 43, i32 25, metadata !102, null}
!110 = metadata !{i32 49, i32 4, metadata !97, null}
!111 = metadata !{i32 39, i32 22, metadata !94, null}
!112 = metadata !{i32 50, i32 3, metadata !95, null}
!113 = metadata !{i32 52, i32 9, metadata !114, null}
!114 = metadata !{i32 786443, metadata !1, metadata !115, i32 52, i32 4, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\fft_16x16.c]
!115 = metadata !{i32 786443, metadata !1, metadata !92, i32 51, i32 7, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\fft_16x16.c]
!116 = metadata !{i32 53, i32 5, metadata !117, null}
!117 = metadata !{i32 786443, metadata !1, metadata !114, i32 52, i32 29, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\fft_16x16.c]
!118 = metadata !{i32 54, i32 10, metadata !119, null}
!119 = metadata !{i32 786443, metadata !1, metadata !117, i32 54, i32 5, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\fft_16x16.c]
!120 = metadata !{i32 55, i32 6, metadata !121, null}
!121 = metadata !{i32 786443, metadata !1, metadata !119, i32 54, i32 31, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\fft_16x16.c]
!122 = metadata !{i32 56, i32 6, metadata !121, null}
!123 = metadata !{i32 57, i32 6, metadata !121, null}
!124 = metadata !{i32 58, i32 6, metadata !121, null} ; [ DW_TAG_imported_module ]
!125 = metadata !{i32 59, i32 6, metadata !121, null}
!126 = metadata !{i32 60, i32 6, metadata !121, null}
!127 = metadata !{i32 61, i32 6, metadata !121, null}
!128 = metadata !{i32 62, i32 6, metadata !121, null}
!129 = metadata !{i32 63, i32 6, metadata !121, null}
!130 = metadata !{i32 64, i32 6, metadata !121, null}
!131 = metadata !{i32 65, i32 6, metadata !121, null}
!132 = metadata !{i32 66, i32 6, metadata !121, null}
!133 = metadata !{i32 67, i32 6, metadata !121, null}
!134 = metadata !{i32 68, i32 5, metadata !121, null}
!135 = metadata !{i32 54, i32 23, metadata !119, null}
!136 = metadata !{i32 69, i32 4, metadata !117, null}
!137 = metadata !{i32 52, i32 22, metadata !114, null}
!138 = metadata !{i32 786688, metadata !139, metadata !"p", metadata !5, i32 71, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [p] [line 71]
!139 = metadata !{i32 786443, metadata !1, metadata !89, i32 71, i32 4, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\fft_16x16.c]
!140 = metadata !{i32 71, i32 12, metadata !139, null}
!141 = metadata !{i32 71, i32 8, metadata !139, null}
!142 = metadata !{i32 72, i32 5, metadata !143, null}
!143 = metadata !{i32 786443, metadata !1, metadata !139, i32 71, i32 32, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\fft_16x16.c]
!144 = metadata !{i32 73, i32 5, metadata !143, null}
!145 = metadata !{i32 74, i32 4, metadata !143, null}
!146 = metadata !{i32 71, i32 27, metadata !139, null}
!147 = metadata !{i32 786688, metadata !148, metadata !"j", metadata !5, i32 75, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 75]
!148 = metadata !{i32 786443, metadata !1, metadata !89, i32 75, i32 4, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\fft_16x16.c]
!149 = metadata !{i32 75, i32 12, metadata !148, null}
!150 = metadata !{i32 75, i32 8, metadata !148, null}
!151 = metadata !{i32 76, i32 8, metadata !152, null}
!152 = metadata !{i32 786443, metadata !1, metadata !148, i32 75, i32 33, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\fft_16x16.c]
!153 = metadata !{i32 77, i32 7, metadata !152, null}
!154 = metadata !{i32 75, i32 28, metadata !148, null}
!155 = metadata !{i32 78, i32 2, metadata !89, null}
!156 = metadata !{i32 35, i32 21, metadata !87, null}
!157 = metadata !{i32 79, i32 2, metadata !11, null}
!158 = metadata !{i32 80, i32 1, metadata !11, null}
