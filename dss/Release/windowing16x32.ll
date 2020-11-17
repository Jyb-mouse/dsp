; ModuleID = '..\windowing16x32.c'
target datalayout = "e-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
target triple = "dsp"

%struct.cmplx16ImRe_t_ = type { i16, i16 }
%struct.cmplx32ImRe_t_ = type { i32, i32 }

@shuffle_l = global [32 x i16] [i16 32, i16 0, i16 32, i16 1, i16 32, i16 2, i16 32, i16 3, i16 32, i16 4, i16 32, i16 5, i16 32, i16 6, i16 32, i16 7, i16 32, i16 8, i16 32, i16 9, i16 32, i16 10, i16 32, i16 11, i16 32, i16 12, i16 32, i16 13, i16 32, i16 14, i16 32, i16 15], align 2
@shuffle_h = global [32 x i16] [i16 32, i16 16, i16 32, i16 17, i16 32, i16 18, i16 32, i16 19, i16 32, i16 20, i16 32, i16 21, i16 32, i16 22, i16 32, i16 23, i16 32, i16 24, i16 32, i16 25, i16 32, i16 26, i16 32, i16 27, i16 32, i16 28, i16 32, i16 29, i16 32, i16 30, i16 32, i16 31], align 2
@shuffle_x2_l = global [32 x i16] [i16 0, i16 1, i16 0, i16 1, i16 2, i16 3, i16 2, i16 3, i16 4, i16 5, i16 4, i16 5, i16 6, i16 7, i16 6, i16 7, i16 8, i16 9, i16 8, i16 9, i16 10, i16 11, i16 10, i16 11, i16 12, i16 13, i16 12, i16 13, i16 14, i16 15, i16 14, i16 15], align 2
@shuffle_x2_h = global [32 x i16] [i16 16, i16 17, i16 16, i16 17, i16 18, i16 19, i16 18, i16 19, i16 20, i16 21, i16 20, i16 21, i16 22, i16 23, i16 22, i16 23, i16 24, i16 25, i16 24, i16 25, i16 26, i16 27, i16 26, i16 27, i16 28, i16 29, i16 28, i16 29, i16 30, i16 31, i16 30, i16 31], align 2

; Function Attrs: nounwind
define void @windowing_16x32(%struct.cmplx16ImRe_t_* %inp, i32* %win, %struct.cmplx32ImRe_t_* %out, i32 %len) #0 {
entry:
  %retval.i = alloca i32, align 4, !dbg !46
  %vpnum.addr.i = alloca i32, align 4, !dbg !46
  %vpsel.i = alloca i32*, align 4, !dbg !46
  %inp.addr = alloca %struct.cmplx16ImRe_t_*, align 4
  %win.addr = alloca i32*, align 4
  %out.addr = alloca %struct.cmplx32ImRe_t_*, align 4
  %len.addr = alloca i32, align 4
  %q = alloca i32, align 4
  %i = alloca i32, align 4
  store %struct.cmplx16ImRe_t_* %inp, %struct.cmplx16ImRe_t_** %inp.addr, align 4
  call void @llvm.dbg.declare(metadata !{%struct.cmplx16ImRe_t_** %inp.addr}, metadata !47), !dbg !48
  store i32* %win, i32** %win.addr, align 4
  call void @llvm.dbg.declare(metadata !{i32** %win.addr}, metadata !49), !dbg !50
  store %struct.cmplx32ImRe_t_* %out, %struct.cmplx32ImRe_t_** %out.addr, align 4
  call void @llvm.dbg.declare(metadata !{%struct.cmplx32ImRe_t_** %out.addr}, metadata !51), !dbg !52
  store i32 %len, i32* %len.addr, align 4
  call void @llvm.dbg.declare(metadata !{i32* %len.addr}, metadata !53), !dbg !54
  call void @llvm.dbg.declare(metadata !{i32* %q}, metadata !55), !dbg !56
  %0 = load i32* %len.addr, align 4, !dbg !57
  %div = sdiv i32 %0, 16, !dbg !57
  store i32 %div, i32* %q, align 4, !dbg !57
  store i32 1, i32* %vpnum.addr.i, align 4, !dbg !46
  call void @llvm.dbg.declare(metadata !{i32* %vpnum.addr.i}, metadata !58), !dbg !59
  call void @llvm.dbg.declare(metadata !{i32** %vpsel.i}, metadata !60), !dbg !64
  store i32* inttoptr (i32 8336896 to i32*), i32** %vpsel.i, align 4, !dbg !65
  %1 = load i32* %vpnum.addr.i, align 4, !dbg !66
  switch i32 %1, label %sw.default.i [
    i32 0, label %sw.bb.i
    i32 1, label %sw.bb1.i
    i32 2, label %sw.bb2.i
    i32 3, label %sw.bb3.i
    i32 4, label %sw.bb4.i
  ], !dbg !66

sw.bb.i:                                          ; preds = %entry
  %2 = load i32** %vpsel.i, align 4, !dbg !67
  store i32 0, i32* %2, align 4, !dbg !67
  br label %sw.epilog.i, !dbg !69

sw.bb1.i:                                         ; preds = %entry
  %3 = load i32** %vpsel.i, align 4, !dbg !70
  store i32 1, i32* %3, align 4, !dbg !70
  br label %sw.epilog.i, !dbg !71

sw.bb2.i:                                         ; preds = %entry
  %4 = load i32** %vpsel.i, align 4, !dbg !72
  store i32 3, i32* %4, align 4, !dbg !72
  br label %sw.epilog.i, !dbg !73

sw.bb3.i:                                         ; preds = %entry
  %5 = load i32** %vpsel.i, align 4, !dbg !74
  store i32 7, i32* %5, align 4, !dbg !74
  br label %sw.epilog.i, !dbg !75

sw.bb4.i:                                         ; preds = %entry
  %6 = load i32** %vpsel.i, align 4, !dbg !76
  store i32 15, i32* %6, align 4, !dbg !76
  br label %sw.epilog.i, !dbg !77

sw.default.i:                                     ; preds = %entry
  store i32 -1, i32* %retval.i, !dbg !78
  br label %set_vpsel.exit, !dbg !78

sw.epilog.i:                                      ; preds = %sw.bb4.i, %sw.bb3.i, %sw.bb2.i, %sw.bb1.i, %sw.bb.i
  store i32 1, i32* %retval.i, !dbg !79
  br label %set_vpsel.exit, !dbg !79

set_vpsel.exit:                                   ; preds = %sw.default.i, %sw.epilog.i
  %7 = load i32* %retval.i, !dbg !80
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !81), !dbg !83
  store i32 0, i32* %i, align 4, !dbg !84
  br label %for.cond, !dbg !84

for.cond:                                         ; preds = %for.inc, %set_vpsel.exit
  %8 = load i32* %i, align 4, !dbg !84
  %9 = load i32* %q, align 4, !dbg !84
  %cmp = icmp slt i32 %8, %9, !dbg !84
  br i1 %cmp, label %for.body, label %for.end, !dbg !84

for.body:                                         ; preds = %for.cond
  %10 = load i32* %i, align 4, !dbg !85
  %mul = mul nsw i32 %10, 16, !dbg !85
  %11 = load %struct.cmplx16ImRe_t_** %inp.addr, align 4, !dbg !85
  %arrayidx = getelementptr inbounds %struct.cmplx16ImRe_t_* %11, i32 %mul, !dbg !85
  %12 = load i32* %i, align 4, !dbg !85
  %mul1 = mul nsw i32 %12, 16, !dbg !85
  %13 = load i32** %win.addr, align 4, !dbg !85
  %arrayidx2 = getelementptr inbounds i32* %13, i32 %mul1, !dbg !85
  %14 = load i32* %i, align 4, !dbg !85
  %mul3 = mul nsw i32 %14, 16, !dbg !85
  %15 = load %struct.cmplx32ImRe_t_** %out.addr, align 4, !dbg !85
  %arrayidx4 = getelementptr inbounds %struct.cmplx32ImRe_t_* %15, i32 %mul3, !dbg !85
  call void @windowing16x32_asm(%struct.cmplx16ImRe_t_* %arrayidx, i32* %arrayidx2, %struct.cmplx32ImRe_t_* %arrayidx4, i16* getelementptr inbounds ([32 x i16]* @shuffle_l, i32 0, i32 0), i16* getelementptr inbounds ([32 x i16]* @shuffle_h, i32 0, i32 0), i16* getelementptr inbounds ([32 x i16]* @shuffle_x2_l, i32 0, i32 0), i16* getelementptr inbounds ([32 x i16]* @shuffle_x2_h, i32 0, i32 0)), !dbg !85
  br label %for.inc, !dbg !87

for.inc:                                          ; preds = %for.body
  %16 = load i32* %i, align 4, !dbg !88
  %inc = add nsw i32 %16, 1, !dbg !88
  store i32 %inc, i32* %i, align 4, !dbg !88
  br label %for.cond, !dbg !88

for.end:                                          ; preds = %for.cond
  ret void, !dbg !89
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

declare void @windowing16x32_asm(%struct.cmplx16ImRe_t_*, i32*, %struct.cmplx32ImRe_t_*, i16*, i16*, i16*, i16*) #2

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!43, !44}
!llvm.ident = !{!45}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.0 (tags/RELEASE_350/final)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !35, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [D:\eclipse\workspace\dss\Release/..\windowing16x32.c] [DW_LANG_C99]
!1 = metadata !{metadata !"..\5Cwindowing16x32.c", metadata !"D:\5Ceclipse\5Cworkspace\5Cdss\5CRelease"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !30}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"windowing_16x32", metadata !"windowing_16x32", metadata !"", i32 23, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.cmplx16ImRe_t_*, i32*, %struct.cmplx32ImRe_t_*, i32)* @windowing_16x32, null, null, metadata !2, i32 23} ; [ DW_TAG_subprogram ] [line 23] [def] [windowing_16x32]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [D:\eclipse\workspace\dss\Release/..\windowing16x32.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{null, metadata !8, metadata !19, metadata !22, metadata !21}
!8 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 32, i64 32, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ] [line 0, size 32, align 32, offset 0] [from ]
!9 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !10} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from cmplx16ImRe_t]
!10 = metadata !{i32 786454, metadata !11, null, metadata !"cmplx16ImRe_t", i32 9, i64 0, i64 0, i64 0, i32 0, metadata !12} ; [ DW_TAG_typedef ] [cmplx16ImRe_t] [line 9, size 0, align 0, offset 0] [from cmplx16ImRe_t_]
!11 = metadata !{metadata !"../mmwave_lib.h", metadata !"D:\5Ceclipse\5Cworkspace\5Cdss\5CRelease"}
!12 = metadata !{i32 786451, metadata !11, null, metadata !"cmplx16ImRe_t_", i32 5, i64 32, i64 16, i32 0, i32 0, null, metadata !13, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [cmplx16ImRe_t_] [line 5, size 32, align 16, offset 0] [def] [from ]
!13 = metadata !{metadata !14, metadata !18}
!14 = metadata !{i32 786445, metadata !11, metadata !12, metadata !"imag", i32 7, i64 16, i64 16, i64 0, i32 0, metadata !15} ; [ DW_TAG_member ] [imag] [line 7, size 16, align 16, offset 0] [from int16_t]
!15 = metadata !{i32 786454, metadata !16, null, metadata !"int16_t", i32 31, i64 0, i64 0, i64 0, i32 0, metadata !17} ; [ DW_TAG_typedef ] [int16_t] [line 31, size 0, align 0, offset 0] [from short]
!16 = metadata !{metadata !"D:\5CCIC\5CSwift_IDE_Toolchain\5Ctoolchain_8slot\5Cinclude\5Ctypes/int16_t.h", metadata !"D:\5Ceclipse\5Cworkspace\5Cdss\5CRelease"}
!17 = metadata !{i32 786468, null, null, metadata !"short", i32 0, i64 16, i64 16, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [short] [line 0, size 16, align 16, offset 0, enc DW_ATE_signed]
!18 = metadata !{i32 786445, metadata !11, metadata !12, metadata !"real", i32 8, i64 16, i64 16, i64 16, i32 0, metadata !15} ; [ DW_TAG_member ] [real] [line 8, size 16, align 16, offset 16] [from int16_t]
!19 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 32, i64 32, i64 0, i32 0, metadata !20} ; [ DW_TAG_pointer_type ] [line 0, size 32, align 32, offset 0] [from ]
!20 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !21} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from int]
!21 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!22 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 32, i64 32, i64 0, i32 0, metadata !23} ; [ DW_TAG_pointer_type ] [line 0, size 32, align 32, offset 0] [from cmplx32ImRe_t]
!23 = metadata !{i32 786454, metadata !11, null, metadata !"cmplx32ImRe_t", i32 19, i64 0, i64 0, i64 0, i32 0, metadata !24} ; [ DW_TAG_typedef ] [cmplx32ImRe_t] [line 19, size 0, align 0, offset 0] [from cmplx32ImRe_t_]
!24 = metadata !{i32 786451, metadata !11, null, metadata !"cmplx32ImRe_t_", i32 15, i64 64, i64 32, i32 0, i32 0, null, metadata !25, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [cmplx32ImRe_t_] [line 15, size 64, align 32, offset 0] [def] [from ]
!25 = metadata !{metadata !26, metadata !29}
!26 = metadata !{i32 786445, metadata !11, metadata !24, metadata !"imag", i32 17, i64 32, i64 32, i64 0, i32 0, metadata !27} ; [ DW_TAG_member ] [imag] [line 17, size 32, align 32, offset 0] [from int32_t]
!27 = metadata !{i32 786454, metadata !28, null, metadata !"int32_t", i32 31, i64 0, i64 0, i64 0, i32 0, metadata !21} ; [ DW_TAG_typedef ] [int32_t] [line 31, size 0, align 0, offset 0] [from int]
!28 = metadata !{metadata !"D:\5CCIC\5CSwift_IDE_Toolchain\5Ctoolchain_8slot\5Cinclude\5Ctypes/int32_t.h", metadata !"D:\5Ceclipse\5Cworkspace\5Cdss\5CRelease"}
!29 = metadata !{i32 786445, metadata !11, metadata !24, metadata !"real", i32 18, i64 32, i64 32, i64 32, i32 0, metadata !27} ; [ DW_TAG_member ] [real] [line 18, size 32, align 32, offset 32] [from int32_t]
!30 = metadata !{i32 786478, metadata !31, metadata !32, metadata !"set_vpsel", metadata !"set_vpsel", metadata !"", i32 13, metadata !33, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !2, i32 13} ; [ DW_TAG_subprogram ] [line 13] [def] [set_vpsel]
!31 = metadata !{metadata !"D:\5CCIC\5CSwift_IDE_Toolchain\5Ctoolchain_8slot\5Cinclude\5Cswift_math.h", metadata !"D:\5Ceclipse\5Cworkspace\5Cdss\5CRelease"}
!32 = metadata !{i32 786473, metadata !31}        ; [ DW_TAG_file_type ] [D:\eclipse\workspace\dss\Release/D:\CIC\Swift_IDE_Toolchain\toolchain_8slot\include\swift_math.h]
!33 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !34, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!34 = metadata !{metadata !21, metadata !21}
!35 = metadata !{metadata !36, metadata !40, metadata !41, metadata !42}
!36 = metadata !{i32 786484, i32 0, null, metadata !"shuffle_l", metadata !"shuffle_l", metadata !"", metadata !5, i32 11, metadata !37, i32 0, i32 1, [32 x i16]* @shuffle_l, null} ; [ DW_TAG_variable ] [shuffle_l] [line 11] [def]
!37 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 512, i64 16, i32 0, i32 0, metadata !17, metadata !38, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 512, align 16, offset 0] [from short]
!38 = metadata !{metadata !39}
!39 = metadata !{i32 786465, i64 0, i64 32}       ; [ DW_TAG_subrange_type ] [0, 31]
!40 = metadata !{i32 786484, i32 0, null, metadata !"shuffle_h", metadata !"shuffle_h", metadata !"", metadata !5, i32 14, metadata !37, i32 0, i32 1, [32 x i16]* @shuffle_h, null} ; [ DW_TAG_variable ] [shuffle_h] [line 14] [def]
!41 = metadata !{i32 786484, i32 0, null, metadata !"shuffle_x2_l", metadata !"shuffle_x2_l", metadata !"", metadata !5, i32 17, metadata !37, i32 0, i32 1, [32 x i16]* @shuffle_x2_l, null} ; [ DW_TAG_variable ] [shuffle_x2_l] [line 17] [def]
!42 = metadata !{i32 786484, i32 0, null, metadata !"shuffle_x2_h", metadata !"shuffle_x2_h", metadata !"", metadata !5, i32 20, metadata !37, i32 0, i32 1, [32 x i16]* @shuffle_x2_h, null} ; [ DW_TAG_variable ] [shuffle_x2_h] [line 20] [def]
!43 = metadata !{i32 2, metadata !"Dwarf Version", i32 2}
!44 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!45 = metadata !{metadata !"clang version 3.5.0 (tags/RELEASE_350/final)"}
!46 = metadata !{i32 26, i32 2, metadata !4, null}
!47 = metadata !{i32 786689, metadata !4, metadata !"inp", metadata !5, i32 16777239, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [inp] [line 23]
!48 = metadata !{i32 23, i32 43, metadata !4, null}
!49 = metadata !{i32 786689, metadata !4, metadata !"win", metadata !5, i32 33554455, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [win] [line 23]
!50 = metadata !{i32 23, i32 59, metadata !4, null}
!51 = metadata !{i32 786689, metadata !4, metadata !"out", metadata !5, i32 50331671, metadata !22, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [out] [line 23]
!52 = metadata !{i32 23, i32 79, metadata !4, null}
!53 = metadata !{i32 786689, metadata !4, metadata !"len", metadata !5, i32 67108887, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 23]
!54 = metadata !{i32 23, i32 88, metadata !4, null}
!55 = metadata !{i32 786688, metadata !4, metadata !"q", metadata !5, i32 25, metadata !21, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [q] [line 25]
!56 = metadata !{i32 25, i32 6, metadata !4, null}
!57 = metadata !{i32 25, i32 2, metadata !4, null}
!58 = metadata !{i32 786689, metadata !30, metadata !"vpnum", metadata !32, i32 16777229, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [vpnum] [line 13]
!59 = metadata !{i32 13, i32 26, metadata !30, metadata !46}
!60 = metadata !{i32 786688, metadata !30, metadata !"vpsel", metadata !32, i32 14, metadata !61, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [vpsel] [line 14]
!61 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !62} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!62 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 32, i64 32, i64 0, i32 0, metadata !63} ; [ DW_TAG_pointer_type ] [line 0, size 32, align 32, offset 0] [from unsigned int]
!63 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!64 = metadata !{i32 14, i32 23, metadata !30, metadata !46}
!65 = metadata !{i32 14, i32 2, metadata !30, metadata !46}
!66 = metadata !{i32 15, i32 2, metadata !30, metadata !46}
!67 = metadata !{i32 16, i32 10, metadata !68, metadata !46}
!68 = metadata !{i32 786443, metadata !31, metadata !30, i32 15, i32 15, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/D:\CIC\Swift_IDE_Toolchain\toolchain_8slot\include\swift_math.h]
!69 = metadata !{i32 16, i32 23, metadata !68, metadata !46}
!70 = metadata !{i32 17, i32 10, metadata !68, metadata !46}
!71 = metadata !{i32 17, i32 23, metadata !68, metadata !46}
!72 = metadata !{i32 18, i32 10, metadata !68, metadata !46}
!73 = metadata !{i32 18, i32 23, metadata !68, metadata !46}
!74 = metadata !{i32 19, i32 10, metadata !68, metadata !46}
!75 = metadata !{i32 19, i32 23, metadata !68, metadata !46}
!76 = metadata !{i32 20, i32 10, metadata !68, metadata !46}
!77 = metadata !{i32 20, i32 23, metadata !68, metadata !46}
!78 = metadata !{i32 22, i32 3, metadata !68, metadata !46}
!79 = metadata !{i32 24, i32 2, metadata !30, metadata !46}
!80 = metadata !{i32 25, i32 1, metadata !30, metadata !46}
!81 = metadata !{i32 786688, metadata !82, metadata !"i", metadata !5, i32 27, metadata !21, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 27]
!82 = metadata !{i32 786443, metadata !1, metadata !4, i32 27, i32 2, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\windowing16x32.c]
!83 = metadata !{i32 27, i32 11, metadata !82, null}
!84 = metadata !{i32 27, i32 7, metadata !82, null}
!85 = metadata !{i32 28, i32 3, metadata !86, null}
!86 = metadata !{i32 786443, metadata !1, metadata !82, i32 27, i32 30, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\windowing16x32.c]
!87 = metadata !{i32 29, i32 2, metadata !86, null}
!88 = metadata !{i32 27, i32 25, metadata !82, null}
!89 = metadata !{i32 31, i32 1, metadata !4, null}
