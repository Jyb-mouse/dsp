; ModuleID = '..\rotation_factor.c'
target datalayout = "e-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
target triple = "dsp"

@dbg_addr = constant i32* inttoptr (i64 2684354560 to i32*), align 4
@m = global [32 x i16] [i16 0, i16 1, i16 4, i16 5, i16 8, i16 9, i16 12, i16 13, i16 16, i16 17, i16 20, i16 21, i16 24, i16 25, i16 28, i16 29, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32], align 2
@f = global [32 x i16] [i16 0, i16 1, i16 4, i16 5, i16 8, i16 9, i16 12, i16 13, i16 16, i16 17, i16 20, i16 21, i16 24, i16 25, i16 28, i16 29, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32, i16 32], align 2

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
  call void @llvm.dbg.declare(metadata !{i8** %base.addr}, metadata !34), !dbg !35
  store i32 %num, i32* %num.addr, align 4
  call void @llvm.dbg.declare(metadata !{i32* %num.addr}, metadata !36), !dbg !37
  store i32 %wid, i32* %wid.addr, align 4
  call void @llvm.dbg.declare(metadata !{i32* %wid.addr}, metadata !38), !dbg !39
  %0 = load i32* %wid.addr, align 4, !dbg !40
  switch i32 %0, label %sw.default [
    i32 1, label %sw.bb
    i32 2, label %sw.bb1
    i32 4, label %sw.bb12
  ], !dbg !40

sw.bb:                                            ; preds = %entry
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !41), !dbg !44
  store i32 0, i32* %i, align 4, !dbg !45
  br label %for.cond, !dbg !45

for.cond:                                         ; preds = %for.inc, %sw.bb
  %1 = load i32* %i, align 4, !dbg !45
  %2 = load i32* %num.addr, align 4, !dbg !45
  %cmp = icmp slt i32 %1, %2, !dbg !45
  br i1 %cmp, label %for.body, label %for.end, !dbg !45

for.body:                                         ; preds = %for.cond
  %3 = load i32* %i, align 4, !dbg !46
  %4 = load i8** %base.addr, align 4, !dbg !46
  %arrayidx = getelementptr inbounds i8* %4, i32 %3, !dbg !46
  %5 = load i8* %arrayidx, align 1, !dbg !46
  %conv = sext i8 %5 to i32, !dbg !46
  %6 = load i32** @dbg_addr, align 4, !dbg !46
  store i32 %conv, i32* %6, align 4, !dbg !46
  br label %for.inc, !dbg !46

for.inc:                                          ; preds = %for.body
  %7 = load i32* %i, align 4, !dbg !47
  %inc = add nsw i32 %7, 1, !dbg !47
  store i32 %inc, i32* %i, align 4, !dbg !47
  br label %for.cond, !dbg !47

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %retval, !dbg !48
  br label %return, !dbg !48

sw.bb1:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata !{i32* %i2}, metadata !49), !dbg !51
  store i32 0, i32* %i2, align 4, !dbg !52
  br label %for.cond3, !dbg !52

for.cond3:                                        ; preds = %for.inc9, %sw.bb1
  %8 = load i32* %i2, align 4, !dbg !52
  %9 = load i32* %num.addr, align 4, !dbg !52
  %cmp4 = icmp slt i32 %8, %9, !dbg !52
  br i1 %cmp4, label %for.body6, label %for.end11, !dbg !52

for.body6:                                        ; preds = %for.cond3
  %10 = load i32* %i2, align 4, !dbg !53
  %11 = load i8** %base.addr, align 4, !dbg !53
  %12 = bitcast i8* %11 to i16*, !dbg !53
  %arrayidx7 = getelementptr inbounds i16* %12, i32 %10, !dbg !53
  %13 = load i16* %arrayidx7, align 2, !dbg !53
  %conv8 = sext i16 %13 to i32, !dbg !53
  %14 = load i32** @dbg_addr, align 4, !dbg !53
  store i32 %conv8, i32* %14, align 4, !dbg !53
  br label %for.inc9, !dbg !53

for.inc9:                                         ; preds = %for.body6
  %15 = load i32* %i2, align 4, !dbg !54
  %inc10 = add nsw i32 %15, 1, !dbg !54
  store i32 %inc10, i32* %i2, align 4, !dbg !54
  br label %for.cond3, !dbg !54

for.end11:                                        ; preds = %for.cond3
  store i32 0, i32* %retval, !dbg !55
  br label %return, !dbg !55

sw.bb12:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata !{i32* %i13}, metadata !56), !dbg !58
  store i32 0, i32* %i13, align 4, !dbg !59
  br label %for.cond14, !dbg !59

for.cond14:                                       ; preds = %for.inc19, %sw.bb12
  %16 = load i32* %i13, align 4, !dbg !59
  %17 = load i32* %num.addr, align 4, !dbg !59
  %cmp15 = icmp slt i32 %16, %17, !dbg !59
  br i1 %cmp15, label %for.body17, label %for.end21, !dbg !59

for.body17:                                       ; preds = %for.cond14
  %18 = load i32* %i13, align 4, !dbg !60
  %19 = load i8** %base.addr, align 4, !dbg !60
  %20 = bitcast i8* %19 to i32*, !dbg !60
  %arrayidx18 = getelementptr inbounds i32* %20, i32 %18, !dbg !60
  %21 = load i32* %arrayidx18, align 4, !dbg !60
  %22 = load i32** @dbg_addr, align 4, !dbg !60
  store i32 %21, i32* %22, align 4, !dbg !60
  br label %for.inc19, !dbg !60

for.inc19:                                        ; preds = %for.body17
  %23 = load i32* %i13, align 4, !dbg !61
  %inc20 = add nsw i32 %23, 1, !dbg !61
  store i32 %inc20, i32* %i13, align 4, !dbg !61
  br label %for.cond14, !dbg !61

for.end21:                                        ; preds = %for.cond14
  store i32 0, i32* %retval, !dbg !62
  br label %return, !dbg !62

sw.default:                                       ; preds = %entry
  store i32 -1, i32* %retval, !dbg !63
  br label %return, !dbg !63

return:                                           ; preds = %sw.default, %for.end21, %for.end11, %for.end
  %24 = load i32* %retval, !dbg !64
  ret i32 %24, !dbg !64
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %retval.i = alloca i32, align 4, !dbg !65
  %vpnum.addr.i = alloca i32, align 4, !dbg !65
  %vpsel.i = alloca i32*, align 4, !dbg !65
  %retval = alloca i32, align 4
  %n2 = alloca i32, align 4
  %step = alloca i32, align 4
  %p = alloca i32, align 4
  store i32 0, i32* %retval
  call void @llvm.dbg.declare(metadata !{i32* %n2}, metadata !68), !dbg !69
  store i32 16, i32* %n2, align 4, !dbg !70
  %0 = load i32* %n2, align 4, !dbg !71
  %cmp = icmp sge i32 %0, 16, !dbg !71
  br i1 %cmp, label %if.then, label %if.end, !dbg !71

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata !{i32* %step}, metadata !72), !dbg !73
  store i32 0, i32* %step, align 4, !dbg !74
  store i32 1, i32* %vpnum.addr.i, align 4, !dbg !65
  call void @llvm.dbg.declare(metadata !{i32* %vpnum.addr.i}, metadata !75), !dbg !76
  call void @llvm.dbg.declare(metadata !{i32** %vpsel.i}, metadata !77), !dbg !78
  store i32* inttoptr (i32 8336896 to i32*), i32** %vpsel.i, align 4, !dbg !79
  %1 = load i32* %vpnum.addr.i, align 4, !dbg !80
  switch i32 %1, label %sw.default.i [
    i32 0, label %sw.bb.i
    i32 1, label %sw.bb1.i
    i32 2, label %sw.bb2.i
    i32 3, label %sw.bb3.i
    i32 4, label %sw.bb4.i
  ], !dbg !80

sw.bb.i:                                          ; preds = %if.then
  %2 = load i32** %vpsel.i, align 4, !dbg !81
  store i32 0, i32* %2, align 4, !dbg !81
  br label %sw.epilog.i, !dbg !83

sw.bb1.i:                                         ; preds = %if.then
  %3 = load i32** %vpsel.i, align 4, !dbg !84
  store i32 1, i32* %3, align 4, !dbg !84
  br label %sw.epilog.i, !dbg !85

sw.bb2.i:                                         ; preds = %if.then
  %4 = load i32** %vpsel.i, align 4, !dbg !86
  store i32 3, i32* %4, align 4, !dbg !86
  br label %sw.epilog.i, !dbg !87

sw.bb3.i:                                         ; preds = %if.then
  %5 = load i32** %vpsel.i, align 4, !dbg !88
  store i32 7, i32* %5, align 4, !dbg !88
  br label %sw.epilog.i, !dbg !89

sw.bb4.i:                                         ; preds = %if.then
  %6 = load i32** %vpsel.i, align 4, !dbg !90
  store i32 15, i32* %6, align 4, !dbg !90
  br label %sw.epilog.i, !dbg !91

sw.default.i:                                     ; preds = %if.then
  store i32 -1, i32* %retval.i, !dbg !92
  br label %set_vpsel.exit, !dbg !92

sw.epilog.i:                                      ; preds = %sw.bb4.i, %sw.bb3.i, %sw.bb2.i, %sw.bb1.i, %sw.bb.i
  store i32 1, i32* %retval.i, !dbg !93
  br label %set_vpsel.exit, !dbg !93

set_vpsel.exit:                                   ; preds = %sw.default.i, %sw.epilog.i
  %7 = load i32* %retval.i, !dbg !94
  call void @llvm.dbg.declare(metadata !{i32* %p}, metadata !95), !dbg !97
  store i32 0, i32* %p, align 4, !dbg !98
  br label %for.cond, !dbg !98

for.cond:                                         ; preds = %for.inc, %set_vpsel.exit
  %8 = load i32* %p, align 4, !dbg !98
  %9 = load i32* %n2, align 4, !dbg !98
  %cmp1 = icmp slt i32 %8, %9, !dbg !98
  br i1 %cmp1, label %for.body, label %for.end, !dbg !98

for.body:                                         ; preds = %for.cond
  %10 = load i32* %p, align 4, !dbg !99
  %mul = mul nsw i32 %10, 2, !dbg !99
  %arrayidx = getelementptr inbounds [32 x i16]* @f, i32 0, i32 %mul, !dbg !99
  %11 = load i32* %step, align 4, !dbg !99
  %arrayidx2 = getelementptr inbounds [32 x i16]* @f, i32 0, i32 %11, !dbg !99
  %call3 = call signext i16 @vmac_rotation_factor(i16* %arrayidx, i16* getelementptr inbounds ([32 x i16]* @m, i32 0, i32 0), i16* %arrayidx2), !dbg !99
  %12 = load i32* %step, align 4, !dbg !101
  %add = add nsw i32 %12, 16, !dbg !101
  store i32 %add, i32* %step, align 4, !dbg !101
  br label %for.inc, !dbg !102

for.inc:                                          ; preds = %for.body
  %13 = load i32* %p, align 4, !dbg !103
  %add4 = add nsw i32 %13, 16, !dbg !103
  store i32 %add4, i32* %p, align 4, !dbg !103
  br label %for.cond, !dbg !103

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !104

if.end:                                           ; preds = %for.end, %entry
  ret i32 0, !dbg !105
}

declare signext i16 @vmac_rotation_factor(i16*, i16*, i16*) #2

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!31, !32}
!llvm.ident = !{!33}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.0 (tags/RELEASE_350/final)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !20, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [D:\eclipse\workspace\rotation_factor\Release/..\rotation_factor.c] [DW_LANG_C99]
!1 = metadata !{metadata !"..\5Crotation_factor.c", metadata !"D:\5Ceclipse\5Cworkspace\5Crotation_factor\5CRelease"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !11, metadata !15}
!4 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"dbg_output", metadata !"dbg_output", metadata !"", i32 12, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i8*, i32, i32)* @dbg_output, null, null, metadata !2, i32 12} ; [ DW_TAG_subprogram ] [line 12] [def] [dbg_output]
!5 = metadata !{metadata !"D:\5CCIC\5CSwift_IDE_Toolchain\5Ctoolchain_8slot\5Cinclude\5Cswift_debug.h", metadata !"D:\5Ceclipse\5Cworkspace\5Crotation_factor\5CRelease"}
!6 = metadata !{i32 786473, metadata !5}          ; [ DW_TAG_file_type ] [D:\eclipse\workspace\rotation_factor\Release/D:\CIC\Swift_IDE_Toolchain\toolchain_8slot\include\swift_debug.h]
!7 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{metadata !9, metadata !10, metadata !9, metadata !9}
!9 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 32, i64 32, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 32, align 32, offset 0] [from ]
!11 = metadata !{i32 786478, metadata !1, metadata !12, metadata !"main", metadata !"main", metadata !"", i32 13, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 13} ; [ DW_TAG_subprogram ] [line 13] [def] [main]
!12 = metadata !{i32 786473, metadata !1}         ; [ DW_TAG_file_type ] [D:\eclipse\workspace\rotation_factor\Release/..\rotation_factor.c]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{metadata !9}
!15 = metadata !{i32 786478, metadata !16, metadata !17, metadata !"set_vpsel", metadata !"set_vpsel", metadata !"", i32 13, metadata !18, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !2, i32 13} ; [ DW_TAG_subprogram ] [line 13] [def] [set_vpsel]
!16 = metadata !{metadata !"D:\5CCIC\5CSwift_IDE_Toolchain\5Ctoolchain_8slot\5Cinclude\5Cswift_math.h", metadata !"D:\5Ceclipse\5Cworkspace\5Crotation_factor\5CRelease"}
!17 = metadata !{i32 786473, metadata !16}        ; [ DW_TAG_file_type ] [D:\eclipse\workspace\rotation_factor\Release/D:\CIC\Swift_IDE_Toolchain\toolchain_8slot\include\swift_math.h]
!18 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !19, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!19 = metadata !{metadata !9, metadata !9}
!20 = metadata !{metadata !21, metadata !25, metadata !30}
!21 = metadata !{i32 786484, i32 0, null, metadata !"dbg_addr", metadata !"dbg_addr", metadata !"", metadata !6, i32 4, metadata !22, i32 0, i32 1, i32** @dbg_addr, null} ; [ DW_TAG_variable ] [dbg_addr] [line 4] [def]
!22 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !23} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!23 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 32, i64 32, i64 0, i32 0, metadata !24} ; [ DW_TAG_pointer_type ] [line 0, size 32, align 32, offset 0] [from unsigned int]
!24 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!25 = metadata !{i32 786484, i32 0, null, metadata !"m", metadata !"m", metadata !"", metadata !12, i32 11, metadata !26, i32 0, i32 1, [32 x i16]* @m, null} ; [ DW_TAG_variable ] [m] [line 11] [def]
!26 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 512, i64 16, i32 0, i32 0, metadata !27, metadata !28, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 512, align 16, offset 0] [from short]
!27 = metadata !{i32 786468, null, null, metadata !"short", i32 0, i64 16, i64 16, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [short] [line 0, size 16, align 16, offset 0, enc DW_ATE_signed]
!28 = metadata !{metadata !29}
!29 = metadata !{i32 786465, i64 0, i64 32}       ; [ DW_TAG_subrange_type ] [0, 31]
!30 = metadata !{i32 786484, i32 0, null, metadata !"f", metadata !"f", metadata !"", metadata !12, i32 12, metadata !26, i32 0, i32 1, [32 x i16]* @f, null} ; [ DW_TAG_variable ] [f] [line 12] [def]
!31 = metadata !{i32 2, metadata !"Dwarf Version", i32 2}
!32 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!33 = metadata !{metadata !"clang version 3.5.0 (tags/RELEASE_350/final)"}
!34 = metadata !{i32 786689, metadata !4, metadata !"base", metadata !6, i32 16777228, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [base] [line 12]
!35 = metadata !{i32 12, i32 22, metadata !4, null}
!36 = metadata !{i32 786689, metadata !4, metadata !"num", metadata !6, i32 33554444, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [num] [line 12]
!37 = metadata !{i32 12, i32 32, metadata !4, null}
!38 = metadata !{i32 786689, metadata !4, metadata !"wid", metadata !6, i32 50331660, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wid] [line 12]
!39 = metadata !{i32 12, i32 41, metadata !4, null}
!40 = metadata !{i32 13, i32 2, metadata !4, null}
!41 = metadata !{i32 786688, metadata !42, metadata !"i", metadata !6, i32 15, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 15]
!42 = metadata !{i32 786443, metadata !5, metadata !43, i32 15, i32 3, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\rotation_factor\Release/D:\CIC\Swift_IDE_Toolchain\toolchain_8slot\include\swift_debug.h]
!43 = metadata !{i32 786443, metadata !5, metadata !4, i32 13, i32 14, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\rotation_factor\Release/D:\CIC\Swift_IDE_Toolchain\toolchain_8slot\include\swift_debug.h]
!44 = metadata !{i32 15, i32 11, metadata !42, null}
!45 = metadata !{i32 15, i32 7, metadata !42, null}
!46 = metadata !{i32 16, i32 4, metadata !42, null}
!47 = metadata !{i32 15, i32 23, metadata !42, null}
!48 = metadata !{i32 17, i32 3, metadata !43, null}
!49 = metadata !{i32 786688, metadata !50, metadata !"i", metadata !6, i32 19, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 19]
!50 = metadata !{i32 786443, metadata !5, metadata !43, i32 19, i32 3, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\rotation_factor\Release/D:\CIC\Swift_IDE_Toolchain\toolchain_8slot\include\swift_debug.h]
!51 = metadata !{i32 19, i32 11, metadata !50, null}
!52 = metadata !{i32 19, i32 7, metadata !50, null}
!53 = metadata !{i32 20, i32 4, metadata !50, null}
!54 = metadata !{i32 19, i32 23, metadata !50, null}
!55 = metadata !{i32 21, i32 3, metadata !43, null}
!56 = metadata !{i32 786688, metadata !57, metadata !"i", metadata !6, i32 23, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 23]
!57 = metadata !{i32 786443, metadata !5, metadata !43, i32 23, i32 3, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\rotation_factor\Release/D:\CIC\Swift_IDE_Toolchain\toolchain_8slot\include\swift_debug.h]
!58 = metadata !{i32 23, i32 11, metadata !57, null}
!59 = metadata !{i32 23, i32 7, metadata !57, null}
!60 = metadata !{i32 24, i32 4, metadata !57, null}
!61 = metadata !{i32 23, i32 23, metadata !57, null}
!62 = metadata !{i32 25, i32 3, metadata !43, null}
!63 = metadata !{i32 27, i32 3, metadata !43, null}
!64 = metadata !{i32 29, i32 1, metadata !4, null}
!65 = metadata !{i32 17, i32 3, metadata !66, null}
!66 = metadata !{i32 786443, metadata !1, metadata !67, i32 15, i32 12, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\rotation_factor\Release/..\rotation_factor.c]
!67 = metadata !{i32 786443, metadata !1, metadata !11, i32 15, i32 5, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\rotation_factor\Release/..\rotation_factor.c]
!68 = metadata !{i32 786688, metadata !11, metadata !"n2", metadata !12, i32 14, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n2] [line 14]
!69 = metadata !{i32 14, i32 6, metadata !11, null}
!70 = metadata !{i32 14, i32 2, metadata !11, null}
!71 = metadata !{i32 15, i32 5, metadata !67, null}
!72 = metadata !{i32 786688, metadata !66, metadata !"step", metadata !12, i32 16, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [step] [line 16]
!73 = metadata !{i32 16, i32 7, metadata !66, null}
!74 = metadata !{i32 16, i32 3, metadata !66, null}
!75 = metadata !{i32 786689, metadata !15, metadata !"vpnum", metadata !17, i32 16777229, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [vpnum] [line 13]
!76 = metadata !{i32 13, i32 26, metadata !15, metadata !65}
!77 = metadata !{i32 786688, metadata !15, metadata !"vpsel", metadata !17, i32 14, metadata !22, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [vpsel] [line 14]
!78 = metadata !{i32 14, i32 23, metadata !15, metadata !65}
!79 = metadata !{i32 14, i32 2, metadata !15, metadata !65}
!80 = metadata !{i32 15, i32 2, metadata !15, metadata !65}
!81 = metadata !{i32 16, i32 10, metadata !82, metadata !65}
!82 = metadata !{i32 786443, metadata !16, metadata !15, i32 15, i32 15, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\rotation_factor\Release/D:\CIC\Swift_IDE_Toolchain\toolchain_8slot\include\swift_math.h]
!83 = metadata !{i32 16, i32 23, metadata !82, metadata !65}
!84 = metadata !{i32 17, i32 10, metadata !82, metadata !65}
!85 = metadata !{i32 17, i32 23, metadata !82, metadata !65}
!86 = metadata !{i32 18, i32 10, metadata !82, metadata !65}
!87 = metadata !{i32 18, i32 23, metadata !82, metadata !65}
!88 = metadata !{i32 19, i32 10, metadata !82, metadata !65}
!89 = metadata !{i32 19, i32 23, metadata !82, metadata !65}
!90 = metadata !{i32 20, i32 10, metadata !82, metadata !65}
!91 = metadata !{i32 20, i32 23, metadata !82, metadata !65}
!92 = metadata !{i32 22, i32 3, metadata !82, metadata !65}
!93 = metadata !{i32 24, i32 2, metadata !15, metadata !65}
!94 = metadata !{i32 25, i32 1, metadata !15, metadata !65}
!95 = metadata !{i32 786688, metadata !96, metadata !"p", metadata !12, i32 18, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [p] [line 18]
!96 = metadata !{i32 786443, metadata !1, metadata !66, i32 18, i32 3, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\rotation_factor\Release/..\rotation_factor.c]
!97 = metadata !{i32 18, i32 11, metadata !96, null}
!98 = metadata !{i32 18, i32 7, metadata !96, null}
!99 = metadata !{i32 19, i32 4, metadata !100, null}
!100 = metadata !{i32 786443, metadata !1, metadata !96, i32 18, i32 34, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\rotation_factor\Release/..\rotation_factor.c]
!101 = metadata !{i32 20, i32 4, metadata !100, null}
!102 = metadata !{i32 21, i32 3, metadata !100, null}
!103 = metadata !{i32 18, i32 26, metadata !96, null}
!104 = metadata !{i32 22, i32 2, metadata !66, null}
!105 = metadata !{i32 23, i32 2, metadata !11, null}
