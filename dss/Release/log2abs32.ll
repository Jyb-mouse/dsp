; ModuleID = '..\log2abs32.c'
target datalayout = "e-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
target triple = "dsp"

%struct.cmplx32ImRe_t_ = type { i32, i32 }

; Function Attrs: nounwind
define void @log2abs32(%struct.cmplx32ImRe_t_* %fftOutBuf, i16* %Log2AbsBuf, i32 %numDopplerBins) #0 {
entry:
  %fftOutBuf.addr = alloca %struct.cmplx32ImRe_t_*, align 4
  %Log2AbsBuf.addr = alloca i16*, align 4
  %numDopplerBins.addr = alloca i32, align 4
  %i = alloca i16, align 2
  %real = alloca i32, align 4
  %imag = alloca i32, align 4
  %max = alloca i32, align 4
  %min = alloca i32, align 4
  %absvalue = alloca i32, align 4
  store %struct.cmplx32ImRe_t_* %fftOutBuf, %struct.cmplx32ImRe_t_** %fftOutBuf.addr, align 4
  call void @llvm.dbg.declare(metadata !{%struct.cmplx32ImRe_t_** %fftOutBuf.addr}, metadata !26), !dbg !27
  store i16* %Log2AbsBuf, i16** %Log2AbsBuf.addr, align 4
  call void @llvm.dbg.declare(metadata !{i16** %Log2AbsBuf.addr}, metadata !28), !dbg !29
  store i32 %numDopplerBins, i32* %numDopplerBins.addr, align 4
  call void @llvm.dbg.declare(metadata !{i32* %numDopplerBins.addr}, metadata !30), !dbg !31
  call void @llvm.dbg.declare(metadata !{i16* %i}, metadata !32), !dbg !35
  store i16 0, i16* %i, align 2, !dbg !36
  br label %for.cond, !dbg !36

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i16* %i, align 2, !dbg !36
  %conv = sext i16 %0 to i32, !dbg !36
  %1 = load i32* %numDopplerBins.addr, align 4, !dbg !36
  %cmp = icmp slt i32 %conv, %1, !dbg !36
  br i1 %cmp, label %for.body, label %for.end, !dbg !36

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata !{i32* %real}, metadata !37), !dbg !39
  %2 = load %struct.cmplx32ImRe_t_** %fftOutBuf.addr, align 4, !dbg !40
  %3 = load i16* %i, align 2, !dbg !40
  %conv2 = sext i16 %3 to i32, !dbg !40
  %add.ptr = getelementptr inbounds %struct.cmplx32ImRe_t_* %2, i32 %conv2, !dbg !40
  %real3 = getelementptr inbounds %struct.cmplx32ImRe_t_* %add.ptr, i32 0, i32 1, !dbg !40
  %4 = load i32* %real3, align 4, !dbg !40
  %call = call i32 @abs(i32 %4) #1, !dbg !40
  store i32 %call, i32* %real, align 4, !dbg !40
  call void @llvm.dbg.declare(metadata !{i32* %imag}, metadata !41), !dbg !42
  %5 = load %struct.cmplx32ImRe_t_** %fftOutBuf.addr, align 4, !dbg !43
  %6 = load i16* %i, align 2, !dbg !43
  %conv4 = sext i16 %6 to i32, !dbg !43
  %add.ptr5 = getelementptr inbounds %struct.cmplx32ImRe_t_* %5, i32 %conv4, !dbg !43
  %imag6 = getelementptr inbounds %struct.cmplx32ImRe_t_* %add.ptr5, i32 0, i32 0, !dbg !43
  %7 = load i32* %imag6, align 4, !dbg !43
  %call7 = call i32 @abs(i32 %7) #1, !dbg !43
  store i32 %call7, i32* %imag, align 4, !dbg !43
  call void @llvm.dbg.declare(metadata !{i32* %max}, metadata !44), !dbg !45
  %8 = load i32* %imag, align 4, !dbg !46
  store i32 %8, i32* %max, align 4, !dbg !46
  call void @llvm.dbg.declare(metadata !{i32* %min}, metadata !47), !dbg !48
  %9 = load i32* %real, align 4, !dbg !49
  store i32 %9, i32* %min, align 4, !dbg !49
  %10 = load i32* %real, align 4, !dbg !50
  %11 = load i32* %imag, align 4, !dbg !50
  %cmp8 = icmp sgt i32 %10, %11, !dbg !50
  br i1 %cmp8, label %if.then, label %if.end, !dbg !50

if.then:                                          ; preds = %for.body
  %12 = load i32* %real, align 4, !dbg !52
  store i32 %12, i32* %max, align 4, !dbg !52
  %13 = load i32* %imag, align 4, !dbg !54
  store i32 %13, i32* %min, align 4, !dbg !54
  br label %if.end, !dbg !55

if.end:                                           ; preds = %if.then, %for.body
  call void @llvm.dbg.declare(metadata !{i32* %absvalue}, metadata !56), !dbg !57
  %14 = load i32* %max, align 4, !dbg !58
  %15 = load i32* %min, align 4, !dbg !58
  %mul = mul nsw i32 %15, 3, !dbg !58
  %shr = ashr i32 %mul, 3, !dbg !58
  %add = add nsw i32 %14, %shr, !dbg !58
  store i32 %add, i32* %absvalue, align 4, !dbg !58
  %16 = load i32* %absvalue, align 4, !dbg !59
  %call10 = call zeroext i16 @log2_q8(i32 %16), !dbg !59
  %17 = load i16** %Log2AbsBuf.addr, align 4, !dbg !59
  %18 = load i16* %i, align 2, !dbg !59
  %conv11 = sext i16 %18 to i32, !dbg !59
  %add.ptr12 = getelementptr inbounds i16* %17, i32 %conv11, !dbg !59
  store i16 %call10, i16* %add.ptr12, align 2, !dbg !59
  br label %for.inc, !dbg !60

for.inc:                                          ; preds = %if.end
  %19 = load i16* %i, align 2, !dbg !61
  %inc = add i16 %19, 1, !dbg !61
  store i16 %inc, i16* %i, align 2, !dbg !61
  br label %for.cond, !dbg !61

for.end:                                          ; preds = %for.cond
  ret void, !dbg !62
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind readnone
declare i32 @abs(i32) #2

declare zeroext i16 @log2_q8(i32) #3

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!23, !24}
!llvm.ident = !{!25}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5.0 (tags/RELEASE_350/final)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [D:\eclipse\workspace\dss\Release/..\log2abs32.c] [DW_LANG_C99]
!1 = metadata !{metadata !"..\5Clog2abs32.c", metadata !"D:\5Ceclipse\5Cworkspace\5Cdss\5CRelease"}
!2 = metadata !{}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"log2abs32", metadata !"log2abs32", metadata !"", i32 7, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.cmplx32ImRe_t_*, i16*, i32)* @log2abs32, null, null, metadata !2, i32 8} ; [ DW_TAG_subprogram ] [line 7] [def] [scope 8] [log2abs32]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [D:\eclipse\workspace\dss\Release/..\log2abs32.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{null, metadata !8, metadata !19, metadata !17}
!8 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 32, i64 32, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ] [line 0, size 32, align 32, offset 0] [from ]
!9 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !10} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from cmplx32ImRe_t]
!10 = metadata !{i32 786454, metadata !11, null, metadata !"cmplx32ImRe_t", i32 19, i64 0, i64 0, i64 0, i32 0, metadata !12} ; [ DW_TAG_typedef ] [cmplx32ImRe_t] [line 19, size 0, align 0, offset 0] [from cmplx32ImRe_t_]
!11 = metadata !{metadata !"../mmwave_lib.h", metadata !"D:\5Ceclipse\5Cworkspace\5Cdss\5CRelease"}
!12 = metadata !{i32 786451, metadata !11, null, metadata !"cmplx32ImRe_t_", i32 15, i64 64, i64 32, i32 0, i32 0, null, metadata !13, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [cmplx32ImRe_t_] [line 15, size 64, align 32, offset 0] [def] [from ]
!13 = metadata !{metadata !14, metadata !18}
!14 = metadata !{i32 786445, metadata !11, metadata !12, metadata !"imag", i32 17, i64 32, i64 32, i64 0, i32 0, metadata !15} ; [ DW_TAG_member ] [imag] [line 17, size 32, align 32, offset 0] [from int32_t]
!15 = metadata !{i32 786454, metadata !16, null, metadata !"int32_t", i32 31, i64 0, i64 0, i64 0, i32 0, metadata !17} ; [ DW_TAG_typedef ] [int32_t] [line 31, size 0, align 0, offset 0] [from int]
!16 = metadata !{metadata !"D:\5CCIC\5CSwift_IDE_Toolchain\5Ctoolchain_8slot\5Cinclude\5Ctypes/int32_t.h", metadata !"D:\5Ceclipse\5Cworkspace\5Cdss\5CRelease"}
!17 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!18 = metadata !{i32 786445, metadata !11, metadata !12, metadata !"real", i32 18, i64 32, i64 32, i64 32, i32 0, metadata !15} ; [ DW_TAG_member ] [real] [line 18, size 32, align 32, offset 32] [from int32_t]
!19 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 32, i64 32, i64 0, i32 0, metadata !20} ; [ DW_TAG_pointer_type ] [line 0, size 32, align 32, offset 0] [from uint16_t]
!20 = metadata !{i32 786454, metadata !21, null, metadata !"uint16_t", i32 31, i64 0, i64 0, i64 0, i32 0, metadata !22} ; [ DW_TAG_typedef ] [uint16_t] [line 31, size 0, align 0, offset 0] [from unsigned short]
!21 = metadata !{metadata !"D:\5CCIC\5CSwift_IDE_Toolchain\5Ctoolchain_8slot\5Cinclude\5Ctypes/uint16_t.h", metadata !"D:\5Ceclipse\5Cworkspace\5Cdss\5CRelease"}
!22 = metadata !{i32 786468, null, null, metadata !"unsigned short", i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned short] [line 0, size 16, align 16, offset 0, enc DW_ATE_unsigned]
!23 = metadata !{i32 2, metadata !"Dwarf Version", i32 2}
!24 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!25 = metadata !{metadata !"clang version 3.5.0 (tags/RELEASE_350/final)"}
!26 = metadata !{i32 786689, metadata !4, metadata !"fftOutBuf", metadata !5, i32 16777223, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fftOutBuf] [line 7]
!27 = metadata !{i32 7, i32 37, metadata !4, null}
!28 = metadata !{i32 786689, metadata !4, metadata !"Log2AbsBuf", metadata !5, i32 33554439, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [Log2AbsBuf] [line 7]
!29 = metadata !{i32 7, i32 57, metadata !4, null}
!30 = metadata !{i32 786689, metadata !4, metadata !"numDopplerBins", metadata !5, i32 50331655, metadata !17, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [numDopplerBins] [line 7]
!31 = metadata !{i32 7, i32 72, metadata !4, null}
!32 = metadata !{i32 786688, metadata !33, metadata !"i", metadata !5, i32 8, metadata !34, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 8]
!33 = metadata !{i32 786443, metadata !1, metadata !4, i32 8, i32 5, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\log2abs32.c]
!34 = metadata !{i32 786468, null, null, metadata !"short", i32 0, i64 16, i64 16, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [short] [line 0, size 16, align 16, offset 0, enc DW_ATE_signed]
!35 = metadata !{i32 8, i32 15, metadata !33, null} ; [ DW_TAG_imported_declaration ]
!36 = metadata !{i32 8, i32 9, metadata !33, null} ; [ DW_TAG_imported_declaration ]
!37 = metadata !{i32 786688, metadata !38, metadata !"real", metadata !5, i32 9, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [real] [line 9]
!38 = metadata !{i32 786443, metadata !1, metadata !33, i32 9, i32 2, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\log2abs32.c]
!39 = metadata !{i32 9, i32 11, metadata !38, null}
!40 = metadata !{i32 9, i32 18, metadata !38, null}
!41 = metadata !{i32 786688, metadata !38, metadata !"imag", metadata !5, i32 10, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [imag] [line 10]
!42 = metadata !{i32 10, i32 10, metadata !38, null}
!43 = metadata !{i32 10, i32 17, metadata !38, null}
!44 = metadata !{i32 786688, metadata !38, metadata !"max", metadata !5, i32 12, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [max] [line 12]
!45 = metadata !{i32 12, i32 10, metadata !38, null}
!46 = metadata !{i32 12, i32 2, metadata !38, null}
!47 = metadata !{i32 786688, metadata !38, metadata !"min", metadata !5, i32 13, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [min] [line 13]
!48 = metadata !{i32 13, i32 10, metadata !38, null}
!49 = metadata !{i32 13, i32 2, metadata !38, null}
!50 = metadata !{i32 14, i32 6, metadata !51, null}
!51 = metadata !{i32 786443, metadata !1, metadata !38, i32 14, i32 6, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\log2abs32.c]
!52 = metadata !{i32 15, i32 3, metadata !53, null}
!53 = metadata !{i32 786443, metadata !1, metadata !51, i32 14, i32 19, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [D:\eclipse\workspace\dss\Release/..\log2abs32.c]
!54 = metadata !{i32 16, i32 3, metadata !53, null}
!55 = metadata !{i32 17, i32 2, metadata !53, null}
!56 = metadata !{i32 786688, metadata !38, metadata !"absvalue", metadata !5, i32 18, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [absvalue] [line 18]
!57 = metadata !{i32 18, i32 6, metadata !38, null}
!58 = metadata !{i32 18, i32 2, metadata !38, null}
!59 = metadata !{i32 19, i32 19, metadata !38, null}
!60 = metadata !{i32 20, i32 2, metadata !38, null}
!61 = metadata !{i32 8, i32 36, metadata !33, null} ; [ DW_TAG_imported_declaration ]
!62 = metadata !{i32 21, i32 1, metadata !4, null}
