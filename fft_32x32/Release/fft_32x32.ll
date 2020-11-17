; ModuleID = '..\fft_32x32.c'
target datalayout = "e-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
target triple = "dsp"

@dbg_addr = constant i32* inttoptr (i64 2684354560 to i32*), align 4

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
  call void @llvm.dbg.declare(metadata !{i8** %base.addr}, metadata !23), !dbg !24
  store i32 %num, i32* %num.addr, align 4
  call void @llvm.dbg.declare(metadata !{i32* %num.addr}, metadata !25), !dbg !26
  store i32 %wid, i32* %wid.addr, align 4
  call void @llvm.dbg.declare(metadata !{i32* %wid.addr}, metadata !27), !dbg !28
  %0 = load i32* %wid.addr, align 4, !dbg !29
  switch i32 %0, label %sw.default [
    i32 1, label %sw.bb
    i32 2, label %sw.bb1
    i32 4, label %sw.bb12
  ], !dbg !29

sw.bb:                                            ; preds = %entry
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !30), !dbg !33
  store i32 0, i32* %i, align 4, !dbg !34
  br label %for.cond, !dbg !34

for.cond:                                         ; preds = %for.inc, %sw.bb
  %1 = load i32* %i, align 4, !dbg !34
  %2 = load i32* %num.addr, align 4, !dbg !34
  %cmp = icmp slt i32 %1, %2, !dbg !34
  br i1 %cmp, label %for.body, label %for.end, !dbg !34

for.body:                                         ; preds = %for.cond
  %3 = load i32* %i, align 4, !dbg !35
  %4 = load i8** %base.addr, align 4, !dbg !35
  %arrayidx = getelementptr inbounds i8* %4, i32 %3, !dbg !35
  %5 = load i8* %arrayidx, align 1, !dbg !35
  %conv = sext i8 %5 to i32, !dbg !35
  %6 = load i32** @dbg_addr, align 4, !dbg !35
  store i32 %conv, i32* %6, align 4, !dbg !35
  br label %for.inc, !dbg !35

for.inc:                                          ; preds = %for.body
  %7 = load i32* %i, align 4, !dbg !36
  %inc = add nsw i32 %7, 1, !dbg !36
  store i32 %inc, i32* %i, align 4, !dbg !36
  br label %for.cond, !dbg !36

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %retval, !dbg !37
  br label %return, !dbg !37

sw.bb1:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata !{i32* %i2}, metadata !38), !dbg !40
  store i32 0, i32* %i2, align 4, !dbg !41
  br label %for.cond3, !dbg !41

for.cond3:                                        ; preds = %for.inc9, %sw.bb1
  %8 = load i32* %i2, align 4, !dbg !41
  %9 = load i32* %num.addr, align 4, !dbg !41
  %cmp4 = icmp slt i32 %8, %9, !dbg !41
  br i1 %cmp4, label %for.body6, label %for.end11, !dbg !41

for.body6:                                        ; preds = %for.cond3
  %10 = load i32* %i2, align 4, !dbg !42
  %11 = load i8** %base.addr, align 4, !dbg !42
  %12 = bitcast i8* %11 to i16*, !dbg !42
  %arrayidx7 = getelementptr inbounds i16* %12, i32 %10, !dbg !42
  %13 = load i16* %arrayidx7, align 2, !dbg !42
  %conv8 = sext i16 %13 to i32, !dbg !42
  %14 = load i32** @dbg_addr, align 4, !dbg !42
  store i32 %conv8, i32* %14, align 4, !dbg !42
  br label %for.inc9, !dbg !42

for.inc9:                                         ; preds = %for.body6
  %15 = load i32* %i2, align 4, !dbg !43
  %inc10 = add nsw i32 %15, 1, !dbg !43
  store i32 %inc10, i32* %i2, align 4, !dbg !43
  br label %for.cond3, !dbg !43

for.end11:                                        ; preds = %for.cond3
  store i32 0, i32* %retval, !dbg !44
  br label %return, !dbg !44

sw.bb12:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata !{i32* %i13}, metadata !45), !dbg !47
  store i32 0, i32* %i13, align 4, !dbg !48
  br label %for.cond14, !dbg !48

for.cond14:                                       ; preds = %for.inc19, %sw.bb12
  %16 = load i32* %i13, align 4, !dbg !48
  %17 = load i32* %num.addr, align 4, !dbg !48
  %cmp15 = icmp slt i32 %16, %17, !dbg !48
  br i1 %cmp15, label %for.body17, label %for.end21, !dbg !48

for.body17:                                       ; preds = %for.cond14
  %18 = load i32* %i13, align 4, !dbg !49
  %19 = load i8** %base.addr, align 4, !dbg !49
  %20 = bitcast i8* %19 to i32*, !dbg !49
  %arrayidx18 = getelementptr inbounds i32* %20, i32 %18, !dbg !49
  %21 = load i32* %arrayidx18, align 4, !dbg !49
  %22 = load i32** @dbg_addr, align 4, !dbg !49
  store i32 %21, i32* %22, align 4, !dbg !49
  br label %for.inc19, !dbg !49

for.inc19:                                        ; preds = %for.body17
  %23 = load i32* %i13, align 4, !dbg !50
  %inc20 = add nsw i32 %23, 1, !dbg !50
  store i32 %inc20, i32* %i13, align 4, !dbg !50
  br label %for.cond14, !dbg !50

for.end21:                                        ; preds = %for.cond14
  store i32 0, i32* %retval, !dbg !51
  br label %return, !dbg !51

sw.default:                                       ; preds = %entry
  store i32 -1, i32* %retval, !dbg !52
  br label %return, !dbg !52

return:                                           ; preds = %sw.default, %for.end21, %for.end11, %for.end
  %24 = load i32* %retval, !dbg !53
  ret i32 %24, !dbg !53
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %num = alloca i32, align 4
  %a = alloca i64, align 8
  %b = alloca i64, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  call void @llvm.dbg.declare(metadata !{i32* %num}, metadata !54), !dbg !55
  store i32 1, i32* %num, align 4, !dbg !56
  call void @llvm.dbg.declare(metadata !{i64* %a}, metadata !57), !dbg !59
  store i64 1, i64* %a, align 8, !dbg !60
  call void @llvm.dbg.declare(metadata !{i64* %b}, metadata !61), !dbg !62
  store i64 2, i64* %b, align 8, !dbg !63
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !64), !dbg !66
  store i32 0, i32* %i, align 4, !dbg !67
  br label %for.cond, !dbg !67

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4, !dbg !67
  %cmp = icmp slt i32 %0, 10, !dbg !67
  br i1 %cmp, label %for.body, label %for.end, !dbg !67

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4, !dbg !68
  %2 = load i32* %num, align 4, !dbg !68
  %add = add nsw i32 %2, %1, !dbg !68
  store i32 %add, i32* %num, align 4, !dbg !68
  br label %for.inc, !dbg !70

for.inc:                                          ; preds = %for.body
  %3 = load i32* %i, align 4, !dbg !71
  %inc = add nsw i32 %3, 1, !dbg !71
  store i32 %inc, i32* %i, align 4, !dbg !71
  br label %for.cond, !dbg !71

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !72
}

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!20, !21}
!llvm.ident = !{!22}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.0 (tags/RELEASE_350/final)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !15, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [D:\eclipse\workspace\fft_32x32\Release/..\fft_32x32.c] [DW_LANG_C99]
!1 = metadata !{metadata !"..\5Cfft_32x32.c", metadata !"D:\5Ceclipse\5Cworkspace\5Cfft_32x32\5CRelease"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !11}
!4 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"dbg_output", metadata !"dbg_output", metadata !"", i32 12, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i8*, i32, i32)* @dbg_output, null, null, metadata !2, i32 12} ; [ DW_TAG_subprogram ] [line 12] [def] [dbg_output]
!5 = metadata !{metadata !"D:\5CCIC\5CSwift_IDE_Toolchain\5Ctoolchain_8slot\5Cinclude\5Cswift_debug.h", metadata !"D:\5Ceclipse\5Cworkspace\5Cfft_32x32\5CRelease"}
!6 = metadata !{i32 786473, metadata !5}          ; [ DW_TAG_file_type ] [D:\eclipse\workspace\fft_32x32\Release/D:\CIC\Swift_IDE_Toolchain\toolchain_8slot\include\swift_debug.h]
!7 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{metadata !9, metadata !10, metadata !9, metadata !9}
!9 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 32, i64 32, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 32, align 32, offset 0] [from ]
!11 = metadata !{i32 786478, metadata !1, metadata !12, metadata !"main", metadata !"main", metadata !"", i32 11, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 11} ; [ DW_TAG_subprogram ] [line 11] [def] [main]
!12 = metadata !{i32 786473, metadata !1}         ; [ DW_TAG_file_type ] [D:\eclipse\workspace\fft_32x32\Release/..\fft_32x32.c]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{metadata !9}
!15 = metadata !{metadata !16}
!16 = metadata !{i32 786484, i32 0, null, metadata !"dbg_addr", metadata !"dbg_addr", metadata !"", metadata !6, i32 4, metadata !17, i32 0, i32 1, i32** @dbg_addr, null} ; [ DW_TAG_variable ] [dbg_addr] [line 4] [def]
!17 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !18} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!18 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 32, i64 32, i64 0, i32 0, metadata !19} ; [ DW_TAG_pointer_type ] [line 0, size 32, align 32, offset 0] [from unsigned int]
!19 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!20 = metadata !{i32 2, metadata !"Dwarf Version", i32 2}
!21 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!22 = metadata !{metadata !"clang version 3.5.0 (tags/RELEASE_350/final)"}
!23 = metadata !{i32 786689, metadata !4, metadata !"base", metadata !6, i32 16777228, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [base] [line 12]
!24 = metadata !{i32 12, i32 22, metadata !4, null}
!25 = metadata !{i32 786689, metadata !4, metadata !"num", metadata !6, i32 33554444, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [num] [line 12]
!26 = metadata !{i32 12, i32 32, metadata !4, null}
!27 = metadata !{i32 786689, metadata !4, metadata !"wid", metadata !6, i32 50331660, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wid] [line 12]
!28 = metadata !{i32 12, i32 41, metadata !4, null}
!29 = metadata !{i32 13, i32 2, metadata !4, null}
!30 = metadata !{i32 786688, metadata !31, metadata !"i", metadata !6, i32 15, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 15]
!31 = metadata !{i32 786443, metadata !5, metadata !32, i32 15, i32 3, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_32x32\Release/D:\CIC\Swift_IDE_Toolchain\toolchain_8slot\include\swift_debug.h]
!32 = metadata !{i32 786443, metadata !5, metadata !4, i32 13, i32 14, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_32x32\Release/D:\CIC\Swift_IDE_Toolchain\toolchain_8slot\include\swift_debug.h]
!33 = metadata !{i32 15, i32 11, metadata !31, null}
!34 = metadata !{i32 15, i32 7, metadata !31, null}
!35 = metadata !{i32 16, i32 4, metadata !31, null}
!36 = metadata !{i32 15, i32 23, metadata !31, null}
!37 = metadata !{i32 17, i32 3, metadata !32, null}
!38 = metadata !{i32 786688, metadata !39, metadata !"i", metadata !6, i32 19, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 19]
!39 = metadata !{i32 786443, metadata !5, metadata !32, i32 19, i32 3, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_32x32\Release/D:\CIC\Swift_IDE_Toolchain\toolchain_8slot\include\swift_debug.h]
!40 = metadata !{i32 19, i32 11, metadata !39, null}
!41 = metadata !{i32 19, i32 7, metadata !39, null}
!42 = metadata !{i32 20, i32 4, metadata !39, null}
!43 = metadata !{i32 19, i32 23, metadata !39, null}
!44 = metadata !{i32 21, i32 3, metadata !32, null}
!45 = metadata !{i32 786688, metadata !46, metadata !"i", metadata !6, i32 23, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 23]
!46 = metadata !{i32 786443, metadata !5, metadata !32, i32 23, i32 3, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_32x32\Release/D:\CIC\Swift_IDE_Toolchain\toolchain_8slot\include\swift_debug.h]
!47 = metadata !{i32 23, i32 11, metadata !46, null}
!48 = metadata !{i32 23, i32 7, metadata !46, null}
!49 = metadata !{i32 24, i32 4, metadata !46, null}
!50 = metadata !{i32 23, i32 23, metadata !46, null}
!51 = metadata !{i32 25, i32 3, metadata !32, null}
!52 = metadata !{i32 27, i32 3, metadata !32, null}
!53 = metadata !{i32 29, i32 1, metadata !4, null}
!54 = metadata !{i32 786688, metadata !11, metadata !"num", metadata !12, i32 12, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [num] [line 12]
!55 = metadata !{i32 12, i32 6, metadata !11, null}
!56 = metadata !{i32 12, i32 2, metadata !11, null}
!57 = metadata !{i32 786688, metadata !11, metadata !"a", metadata !12, i32 14, metadata !58, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 14]
!58 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!59 = metadata !{i32 14, i32 12, metadata !11, null}
!60 = metadata !{i32 14, i32 2, metadata !11, null}
!61 = metadata !{i32 786688, metadata !11, metadata !"b", metadata !12, i32 15, metadata !58, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 15]
!62 = metadata !{i32 15, i32 12, metadata !11, null}
!63 = metadata !{i32 15, i32 2, metadata !11, null}
!64 = metadata !{i32 786688, metadata !65, metadata !"i", metadata !12, i32 17, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 17]
!65 = metadata !{i32 786443, metadata !1, metadata !11, i32 17, i32 2, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_32x32\Release/..\fft_32x32.c]
!66 = metadata !{i32 17, i32 10, metadata !65, null}
!67 = metadata !{i32 17, i32 6, metadata !65, null}
!68 = metadata !{i32 18, i32 3, metadata !69, null}
!69 = metadata !{i32 786443, metadata !1, metadata !65, i32 17, i32 28, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\fft_32x32\Release/..\fft_32x32.c]
!70 = metadata !{i32 19, i32 2, metadata !69, null}
!71 = metadata !{i32 17, i32 24, metadata !65, null}
!72 = metadata !{i32 21, i32 2, metadata !11, null}
