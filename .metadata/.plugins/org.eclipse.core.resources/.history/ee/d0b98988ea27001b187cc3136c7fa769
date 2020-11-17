; ModuleID = '..\addition.c'
target datalayout = "e-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
target triple = "dsp"

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  call void @llvm.dbg.declare(metadata !{i32* %a}, metadata !12), !dbg !13
  store i32 1, i32* %a, align 4, !dbg !14
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !15), !dbg !17
  store i32 0, i32* %i, align 4, !dbg !18
  br label %for.cond, !dbg !18

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4, !dbg !18
  %cmp = icmp slt i32 %0, 64, !dbg !18
  br i1 %cmp, label %for.body, label %for.end, !dbg !18

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4, !dbg !19
  %2 = load i32* %a, align 4, !dbg !19
  %add = add nsw i32 %2, %1, !dbg !19
  store i32 %add, i32* %a, align 4, !dbg !19
  br label %for.inc, !dbg !21

for.inc:                                          ; preds = %for.body
  %3 = load i32* %i, align 4, !dbg !22
  %inc = add nsw i32 %3, 1, !dbg !22
  store i32 %inc, i32* %i, align 4, !dbg !22
  br label %for.cond, !dbg !22

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !23
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10}
!llvm.ident = !{!11}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.0 (tags/RELEASE_350/final)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [D:\eclipse\workspace\addtion\Release/..\addition.c] [DW_LANG_C99]
!1 = metadata !{metadata !"..\5Caddition.c", metadata !"D:\5Ceclipse\5Cworkspace\5Caddtion\5CRelease"}
!2 = metadata !{}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 12, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 13} ; [ DW_TAG_subprogram ] [line 12] [def] [scope 13] [main]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [D:\eclipse\workspace\addtion\Release/..\addition.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 2, metadata !"Dwarf Version", i32 2}
!10 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!11 = metadata !{metadata !"clang version 3.5.0 (tags/RELEASE_350/final)"}
!12 = metadata !{i32 786688, metadata !4, metadata !"a", metadata !5, i32 14, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 14]
!13 = metadata !{i32 14, i32 9, metadata !4, null}
!14 = metadata !{i32 14, i32 5, metadata !4, null}
!15 = metadata !{i32 786688, metadata !16, metadata !"i", metadata !5, i32 15, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 15]
!16 = metadata !{i32 786443, metadata !1, metadata !4, i32 15, i32 5, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\addtion\Release/..\addition.c]
!17 = metadata !{i32 15, i32 14, metadata !16, null}
!18 = metadata !{i32 15, i32 10, metadata !16, null}
!19 = metadata !{i32 16, i32 9, metadata !20, null}
!20 = metadata !{i32 786443, metadata !1, metadata !16, i32 15, i32 34, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\addtion\Release/..\addition.c]
!21 = metadata !{i32 17, i32 5, metadata !20, null}
!22 = metadata !{i32 15, i32 29, metadata !16, null}
!23 = metadata !{i32 22, i32 5, metadata !4, null}
