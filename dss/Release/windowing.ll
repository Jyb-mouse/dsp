; ModuleID = '..\windowing.c'
target datalayout = "e-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
target triple = "dsp"

%struct.cmplx16ImRe_t_ = type { i16, i16 }

; Function Attrs: nounwind
define void @windowing(%struct.cmplx16ImRe_t_* %fftSrcAddr, i16* %window, i32 %len) #0 {
entry:
  %fftSrcAddr.addr = alloca %struct.cmplx16ImRe_t_*, align 4
  %window.addr = alloca i16*, align 4
  %len.addr = alloca i32, align 4
  %q = alloca i32, align 4
  %i = alloca i32, align 4
  store %struct.cmplx16ImRe_t_* %fftSrcAddr, %struct.cmplx16ImRe_t_** %fftSrcAddr.addr, align 4
  call void @llvm.dbg.declare(metadata !{%struct.cmplx16ImRe_t_** %fftSrcAddr.addr}, metadata !23), !dbg !24
  store i16* %window, i16** %window.addr, align 4
  call void @llvm.dbg.declare(metadata !{i16** %window.addr}, metadata !25), !dbg !26
  store i32 %len, i32* %len.addr, align 4
  call void @llvm.dbg.declare(metadata !{i32* %len.addr}, metadata !27), !dbg !28
  call void @llvm.dbg.declare(metadata !{i32* %q}, metadata !29), !dbg !30
  %0 = load i32* %len.addr, align 4, !dbg !31
  %div = sdiv i32 %0, 64, !dbg !31
  store i32 %div, i32* %q, align 4, !dbg !31
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !32), !dbg !34
  store i32 0, i32* %i, align 4, !dbg !35
  br label %for.cond, !dbg !35

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32* %i, align 4, !dbg !35
  %2 = load i32* %q, align 4, !dbg !35
  %cmp = icmp slt i32 %1, %2, !dbg !35
  br i1 %cmp, label %for.body, label %for.end, !dbg !35

for.body:                                         ; preds = %for.cond
  %3 = load i32* %i, align 4, !dbg !36
  %mul = mul nsw i32 %3, 64, !dbg !36
  %4 = load %struct.cmplx16ImRe_t_** %fftSrcAddr.addr, align 4, !dbg !36
  %arrayidx = getelementptr inbounds %struct.cmplx16ImRe_t_* %4, i32 %mul, !dbg !36
  %5 = load i32* %i, align 4, !dbg !36
  %mul1 = mul nsw i32 %5, 128, !dbg !36
  %6 = load i16** %window.addr, align 4, !dbg !36
  %arrayidx2 = getelementptr inbounds i16* %6, i32 %mul1, !dbg !36
  call void @windowing_asm(%struct.cmplx16ImRe_t_* %arrayidx, i16* %arrayidx2), !dbg !36
  br label %for.inc, !dbg !38

for.inc:                                          ; preds = %for.body
  %7 = load i32* %i, align 4, !dbg !39
  %inc = add nsw i32 %7, 1, !dbg !39
  store i32 %inc, i32* %i, align 4, !dbg !39
  br label %for.cond, !dbg !39

for.end:                                          ; preds = %for.cond
  ret void, !dbg !40
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

declare void @windowing_asm(%struct.cmplx16ImRe_t_*, i16*) #2

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!20, !21}
!llvm.ident = !{!22}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.0 (tags/RELEASE_350/final)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [D:\eclipse\workspace\dss\Release/..\windowing.c] [DW_LANG_C99]
!1 = metadata !{metadata !"..\5Cwindowing.c", metadata !"D:\5Ceclipse\5Cworkspace\5Cdss\5CRelease"}
!2 = metadata !{}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"windowing", metadata !"windowing", metadata !"", i32 5, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.cmplx16ImRe_t_*, i16*, i32)* @windowing, null, null, metadata !2, i32 6} ; [ DW_TAG_subprogram ] [line 5] [def] [scope 6] [windowing]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [D:\eclipse\workspace\dss\Release/..\windowing.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{null, metadata !8, metadata !18, metadata !19}
!8 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 32, i64 32, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ] [line 0, size 32, align 32, offset 0] [from cmplx16ImRe_t]
!9 = metadata !{i32 786454, metadata !10, null, metadata !"cmplx16ImRe_t", i32 9, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_typedef ] [cmplx16ImRe_t] [line 9, size 0, align 0, offset 0] [from cmplx16ImRe_t_]
!10 = metadata !{metadata !"../mmwave_lib.h", metadata !"D:\5Ceclipse\5Cworkspace\5Cdss\5CRelease"}
!11 = metadata !{i32 786451, metadata !10, null, metadata !"cmplx16ImRe_t_", i32 5, i64 32, i64 16, i32 0, i32 0, null, metadata !12, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [cmplx16ImRe_t_] [line 5, size 32, align 16, offset 0] [def] [from ]
!12 = metadata !{metadata !13, metadata !17}
!13 = metadata !{i32 786445, metadata !10, metadata !11, metadata !"imag", i32 7, i64 16, i64 16, i64 0, i32 0, metadata !14} ; [ DW_TAG_member ] [imag] [line 7, size 16, align 16, offset 0] [from int16_t]
!14 = metadata !{i32 786454, metadata !15, null, metadata !"int16_t", i32 31, i64 0, i64 0, i64 0, i32 0, metadata !16} ; [ DW_TAG_typedef ] [int16_t] [line 31, size 0, align 0, offset 0] [from short]
!15 = metadata !{metadata !"D:\5CCIC\5CSwift_IDE_Toolchain\5Ctoolchain_8slot\5Cinclude\5Ctypes/int16_t.h", metadata !"D:\5Ceclipse\5Cworkspace\5Cdss\5CRelease"}
!16 = metadata !{i32 786468, null, null, metadata !"short", i32 0, i64 16, i64 16, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [short] [line 0, size 16, align 16, offset 0, enc DW_ATE_signed]
!17 = metadata !{i32 786445, metadata !10, metadata !11, metadata !"real", i32 8, i64 16, i64 16, i64 16, i32 0, metadata !14} ; [ DW_TAG_member ] [real] [line 8, size 16, align 16, offset 16] [from int16_t]
!18 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 32, i64 32, i64 0, i32 0, metadata !16} ; [ DW_TAG_pointer_type ] [line 0, size 32, align 32, offset 0] [from short]
!19 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!20 = metadata !{i32 2, metadata !"Dwarf Version", i32 2}
!21 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!22 = metadata !{metadata !"clang version 3.5.0 (tags/RELEASE_350/final)"}
!23 = metadata !{i32 786689, metadata !4, metadata !"fftSrcAddr", metadata !5, i32 16777221, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fftSrcAddr] [line 5]
!24 = metadata !{i32 5, i32 31, metadata !4, null}
!25 = metadata !{i32 786689, metadata !4, metadata !"window", metadata !5, i32 33554437, metadata !18, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [window] [line 5]
!26 = metadata !{i32 5, i32 50, metadata !4, null}
!27 = metadata !{i32 786689, metadata !4, metadata !"len", metadata !5, i32 50331653, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 5]
!28 = metadata !{i32 5, i32 62, metadata !4, null}
!29 = metadata !{i32 786688, metadata !4, metadata !"q", metadata !5, i32 7, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [q] [line 7]
!30 = metadata !{i32 7, i32 6, metadata !4, null}
!31 = metadata !{i32 7, i32 2, metadata !4, null}
!32 = metadata !{i32 786688, metadata !33, metadata !"i", metadata !5, i32 9, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 9]
!33 = metadata !{i32 786443, metadata !1, metadata !4, i32 9, i32 2, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\windowing.c]
!34 = metadata !{i32 9, i32 11, metadata !33, null}
!35 = metadata !{i32 9, i32 7, metadata !33, null}
!36 = metadata !{i32 10, i32 3, metadata !37, null}
!37 = metadata !{i32 786443, metadata !1, metadata !33, i32 9, i32 30, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\windowing.c]
!38 = metadata !{i32 11, i32 2, metadata !37, null}
!39 = metadata !{i32 9, i32 25, metadata !33, null}
!40 = metadata !{i32 13, i32 1, metadata !4, null}
