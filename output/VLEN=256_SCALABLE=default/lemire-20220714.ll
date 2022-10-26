; ModuleID = 'lemire-20220714.c'
source_filename = "lemire-20220714.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
target triple = "riscv64-unknown-unknown"

; Function Attrs: argmemonly nofree norecurse nosync nounwind vscale_range(4,1024)
define dso_local void @remove_negatives_scalar(ptr noalias nocapture noundef readonly %input, i64 noundef %count, ptr noalias nocapture noundef writeonly %output) local_unnamed_addr #0 {
entry:
  %cmp9 = icmp sgt i64 %count, 0
  br i1 %cmp9, label %for.body, label %for.end

for.body:                                         ; preds = %entry, %for.inc
  %j.011 = phi i64 [ %j.1, %for.inc ], [ 0, %entry ]
  %i.010 = phi i64 [ %inc4, %for.inc ], [ 0, %entry ]
  %arrayidx = getelementptr inbounds i32, ptr %input, i64 %i.010
  %0 = load i32, ptr %arrayidx, align 4, !tbaa !4
  %cmp1 = icmp sgt i32 %0, -1
  br i1 %cmp1, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %inc = add nsw i64 %j.011, 1
  %arrayidx3 = getelementptr inbounds i32, ptr %output, i64 %j.011
  store i32 %0, ptr %arrayidx3, align 4, !tbaa !4
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %j.1 = phi i64 [ %inc, %if.then ], [ %j.011, %for.body ]
  %inc4 = add nuw nsw i64 %i.010, 1
  %exitcond.not = icmp eq i64 %inc4, %count
  br i1 %exitcond.not, label %for.end, label %for.body, !llvm.loop !8

for.end:                                          ; preds = %for.inc, %entry
  ret void
}

attributes #0 = { argmemonly nofree norecurse nosync nounwind vscale_range(4,1024) "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,+v,+zba,+zbb,+zbc,+zbs,+zve32f,+zve32x,+zve64d,+zve64f,+zve64x,+zvl128b,+zvl256b,+zvl32b,+zvl64b,-save-restore" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64d"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 269bc684e7a0c3f727ea5e74270112585acaf55d)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
