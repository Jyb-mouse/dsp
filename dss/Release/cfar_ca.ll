; ModuleID = '..\cfar_ca.c'
target datalayout = "e-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
target triple = "dsp"

; Function Attrs: nounwind
define zeroext i16 @cfarCa(i16* %inp, i16* %out, i16 signext %len, i16 signext %const1, i16 signext %const2, i16 signext %guardLen, i16 signext %noiseLen) #0 {
entry:
  %inp.addr = alloca i16*, align 4
  %out.addr = alloca i16*, align 4
  %len.addr = alloca i16, align 2
  %const1.addr = alloca i16, align 2
  %const2.addr = alloca i16, align 2
  %guardLen.addr = alloca i16, align 2
  %noiseLen.addr = alloca i16, align 2
  %idx = alloca i32, align 4
  %idxLeftNext = alloca i32, align 4
  %idxLeftPrev = alloca i32, align 4
  %idxRightNext = alloca i32, align 4
  %idxRightPrev = alloca i32, align 4
  %idxCUT = alloca i32, align 4
  %sum = alloca i32, align 4
  %sumLeft = alloca i32, align 4
  %sumRight = alloca i32, align 4
  %outIdx = alloca i16, align 2
  store i16* %inp, i16** %inp.addr, align 4
  call void @llvm.dbg.declare(metadata !{i16** %inp.addr}, metadata !20), !dbg !21
  store i16* %out, i16** %out.addr, align 4
  call void @llvm.dbg.declare(metadata !{i16** %out.addr}, metadata !22), !dbg !23
  store i16 %len, i16* %len.addr, align 2
  call void @llvm.dbg.declare(metadata !{i16* %len.addr}, metadata !24), !dbg !25
  store i16 %const1, i16* %const1.addr, align 2
  call void @llvm.dbg.declare(metadata !{i16* %const1.addr}, metadata !26), !dbg !27
  store i16 %const2, i16* %const2.addr, align 2
  call void @llvm.dbg.declare(metadata !{i16* %const2.addr}, metadata !28), !dbg !29
  store i16 %guardLen, i16* %guardLen.addr, align 2
  call void @llvm.dbg.declare(metadata !{i16* %guardLen.addr}, metadata !30), !dbg !31
  store i16 %noiseLen, i16* %noiseLen.addr, align 2
  call void @llvm.dbg.declare(metadata !{i16* %noiseLen.addr}, metadata !32), !dbg !33
  call void @llvm.dbg.declare(metadata !{i32* %idx}, metadata !34), !dbg !38
  call void @llvm.dbg.declare(metadata !{i32* %idxLeftNext}, metadata !39), !dbg !40
  call void @llvm.dbg.declare(metadata !{i32* %idxLeftPrev}, metadata !41), !dbg !42
  call void @llvm.dbg.declare(metadata !{i32* %idxRightNext}, metadata !43), !dbg !44
  call void @llvm.dbg.declare(metadata !{i32* %idxRightPrev}, metadata !45), !dbg !46
  call void @llvm.dbg.declare(metadata !{i32* %idxCUT}, metadata !47), !dbg !48
  call void @llvm.dbg.declare(metadata !{i32* %sum}, metadata !49), !dbg !50
  call void @llvm.dbg.declare(metadata !{i32* %sumLeft}, metadata !51), !dbg !52
  call void @llvm.dbg.declare(metadata !{i32* %sumRight}, metadata !53), !dbg !54
  call void @llvm.dbg.declare(metadata !{i16* %outIdx}, metadata !55), !dbg !56
  store i16 0, i16* %outIdx, align 2, !dbg !57
  store i32 0, i32* %sumLeft, align 4, !dbg !58
  store i32 0, i32* %sumRight, align 4, !dbg !59
  store i32 0, i32* %idx, align 4, !dbg !60
  br label %for.cond, !dbg !60

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %idx, align 4, !dbg !60
  %1 = load i16* %noiseLen.addr, align 2, !dbg !60
  %conv = sext i16 %1 to i32, !dbg !60
  %cmp = icmp ult i32 %0, %conv, !dbg !60
  br i1 %cmp, label %for.body, label %for.end, !dbg !60

for.body:                                         ; preds = %for.cond
  %2 = load i32* %idx, align 4, !dbg !62
  %3 = load i16* %guardLen.addr, align 2, !dbg !62
  %conv2 = sext i16 %3 to i32, !dbg !62
  %add = add i32 %2, %conv2, !dbg !62
  %add3 = add i32 %add, 1, !dbg !62
  %4 = load i16** %inp.addr, align 4, !dbg !62
  %arrayidx = getelementptr inbounds i16* %4, i32 %add3, !dbg !62
  %5 = load i16* %arrayidx, align 2, !dbg !62
  %conv4 = zext i16 %5 to i32, !dbg !62
  %6 = load i32* %sumRight, align 4, !dbg !62
  %add5 = add i32 %6, %conv4, !dbg !62
  store i32 %add5, i32* %sumRight, align 4, !dbg !62
  br label %for.inc, !dbg !64

for.inc:                                          ; preds = %for.body
  %7 = load i32* %idx, align 4, !dbg !65
  %inc = add i32 %7, 1, !dbg !65
  store i32 %inc, i32* %idx, align 4, !dbg !65
  br label %for.cond, !dbg !65

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %idxCUT, align 4, !dbg !66
  %8 = load i32* %idxCUT, align 4, !dbg !67
  %9 = load i16** %inp.addr, align 4, !dbg !67
  %arrayidx6 = getelementptr inbounds i16* %9, i32 %8, !dbg !67
  %10 = load i16* %arrayidx6, align 2, !dbg !67
  %conv7 = zext i16 %10 to i32, !dbg !67
  %11 = load i32* %sumRight, align 4, !dbg !67
  %12 = load i16* %const2.addr, align 2, !dbg !67
  %conv8 = sext i16 %12 to i32, !dbg !67
  %sub = sub i32 %conv8, 1, !dbg !67
  %shr = lshr i32 %11, %sub, !dbg !67
  %13 = load i16* %const1.addr, align 2, !dbg !67
  %conv9 = sext i16 %13 to i32, !dbg !67
  %add10 = add i32 %shr, %conv9, !dbg !67
  %cmp11 = icmp ugt i32 %conv7, %add10, !dbg !67
  br i1 %cmp11, label %if.then, label %if.end, !dbg !67

if.then:                                          ; preds = %for.end
  %14 = load i32* %idxCUT, align 4, !dbg !69
  %conv13 = trunc i32 %14 to i16, !dbg !69
  %15 = load i16* %outIdx, align 2, !dbg !69
  %idxprom = sext i16 %15 to i32, !dbg !69
  %16 = load i16** %out.addr, align 4, !dbg !69
  %arrayidx14 = getelementptr inbounds i16* %16, i32 %idxprom, !dbg !69
  store i16 %conv13, i16* %arrayidx14, align 2, !dbg !69
  %17 = load i16* %outIdx, align 2, !dbg !71
  %inc15 = add i16 %17, 1, !dbg !71
  store i16 %inc15, i16* %outIdx, align 2, !dbg !71
  br label %if.end, !dbg !72

if.end:                                           ; preds = %if.then, %for.end
  %18 = load i32* %idxCUT, align 4, !dbg !73
  %inc16 = add i32 %18, 1, !dbg !73
  store i32 %inc16, i32* %idxCUT, align 4, !dbg !73
  store i32 0, i32* %idxLeftNext, align 4, !dbg !74
  %19 = load i32* %idxCUT, align 4, !dbg !75
  %20 = load i16* %guardLen.addr, align 2, !dbg !75
  %conv17 = sext i16 %20 to i32, !dbg !75
  %add18 = add i32 %19, %conv17, !dbg !75
  store i32 %add18, i32* %idxRightPrev, align 4, !dbg !75
  %21 = load i32* %idxRightPrev, align 4, !dbg !76
  %22 = load i16* %noiseLen.addr, align 2, !dbg !76
  %conv19 = sext i16 %22 to i32, !dbg !76
  %add20 = add i32 %21, %conv19, !dbg !76
  store i32 %add20, i32* %idxRightNext, align 4, !dbg !76
  store i32 0, i32* %idx, align 4, !dbg !77
  br label %for.cond21, !dbg !77

for.cond21:                                       ; preds = %for.inc62, %if.end
  %23 = load i32* %idx, align 4, !dbg !77
  %24 = load i16* %noiseLen.addr, align 2, !dbg !77
  %conv22 = sext i16 %24 to i32, !dbg !77
  %25 = load i16* %guardLen.addr, align 2, !dbg !77
  %conv23 = sext i16 %25 to i32, !dbg !77
  %add24 = add nsw i32 %conv22, %conv23, !dbg !77
  %sub25 = sub i32 %add24, 1, !dbg !77
  %cmp26 = icmp ult i32 %23, %sub25, !dbg !77
  br i1 %cmp26, label %for.body28, label %for.end64, !dbg !77

for.body28:                                       ; preds = %for.cond21
  %26 = load i32* %sumRight, align 4, !dbg !79
  %27 = load i32* %idxRightNext, align 4, !dbg !79
  %28 = load i16** %inp.addr, align 4, !dbg !79
  %arrayidx29 = getelementptr inbounds i16* %28, i32 %27, !dbg !79
  %29 = load i16* %arrayidx29, align 2, !dbg !79
  %conv30 = zext i16 %29 to i32, !dbg !79
  %add31 = add i32 %26, %conv30, !dbg !79
  %30 = load i32* %idxRightPrev, align 4, !dbg !79
  %31 = load i16** %inp.addr, align 4, !dbg !79
  %arrayidx32 = getelementptr inbounds i16* %31, i32 %30, !dbg !79
  %32 = load i16* %arrayidx32, align 2, !dbg !79
  %conv33 = zext i16 %32 to i32, !dbg !79
  %sub34 = sub i32 %add31, %conv33, !dbg !79
  store i32 %sub34, i32* %sumRight, align 4, !dbg !79
  %33 = load i32* %idxRightNext, align 4, !dbg !81
  %inc35 = add i32 %33, 1, !dbg !81
  store i32 %inc35, i32* %idxRightNext, align 4, !dbg !81
  %34 = load i32* %idxRightPrev, align 4, !dbg !82
  %inc36 = add i32 %34, 1, !dbg !82
  store i32 %inc36, i32* %idxRightPrev, align 4, !dbg !82
  %35 = load i32* %idx, align 4, !dbg !83
  %36 = load i16* %noiseLen.addr, align 2, !dbg !83
  %conv37 = sext i16 %36 to i32, !dbg !83
  %cmp38 = icmp ult i32 %35, %conv37, !dbg !83
  br i1 %cmp38, label %if.then40, label %if.end45, !dbg !83

if.then40:                                        ; preds = %for.body28
  %37 = load i32* %idxLeftNext, align 4, !dbg !85
  %38 = load i16** %inp.addr, align 4, !dbg !85
  %arrayidx41 = getelementptr inbounds i16* %38, i32 %37, !dbg !85
  %39 = load i16* %arrayidx41, align 2, !dbg !85
  %conv42 = zext i16 %39 to i32, !dbg !85
  %40 = load i32* %sumLeft, align 4, !dbg !85
  %add43 = add i32 %40, %conv42, !dbg !85
  store i32 %add43, i32* %sumLeft, align 4, !dbg !85
  %41 = load i32* %idxLeftNext, align 4, !dbg !87
  %inc44 = add i32 %41, 1, !dbg !87
  store i32 %inc44, i32* %idxLeftNext, align 4, !dbg !87
  br label %if.end45, !dbg !88

if.end45:                                         ; preds = %if.then40, %for.body28
  %42 = load i32* %idxCUT, align 4, !dbg !89
  %43 = load i16** %inp.addr, align 4, !dbg !89
  %arrayidx46 = getelementptr inbounds i16* %43, i32 %42, !dbg !89
  %44 = load i16* %arrayidx46, align 2, !dbg !89
  %conv47 = zext i16 %44 to i32, !dbg !89
  %45 = load i32* %sumRight, align 4, !dbg !89
  %46 = load i16* %const2.addr, align 2, !dbg !89
  %conv48 = sext i16 %46 to i32, !dbg !89
  %sub49 = sub i32 %conv48, 1, !dbg !89
  %shr50 = lshr i32 %45, %sub49, !dbg !89
  %47 = load i16* %const1.addr, align 2, !dbg !89
  %conv51 = sext i16 %47 to i32, !dbg !89
  %add52 = add i32 %shr50, %conv51, !dbg !89
  %cmp53 = icmp ugt i32 %conv47, %add52, !dbg !89
  br i1 %cmp53, label %if.then55, label %if.end60, !dbg !89

if.then55:                                        ; preds = %if.end45
  %48 = load i32* %idxCUT, align 4, !dbg !91
  %conv56 = trunc i32 %48 to i16, !dbg !91
  %49 = load i16* %outIdx, align 2, !dbg !91
  %idxprom57 = sext i16 %49 to i32, !dbg !91
  %50 = load i16** %out.addr, align 4, !dbg !91
  %arrayidx58 = getelementptr inbounds i16* %50, i32 %idxprom57, !dbg !91
  store i16 %conv56, i16* %arrayidx58, align 2, !dbg !91
  %51 = load i16* %outIdx, align 2, !dbg !93
  %inc59 = add i16 %51, 1, !dbg !93
  store i16 %inc59, i16* %outIdx, align 2, !dbg !93
  br label %if.end60, !dbg !94

if.end60:                                         ; preds = %if.then55, %if.end45
  %52 = load i32* %idxCUT, align 4, !dbg !95
  %inc61 = add i32 %52, 1, !dbg !95
  store i32 %inc61, i32* %idxCUT, align 4, !dbg !95
  br label %for.inc62, !dbg !96

for.inc62:                                        ; preds = %if.end60
  %53 = load i32* %idx, align 4, !dbg !97
  %inc63 = add i32 %53, 1, !dbg !97
  store i32 %inc63, i32* %idx, align 4, !dbg !97
  br label %for.cond21, !dbg !97

for.end64:                                        ; preds = %for.cond21
  %54 = load i32* %sumRight, align 4, !dbg !98
  %55 = load i32* %idxRightNext, align 4, !dbg !98
  %56 = load i16** %inp.addr, align 4, !dbg !98
  %arrayidx65 = getelementptr inbounds i16* %56, i32 %55, !dbg !98
  %57 = load i16* %arrayidx65, align 2, !dbg !98
  %conv66 = zext i16 %57 to i32, !dbg !98
  %add67 = add i32 %54, %conv66, !dbg !98
  %58 = load i32* %idxRightPrev, align 4, !dbg !98
  %59 = load i16** %inp.addr, align 4, !dbg !98
  %arrayidx68 = getelementptr inbounds i16* %59, i32 %58, !dbg !98
  %60 = load i16* %arrayidx68, align 2, !dbg !98
  %conv69 = zext i16 %60 to i32, !dbg !98
  %sub70 = sub i32 %add67, %conv69, !dbg !98
  store i32 %sub70, i32* %sumRight, align 4, !dbg !98
  %61 = load i32* %idxRightNext, align 4, !dbg !99
  %inc71 = add i32 %61, 1, !dbg !99
  store i32 %inc71, i32* %idxRightNext, align 4, !dbg !99
  %62 = load i32* %idxRightPrev, align 4, !dbg !100
  %inc72 = add i32 %62, 1, !dbg !100
  store i32 %inc72, i32* %idxRightPrev, align 4, !dbg !100
  %63 = load i32* %sumRight, align 4, !dbg !101
  %64 = load i32* %sumLeft, align 4, !dbg !101
  %add73 = add i32 %63, %64, !dbg !101
  store i32 %add73, i32* %sum, align 4, !dbg !101
  %65 = load i32* %idxCUT, align 4, !dbg !102
  %66 = load i16** %inp.addr, align 4, !dbg !102
  %arrayidx74 = getelementptr inbounds i16* %66, i32 %65, !dbg !102
  %67 = load i16* %arrayidx74, align 2, !dbg !102
  %conv75 = zext i16 %67 to i32, !dbg !102
  %68 = load i32* %sum, align 4, !dbg !102
  %69 = load i16* %const2.addr, align 2, !dbg !102
  %conv76 = sext i16 %69 to i32, !dbg !102
  %shr77 = lshr i32 %68, %conv76, !dbg !102
  %70 = load i16* %const1.addr, align 2, !dbg !102
  %conv78 = sext i16 %70 to i32, !dbg !102
  %add79 = add i32 %shr77, %conv78, !dbg !102
  %cmp80 = icmp ugt i32 %conv75, %add79, !dbg !102
  br i1 %cmp80, label %if.then82, label %if.end87, !dbg !102

if.then82:                                        ; preds = %for.end64
  %71 = load i32* %idxCUT, align 4, !dbg !104
  %conv83 = trunc i32 %71 to i16, !dbg !104
  %72 = load i16* %outIdx, align 2, !dbg !104
  %idxprom84 = sext i16 %72 to i32, !dbg !104
  %73 = load i16** %out.addr, align 4, !dbg !104
  %arrayidx85 = getelementptr inbounds i16* %73, i32 %idxprom84, !dbg !104
  store i16 %conv83, i16* %arrayidx85, align 2, !dbg !104
  %74 = load i16* %outIdx, align 2, !dbg !106
  %inc86 = add i16 %74, 1, !dbg !106
  store i16 %inc86, i16* %outIdx, align 2, !dbg !106
  br label %if.end87, !dbg !107

if.end87:                                         ; preds = %if.then82, %for.end64
  %75 = load i32* %idxCUT, align 4, !dbg !108
  %inc88 = add i32 %75, 1, !dbg !108
  store i32 %inc88, i32* %idxCUT, align 4, !dbg !108
  store i32 0, i32* %idxLeftPrev, align 4, !dbg !109
  store i32 0, i32* %idx, align 4, !dbg !110
  br label %for.cond89, !dbg !110

for.cond89:                                       ; preds = %for.inc131, %if.end87
  %76 = load i32* %idx, align 4, !dbg !110
  %77 = load i16* %len.addr, align 2, !dbg !110
  %conv90 = sext i16 %77 to i32, !dbg !110
  %78 = load i16* %noiseLen.addr, align 2, !dbg !110
  %conv91 = sext i16 %78 to i32, !dbg !110
  %79 = load i16* %guardLen.addr, align 2, !dbg !110
  %conv92 = sext i16 %79 to i32, !dbg !110
  %add93 = add nsw i32 %conv91, %conv92, !dbg !110
  %mul = mul i32 2, %add93, !dbg !110
  %sub94 = sub i32 %conv90, %mul, !dbg !110
  %sub95 = sub i32 %sub94, 1, !dbg !110
  %cmp96 = icmp ult i32 %76, %sub95, !dbg !110
  br i1 %cmp96, label %for.body98, label %for.end133, !dbg !110

for.body98:                                       ; preds = %for.cond89
  %80 = load i32* %sumLeft, align 4, !dbg !112
  %81 = load i32* %idxLeftNext, align 4, !dbg !112
  %82 = load i16** %inp.addr, align 4, !dbg !112
  %arrayidx99 = getelementptr inbounds i16* %82, i32 %81, !dbg !112
  %83 = load i16* %arrayidx99, align 2, !dbg !112
  %conv100 = zext i16 %83 to i32, !dbg !112
  %add101 = add i32 %80, %conv100, !dbg !112
  %84 = load i32* %idxLeftPrev, align 4, !dbg !112
  %85 = load i16** %inp.addr, align 4, !dbg !112
  %arrayidx102 = getelementptr inbounds i16* %85, i32 %84, !dbg !112
  %86 = load i16* %arrayidx102, align 2, !dbg !112
  %conv103 = zext i16 %86 to i32, !dbg !112
  %sub104 = sub i32 %add101, %conv103, !dbg !112
  store i32 %sub104, i32* %sumLeft, align 4, !dbg !112
  %87 = load i32* %sumRight, align 4, !dbg !114
  %88 = load i32* %idxRightNext, align 4, !dbg !114
  %89 = load i16** %inp.addr, align 4, !dbg !114
  %arrayidx105 = getelementptr inbounds i16* %89, i32 %88, !dbg !114
  %90 = load i16* %arrayidx105, align 2, !dbg !114
  %conv106 = zext i16 %90 to i32, !dbg !114
  %add107 = add i32 %87, %conv106, !dbg !114
  %91 = load i32* %idxRightPrev, align 4, !dbg !114
  %92 = load i16** %inp.addr, align 4, !dbg !114
  %arrayidx108 = getelementptr inbounds i16* %92, i32 %91, !dbg !114
  %93 = load i16* %arrayidx108, align 2, !dbg !114
  %conv109 = zext i16 %93 to i32, !dbg !114
  %sub110 = sub i32 %add107, %conv109, !dbg !114
  store i32 %sub110, i32* %sumRight, align 4, !dbg !114
  %94 = load i32* %idxLeftNext, align 4, !dbg !115
  %inc111 = add i32 %94, 1, !dbg !115
  store i32 %inc111, i32* %idxLeftNext, align 4, !dbg !115
  %95 = load i32* %idxLeftPrev, align 4, !dbg !116
  %inc112 = add i32 %95, 1, !dbg !116
  store i32 %inc112, i32* %idxLeftPrev, align 4, !dbg !116
  %96 = load i32* %idxRightNext, align 4, !dbg !117
  %inc113 = add i32 %96, 1, !dbg !117
  store i32 %inc113, i32* %idxRightNext, align 4, !dbg !117
  %97 = load i32* %idxRightPrev, align 4, !dbg !118
  %inc114 = add i32 %97, 1, !dbg !118
  store i32 %inc114, i32* %idxRightPrev, align 4, !dbg !118
  %98 = load i32* %sumLeft, align 4, !dbg !119
  %99 = load i32* %sumRight, align 4, !dbg !119
  %add115 = add i32 %98, %99, !dbg !119
  store i32 %add115, i32* %sum, align 4, !dbg !119
  %100 = load i32* %idxCUT, align 4, !dbg !120
  %101 = load i16** %inp.addr, align 4, !dbg !120
  %arrayidx116 = getelementptr inbounds i16* %101, i32 %100, !dbg !120
  %102 = load i16* %arrayidx116, align 2, !dbg !120
  %conv117 = zext i16 %102 to i32, !dbg !120
  %103 = load i32* %sum, align 4, !dbg !120
  %104 = load i16* %const2.addr, align 2, !dbg !120
  %conv118 = sext i16 %104 to i32, !dbg !120
  %shr119 = lshr i32 %103, %conv118, !dbg !120
  %105 = load i16* %const1.addr, align 2, !dbg !120
  %conv120 = sext i16 %105 to i32, !dbg !120
  %add121 = add i32 %shr119, %conv120, !dbg !120
  %cmp122 = icmp ugt i32 %conv117, %add121, !dbg !120
  br i1 %cmp122, label %if.then124, label %if.end129, !dbg !120

if.then124:                                       ; preds = %for.body98
  %106 = load i32* %idxCUT, align 4, !dbg !122
  %conv125 = trunc i32 %106 to i16, !dbg !122
  %107 = load i16* %outIdx, align 2, !dbg !122
  %idxprom126 = sext i16 %107 to i32, !dbg !122
  %108 = load i16** %out.addr, align 4, !dbg !122
  %arrayidx127 = getelementptr inbounds i16* %108, i32 %idxprom126, !dbg !122
  store i16 %conv125, i16* %arrayidx127, align 2, !dbg !122
  %109 = load i16* %outIdx, align 2, !dbg !124
  %inc128 = add i16 %109, 1, !dbg !124
  store i16 %inc128, i16* %outIdx, align 2, !dbg !124
  br label %if.end129, !dbg !125

if.end129:                                        ; preds = %if.then124, %for.body98
  %110 = load i32* %idxCUT, align 4, !dbg !126
  %inc130 = add i32 %110, 1, !dbg !126
  store i32 %inc130, i32* %idxCUT, align 4, !dbg !126
  br label %for.inc131, !dbg !127

for.inc131:                                       ; preds = %if.end129
  %111 = load i32* %idx, align 4, !dbg !128
  %inc132 = add i32 %111, 1, !dbg !128
  store i32 %inc132, i32* %idx, align 4, !dbg !128
  br label %for.cond89, !dbg !128

for.end133:                                       ; preds = %for.cond89
  store i32 0, i32* %idx, align 4, !dbg !129
  br label %for.cond134, !dbg !129

for.cond134:                                      ; preds = %for.inc165, %for.end133
  %112 = load i32* %idx, align 4, !dbg !129
  %113 = load i16* %noiseLen.addr, align 2, !dbg !129
  %conv135 = sext i16 %113 to i32, !dbg !129
  %114 = load i16* %guardLen.addr, align 2, !dbg !129
  %conv136 = sext i16 %114 to i32, !dbg !129
  %add137 = add nsw i32 %conv135, %conv136, !dbg !129
  %cmp138 = icmp ult i32 %112, %add137, !dbg !129
  br i1 %cmp138, label %for.body140, label %for.end167, !dbg !129

for.body140:                                      ; preds = %for.cond134
  %115 = load i32* %sumLeft, align 4, !dbg !131
  %116 = load i32* %idxLeftNext, align 4, !dbg !131
  %117 = load i16** %inp.addr, align 4, !dbg !131
  %arrayidx141 = getelementptr inbounds i16* %117, i32 %116, !dbg !131
  %118 = load i16* %arrayidx141, align 2, !dbg !131
  %conv142 = zext i16 %118 to i32, !dbg !131
  %add143 = add i32 %115, %conv142, !dbg !131
  %119 = load i32* %idxLeftPrev, align 4, !dbg !131
  %120 = load i16** %inp.addr, align 4, !dbg !131
  %arrayidx144 = getelementptr inbounds i16* %120, i32 %119, !dbg !131
  %121 = load i16* %arrayidx144, align 2, !dbg !131
  %conv145 = zext i16 %121 to i32, !dbg !131
  %sub146 = sub i32 %add143, %conv145, !dbg !131
  store i32 %sub146, i32* %sumLeft, align 4, !dbg !131
  %122 = load i32* %idxLeftNext, align 4, !dbg !133
  %inc147 = add i32 %122, 1, !dbg !133
  store i32 %inc147, i32* %idxLeftNext, align 4, !dbg !133
  %123 = load i32* %idxLeftPrev, align 4, !dbg !134
  %inc148 = add i32 %123, 1, !dbg !134
  store i32 %inc148, i32* %idxLeftPrev, align 4, !dbg !134
  %124 = load i32* %idxCUT, align 4, !dbg !135
  %125 = load i16** %inp.addr, align 4, !dbg !135
  %arrayidx149 = getelementptr inbounds i16* %125, i32 %124, !dbg !135
  %126 = load i16* %arrayidx149, align 2, !dbg !135
  %conv150 = zext i16 %126 to i32, !dbg !135
  %127 = load i32* %sumLeft, align 4, !dbg !135
  %128 = load i16* %const2.addr, align 2, !dbg !135
  %conv151 = sext i16 %128 to i32, !dbg !135
  %sub152 = sub i32 %conv151, 1, !dbg !135
  %shr153 = lshr i32 %127, %sub152, !dbg !135
  %129 = load i16* %const1.addr, align 2, !dbg !135
  %conv154 = sext i16 %129 to i32, !dbg !135
  %add155 = add i32 %shr153, %conv154, !dbg !135
  %cmp156 = icmp ugt i32 %conv150, %add155, !dbg !135
  br i1 %cmp156, label %if.then158, label %if.end163, !dbg !135

if.then158:                                       ; preds = %for.body140
  %130 = load i32* %idxCUT, align 4, !dbg !137
  %conv159 = trunc i32 %130 to i16, !dbg !137
  %131 = load i16* %outIdx, align 2, !dbg !137
  %idxprom160 = sext i16 %131 to i32, !dbg !137
  %132 = load i16** %out.addr, align 4, !dbg !137
  %arrayidx161 = getelementptr inbounds i16* %132, i32 %idxprom160, !dbg !137
  store i16 %conv159, i16* %arrayidx161, align 2, !dbg !137
  %133 = load i16* %outIdx, align 2, !dbg !139
  %inc162 = add i16 %133, 1, !dbg !139
  store i16 %inc162, i16* %outIdx, align 2, !dbg !139
  br label %if.end163, !dbg !140

if.end163:                                        ; preds = %if.then158, %for.body140
  %134 = load i32* %idxCUT, align 4, !dbg !141
  %inc164 = add i32 %134, 1, !dbg !141
  store i32 %inc164, i32* %idxCUT, align 4, !dbg !141
  br label %for.inc165, !dbg !142

for.inc165:                                       ; preds = %if.end163
  %135 = load i32* %idx, align 4, !dbg !143
  %inc166 = add i32 %135, 1, !dbg !143
  store i32 %inc166, i32* %idx, align 4, !dbg !143
  br label %for.cond134, !dbg !143

for.end167:                                       ; preds = %for.cond134
  %136 = load i16* %outIdx, align 2, !dbg !144
  ret i16 %136, !dbg !144
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!17, !18}
!llvm.ident = !{!19}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.0 (tags/RELEASE_350/final)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [D:\eclipse\workspace\dss\Release/..\cfar_ca.c] [DW_LANG_C99]
!1 = metadata !{metadata !"..\5Ccfar_ca.c", metadata !"D:\5Ceclipse\5Cworkspace\5Cdss\5CRelease"}
!2 = metadata !{}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"cfarCa", metadata !"cfarCa", metadata !"", i32 3, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i16 (i16*, i16*, i16, i16, i16, i16, i16)* @cfarCa, null, null, metadata !2, i32 7} ; [ DW_TAG_subprogram ] [line 3] [def] [scope 7] [cfarCa]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [D:\eclipse\workspace\dss\Release/..\cfar_ca.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !11, metadata !13, metadata !14, metadata !14, metadata !14, metadata !14, metadata !14}
!8 = metadata !{i32 786454, metadata !9, null, metadata !"uint16_t", i32 31, i64 0, i64 0, i64 0, i32 0, metadata !10} ; [ DW_TAG_typedef ] [uint16_t] [line 31, size 0, align 0, offset 0] [from unsigned short]
!9 = metadata !{metadata !"D:\5CCIC\5CSwift_IDE_Toolchain\5Ctoolchain_8slot\5Cinclude\5Ctypes/uint16_t.h", metadata !"D:\5Ceclipse\5Cworkspace\5Cdss\5CRelease"}
!10 = metadata !{i32 786468, null, null, metadata !"unsigned short", i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned short] [line 0, size 16, align 16, offset 0, enc DW_ATE_unsigned]
!11 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 32, i64 32, i64 0, i32 0, metadata !12} ; [ DW_TAG_pointer_type ] [line 0, size 32, align 32, offset 0] [from ]
!12 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !8} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from uint16_t]
!13 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 32, i64 32, i64 0, i32 0, metadata !8} ; [ DW_TAG_pointer_type ] [line 0, size 32, align 32, offset 0] [from uint16_t]
!14 = metadata !{i32 786454, metadata !15, null, metadata !"int16_t", i32 31, i64 0, i64 0, i64 0, i32 0, metadata !16} ; [ DW_TAG_typedef ] [int16_t] [line 31, size 0, align 0, offset 0] [from short]
!15 = metadata !{metadata !"D:\5CCIC\5CSwift_IDE_Toolchain\5Ctoolchain_8slot\5Cinclude\5Ctypes/int16_t.h", metadata !"D:\5Ceclipse\5Cworkspace\5Cdss\5CRelease"}
!16 = metadata !{i32 786468, null, null, metadata !"short", i32 0, i64 16, i64 16, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [short] [line 0, size 16, align 16, offset 0, enc DW_ATE_signed]
!17 = metadata !{i32 2, metadata !"Dwarf Version", i32 2}
!18 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!19 = metadata !{metadata !"clang version 3.5.0 (tags/RELEASE_350/final)"}
!20 = metadata !{i32 786689, metadata !4, metadata !"inp", metadata !5, i32 16777219, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [inp] [line 3]
!21 = metadata !{i32 3, i32 33, metadata !4, null}
!22 = metadata !{i32 786689, metadata !4, metadata !"out", metadata !5, i32 33554436, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [out] [line 4]
!23 = metadata !{i32 4, i32 39, metadata !4, null}
!24 = metadata !{i32 786689, metadata !4, metadata !"len", metadata !5, i32 50331652, metadata !14, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 4]
!25 = metadata !{i32 4, i32 52, metadata !4, null}
!26 = metadata !{i32 786689, metadata !4, metadata !"const1", metadata !5, i32 67108869, metadata !14, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [const1] [line 5]
!27 = metadata !{i32 5, i32 16, metadata !4, null}
!28 = metadata !{i32 786689, metadata !4, metadata !"const2", metadata !5, i32 83886085, metadata !14, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [const2] [line 5]
!29 = metadata !{i32 5, i32 32, metadata !4, null}
!30 = metadata !{i32 786689, metadata !4, metadata !"guardLen", metadata !5, i32 100663302, metadata !14, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [guardLen] [line 6]
!31 = metadata !{i32 6, i32 16, metadata !4, null}
!32 = metadata !{i32 786689, metadata !4, metadata !"noiseLen", metadata !5, i32 117440518, metadata !14, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [noiseLen] [line 6]
!33 = metadata !{i32 6, i32 34, metadata !4, null}
!34 = metadata !{i32 786688, metadata !4, metadata !"idx", metadata !5, i32 8, metadata !35, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [idx] [line 8]
!35 = metadata !{i32 786454, metadata !36, null, metadata !"uint32_t", i32 31, i64 0, i64 0, i64 0, i32 0, metadata !37} ; [ DW_TAG_typedef ] [uint32_t] [line 31, size 0, align 0, offset 0] [from unsigned int]
!36 = metadata !{metadata !"D:\5CCIC\5CSwift_IDE_Toolchain\5Ctoolchain_8slot\5Cinclude\5Ctypes/uint32_t.h", metadata !"D:\5Ceclipse\5Cworkspace\5Cdss\5CRelease"}
!37 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!38 = metadata !{i32 8, i32 11, metadata !4, null} ; [ DW_TAG_imported_declaration ]
!39 = metadata !{i32 786688, metadata !4, metadata !"idxLeftNext", metadata !5, i32 8, metadata !35, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [idxLeftNext] [line 8]
!40 = metadata !{i32 8, i32 16, metadata !4, null} ; [ DW_TAG_imported_declaration ]
!41 = metadata !{i32 786688, metadata !4, metadata !"idxLeftPrev", metadata !5, i32 8, metadata !35, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [idxLeftPrev] [line 8]
!42 = metadata !{i32 8, i32 29, metadata !4, null} ; [ DW_TAG_imported_declaration ]
!43 = metadata !{i32 786688, metadata !4, metadata !"idxRightNext", metadata !5, i32 8, metadata !35, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [idxRightNext] [line 8]
!44 = metadata !{i32 8, i32 42, metadata !4, null} ; [ DW_TAG_imported_declaration ]
!45 = metadata !{i32 786688, metadata !4, metadata !"idxRightPrev", metadata !5, i32 9, metadata !35, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [idxRightPrev] [line 9]
!46 = metadata !{i32 9, i32 14, metadata !4, null}
!47 = metadata !{i32 786688, metadata !4, metadata !"idxCUT", metadata !5, i32 9, metadata !35, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [idxCUT] [line 9]
!48 = metadata !{i32 9, i32 29, metadata !4, null}
!49 = metadata !{i32 786688, metadata !4, metadata !"sum", metadata !5, i32 10, metadata !35, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sum] [line 10]
!50 = metadata !{i32 10, i32 14, metadata !4, null}
!51 = metadata !{i32 786688, metadata !4, metadata !"sumLeft", metadata !5, i32 10, metadata !35, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sumLeft] [line 10]
!52 = metadata !{i32 10, i32 19, metadata !4, null}
!53 = metadata !{i32 786688, metadata !4, metadata !"sumRight", metadata !5, i32 10, metadata !35, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sumRight] [line 10]
!54 = metadata !{i32 10, i32 28, metadata !4, null}
!55 = metadata !{i32 786688, metadata !4, metadata !"outIdx", metadata !5, i32 11, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [outIdx] [line 11]
!56 = metadata !{i32 11, i32 15, metadata !4, null}
!57 = metadata !{i32 13, i32 5, metadata !4, null}
!58 = metadata !{i32 14, i32 5, metadata !4, null}
!59 = metadata !{i32 15, i32 5, metadata !4, null}
!60 = metadata !{i32 16, i32 10, metadata !61, null}
!61 = metadata !{i32 786443, metadata !1, metadata !4, i32 16, i32 5, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\cfar_ca.c]
!62 = metadata !{i32 18, i32 9, metadata !63, null}
!63 = metadata !{i32 786443, metadata !1, metadata !61, i32 17, i32 5, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\cfar_ca.c]
!64 = metadata !{i32 19, i32 5, metadata !63, null}
!65 = metadata !{i32 16, i32 35, metadata !61, null}
!66 = metadata !{i32 23, i32 5, metadata !4, null}
!67 = metadata !{i32 24, i32 9, metadata !68, null}
!68 = metadata !{i32 786443, metadata !1, metadata !4, i32 24, i32 9, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\cfar_ca.c]
!69 = metadata !{i32 26, i32 9, metadata !70, null}
!70 = metadata !{i32 786443, metadata !1, metadata !68, i32 25, i32 5, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\cfar_ca.c]
!71 = metadata !{i32 28, i32 9, metadata !70, null}
!72 = metadata !{i32 29, i32 5, metadata !70, null}
!73 = metadata !{i32 30, i32 5, metadata !4, null}
!74 = metadata !{i32 32, i32 5, metadata !4, null}
!75 = metadata !{i32 33, i32 5, metadata !4, null}
!76 = metadata !{i32 34, i32 5, metadata !4, null}
!77 = metadata !{i32 35, i32 10, metadata !78, null}
!78 = metadata !{i32 786443, metadata !1, metadata !4, i32 35, i32 5, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\cfar_ca.c]
!79 = metadata !{i32 37, i32 9, metadata !80, null}
!80 = metadata !{i32 786443, metadata !1, metadata !78, i32 36, i32 5, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\cfar_ca.c]
!81 = metadata !{i32 38, i32 9, metadata !80, null}
!82 = metadata !{i32 39, i32 9, metadata !80, null}
!83 = metadata !{i32 41, i32 13, metadata !84, null}
!84 = metadata !{i32 786443, metadata !1, metadata !80, i32 41, i32 13, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\cfar_ca.c]
!85 = metadata !{i32 43, i32 13, metadata !86, null}
!86 = metadata !{i32 786443, metadata !1, metadata !84, i32 42, i32 9, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\cfar_ca.c]
!87 = metadata !{i32 44, i32 13, metadata !86, null}
!88 = metadata !{i32 45, i32 9, metadata !86, null}
!89 = metadata !{i32 47, i32 13, metadata !90, null}
!90 = metadata !{i32 786443, metadata !1, metadata !80, i32 47, i32 13, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\cfar_ca.c]
!91 = metadata !{i32 49, i32 13, metadata !92, null}
!92 = metadata !{i32 786443, metadata !1, metadata !90, i32 48, i32 9, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\cfar_ca.c]
!93 = metadata !{i32 51, i32 13, metadata !92, null}
!94 = metadata !{i32 52, i32 9, metadata !92, null}
!95 = metadata !{i32 53, i32 9, metadata !80, null}
!96 = metadata !{i32 54, i32 5, metadata !80, null}
!97 = metadata !{i32 35, i32 53, metadata !78, null}
!98 = metadata !{i32 58, i32 5, metadata !4, null} ; [ DW_TAG_imported_module ]
!99 = metadata !{i32 59, i32 5, metadata !4, null}
!100 = metadata !{i32 60, i32 5, metadata !4, null}
!101 = metadata !{i32 64, i32 9, metadata !4, null}
!102 = metadata !{i32 65, i32 13, metadata !103, null}
!103 = metadata !{i32 786443, metadata !1, metadata !4, i32 65, i32 13, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\cfar_ca.c]
!104 = metadata !{i32 67, i32 13, metadata !105, null}
!105 = metadata !{i32 786443, metadata !1, metadata !103, i32 66, i32 9, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\cfar_ca.c]
!106 = metadata !{i32 69, i32 13, metadata !105, null}
!107 = metadata !{i32 70, i32 9, metadata !105, null}
!108 = metadata !{i32 71, i32 9, metadata !4, null}
!109 = metadata !{i32 73, i32 9, metadata !4, null}
!110 = metadata !{i32 74, i32 14, metadata !111, null}
!111 = metadata !{i32 786443, metadata !1, metadata !4, i32 74, i32 9, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\cfar_ca.c]
!112 = metadata !{i32 76, i32 13, metadata !113, null}
!113 = metadata !{i32 786443, metadata !1, metadata !111, i32 75, i32 9, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\cfar_ca.c]
!114 = metadata !{i32 77, i32 13, metadata !113, null}
!115 = metadata !{i32 78, i32 13, metadata !113, null}
!116 = metadata !{i32 79, i32 13, metadata !113, null}
!117 = metadata !{i32 80, i32 13, metadata !113, null}
!118 = metadata !{i32 81, i32 13, metadata !113, null}
!119 = metadata !{i32 82, i32 13, metadata !113, null}
!120 = metadata !{i32 84, i32 17, metadata !121, null}
!121 = metadata !{i32 786443, metadata !1, metadata !113, i32 84, i32 17, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\cfar_ca.c]
!122 = metadata !{i32 86, i32 17, metadata !123, null}
!123 = metadata !{i32 786443, metadata !1, metadata !121, i32 85, i32 13, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\cfar_ca.c]
!124 = metadata !{i32 88, i32 17, metadata !123, null}
!125 = metadata !{i32 89, i32 13, metadata !123, null}
!126 = metadata !{i32 90, i32 13, metadata !113, null}
!127 = metadata !{i32 91, i32 9, metadata !113, null}
!128 = metadata !{i32 74, i32 68, metadata !111, null}
!129 = metadata !{i32 95, i32 13, metadata !130, null}
!130 = metadata !{i32 786443, metadata !1, metadata !4, i32 95, i32 8, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\cfar_ca.c]
!131 = metadata !{i32 97, i32 12, metadata !132, null}
!132 = metadata !{i32 786443, metadata !1, metadata !130, i32 96, i32 8, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\cfar_ca.c]
!133 = metadata !{i32 98, i32 12, metadata !132, null}
!134 = metadata !{i32 99, i32 12, metadata !132, null}
!135 = metadata !{i32 100, i32 16, metadata !136, null}
!136 = metadata !{i32 786443, metadata !1, metadata !132, i32 100, i32 16, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\cfar_ca.c]
!137 = metadata !{i32 102, i32 16, metadata !138, null}
!138 = metadata !{i32 786443, metadata !1, metadata !136, i32 101, i32 12, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\cfar_ca.c]
!139 = metadata !{i32 104, i32 16, metadata !138, null}
!140 = metadata !{i32 105, i32 12, metadata !138, null}
!141 = metadata !{i32 106, i32 12, metadata !132, null}
!142 = metadata !{i32 107, i32 8, metadata !132, null}
!143 = metadata !{i32 95, i32 51, metadata !130, null}
!144 = metadata !{i32 110, i32 8, metadata !4, null}
