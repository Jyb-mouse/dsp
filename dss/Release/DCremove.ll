; ModuleID = '..\DCremove.c'
target datalayout = "e-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
target triple = "dsp"

%struct.cmplx16ImRe_t_ = type { i16, i16 }
%struct.cmplx32ImRe_t_ = type { i32, i32 }

; Function Attrs: nounwind
define void @dcremove(i32 %numsample, %struct.cmplx16ImRe_t_* %s, %struct.cmplx32ImRe_t_* %sum) #0 {
entry:
  %numsample.addr = alloca i32, align 4
  %s.addr = alloca %struct.cmplx16ImRe_t_*, align 4
  %sum.addr = alloca %struct.cmplx32ImRe_t_*, align 4
  %i = alloca i16, align 2
  %k = alloca i16, align 2
  %m = alloca i16, align 2
  %b = alloca i16, align 2
  %jj = alloca i16, align 2
  %j = alloca i32, align 4
  %n = alloca i16, align 2
  %j102 = alloca i32, align 4
  store i32 %numsample, i32* %numsample.addr, align 4
  call void @llvm.dbg.declare(metadata !{i32* %numsample.addr}, metadata !30), !dbg !31
  store %struct.cmplx16ImRe_t_* %s, %struct.cmplx16ImRe_t_** %s.addr, align 4
  call void @llvm.dbg.declare(metadata !{%struct.cmplx16ImRe_t_** %s.addr}, metadata !32), !dbg !33
  store %struct.cmplx32ImRe_t_* %sum, %struct.cmplx32ImRe_t_** %sum.addr, align 4
  call void @llvm.dbg.declare(metadata !{%struct.cmplx32ImRe_t_** %sum.addr}, metadata !34), !dbg !35
  call void @llvm.dbg.declare(metadata !{i16* %i}, metadata !36), !dbg !37
  store i16 16, i16* %i, align 2, !dbg !38
  call void @llvm.dbg.declare(metadata !{i16* %k}, metadata !39), !dbg !40
  %0 = load i32* %numsample.addr, align 4, !dbg !41
  %1 = load i16* %i, align 2, !dbg !41
  %conv = sext i16 %1 to i32, !dbg !41
  %div = sdiv i32 %0, %conv, !dbg !41
  %conv1 = trunc i32 %div to i16, !dbg !41
  store i16 %conv1, i16* %k, align 2, !dbg !41
  call void @llvm.dbg.declare(metadata !{i16* %m}, metadata !42), !dbg !43
  call void @llvm.dbg.declare(metadata !{i16* %b}, metadata !44), !dbg !45
  call void @llvm.dbg.declare(metadata !{i16* %jj}, metadata !46), !dbg !48
  store i16 0, i16* %jj, align 2, !dbg !49
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc60, %entry
  %2 = load i16* %jj, align 2, !dbg !49
  %conv2 = sext i16 %2 to i32, !dbg !49
  %3 = load i16* %k, align 2, !dbg !49
  %conv3 = sext i16 %3 to i32, !dbg !49
  %cmp = icmp slt i32 %conv2, %conv3, !dbg !49
  br i1 %cmp, label %for.body, label %for.end62, !dbg !49

for.body:                                         ; preds = %for.cond
  %4 = load i16* %i, align 2, !dbg !50
  store i16 %4, i16* %m, align 2, !dbg !50
  %5 = load i16* %i, align 2, !dbg !52
  store i16 %5, i16* %b, align 2, !dbg !52
  %6 = load %struct.cmplx32ImRe_t_** %sum.addr, align 4, !dbg !53
  %7 = load i16* %jj, align 2, !dbg !53
  %conv5 = sext i16 %7 to i32, !dbg !53
  %add.ptr = getelementptr inbounds %struct.cmplx32ImRe_t_* %6, i32 %conv5, !dbg !53
  %real = getelementptr inbounds %struct.cmplx32ImRe_t_* %add.ptr, i32 0, i32 1, !dbg !53
  store i32 0, i32* %real, align 4, !dbg !53
  %8 = load %struct.cmplx32ImRe_t_** %sum.addr, align 4, !dbg !54
  %9 = load i16* %jj, align 2, !dbg !54
  %conv6 = sext i16 %9 to i32, !dbg !54
  %add.ptr7 = getelementptr inbounds %struct.cmplx32ImRe_t_* %8, i32 %conv6, !dbg !54
  %imag = getelementptr inbounds %struct.cmplx32ImRe_t_* %add.ptr7, i32 0, i32 0, !dbg !54
  store i32 0, i32* %imag, align 4, !dbg !54
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !55), !dbg !57
  %10 = load i16* %jj, align 2, !dbg !58
  %conv8 = sext i16 %10 to i32, !dbg !58
  %11 = load i16* %i, align 2, !dbg !58
  %conv9 = sext i16 %11 to i32, !dbg !58
  %mul = mul nsw i32 %conv8, %conv9, !dbg !58
  store i32 %mul, i32* %j, align 4, !dbg !58
  br label %for.cond10, !dbg !58

for.cond10:                                       ; preds = %for.inc, %for.body
  %12 = load i32* %j, align 4, !dbg !58
  %13 = load i16* %jj, align 2, !dbg !58
  %conv11 = sext i16 %13 to i32, !dbg !58
  %14 = load i16* %i, align 2, !dbg !58
  %conv12 = sext i16 %14 to i32, !dbg !58
  %mul13 = mul nsw i32 %conv11, %conv12, !dbg !58
  %15 = load i16* %i, align 2, !dbg !58
  %conv14 = sext i16 %15 to i32, !dbg !58
  %add = add nsw i32 %mul13, %conv14, !dbg !58
  %cmp15 = icmp slt i32 %12, %add, !dbg !58
  br i1 %cmp15, label %for.body17, label %for.end, !dbg !58

for.body17:                                       ; preds = %for.cond10
  %16 = load %struct.cmplx16ImRe_t_** %s.addr, align 4, !dbg !59
  %17 = load i32* %j, align 4, !dbg !59
  %add.ptr18 = getelementptr inbounds %struct.cmplx16ImRe_t_* %16, i32 %17, !dbg !59
  %real19 = getelementptr inbounds %struct.cmplx16ImRe_t_* %add.ptr18, i32 0, i32 1, !dbg !59
  %18 = load i16* %real19, align 2, !dbg !59
  %conv20 = sext i16 %18 to i32, !dbg !59
  %cmp21 = icmp eq i32 %conv20, 0, !dbg !59
  br i1 %cmp21, label %if.then, label %if.else, !dbg !59

if.then:                                          ; preds = %for.body17
  %19 = load i16* %m, align 2, !dbg !62
  %conv23 = sext i16 %19 to i32, !dbg !62
  %sub = sub nsw i32 %conv23, 1, !dbg !62
  %conv24 = trunc i32 %sub to i16, !dbg !62
  store i16 %conv24, i16* %m, align 2, !dbg !62
  br label %if.end, !dbg !64

if.else:                                          ; preds = %for.body17
  %20 = load %struct.cmplx16ImRe_t_** %s.addr, align 4, !dbg !65
  %21 = load i32* %j, align 4, !dbg !65
  %add.ptr25 = getelementptr inbounds %struct.cmplx16ImRe_t_* %20, i32 %21, !dbg !65
  %real26 = getelementptr inbounds %struct.cmplx16ImRe_t_* %add.ptr25, i32 0, i32 1, !dbg !65
  %22 = load i16* %real26, align 2, !dbg !65
  %conv27 = sext i16 %22 to i32, !dbg !65
  %23 = load %struct.cmplx32ImRe_t_** %sum.addr, align 4, !dbg !65
  %24 = load i16* %jj, align 2, !dbg !65
  %conv28 = sext i16 %24 to i32, !dbg !65
  %add.ptr29 = getelementptr inbounds %struct.cmplx32ImRe_t_* %23, i32 %conv28, !dbg !65
  %real30 = getelementptr inbounds %struct.cmplx32ImRe_t_* %add.ptr29, i32 0, i32 1, !dbg !65
  %25 = load i32* %real30, align 4, !dbg !65
  %add31 = add nsw i32 %25, %conv27, !dbg !65
  store i32 %add31, i32* %real30, align 4, !dbg !65
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %26 = load %struct.cmplx16ImRe_t_** %s.addr, align 4, !dbg !67
  %27 = load i32* %j, align 4, !dbg !67
  %add.ptr32 = getelementptr inbounds %struct.cmplx16ImRe_t_* %26, i32 %27, !dbg !67
  %imag33 = getelementptr inbounds %struct.cmplx16ImRe_t_* %add.ptr32, i32 0, i32 0, !dbg !67
  %28 = load i16* %imag33, align 2, !dbg !67
  %conv34 = sext i16 %28 to i32, !dbg !67
  %cmp35 = icmp eq i32 %conv34, 0, !dbg !67
  br i1 %cmp35, label %if.then37, label %if.else41, !dbg !67

if.then37:                                        ; preds = %if.end
  %29 = load i16* %b, align 2, !dbg !69
  %conv38 = sext i16 %29 to i32, !dbg !69
  %sub39 = sub nsw i32 %conv38, 1, !dbg !69
  %conv40 = trunc i32 %sub39 to i16, !dbg !69
  store i16 %conv40, i16* %b, align 2, !dbg !69
  br label %if.end49, !dbg !71

if.else41:                                        ; preds = %if.end
  %30 = load %struct.cmplx16ImRe_t_** %s.addr, align 4, !dbg !72
  %31 = load i32* %j, align 4, !dbg !72
  %add.ptr42 = getelementptr inbounds %struct.cmplx16ImRe_t_* %30, i32 %31, !dbg !72
  %imag43 = getelementptr inbounds %struct.cmplx16ImRe_t_* %add.ptr42, i32 0, i32 0, !dbg !72
  %32 = load i16* %imag43, align 2, !dbg !72
  %conv44 = sext i16 %32 to i32, !dbg !72
  %33 = load %struct.cmplx32ImRe_t_** %sum.addr, align 4, !dbg !72
  %34 = load i16* %jj, align 2, !dbg !72
  %conv45 = sext i16 %34 to i32, !dbg !72
  %add.ptr46 = getelementptr inbounds %struct.cmplx32ImRe_t_* %33, i32 %conv45, !dbg !72
  %imag47 = getelementptr inbounds %struct.cmplx32ImRe_t_* %add.ptr46, i32 0, i32 0, !dbg !72
  %35 = load i32* %imag47, align 4, !dbg !72
  %add48 = add nsw i32 %35, %conv44, !dbg !72
  store i32 %add48, i32* %imag47, align 4, !dbg !72
  br label %if.end49

if.end49:                                         ; preds = %if.else41, %if.then37
  br label %for.inc, !dbg !74

for.inc:                                          ; preds = %if.end49
  %36 = load i32* %j, align 4, !dbg !75
  %inc = add nsw i32 %36, 1, !dbg !75
  store i32 %inc, i32* %j, align 4, !dbg !75
  br label %for.cond10, !dbg !75

for.end:                                          ; preds = %for.cond10
  %37 = load i16* %m, align 2, !dbg !76
  %conv50 = sext i16 %37 to i32, !dbg !76
  %38 = load %struct.cmplx32ImRe_t_** %sum.addr, align 4, !dbg !76
  %39 = load i16* %jj, align 2, !dbg !76
  %conv51 = sext i16 %39 to i32, !dbg !76
  %add.ptr52 = getelementptr inbounds %struct.cmplx32ImRe_t_* %38, i32 %conv51, !dbg !76
  %real53 = getelementptr inbounds %struct.cmplx32ImRe_t_* %add.ptr52, i32 0, i32 1, !dbg !76
  %40 = load i32* %real53, align 4, !dbg !76
  %div54 = sdiv i32 %40, %conv50, !dbg !76
  store i32 %div54, i32* %real53, align 4, !dbg !76
  %41 = load i16* %b, align 2, !dbg !77
  %conv55 = sext i16 %41 to i32, !dbg !77
  %42 = load %struct.cmplx32ImRe_t_** %sum.addr, align 4, !dbg !77
  %43 = load i16* %jj, align 2, !dbg !77
  %conv56 = sext i16 %43 to i32, !dbg !77
  %add.ptr57 = getelementptr inbounds %struct.cmplx32ImRe_t_* %42, i32 %conv56, !dbg !77
  %imag58 = getelementptr inbounds %struct.cmplx32ImRe_t_* %add.ptr57, i32 0, i32 0, !dbg !77
  %44 = load i32* %imag58, align 4, !dbg !77
  %div59 = sdiv i32 %44, %conv55, !dbg !77
  store i32 %div59, i32* %imag58, align 4, !dbg !77
  br label %for.inc60, !dbg !78

for.inc60:                                        ; preds = %for.end
  %45 = load i16* %jj, align 2, !dbg !79
  %inc61 = add i16 %45, 1, !dbg !79
  store i16 %inc61, i16* %jj, align 2, !dbg !79
  br label %for.cond, !dbg !79

for.end62:                                        ; preds = %for.cond
  %46 = load %struct.cmplx32ImRe_t_** %sum.addr, align 4, !dbg !80
  %47 = load i16* %k, align 2, !dbg !80
  %conv63 = sext i16 %47 to i32, !dbg !80
  %add.ptr64 = getelementptr inbounds %struct.cmplx32ImRe_t_* %46, i32 %conv63, !dbg !80
  %real65 = getelementptr inbounds %struct.cmplx32ImRe_t_* %add.ptr64, i32 0, i32 1, !dbg !80
  store i32 0, i32* %real65, align 4, !dbg !80
  %48 = load %struct.cmplx32ImRe_t_** %sum.addr, align 4, !dbg !81
  %49 = load i16* %k, align 2, !dbg !81
  %conv66 = sext i16 %49 to i32, !dbg !81
  %add.ptr67 = getelementptr inbounds %struct.cmplx32ImRe_t_* %48, i32 %conv66, !dbg !81
  %imag68 = getelementptr inbounds %struct.cmplx32ImRe_t_* %add.ptr67, i32 0, i32 0, !dbg !81
  store i32 0, i32* %imag68, align 4, !dbg !81
  call void @llvm.dbg.declare(metadata !{i16* %n}, metadata !82), !dbg !84
  store i16 0, i16* %n, align 2, !dbg !85
  br label %for.cond69, !dbg !85

for.cond69:                                       ; preds = %for.inc89, %for.end62
  %50 = load i16* %n, align 2, !dbg !85
  %conv70 = sext i16 %50 to i32, !dbg !85
  %51 = load i16* %k, align 2, !dbg !85
  %conv71 = sext i16 %51 to i32, !dbg !85
  %cmp72 = icmp slt i32 %conv70, %conv71, !dbg !85
  br i1 %cmp72, label %for.body74, label %for.end91, !dbg !85

for.body74:                                       ; preds = %for.cond69
  %52 = load %struct.cmplx32ImRe_t_** %sum.addr, align 4, !dbg !86
  %53 = load i16* %n, align 2, !dbg !86
  %conv75 = sext i16 %53 to i32, !dbg !86
  %add.ptr76 = getelementptr inbounds %struct.cmplx32ImRe_t_* %52, i32 %conv75, !dbg !86
  %real77 = getelementptr inbounds %struct.cmplx32ImRe_t_* %add.ptr76, i32 0, i32 1, !dbg !86
  %54 = load i32* %real77, align 4, !dbg !86
  %55 = load %struct.cmplx32ImRe_t_** %sum.addr, align 4, !dbg !86
  %56 = load i16* %k, align 2, !dbg !86
  %conv78 = sext i16 %56 to i32, !dbg !86
  %add.ptr79 = getelementptr inbounds %struct.cmplx32ImRe_t_* %55, i32 %conv78, !dbg !86
  %real80 = getelementptr inbounds %struct.cmplx32ImRe_t_* %add.ptr79, i32 0, i32 1, !dbg !86
  %57 = load i32* %real80, align 4, !dbg !86
  %add81 = add nsw i32 %57, %54, !dbg !86
  store i32 %add81, i32* %real80, align 4, !dbg !86
  %58 = load %struct.cmplx32ImRe_t_** %sum.addr, align 4, !dbg !88
  %59 = load i16* %n, align 2, !dbg !88
  %conv82 = sext i16 %59 to i32, !dbg !88
  %add.ptr83 = getelementptr inbounds %struct.cmplx32ImRe_t_* %58, i32 %conv82, !dbg !88
  %imag84 = getelementptr inbounds %struct.cmplx32ImRe_t_* %add.ptr83, i32 0, i32 0, !dbg !88
  %60 = load i32* %imag84, align 4, !dbg !88
  %61 = load %struct.cmplx32ImRe_t_** %sum.addr, align 4, !dbg !88
  %62 = load i16* %k, align 2, !dbg !88
  %conv85 = sext i16 %62 to i32, !dbg !88
  %add.ptr86 = getelementptr inbounds %struct.cmplx32ImRe_t_* %61, i32 %conv85, !dbg !88
  %imag87 = getelementptr inbounds %struct.cmplx32ImRe_t_* %add.ptr86, i32 0, i32 0, !dbg !88
  %63 = load i32* %imag87, align 4, !dbg !88
  %add88 = add nsw i32 %63, %60, !dbg !88
  store i32 %add88, i32* %imag87, align 4, !dbg !88
  br label %for.inc89, !dbg !89

for.inc89:                                        ; preds = %for.body74
  %64 = load i16* %n, align 2, !dbg !90
  %inc90 = add i16 %64, 1, !dbg !90
  store i16 %inc90, i16* %n, align 2, !dbg !90
  br label %for.cond69, !dbg !90

for.end91:                                        ; preds = %for.cond69
  %65 = load i16* %k, align 2, !dbg !91
  %conv92 = sext i16 %65 to i32, !dbg !91
  %66 = load %struct.cmplx32ImRe_t_** %sum.addr, align 4, !dbg !91
  %67 = load i16* %k, align 2, !dbg !91
  %conv93 = sext i16 %67 to i32, !dbg !91
  %add.ptr94 = getelementptr inbounds %struct.cmplx32ImRe_t_* %66, i32 %conv93, !dbg !91
  %real95 = getelementptr inbounds %struct.cmplx32ImRe_t_* %add.ptr94, i32 0, i32 1, !dbg !91
  %68 = load i32* %real95, align 4, !dbg !91
  %div96 = sdiv i32 %68, %conv92, !dbg !91
  store i32 %div96, i32* %real95, align 4, !dbg !91
  %69 = load i16* %k, align 2, !dbg !92
  %conv97 = sext i16 %69 to i32, !dbg !92
  %70 = load %struct.cmplx32ImRe_t_** %sum.addr, align 4, !dbg !92
  %71 = load i16* %k, align 2, !dbg !92
  %conv98 = sext i16 %71 to i32, !dbg !92
  %add.ptr99 = getelementptr inbounds %struct.cmplx32ImRe_t_* %70, i32 %conv98, !dbg !92
  %imag100 = getelementptr inbounds %struct.cmplx32ImRe_t_* %add.ptr99, i32 0, i32 0, !dbg !92
  %72 = load i32* %imag100, align 4, !dbg !92
  %div101 = sdiv i32 %72, %conv97, !dbg !92
  store i32 %div101, i32* %imag100, align 4, !dbg !92
  call void @llvm.dbg.declare(metadata !{i32* %j102}, metadata !93), !dbg !95
  store i32 0, i32* %j102, align 4, !dbg !96
  br label %for.cond103, !dbg !96

for.cond103:                                      ; preds = %for.inc137, %for.end91
  %73 = load i32* %j102, align 4, !dbg !96
  %74 = load i32* %numsample.addr, align 4, !dbg !96
  %cmp104 = icmp slt i32 %73, %74, !dbg !96
  br i1 %cmp104, label %for.body106, label %for.end139, !dbg !96

for.body106:                                      ; preds = %for.cond103
  %75 = load %struct.cmplx16ImRe_t_** %s.addr, align 4, !dbg !97
  %76 = load i32* %j102, align 4, !dbg !97
  %add.ptr107 = getelementptr inbounds %struct.cmplx16ImRe_t_* %75, i32 %76, !dbg !97
  %real108 = getelementptr inbounds %struct.cmplx16ImRe_t_* %add.ptr107, i32 0, i32 1, !dbg !97
  %77 = load i16* %real108, align 2, !dbg !97
  %conv109 = sext i16 %77 to i32, !dbg !97
  %cmp110 = icmp ne i32 %conv109, 0, !dbg !97
  br i1 %cmp110, label %if.then112, label %if.end121, !dbg !97

if.then112:                                       ; preds = %for.body106
  %78 = load %struct.cmplx32ImRe_t_** %sum.addr, align 4, !dbg !100
  %79 = load i16* %k, align 2, !dbg !100
  %conv113 = sext i16 %79 to i32, !dbg !100
  %add.ptr114 = getelementptr inbounds %struct.cmplx32ImRe_t_* %78, i32 %conv113, !dbg !100
  %real115 = getelementptr inbounds %struct.cmplx32ImRe_t_* %add.ptr114, i32 0, i32 1, !dbg !100
  %80 = load i32* %real115, align 4, !dbg !100
  %81 = load %struct.cmplx16ImRe_t_** %s.addr, align 4, !dbg !100
  %82 = load i32* %j102, align 4, !dbg !100
  %add.ptr116 = getelementptr inbounds %struct.cmplx16ImRe_t_* %81, i32 %82, !dbg !100
  %real117 = getelementptr inbounds %struct.cmplx16ImRe_t_* %add.ptr116, i32 0, i32 1, !dbg !100
  %83 = load i16* %real117, align 2, !dbg !100
  %conv118 = sext i16 %83 to i32, !dbg !100
  %sub119 = sub nsw i32 %conv118, %80, !dbg !100
  %conv120 = trunc i32 %sub119 to i16, !dbg !100
  store i16 %conv120, i16* %real117, align 2, !dbg !100
  br label %if.end121, !dbg !102

if.end121:                                        ; preds = %if.then112, %for.body106
  %84 = load %struct.cmplx16ImRe_t_** %s.addr, align 4, !dbg !103
  %85 = load i32* %j102, align 4, !dbg !103
  %add.ptr122 = getelementptr inbounds %struct.cmplx16ImRe_t_* %84, i32 %85, !dbg !103
  %imag123 = getelementptr inbounds %struct.cmplx16ImRe_t_* %add.ptr122, i32 0, i32 0, !dbg !103
  %86 = load i16* %imag123, align 2, !dbg !103
  %conv124 = sext i16 %86 to i32, !dbg !103
  %cmp125 = icmp ne i32 %conv124, 0, !dbg !103
  br i1 %cmp125, label %if.then127, label %if.end136, !dbg !103

if.then127:                                       ; preds = %if.end121
  %87 = load %struct.cmplx32ImRe_t_** %sum.addr, align 4, !dbg !105
  %88 = load i16* %k, align 2, !dbg !105
  %conv128 = sext i16 %88 to i32, !dbg !105
  %add.ptr129 = getelementptr inbounds %struct.cmplx32ImRe_t_* %87, i32 %conv128, !dbg !105
  %imag130 = getelementptr inbounds %struct.cmplx32ImRe_t_* %add.ptr129, i32 0, i32 0, !dbg !105
  %89 = load i32* %imag130, align 4, !dbg !105
  %90 = load %struct.cmplx16ImRe_t_** %s.addr, align 4, !dbg !105
  %91 = load i32* %j102, align 4, !dbg !105
  %add.ptr131 = getelementptr inbounds %struct.cmplx16ImRe_t_* %90, i32 %91, !dbg !105
  %imag132 = getelementptr inbounds %struct.cmplx16ImRe_t_* %add.ptr131, i32 0, i32 0, !dbg !105
  %92 = load i16* %imag132, align 2, !dbg !105
  %conv133 = sext i16 %92 to i32, !dbg !105
  %sub134 = sub nsw i32 %conv133, %89, !dbg !105
  %conv135 = trunc i32 %sub134 to i16, !dbg !105
  store i16 %conv135, i16* %imag132, align 2, !dbg !105
  br label %if.end136, !dbg !107

if.end136:                                        ; preds = %if.then127, %if.end121
  br label %for.inc137, !dbg !108

for.inc137:                                       ; preds = %if.end136
  %93 = load i32* %j102, align 4, !dbg !109
  %inc138 = add nsw i32 %93, 1, !dbg !109
  store i32 %inc138, i32* %j102, align 4, !dbg !109
  br label %for.cond103, !dbg !109

for.end139:                                       ; preds = %for.cond103
  ret void, !dbg !110
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!27, !28}
!llvm.ident = !{!29}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.0 (tags/RELEASE_350/final)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [D:\eclipse\workspace\dss\Release/..\DCremove.c] [DW_LANG_C99]
!1 = metadata !{metadata !"..\5CDCremove.c", metadata !"D:\5Ceclipse\5Cworkspace\5Cdss\5CRelease"}
!2 = metadata !{}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"dcremove", metadata !"dcremove", metadata !"", i32 16, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32, %struct.cmplx16ImRe_t_*, %struct.cmplx32ImRe_t_*)* @dcremove, null, null, metadata !2, i32 17} ; [ DW_TAG_subprogram ] [line 16] [def] [scope 17] [dcremove]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [D:\eclipse\workspace\dss\Release/..\DCremove.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{null, metadata !8, metadata !9, metadata !19}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 32, i64 32, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 32, align 32, offset 0] [from cmplx16ImRe_t]
!10 = metadata !{i32 786454, metadata !11, null, metadata !"cmplx16ImRe_t", i32 9, i64 0, i64 0, i64 0, i32 0, metadata !12} ; [ DW_TAG_typedef ] [cmplx16ImRe_t] [line 9, size 0, align 0, offset 0] [from cmplx16ImRe_t_]
!11 = metadata !{metadata !"../mmwave_lib.h", metadata !"D:\5Ceclipse\5Cworkspace\5Cdss\5CRelease"}
!12 = metadata !{i32 786451, metadata !11, null, metadata !"cmplx16ImRe_t_", i32 5, i64 32, i64 16, i32 0, i32 0, null, metadata !13, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [cmplx16ImRe_t_] [line 5, size 32, align 16, offset 0] [def] [from ]
!13 = metadata !{metadata !14, metadata !18}
!14 = metadata !{i32 786445, metadata !11, metadata !12, metadata !"imag", i32 7, i64 16, i64 16, i64 0, i32 0, metadata !15} ; [ DW_TAG_member ] [imag] [line 7, size 16, align 16, offset 0] [from int16_t]
!15 = metadata !{i32 786454, metadata !16, null, metadata !"int16_t", i32 31, i64 0, i64 0, i64 0, i32 0, metadata !17} ; [ DW_TAG_typedef ] [int16_t] [line 31, size 0, align 0, offset 0] [from short]
!16 = metadata !{metadata !"D:\5CCIC\5CSwift_IDE_Toolchain\5Ctoolchain_8slot\5Cinclude\5Ctypes/int16_t.h", metadata !"D:\5Ceclipse\5Cworkspace\5Cdss\5CRelease"}
!17 = metadata !{i32 786468, null, null, metadata !"short", i32 0, i64 16, i64 16, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [short] [line 0, size 16, align 16, offset 0, enc DW_ATE_signed]
!18 = metadata !{i32 786445, metadata !11, metadata !12, metadata !"real", i32 8, i64 16, i64 16, i64 16, i32 0, metadata !15} ; [ DW_TAG_member ] [real] [line 8, size 16, align 16, offset 16] [from int16_t]
!19 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 32, i64 32, i64 0, i32 0, metadata !20} ; [ DW_TAG_pointer_type ] [line 0, size 32, align 32, offset 0] [from cmplx32ImRe_t]
!20 = metadata !{i32 786454, metadata !11, null, metadata !"cmplx32ImRe_t", i32 19, i64 0, i64 0, i64 0, i32 0, metadata !21} ; [ DW_TAG_typedef ] [cmplx32ImRe_t] [line 19, size 0, align 0, offset 0] [from cmplx32ImRe_t_]
!21 = metadata !{i32 786451, metadata !11, null, metadata !"cmplx32ImRe_t_", i32 15, i64 64, i64 32, i32 0, i32 0, null, metadata !22, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [cmplx32ImRe_t_] [line 15, size 64, align 32, offset 0] [def] [from ]
!22 = metadata !{metadata !23, metadata !26}
!23 = metadata !{i32 786445, metadata !11, metadata !21, metadata !"imag", i32 17, i64 32, i64 32, i64 0, i32 0, metadata !24} ; [ DW_TAG_member ] [imag] [line 17, size 32, align 32, offset 0] [from int32_t]
!24 = metadata !{i32 786454, metadata !25, null, metadata !"int32_t", i32 31, i64 0, i64 0, i64 0, i32 0, metadata !8} ; [ DW_TAG_typedef ] [int32_t] [line 31, size 0, align 0, offset 0] [from int]
!25 = metadata !{metadata !"D:\5CCIC\5CSwift_IDE_Toolchain\5Ctoolchain_8slot\5Cinclude\5Ctypes/int32_t.h", metadata !"D:\5Ceclipse\5Cworkspace\5Cdss\5CRelease"}
!26 = metadata !{i32 786445, metadata !11, metadata !21, metadata !"real", i32 18, i64 32, i64 32, i64 32, i32 0, metadata !24} ; [ DW_TAG_member ] [real] [line 18, size 32, align 32, offset 32] [from int32_t]
!27 = metadata !{i32 2, metadata !"Dwarf Version", i32 2}
!28 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!29 = metadata !{metadata !"clang version 3.5.0 (tags/RELEASE_350/final)"}
!30 = metadata !{i32 786689, metadata !4, metadata !"numsample", metadata !5, i32 16777232, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [numsample] [line 16]
!31 = metadata !{i32 16, i32 19, metadata !4, null}
!32 = metadata !{i32 786689, metadata !4, metadata !"s", metadata !5, i32 33554448, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 16]
!33 = metadata !{i32 16, i32 44, metadata !4, null}
!34 = metadata !{i32 786689, metadata !4, metadata !"sum", metadata !5, i32 50331664, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sum] [line 16]
!35 = metadata !{i32 16, i32 61, metadata !4, null}
!36 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 17, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 17]
!37 = metadata !{i32 17, i32 11, metadata !4, null}
!38 = metadata !{i32 17, i32 5, metadata !4, null}
!39 = metadata !{i32 786688, metadata !4, metadata !"k", metadata !5, i32 18, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 18]
!40 = metadata !{i32 18, i32 11, metadata !4, null}
!41 = metadata !{i32 18, i32 5, metadata !4, null}
!42 = metadata !{i32 786688, metadata !4, metadata !"m", metadata !5, i32 19, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [m] [line 19]
!43 = metadata !{i32 19, i32 11, metadata !4, null}
!44 = metadata !{i32 786688, metadata !4, metadata !"b", metadata !5, i32 19, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 19]
!45 = metadata !{i32 19, i32 13, metadata !4, null}
!46 = metadata !{i32 786688, metadata !47, metadata !"jj", metadata !5, i32 20, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [jj] [line 20]
!47 = metadata !{i32 786443, metadata !1, metadata !4, i32 20, i32 1, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\DCremove.c]
!48 = metadata !{i32 20, i32 11, metadata !47, null}
!49 = metadata !{i32 20, i32 5, metadata !47, null}
!50 = metadata !{i32 21, i32 4, metadata !51, null}
!51 = metadata !{i32 786443, metadata !1, metadata !47, i32 21, i32 2, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\DCremove.c]
!52 = metadata !{i32 21, i32 8, metadata !51, null}
!53 = metadata !{i32 22, i32 2, metadata !51, null}
!54 = metadata !{i32 23, i32 2, metadata !51, null}
!55 = metadata !{i32 786688, metadata !56, metadata !"j", metadata !5, i32 24, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 24]
!56 = metadata !{i32 786443, metadata !1, metadata !51, i32 24, i32 4, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\DCremove.c]
!57 = metadata !{i32 24, i32 12, metadata !56, null}
!58 = metadata !{i32 24, i32 8, metadata !56, null}
!59 = metadata !{i32 26, i32 6, metadata !60, null}
!60 = metadata !{i32 786443, metadata !1, metadata !61, i32 26, i32 6, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\DCremove.c]
!61 = metadata !{i32 786443, metadata !1, metadata !56, i32 25, i32 3, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\DCremove.c]
!62 = metadata !{i32 27, i32 10, metadata !63, null}
!63 = metadata !{i32 786443, metadata !1, metadata !60, i32 27, i32 9, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\DCremove.c]
!64 = metadata !{i32 27, i32 16, metadata !63, null}
!65 = metadata !{i32 29, i32 4, metadata !66, null}
!66 = metadata !{i32 786443, metadata !1, metadata !60, i32 29, i32 3, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\DCremove.c]
!67 = metadata !{i32 30, i32 6, metadata !68, null}
!68 = metadata !{i32 786443, metadata !1, metadata !61, i32 30, i32 6, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\DCremove.c]
!69 = metadata !{i32 31, i32 12, metadata !70, null}
!70 = metadata !{i32 786443, metadata !1, metadata !68, i32 31, i32 11, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\DCremove.c]
!71 = metadata !{i32 31, i32 18, metadata !70, null}
!72 = metadata !{i32 33, i32 4, metadata !73, null}
!73 = metadata !{i32 786443, metadata !1, metadata !68, i32 33, i32 3, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\DCremove.c]
!74 = metadata !{i32 34, i32 5, metadata !61, null}
!75 = metadata !{i32 24, i32 34, metadata !56, null}
!76 = metadata !{i32 35, i32 3, metadata !51, null}
!77 = metadata !{i32 36, i32 3, metadata !51, null}
!78 = metadata !{i32 37, i32 2, metadata !51, null}
!79 = metadata !{i32 20, i32 21, metadata !47, null}
!80 = metadata !{i32 38, i32 1, metadata !4, null}
!81 = metadata !{i32 39, i32 1, metadata !4, null}
!82 = metadata !{i32 786688, metadata !83, metadata !"n", metadata !5, i32 40, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 40]
!83 = metadata !{i32 786443, metadata !1, metadata !4, i32 40, i32 4, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\DCremove.c]
!84 = metadata !{i32 40, i32 14, metadata !83, null}
!85 = metadata !{i32 40, i32 8, metadata !83, null}
!86 = metadata !{i32 41, i32 7, metadata !87, null}
!87 = metadata !{i32 786443, metadata !1, metadata !83, i32 41, i32 4, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\DCremove.c]
!88 = metadata !{i32 42, i32 4, metadata !87, null}
!89 = metadata !{i32 43, i32 4, metadata !87, null}
!90 = metadata !{i32 40, i32 22, metadata !83, null}
!91 = metadata !{i32 44, i32 6, metadata !4, null}
!92 = metadata !{i32 45, i32 3, metadata !4, null}
!93 = metadata !{i32 786688, metadata !94, metadata !"j", metadata !5, i32 47, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 47]
!94 = metadata !{i32 786443, metadata !1, metadata !4, i32 47, i32 2, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\DCremove.c]
!95 = metadata !{i32 47, i32 10, metadata !94, null}
!96 = metadata !{i32 47, i32 6, metadata !94, null}
!97 = metadata !{i32 48, i32 9, metadata !98, null}
!98 = metadata !{i32 786443, metadata !1, metadata !99, i32 48, i32 9, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\DCremove.c]
!99 = metadata !{i32 786443, metadata !1, metadata !94, i32 48, i32 2, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\DCremove.c]
!100 = metadata !{i32 49, i32 4, metadata !101, null}
!101 = metadata !{i32 786443, metadata !1, metadata !98, i32 49, i32 3, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\DCremove.c]
!102 = metadata !{i32 49, i32 37, metadata !101, null}
!103 = metadata !{i32 50, i32 9, metadata !104, null}
!104 = metadata !{i32 786443, metadata !1, metadata !99, i32 50, i32 9, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\DCremove.c]
!105 = metadata !{i32 51, i32 4, metadata !106, null}
!106 = metadata !{i32 786443, metadata !1, metadata !104, i32 51, i32 3, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\DCremove.c]
!107 = metadata !{i32 52, i32 3, metadata !106, null}
!108 = metadata !{i32 53, i32 2, metadata !99, null}
!109 = metadata !{i32 47, i32 32, metadata !94, null}
!110 = metadata !{i32 55, i32 1, metadata !4, null}
