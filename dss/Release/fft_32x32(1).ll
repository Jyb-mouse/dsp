; ModuleID = '..\fft_32x32(1).c'
target datalayout = "e-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
target triple = "dsp"

%struct.cmplx32ImRe_t_ = type { i32, i32 }

@fft_32x32.f = private unnamed_addr constant [64 x i32] [i32 0, i32 32767, i32 -6392, i32 32137, i32 -12539, i32 30272, i32 -18204, i32 27244, i32 -23169, i32 23169, i32 -27244, i32 18204, i32 -30272, i32 12539, i32 -32137, i32 6392, i32 -32767, i32 0, i32 -32137, i32 -6392, i32 -30272, i32 -12539, i32 -27244, i32 -18204, i32 -23169, i32 -23169, i32 -18204, i32 -27244, i32 -12539, i32 -30272, i32 -6392, i32 -32137, i32 0, i32 -32766, i32 6392, i32 -32137, i32 12539, i32 -30272, i32 18204, i32 -27244, i32 23169, i32 -23169, i32 27244, i32 -18204, i32 30272, i32 -12539, i32 32137, i32 -6392, i32 32766, i32 0, i32 32137, i32 6392, i32 30272, i32 12539, i32 27244, i32 18204, i32 23169, i32 23169, i32 18204, i32 27244, i32 12539, i32 30272, i32 6392, i32 32137], align 4

; Function Attrs: nounwind
define void @bit_reverse(i32 %n, i32* %x) #0 {
entry:
  %n.addr = alloca i32, align 4
  %x.addr = alloca i32*, align 4
  %temp = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata !{i32* %n.addr}, metadata !31), !dbg !32
  store i32* %x, i32** %x.addr, align 4
  call void @llvm.dbg.declare(metadata !{i32** %x.addr}, metadata !33), !dbg !34
  call void @llvm.dbg.declare(metadata !{i32* %temp}, metadata !35), !dbg !36
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !37), !dbg !39
  store i32 0, i32* %i, align 4, !dbg !40
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !41), !dbg !42
  store i32 1, i32* %j, align 4, !dbg !40
  br label %for.cond, !dbg !40

for.cond:                                         ; preds = %for.inc23, %entry
  %0 = load i32* %j, align 4, !dbg !40
  %1 = load i32* %n.addr, align 4, !dbg !40
  %sub = sub nsw i32 %1, 1, !dbg !40
  %cmp = icmp slt i32 %0, %sub, !dbg !40
  br i1 %cmp, label %for.body, label %for.end24, !dbg !40

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata !{i32* %k}, metadata !43), !dbg !46
  %2 = load i32* %n.addr, align 4, !dbg !47
  %shr = ashr i32 %2, 1, !dbg !47
  store i32 %shr, i32* %k, align 4, !dbg !47
  br label %for.cond1, !dbg !47

for.cond1:                                        ; preds = %for.inc, %for.body
  %3 = load i32* %k, align 4, !dbg !47
  %4 = load i32* %k, align 4, !dbg !47
  %5 = load i32* %i, align 4, !dbg !47
  %xor = xor i32 %5, %4, !dbg !47
  store i32 %xor, i32* %i, align 4, !dbg !47
  %cmp2 = icmp sgt i32 %3, %xor, !dbg !47
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !47

for.body3:                                        ; preds = %for.cond1
  br label %for.inc, !dbg !47

for.inc:                                          ; preds = %for.body3
  %6 = load i32* %k, align 4, !dbg !48
  %shr4 = ashr i32 %6, 1, !dbg !48
  store i32 %shr4, i32* %k, align 4, !dbg !48
  br label %for.cond1, !dbg !48

for.end:                                          ; preds = %for.cond1
  %7 = load i32* %i, align 4, !dbg !49
  %8 = load i32* %j, align 4, !dbg !49
  %cmp5 = icmp slt i32 %7, %8, !dbg !49
  br i1 %cmp5, label %if.then, label %if.end, !dbg !49

if.then:                                          ; preds = %for.end
  %9 = load i32* %i, align 4, !dbg !51
  %mul = mul nsw i32 2, %9, !dbg !51
  %10 = load i32** %x.addr, align 4, !dbg !51
  %arrayidx = getelementptr inbounds i32* %10, i32 %mul, !dbg !51
  %11 = load i32* %arrayidx, align 4, !dbg !51
  store i32 %11, i32* %temp, align 4, !dbg !51
  %12 = load i32* %j, align 4, !dbg !53
  %mul6 = mul nsw i32 2, %12, !dbg !53
  %13 = load i32** %x.addr, align 4, !dbg !53
  %arrayidx7 = getelementptr inbounds i32* %13, i32 %mul6, !dbg !53
  %14 = load i32* %arrayidx7, align 4, !dbg !53
  %15 = load i32* %i, align 4, !dbg !53
  %mul8 = mul nsw i32 2, %15, !dbg !53
  %16 = load i32** %x.addr, align 4, !dbg !53
  %arrayidx9 = getelementptr inbounds i32* %16, i32 %mul8, !dbg !53
  store i32 %14, i32* %arrayidx9, align 4, !dbg !53
  %17 = load i32* %temp, align 4, !dbg !54
  %18 = load i32* %j, align 4, !dbg !54
  %mul10 = mul nsw i32 2, %18, !dbg !54
  %19 = load i32** %x.addr, align 4, !dbg !54
  %arrayidx11 = getelementptr inbounds i32* %19, i32 %mul10, !dbg !54
  store i32 %17, i32* %arrayidx11, align 4, !dbg !54
  %20 = load i32* %i, align 4, !dbg !55
  %mul12 = mul nsw i32 2, %20, !dbg !55
  %add = add nsw i32 %mul12, 1, !dbg !55
  %21 = load i32** %x.addr, align 4, !dbg !55
  %arrayidx13 = getelementptr inbounds i32* %21, i32 %add, !dbg !55
  %22 = load i32* %arrayidx13, align 4, !dbg !55
  store i32 %22, i32* %temp, align 4, !dbg !55
  %23 = load i32* %j, align 4, !dbg !56
  %mul14 = mul nsw i32 2, %23, !dbg !56
  %add15 = add nsw i32 %mul14, 1, !dbg !56
  %24 = load i32** %x.addr, align 4, !dbg !56
  %arrayidx16 = getelementptr inbounds i32* %24, i32 %add15, !dbg !56
  %25 = load i32* %arrayidx16, align 4, !dbg !56
  %26 = load i32* %i, align 4, !dbg !56
  %mul17 = mul nsw i32 2, %26, !dbg !56
  %add18 = add nsw i32 %mul17, 1, !dbg !56
  %27 = load i32** %x.addr, align 4, !dbg !56
  %arrayidx19 = getelementptr inbounds i32* %27, i32 %add18, !dbg !56
  store i32 %25, i32* %arrayidx19, align 4, !dbg !56
  %28 = load i32* %temp, align 4, !dbg !57
  %29 = load i32* %j, align 4, !dbg !57
  %mul20 = mul nsw i32 2, %29, !dbg !57
  %add21 = add nsw i32 %mul20, 1, !dbg !57
  %30 = load i32** %x.addr, align 4, !dbg !57
  %arrayidx22 = getelementptr inbounds i32* %30, i32 %add21, !dbg !57
  store i32 %28, i32* %arrayidx22, align 4, !dbg !57
  br label %if.end, !dbg !58

if.end:                                           ; preds = %if.then, %for.end
  br label %for.inc23, !dbg !59

for.inc23:                                        ; preds = %if.end
  %31 = load i32* %j, align 4, !dbg !60
  %inc = add nsw i32 %31, 1, !dbg !60
  store i32 %inc, i32* %j, align 4, !dbg !60
  br label %for.cond, !dbg !60

for.end24:                                        ; preds = %for.cond
  ret void, !dbg !61
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind
define void @fft_32x32a(i32* %x, i32* %w, i32 %nx) #0 {
entry:
  %x.addr = alloca i32*, align 4
  %w.addr = alloca i32*, align 4
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
  %p = alloca i32, align 4
  store i32* %x, i32** %x.addr, align 4
  call void @llvm.dbg.declare(metadata !{i32** %x.addr}, metadata !62), !dbg !63
  store i32* %w, i32** %w.addr, align 4
  call void @llvm.dbg.declare(metadata !{i32** %w.addr}, metadata !64), !dbg !65
  store i32 %nx, i32* %nx.addr, align 4
  call void @llvm.dbg.declare(metadata !{i32* %nx.addr}, metadata !66), !dbg !67
  call void @llvm.dbg.declare(metadata !{i32* %n1}, metadata !68), !dbg !69
  call void @llvm.dbg.declare(metadata !{i32* %n2}, metadata !70), !dbg !71
  call void @llvm.dbg.declare(metadata !{i32* %ie}, metadata !72), !dbg !73
  call void @llvm.dbg.declare(metadata !{i32* %ia}, metadata !74), !dbg !75
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !76), !dbg !77
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !78), !dbg !79
  call void @llvm.dbg.declare(metadata !{i32* %k}, metadata !80), !dbg !81
  call void @llvm.dbg.declare(metadata !{i32* %l}, metadata !82), !dbg !83
  call void @llvm.dbg.declare(metadata !{i32* %m}, metadata !84), !dbg !85
  call void @llvm.dbg.declare(metadata !{i32* %xt}, metadata !86), !dbg !87
  call void @llvm.dbg.declare(metadata !{i32* %yt}, metadata !88), !dbg !89
  call void @llvm.dbg.declare(metadata !{i32* %c}, metadata !90), !dbg !91
  call void @llvm.dbg.declare(metadata !{i32* %s}, metadata !92), !dbg !93
  %0 = load i32* %nx.addr, align 4, !dbg !94
  store i32 %0, i32* %n2, align 4, !dbg !94
  store i32 1, i32* %ie, align 4, !dbg !95
  %1 = load i32* %nx.addr, align 4, !dbg !96
  store i32 %1, i32* %k, align 4, !dbg !96
  br label %for.cond, !dbg !96

for.cond:                                         ; preds = %for.inc71, %entry
  %2 = load i32* %k, align 4, !dbg !96
  %cmp = icmp sgt i32 %2, 1, !dbg !96
  br i1 %cmp, label %for.body, label %for.end73, !dbg !96

for.body:                                         ; preds = %for.cond
  %3 = load i32* %n2, align 4, !dbg !98
  store i32 %3, i32* %n1, align 4, !dbg !98
  %4 = load i32* %n2, align 4, !dbg !100
  %shr = ashr i32 %4, 1, !dbg !100
  store i32 %shr, i32* %n2, align 4, !dbg !100
  store i32 0, i32* %j, align 4, !dbg !101
  br label %for.cond1, !dbg !101

for.cond1:                                        ; preds = %for.inc54, %for.body
  %5 = load i32* %j, align 4, !dbg !101
  %6 = load i32* %nx.addr, align 4, !dbg !101
  %cmp2 = icmp slt i32 %5, %6, !dbg !101
  br i1 %cmp2, label %for.body3, label %for.end56, !dbg !101

for.body3:                                        ; preds = %for.cond1
  store i32 0, i32* %ia, align 4, !dbg !103
  store i32 0, i32* %i, align 4, !dbg !105
  br label %for.cond4, !dbg !105

for.cond4:                                        ; preds = %for.inc, %for.body3
  %7 = load i32* %i, align 4, !dbg !105
  %8 = load i32* %n2, align 4, !dbg !105
  %cmp5 = icmp slt i32 %7, %8, !dbg !105
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !105

for.body6:                                        ; preds = %for.cond4
  %9 = load i32* %ia, align 4, !dbg !107
  %mul = mul nsw i32 2, %9, !dbg !107
  %10 = load i32** %w.addr, align 4, !dbg !107
  %arrayidx = getelementptr inbounds i32* %10, i32 %mul, !dbg !107
  %11 = load i32* %arrayidx, align 4, !dbg !107
  store i32 %11, i32* %c, align 4, !dbg !107
  %12 = load i32* %ia, align 4, !dbg !109
  %mul7 = mul nsw i32 2, %12, !dbg !109
  %add = add nsw i32 %mul7, 1, !dbg !109
  %13 = load i32** %w.addr, align 4, !dbg !109
  %arrayidx8 = getelementptr inbounds i32* %13, i32 %add, !dbg !109
  %14 = load i32* %arrayidx8, align 4, !dbg !109
  store i32 %14, i32* %s, align 4, !dbg !109
  %15 = load i32* %ia, align 4, !dbg !110
  %add9 = add nsw i32 %15, 1, !dbg !110
  store i32 %add9, i32* %ia, align 4, !dbg !110
  %16 = load i32* %i, align 4, !dbg !111
  %17 = load i32* %j, align 4, !dbg !111
  %add10 = add nsw i32 %16, %17, !dbg !111
  store i32 %add10, i32* %m, align 4, !dbg !111
  %18 = load i32* %m, align 4, !dbg !112
  %19 = load i32* %n2, align 4, !dbg !112
  %add11 = add nsw i32 %18, %19, !dbg !112
  store i32 %add11, i32* %l, align 4, !dbg !112
  %20 = load i32* %m, align 4, !dbg !113
  %mul12 = mul nsw i32 2, %20, !dbg !113
  %21 = load i32** %x.addr, align 4, !dbg !113
  %arrayidx13 = getelementptr inbounds i32* %21, i32 %mul12, !dbg !113
  %22 = load i32* %arrayidx13, align 4, !dbg !113
  %23 = load i32* %l, align 4, !dbg !113
  %mul14 = mul nsw i32 2, %23, !dbg !113
  %24 = load i32** %x.addr, align 4, !dbg !113
  %arrayidx15 = getelementptr inbounds i32* %24, i32 %mul14, !dbg !113
  %25 = load i32* %arrayidx15, align 4, !dbg !113
  %sub = sub nsw i32 %22, %25, !dbg !113
  store i32 %sub, i32* %xt, align 4, !dbg !113
  %26 = load i32* %m, align 4, !dbg !114
  %mul16 = mul nsw i32 2, %26, !dbg !114
  %27 = load i32** %x.addr, align 4, !dbg !114
  %arrayidx17 = getelementptr inbounds i32* %27, i32 %mul16, !dbg !114
  %28 = load i32* %arrayidx17, align 4, !dbg !114
  %29 = load i32* %l, align 4, !dbg !114
  %mul18 = mul nsw i32 2, %29, !dbg !114
  %30 = load i32** %x.addr, align 4, !dbg !114
  %arrayidx19 = getelementptr inbounds i32* %30, i32 %mul18, !dbg !114
  %31 = load i32* %arrayidx19, align 4, !dbg !114
  %add20 = add nsw i32 %28, %31, !dbg !114
  %32 = load i32* %m, align 4, !dbg !114
  %mul21 = mul nsw i32 2, %32, !dbg !114
  %33 = load i32** %x.addr, align 4, !dbg !114
  %arrayidx22 = getelementptr inbounds i32* %33, i32 %mul21, !dbg !114
  store i32 %add20, i32* %arrayidx22, align 4, !dbg !114
  %34 = load i32* %m, align 4, !dbg !115
  %mul23 = mul nsw i32 2, %34, !dbg !115
  %add24 = add nsw i32 %mul23, 1, !dbg !115
  %35 = load i32** %x.addr, align 4, !dbg !115
  %arrayidx25 = getelementptr inbounds i32* %35, i32 %add24, !dbg !115
  %36 = load i32* %arrayidx25, align 4, !dbg !115
  %37 = load i32* %l, align 4, !dbg !115
  %mul26 = mul nsw i32 2, %37, !dbg !115
  %add27 = add nsw i32 %mul26, 1, !dbg !115
  %38 = load i32** %x.addr, align 4, !dbg !115
  %arrayidx28 = getelementptr inbounds i32* %38, i32 %add27, !dbg !115
  %39 = load i32* %arrayidx28, align 4, !dbg !115
  %sub29 = sub nsw i32 %36, %39, !dbg !115
  store i32 %sub29, i32* %yt, align 4, !dbg !115
  %40 = load i32* %m, align 4, !dbg !116
  %mul30 = mul nsw i32 2, %40, !dbg !116
  %add31 = add nsw i32 %mul30, 1, !dbg !116
  %41 = load i32** %x.addr, align 4, !dbg !116
  %arrayidx32 = getelementptr inbounds i32* %41, i32 %add31, !dbg !116
  %42 = load i32* %arrayidx32, align 4, !dbg !116
  %43 = load i32* %l, align 4, !dbg !116
  %mul33 = mul nsw i32 2, %43, !dbg !116
  %add34 = add nsw i32 %mul33, 1, !dbg !116
  %44 = load i32** %x.addr, align 4, !dbg !116
  %arrayidx35 = getelementptr inbounds i32* %44, i32 %add34, !dbg !116
  %45 = load i32* %arrayidx35, align 4, !dbg !116
  %add36 = add nsw i32 %42, %45, !dbg !116
  %46 = load i32* %m, align 4, !dbg !116
  %mul37 = mul nsw i32 2, %46, !dbg !116
  %add38 = add nsw i32 %mul37, 1, !dbg !116
  %47 = load i32** %x.addr, align 4, !dbg !116
  %arrayidx39 = getelementptr inbounds i32* %47, i32 %add38, !dbg !116
  store i32 %add36, i32* %arrayidx39, align 4, !dbg !116
  %48 = load i32* %c, align 4, !dbg !117
  %49 = load i32* %yt, align 4, !dbg !117
  %mul40 = mul nsw i32 %48, %49, !dbg !117
  %50 = load i32* %s, align 4, !dbg !117
  %51 = load i32* %xt, align 4, !dbg !117
  %mul41 = mul nsw i32 %50, %51, !dbg !117
  %add42 = add nsw i32 %mul40, %mul41, !dbg !117
  %shr43 = ashr i32 %add42, 16, !dbg !117
  %52 = load i32* %l, align 4, !dbg !117
  %mul44 = mul nsw i32 2, %52, !dbg !117
  %53 = load i32** %x.addr, align 4, !dbg !117
  %arrayidx45 = getelementptr inbounds i32* %53, i32 %mul44, !dbg !117
  store i32 %shr43, i32* %arrayidx45, align 4, !dbg !117
  %54 = load i32* %s, align 4, !dbg !118
  %55 = load i32* %yt, align 4, !dbg !118
  %mul46 = mul nsw i32 %54, %55, !dbg !118
  %56 = load i32* %c, align 4, !dbg !118
  %57 = load i32* %xt, align 4, !dbg !118
  %mul47 = mul nsw i32 %56, %57, !dbg !118
  %sub48 = sub nsw i32 %mul46, %mul47, !dbg !118
  %shr49 = ashr i32 %sub48, 16, !dbg !118
  %58 = load i32* %l, align 4, !dbg !118
  %mul50 = mul nsw i32 2, %58, !dbg !118
  %add51 = add nsw i32 %mul50, 1, !dbg !118
  %59 = load i32** %x.addr, align 4, !dbg !118
  %arrayidx52 = getelementptr inbounds i32* %59, i32 %add51, !dbg !118
  store i32 %shr49, i32* %arrayidx52, align 4, !dbg !118
  br label %for.inc, !dbg !119

for.inc:                                          ; preds = %for.body6
  %60 = load i32* %i, align 4, !dbg !120
  %add53 = add nsw i32 %60, 1, !dbg !120
  store i32 %add53, i32* %i, align 4, !dbg !120
  br label %for.cond4, !dbg !120

for.end:                                          ; preds = %for.cond4
  br label %for.inc54, !dbg !121

for.inc54:                                        ; preds = %for.end
  %61 = load i32* %n1, align 4, !dbg !122
  %62 = load i32* %j, align 4, !dbg !122
  %add55 = add nsw i32 %62, %61, !dbg !122
  store i32 %add55, i32* %j, align 4, !dbg !122
  br label %for.cond1, !dbg !122

for.end56:                                        ; preds = %for.cond1
  call void @llvm.dbg.declare(metadata !{i32* %p}, metadata !123), !dbg !125
  store i32 0, i32* %p, align 4, !dbg !126
  br label %for.cond57, !dbg !126

for.cond57:                                       ; preds = %for.inc68, %for.end56
  %63 = load i32* %p, align 4, !dbg !126
  %64 = load i32* %n2, align 4, !dbg !126
  %cmp58 = icmp slt i32 %63, %64, !dbg !126
  br i1 %cmp58, label %for.body59, label %for.end70, !dbg !126

for.body59:                                       ; preds = %for.cond57
  %65 = load i32* %p, align 4, !dbg !127
  %mul60 = mul nsw i32 2, %65, !dbg !127
  %66 = load i32** %w.addr, align 4, !dbg !127
  %arrayidx61 = getelementptr inbounds i32* %66, i32 %mul60, !dbg !127
  %67 = load i32* %arrayidx61, align 4, !dbg !127
  %68 = load i32* %p, align 4, !dbg !127
  %69 = load i32** %w.addr, align 4, !dbg !127
  %arrayidx62 = getelementptr inbounds i32* %69, i32 %68, !dbg !127
  store i32 %67, i32* %arrayidx62, align 4, !dbg !127
  %70 = load i32* %p, align 4, !dbg !129
  %mul63 = mul nsw i32 2, %70, !dbg !129
  %add64 = add nsw i32 %mul63, 1, !dbg !129
  %71 = load i32** %w.addr, align 4, !dbg !129
  %arrayidx65 = getelementptr inbounds i32* %71, i32 %add64, !dbg !129
  %72 = load i32* %arrayidx65, align 4, !dbg !129
  %73 = load i32* %p, align 4, !dbg !129
  %add66 = add nsw i32 %73, 1, !dbg !129
  %74 = load i32** %w.addr, align 4, !dbg !129
  %arrayidx67 = getelementptr inbounds i32* %74, i32 %add66, !dbg !129
  store i32 %72, i32* %arrayidx67, align 4, !dbg !129
  br label %for.inc68, !dbg !130

for.inc68:                                        ; preds = %for.body59
  %75 = load i32* %p, align 4, !dbg !131
  %add69 = add nsw i32 %75, 2, !dbg !131
  store i32 %add69, i32* %p, align 4, !dbg !131
  br label %for.cond57, !dbg !131

for.end70:                                        ; preds = %for.cond57
  br label %for.inc71, !dbg !132

for.inc71:                                        ; preds = %for.end70
  %76 = load i32* %k, align 4, !dbg !133
  %shr72 = ashr i32 %76, 1, !dbg !133
  store i32 %shr72, i32* %k, align 4, !dbg !133
  br label %for.cond, !dbg !133

for.end73:                                        ; preds = %for.cond
  %77 = load i32* %nx.addr, align 4, !dbg !134
  %78 = load i32** %x.addr, align 4, !dbg !134
  call void @bit_reverse(i32 %77, i32* %78), !dbg !134
  ret void, !dbg !135
}

; Function Attrs: nounwind
define void @fft_32x32(%struct.cmplx32ImRe_t_* %fftSrcAddr, %struct.cmplx32ImRe_t_* %fftDstAddr, i32 %nfft) #0 {
entry:
  %fftSrcAddr.addr = alloca %struct.cmplx32ImRe_t_*, align 4
  %fftDstAddr.addr = alloca %struct.cmplx32ImRe_t_*, align 4
  %nfft.addr = alloca i32, align 4
  %data = alloca [64 x i32], align 4
  %ndata = alloca i16, align 2
  %f = alloca [64 x i32], align 4
  %j = alloca i32, align 4
  %j7 = alloca i32, align 4
  store %struct.cmplx32ImRe_t_* %fftSrcAddr, %struct.cmplx32ImRe_t_** %fftSrcAddr.addr, align 4
  call void @llvm.dbg.declare(metadata !{%struct.cmplx32ImRe_t_** %fftSrcAddr.addr}, metadata !136), !dbg !137
  store %struct.cmplx32ImRe_t_* %fftDstAddr, %struct.cmplx32ImRe_t_** %fftDstAddr.addr, align 4
  call void @llvm.dbg.declare(metadata !{%struct.cmplx32ImRe_t_** %fftDstAddr.addr}, metadata !138), !dbg !139
  store i32 %nfft, i32* %nfft.addr, align 4
  call void @llvm.dbg.declare(metadata !{i32* %nfft.addr}, metadata !140), !dbg !141
  call void @llvm.dbg.declare(metadata !{[64 x i32]* %data}, metadata !142), !dbg !146
  call void @llvm.dbg.declare(metadata !{i16* %ndata}, metadata !147), !dbg !149
  %0 = load i32* %nfft.addr, align 4, !dbg !150
  %conv = trunc i32 %0 to i16, !dbg !150
  store i16 %conv, i16* %ndata, align 2, !dbg !150
  call void @llvm.dbg.declare(metadata !{[64 x i32]* %f}, metadata !151), !dbg !152
  %1 = bitcast [64 x i32]* %f to i8*, !dbg !153
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %1, i8* bitcast ([64 x i32]* @fft_32x32.f to i8*), i32 256, i32 4, i1 false), !dbg !153
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !154), !dbg !156
  store i32 0, i32* %j, align 4, !dbg !157
  br label %for.cond, !dbg !157

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32* %j, align 4, !dbg !157
  %cmp = icmp slt i32 %2, 32, !dbg !157
  br i1 %cmp, label %for.body, label %for.end, !dbg !157

for.body:                                         ; preds = %for.cond
  %3 = load %struct.cmplx32ImRe_t_** %fftSrcAddr.addr, align 4, !dbg !158
  %4 = load i32* %j, align 4, !dbg !158
  %add.ptr = getelementptr inbounds %struct.cmplx32ImRe_t_* %3, i32 %4, !dbg !158
  %imag = getelementptr inbounds %struct.cmplx32ImRe_t_* %add.ptr, i32 0, i32 0, !dbg !158
  %5 = load i32* %imag, align 4, !dbg !158
  %6 = load i32* %j, align 4, !dbg !158
  %mul = mul nsw i32 2, %6, !dbg !158
  %arrayidx = getelementptr inbounds [64 x i32]* %data, i32 0, i32 %mul, !dbg !158
  store i32 %5, i32* %arrayidx, align 4, !dbg !158
  %7 = load %struct.cmplx32ImRe_t_** %fftSrcAddr.addr, align 4, !dbg !160
  %8 = load i32* %j, align 4, !dbg !160
  %add.ptr2 = getelementptr inbounds %struct.cmplx32ImRe_t_* %7, i32 %8, !dbg !160
  %real = getelementptr inbounds %struct.cmplx32ImRe_t_* %add.ptr2, i32 0, i32 1, !dbg !160
  %9 = load i32* %real, align 4, !dbg !160
  %10 = load i32* %j, align 4, !dbg !160
  %mul3 = mul nsw i32 2, %10, !dbg !160
  %add = add nsw i32 %mul3, 1, !dbg !160
  %arrayidx4 = getelementptr inbounds [64 x i32]* %data, i32 0, i32 %add, !dbg !160
  store i32 %9, i32* %arrayidx4, align 4, !dbg !160
  br label %for.inc, !dbg !161

for.inc:                                          ; preds = %for.body
  %11 = load i32* %j, align 4, !dbg !162
  %inc = add nsw i32 %11, 1, !dbg !162
  store i32 %inc, i32* %j, align 4, !dbg !162
  br label %for.cond, !dbg !162

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [64 x i32]* %data, i32 0, i32 0, !dbg !163
  %arraydecay5 = getelementptr inbounds [64 x i32]* %f, i32 0, i32 0, !dbg !163
  %12 = load i16* %ndata, align 2, !dbg !163
  %conv6 = sext i16 %12 to i32, !dbg !163
  call void @fft_32x32a(i32* %arraydecay, i32* %arraydecay5, i32 %conv6), !dbg !163
  call void @llvm.dbg.declare(metadata !{i32* %j7}, metadata !164), !dbg !166
  store i32 0, i32* %j7, align 4, !dbg !167
  br label %for.cond8, !dbg !167

for.cond8:                                        ; preds = %for.inc21, %for.end
  %13 = load i32* %j7, align 4, !dbg !167
  %cmp9 = icmp slt i32 %13, 32, !dbg !167
  br i1 %cmp9, label %for.body11, label %for.end23, !dbg !167

for.body11:                                       ; preds = %for.cond8
  %14 = load i32* %j7, align 4, !dbg !168
  %mul12 = mul nsw i32 2, %14, !dbg !168
  %arrayidx13 = getelementptr inbounds [64 x i32]* %data, i32 0, i32 %mul12, !dbg !168
  %15 = load i32* %arrayidx13, align 4, !dbg !168
  %16 = load %struct.cmplx32ImRe_t_** %fftDstAddr.addr, align 4, !dbg !168
  %17 = load i32* %j7, align 4, !dbg !168
  %add.ptr14 = getelementptr inbounds %struct.cmplx32ImRe_t_* %16, i32 %17, !dbg !168
  %imag15 = getelementptr inbounds %struct.cmplx32ImRe_t_* %add.ptr14, i32 0, i32 0, !dbg !168
  store i32 %15, i32* %imag15, align 4, !dbg !168
  %18 = load i32* %j7, align 4, !dbg !170
  %mul16 = mul nsw i32 2, %18, !dbg !170
  %add17 = add nsw i32 %mul16, 1, !dbg !170
  %arrayidx18 = getelementptr inbounds [64 x i32]* %data, i32 0, i32 %add17, !dbg !170
  %19 = load i32* %arrayidx18, align 4, !dbg !170
  %20 = load %struct.cmplx32ImRe_t_** %fftDstAddr.addr, align 4, !dbg !170
  %21 = load i32* %j7, align 4, !dbg !170
  %add.ptr19 = getelementptr inbounds %struct.cmplx32ImRe_t_* %20, i32 %21, !dbg !170
  %real20 = getelementptr inbounds %struct.cmplx32ImRe_t_* %add.ptr19, i32 0, i32 1, !dbg !170
  store i32 %19, i32* %real20, align 4, !dbg !170
  br label %for.inc21, !dbg !171

for.inc21:                                        ; preds = %for.body11
  %22 = load i32* %j7, align 4, !dbg !172
  %inc22 = add nsw i32 %22, 1, !dbg !172
  store i32 %inc22, i32* %j7, align 4, !dbg !172
  br label %for.cond8, !dbg !172

for.end23:                                        ; preds = %for.cond8
  ret void, !dbg !173
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture, i8* nocapture readonly, i32, i32, i1) #2

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!28, !29}
!llvm.ident = !{!30}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.0 (tags/RELEASE_350/final)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [D:\eclipse\workspace\dss\Release/..\fft_32x32(1).c] [DW_LANG_C99]
!1 = metadata !{metadata !"..\5Cfft_32x32(1).c", metadata !"D:\5Ceclipse\5Cworkspace\5Cdss\5CRelease"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !10, metadata !13}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"bit_reverse", metadata !"bit_reverse", metadata !"", i32 12, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32, i32*)* @bit_reverse, null, null, metadata !2, i32 15} ; [ DW_TAG_subprogram ] [line 12] [def] [scope 15] [bit_reverse]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [D:\eclipse\workspace\dss\Release/..\fft_32x32(1).c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{null, metadata !8, metadata !9}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 32, i64 32, i64 0, i32 0, metadata !8} ; [ DW_TAG_pointer_type ] [line 0, size 32, align 32, offset 0] [from int]
!10 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"fft_32x32a", metadata !"fft_32x32a", metadata !"", i32 29, metadata !11, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32*, i32*, i32)* @fft_32x32a, null, null, metadata !2, i32 29} ; [ DW_TAG_subprogram ] [line 29] [def] [fft_32x32a]
!11 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !12, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!12 = metadata !{null, metadata !9, metadata !9, metadata !8}
!13 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"fft_32x32", metadata !"fft_32x32", metadata !"", i32 78, metadata !14, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.cmplx32ImRe_t_*, %struct.cmplx32ImRe_t_*, i32)* @fft_32x32, null, null, metadata !2, i32 79} ; [ DW_TAG_subprogram ] [line 78] [def] [scope 79] [fft_32x32]
!14 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !15, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!15 = metadata !{null, metadata !16, metadata !26, metadata !27}
!16 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 32, i64 32, i64 0, i32 0, metadata !17} ; [ DW_TAG_pointer_type ] [line 0, size 32, align 32, offset 0] [from ]
!17 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !18} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from cmplx32ImRe_t]
!18 = metadata !{i32 786454, metadata !19, null, metadata !"cmplx32ImRe_t", i32 19, i64 0, i64 0, i64 0, i32 0, metadata !20} ; [ DW_TAG_typedef ] [cmplx32ImRe_t] [line 19, size 0, align 0, offset 0] [from cmplx32ImRe_t_]
!19 = metadata !{metadata !"../mmwave_lib.h", metadata !"D:\5Ceclipse\5Cworkspace\5Cdss\5CRelease"}
!20 = metadata !{i32 786451, metadata !19, null, metadata !"cmplx32ImRe_t_", i32 15, i64 64, i64 32, i32 0, i32 0, null, metadata !21, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [cmplx32ImRe_t_] [line 15, size 64, align 32, offset 0] [def] [from ]
!21 = metadata !{metadata !22, metadata !25}
!22 = metadata !{i32 786445, metadata !19, metadata !20, metadata !"imag", i32 17, i64 32, i64 32, i64 0, i32 0, metadata !23} ; [ DW_TAG_member ] [imag] [line 17, size 32, align 32, offset 0] [from int32_t]
!23 = metadata !{i32 786454, metadata !24, null, metadata !"int32_t", i32 31, i64 0, i64 0, i64 0, i32 0, metadata !8} ; [ DW_TAG_typedef ] [int32_t] [line 31, size 0, align 0, offset 0] [from int]
!24 = metadata !{metadata !"D:\5CCIC\5CSwift_IDE_Toolchain\5Ctoolchain_8slot\5Cinclude\5Ctypes/int32_t.h", metadata !"D:\5Ceclipse\5Cworkspace\5Cdss\5CRelease"}
!25 = metadata !{i32 786445, metadata !19, metadata !20, metadata !"real", i32 18, i64 32, i64 32, i64 32, i32 0, metadata !23} ; [ DW_TAG_member ] [real] [line 18, size 32, align 32, offset 32] [from int32_t]
!26 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 32, i64 32, i64 0, i32 0, metadata !18} ; [ DW_TAG_pointer_type ] [line 0, size 32, align 32, offset 0] [from cmplx32ImRe_t]
!27 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !8} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from int]
!28 = metadata !{i32 2, metadata !"Dwarf Version", i32 2}
!29 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!30 = metadata !{metadata !"clang version 3.5.0 (tags/RELEASE_350/final)"}
!31 = metadata !{i32 786689, metadata !4, metadata !"n", metadata !5, i32 16777228, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 12]
!32 = metadata !{i32 12, i32 22, metadata !4, null}
!33 = metadata !{i32 786689, metadata !4, metadata !"x", metadata !5, i32 33554444, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 12]
!34 = metadata !{i32 12, i32 30, metadata !4, null}
!35 = metadata !{i32 786688, metadata !4, metadata !"temp", metadata !5, i32 16, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [temp] [line 16]
!36 = metadata !{i32 16, i32 7, metadata !4, null}
!37 = metadata !{i32 786688, metadata !38, metadata !"i", metadata !5, i32 17, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 17]
!38 = metadata !{i32 786443, metadata !1, metadata !4, i32 17, i32 3, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\fft_32x32(1).c]
!39 = metadata !{i32 17, i32 12, metadata !38, null}
!40 = metadata !{i32 17, i32 8, metadata !38, null}
!41 = metadata !{i32 786688, metadata !38, metadata !"j", metadata !5, i32 17, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 17]
!42 = metadata !{i32 17, i32 19, metadata !38, null}
!43 = metadata !{i32 786688, metadata !44, metadata !"k", metadata !5, i32 18, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 18]
!44 = metadata !{i32 786443, metadata !1, metadata !45, i32 18, i32 5, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\fft_32x32(1).c]
!45 = metadata !{i32 786443, metadata !1, metadata !38, i32 17, i32 42, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\fft_32x32(1).c]
!46 = metadata !{i32 18, i32 14, metadata !44, null}
!47 = metadata !{i32 18, i32 10, metadata !44, null}
!48 = metadata !{i32 18, i32 39, metadata !44, null}
!49 = metadata !{i32 19, i32 9, metadata !50, null}
!50 = metadata !{i32 786443, metadata !1, metadata !45, i32 19, i32 9, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\fft_32x32(1).c]
!51 = metadata !{i32 20, i32 6, metadata !52, null}
!52 = metadata !{i32 786443, metadata !1, metadata !50, i32 19, i32 15, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\fft_32x32(1).c]
!53 = metadata !{i32 21, i32 6, metadata !52, null}
!54 = metadata !{i32 22, i32 6, metadata !52, null}
!55 = metadata !{i32 23, i32 6, metadata !52, null}
!56 = metadata !{i32 24, i32 6, metadata !52, null}
!57 = metadata !{i32 25, i32 6, metadata !52, null}
!58 = metadata !{i32 26, i32 5, metadata !52, null}
!59 = metadata !{i32 27, i32 3, metadata !45, null}
!60 = metadata !{i32 17, i32 37, metadata !38, null}
!61 = metadata !{i32 28, i32 1, metadata !4, null}
!62 = metadata !{i32 786689, metadata !10, metadata !"x", metadata !5, i32 16777245, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 29]
!63 = metadata !{i32 29, i32 22, metadata !10, null}
!64 = metadata !{i32 786689, metadata !10, metadata !"w", metadata !5, i32 33554461, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [w] [line 29]
!65 = metadata !{i32 29, i32 30, metadata !10, null}
!66 = metadata !{i32 786689, metadata !10, metadata !"nx", metadata !5, i32 50331677, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [nx] [line 29]
!67 = metadata !{i32 29, i32 37, metadata !10, null}
!68 = metadata !{i32 786688, metadata !10, metadata !"n1", metadata !5, i32 30, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n1] [line 30]
!69 = metadata !{i32 30, i32 6, metadata !10, null}
!70 = metadata !{i32 786688, metadata !10, metadata !"n2", metadata !5, i32 30, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n2] [line 30]
!71 = metadata !{i32 30, i32 9, metadata !10, null}
!72 = metadata !{i32 786688, metadata !10, metadata !"ie", metadata !5, i32 30, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ie] [line 30]
!73 = metadata !{i32 30, i32 12, metadata !10, null}
!74 = metadata !{i32 786688, metadata !10, metadata !"ia", metadata !5, i32 30, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ia] [line 30]
!75 = metadata !{i32 30, i32 15, metadata !10, null}
!76 = metadata !{i32 786688, metadata !10, metadata !"i", metadata !5, i32 30, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 30]
!77 = metadata !{i32 30, i32 18, metadata !10, null}
!78 = metadata !{i32 786688, metadata !10, metadata !"j", metadata !5, i32 30, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 30]
!79 = metadata !{i32 30, i32 20, metadata !10, null}
!80 = metadata !{i32 786688, metadata !10, metadata !"k", metadata !5, i32 30, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 30]
!81 = metadata !{i32 30, i32 22, metadata !10, null}
!82 = metadata !{i32 786688, metadata !10, metadata !"l", metadata !5, i32 30, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [l] [line 30]
!83 = metadata !{i32 30, i32 24, metadata !10, null}
!84 = metadata !{i32 786688, metadata !10, metadata !"m", metadata !5, i32 30, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [m] [line 30]
!85 = metadata !{i32 30, i32 26, metadata !10, null}
!86 = metadata !{i32 786688, metadata !10, metadata !"xt", metadata !5, i32 31, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [xt] [line 31]
!87 = metadata !{i32 31, i32 6, metadata !10, null}
!88 = metadata !{i32 786688, metadata !10, metadata !"yt", metadata !5, i32 31, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [yt] [line 31]
!89 = metadata !{i32 31, i32 9, metadata !10, null}
!90 = metadata !{i32 786688, metadata !10, metadata !"c", metadata !5, i32 31, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [c] [line 31]
!91 = metadata !{i32 31, i32 12, metadata !10, null}
!92 = metadata !{i32 786688, metadata !10, metadata !"s", metadata !5, i32 31, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [s] [line 31]
!93 = metadata !{i32 31, i32 14, metadata !10, null}
!94 = metadata !{i32 32, i32 2, metadata !10, null}
!95 = metadata !{i32 33, i32 2, metadata !10, null}
!96 = metadata !{i32 34, i32 7, metadata !97, null}
!97 = metadata !{i32 786443, metadata !1, metadata !10, i32 34, i32 2, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\fft_32x32(1).c]
!98 = metadata !{i32 35, i32 3, metadata !99, null}
!99 = metadata !{i32 786443, metadata !1, metadata !97, i32 34, i32 35, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\fft_32x32(1).c]
!100 = metadata !{i32 36, i32 3, metadata !99, null}
!101 = metadata !{i32 51, i32 9, metadata !102, null}
!102 = metadata !{i32 786443, metadata !1, metadata !99, i32 51, i32 4, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\fft_32x32(1).c]
!103 = metadata !{i32 52, i32 5, metadata !104, null}
!104 = metadata !{i32 786443, metadata !1, metadata !102, i32 51, i32 29, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\fft_32x32(1).c]
!105 = metadata !{i32 53, i32 10, metadata !106, null}
!106 = metadata !{i32 786443, metadata !1, metadata !104, i32 53, i32 5, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\fft_32x32(1).c]
!107 = metadata !{i32 54, i32 6, metadata !108, null}
!108 = metadata !{i32 786443, metadata !1, metadata !106, i32 53, i32 31, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\fft_32x32(1).c]
!109 = metadata !{i32 55, i32 6, metadata !108, null}
!110 = metadata !{i32 56, i32 6, metadata !108, null}
!111 = metadata !{i32 57, i32 6, metadata !108, null}
!112 = metadata !{i32 58, i32 6, metadata !108, null} ; [ DW_TAG_imported_module ]
!113 = metadata !{i32 59, i32 6, metadata !108, null}
!114 = metadata !{i32 60, i32 6, metadata !108, null}
!115 = metadata !{i32 61, i32 6, metadata !108, null}
!116 = metadata !{i32 62, i32 6, metadata !108, null}
!117 = metadata !{i32 63, i32 6, metadata !108, null}
!118 = metadata !{i32 64, i32 6, metadata !108, null}
!119 = metadata !{i32 65, i32 5, metadata !108, null}
!120 = metadata !{i32 53, i32 23, metadata !106, null}
!121 = metadata !{i32 66, i32 4, metadata !104, null}
!122 = metadata !{i32 51, i32 22, metadata !102, null}
!123 = metadata !{i32 786688, metadata !124, metadata !"p", metadata !5, i32 68, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [p] [line 68]
!124 = metadata !{i32 786443, metadata !1, metadata !99, i32 68, i32 4, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\fft_32x32(1).c]
!125 = metadata !{i32 68, i32 12, metadata !124, null}
!126 = metadata !{i32 68, i32 8, metadata !124, null}
!127 = metadata !{i32 69, i32 5, metadata !128, null}
!128 = metadata !{i32 786443, metadata !1, metadata !124, i32 68, i32 32, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\fft_32x32(1).c]
!129 = metadata !{i32 70, i32 5, metadata !128, null}
!130 = metadata !{i32 71, i32 4, metadata !128, null}
!131 = metadata !{i32 68, i32 27, metadata !124, null}
!132 = metadata !{i32 75, i32 2, metadata !99, null}
!133 = metadata !{i32 34, i32 21, metadata !97, null}
!134 = metadata !{i32 76, i32 2, metadata !10, null}
!135 = metadata !{i32 77, i32 1, metadata !10, null}
!136 = metadata !{i32 786689, metadata !13, metadata !"fftSrcAddr", metadata !5, i32 16777294, metadata !16, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fftSrcAddr] [line 78]
!137 = metadata !{i32 78, i32 37, metadata !13, null}
!138 = metadata !{i32 786689, metadata !13, metadata !"fftDstAddr", metadata !5, i32 33554510, metadata !26, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fftDstAddr] [line 78]
!139 = metadata !{i32 78, i32 65, metadata !13, null}
!140 = metadata !{i32 786689, metadata !13, metadata !"nfft", metadata !5, i32 50331726, metadata !27, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [nfft] [line 78]
!141 = metadata !{i32 78, i32 87, metadata !13, null}
!142 = metadata !{i32 786688, metadata !13, metadata !"data", metadata !5, i32 79, metadata !143, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [data] [line 79]
!143 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 2048, i64 32, i32 0, i32 0, metadata !8, metadata !144, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 2048, align 32, offset 0] [from int]
!144 = metadata !{metadata !145}
!145 = metadata !{i32 786465, i64 0, i64 64}      ; [ DW_TAG_subrange_type ] [0, 63]
!146 = metadata !{i32 79, i32 9, metadata !13, null}
!147 = metadata !{i32 786688, metadata !13, metadata !"ndata", metadata !5, i32 80, metadata !148, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ndata] [line 80]
!148 = metadata !{i32 786468, null, null, metadata !"short", i32 0, i64 16, i64 16, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [short] [line 0, size 16, align 16, offset 0, enc DW_ATE_signed]
!149 = metadata !{i32 80, i32 8, metadata !13, null}
!150 = metadata !{i32 80, i32 2, metadata !13, null}
!151 = metadata !{i32 786688, metadata !13, metadata !"f", metadata !5, i32 81, metadata !143, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 81]
!152 = metadata !{i32 81, i32 6, metadata !13, null}
!153 = metadata !{i32 81, i32 2, metadata !13, null}
!154 = metadata !{i32 786688, metadata !155, metadata !"j", metadata !5, i32 83, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 83]
!155 = metadata !{i32 786443, metadata !1, metadata !13, i32 83, i32 2, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\fft_32x32(1).c]
!156 = metadata !{i32 83, i32 11, metadata !155, null}
!157 = metadata !{i32 83, i32 7, metadata !155, null}
!158 = metadata !{i32 85, i32 6, metadata !159, null}
!159 = metadata !{i32 786443, metadata !1, metadata !155, i32 84, i32 3, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\fft_32x32(1).c]
!160 = metadata !{i32 86, i32 6, metadata !159, null}
!161 = metadata !{i32 86, i32 41, metadata !159, null}
!162 = metadata !{i32 83, i32 20, metadata !155, null}
!163 = metadata !{i32 89, i32 2, metadata !13, null}
!164 = metadata !{i32 786688, metadata !165, metadata !"j", metadata !5, i32 90, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 90]
!165 = metadata !{i32 786443, metadata !1, metadata !13, i32 90, i32 2, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\fft_32x32(1).c]
!166 = metadata !{i32 90, i32 11, metadata !165, null}
!167 = metadata !{i32 90, i32 7, metadata !165, null}
!168 = metadata !{i32 91, i32 8, metadata !169, null}
!169 = metadata !{i32 786443, metadata !1, metadata !165, i32 91, i32 5, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\fft_32x32(1).c]
!170 = metadata !{i32 92, i32 8, metadata !169, null}
!171 = metadata !{i32 93, i32 5, metadata !169, null}
!172 = metadata !{i32 90, i32 20, metadata !165, null}
!173 = metadata !{i32 95, i32 1, metadata !13, null}
