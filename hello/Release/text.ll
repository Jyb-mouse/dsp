; ModuleID = '..\text.c'
target datalayout = "e-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
target triple = "dsp"

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %n = alloca i32, align 4
  %a = alloca [10 x i32], align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  call void @llvm.dbg.declare(metadata !{i32* %n}, metadata !12), !dbg !13
  store i32 10, i32* %n, align 4, !dbg !14
  call void @llvm.dbg.declare(metadata !{[10 x i32]* %a}, metadata !15), !dbg !19
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !20), !dbg !22
  br label %for.cond, !dbg !23

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4, !dbg !23
  %1 = load i32* %n, align 4, !dbg !23
  %cmp = icmp slt i32 %0, %1, !dbg !23
  br i1 %cmp, label %for.body, label %for.end, !dbg !23

for.body:                                         ; preds = %for.cond
  %2 = load i32* %i, align 4, !dbg !24
  %arrayidx = getelementptr inbounds [10 x i32]* %a, i32 0, i32 %2, !dbg !24
  store i32 1, i32* %arrayidx, align 4, !dbg !24
  br label %for.inc, !dbg !26

for.inc:                                          ; preds = %for.body
  %3 = load i32* %i, align 4, !dbg !27
  %inc = add nsw i32 %3, 1, !dbg !27
  store i32 %inc, i32* %i, align 4, !dbg !27
  br label %for.cond, !dbg !27

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !28
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10}
!llvm.ident = !{!11}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.0 (tags/RELEASE_350/final)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [D:\eclipse\workspace\hello\Release/..\text.c] [DW_LANG_C99]
!1 = metadata !{metadata !"..\5Ctext.c", metadata !"D:\5Ceclipse\5Cworkspace\5Chello\5CRelease"}
!2 = metadata !{}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 7, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 7} ; [ DW_TAG_subprogram ] [line 7] [def] [main]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [D:\eclipse\workspace\hello\Release/..\text.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 2, metadata !"Dwarf Version", i32 2}
!10 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!11 = metadata !{metadata !"clang version 3.5.0 (tags/RELEASE_350/final)"}
!12 = metadata !{i32 786688, metadata !4, metadata !"n", metadata !5, i32 8, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 8]
!13 = metadata !{i32 8, i32 6, metadata !4, null} ; [ DW_TAG_imported_declaration ]
!14 = metadata !{i32 8, i32 2, metadata !4, null} ; [ DW_TAG_imported_declaration ]
!15 = metadata !{i32 786688, metadata !4, metadata !"a", metadata !5, i32 8, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 8]
!16 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 320, i64 32, i32 0, i32 0, metadata !8, metadata !17, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 320, align 32, offset 0] [from int]
!17 = metadata !{metadata !18}
!18 = metadata !{i32 786465, i64 0, i64 10}       ; [ DW_TAG_subrange_type ] [0, 9]
!19 = metadata !{i32 8, i32 13, metadata !4, null} ; [ DW_TAG_imported_declaration ]
!20 = metadata !{i32 786688, metadata !21, metadata !"i", metadata !5, i32 9, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 9]
!21 = metadata !{i32 786443, metadata !1, metadata !4, i32 9, i32 2, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\hello\Release/..\text.c]
!22 = metadata !{i32 9, i32 10, metadata !21, null}
!23 = metadata !{i32 9, i32 6, metadata !21, null}
!24 = metadata !{i32 10, i32 3, metadata !25, null}
!25 = metadata !{i32 786443, metadata !1, metadata !21, i32 9, i32 23, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\hello\Release/..\text.c]
!26 = metadata !{i32 11, i32 2, metadata !25, null}
!27 = metadata !{i32 9, i32 19, metadata !21, null}
!28 = metadata !{i32 12, i32 3, metadata !4, null}
