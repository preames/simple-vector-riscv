; ModuleID = 'vector_overlap_i32.c'
source_filename = "vector_overlap_i32.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
target triple = "riscv64-unknown-unknown"

; Function Attrs: argmemonly nofree norecurse nosync nounwind vscale_range(4,1024)
define dso_local void @vector_overlap(ptr noalias nocapture noundef readonly %a, ptr noalias nocapture noundef writeonly %b, i32 noundef signext %N) local_unnamed_addr #0 {
entry:
  %cmp16 = icmp ugt i32 %N, 1
  br i1 %cmp16, label %for.body.preheader, label %for.cond.cleanup

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %N to i64
  %.pre = load i32, ptr %a, align 4, !tbaa !4
  %arrayidx2.phi.trans.insert = getelementptr inbounds i32, ptr %a, i64 1
  %.pre19 = load i32, ptr %arrayidx2.phi.trans.insert, align 4, !tbaa !4
  %0 = add nsw i64 %wide.trip.count, -1
  %min.iters.check = icmp ult i32 %N, 9
  br i1 %min.iters.check, label %for.body.preheader26, label %vector.ph

vector.ph:                                        ; preds = %for.body.preheader
  %n.vec = and i64 %0, -8
  %ind.end = or i64 %n.vec, 1
  %vector.recur.init = insertelement <8 x i32> poison, i32 %.pre19, i64 7
  %vector.recur.init20 = insertelement <8 x i32> poison, i32 %.pre, i64 7
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vector.recur = phi <8 x i32> [ %vector.recur.init, %vector.ph ], [ %wide.load, %vector.body ]
  %vector.recur21 = phi <8 x i32> [ %vector.recur.init20, %vector.ph ], [ %3, %vector.body ]
  %offset.idx = or i64 %index, 1
  %1 = or i64 %index, 2
  %2 = getelementptr inbounds i32, ptr %a, i64 %1
  %wide.load = load <8 x i32>, ptr %2, align 4, !tbaa !4
  %3 = shufflevector <8 x i32> %vector.recur, <8 x i32> %wide.load, <8 x i32> <i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14>
  %4 = shufflevector <8 x i32> %vector.recur21, <8 x i32> %3, <8 x i32> <i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14>
  %5 = add nsw <8 x i32> %3, %4
  %6 = add nsw <8 x i32> %5, %wide.load
  %7 = getelementptr inbounds i32, ptr %b, i64 %offset.idx
  store <8 x i32> %6, ptr %7, align 4, !tbaa !4
  %index.next = add nuw i64 %index, 8
  %8 = icmp eq i64 %index.next, %n.vec
  br i1 %8, label %middle.block, label %vector.body, !llvm.loop !8

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %0, %n.vec
  %vector.recur.extract = extractelement <8 x i32> %wide.load, i64 7
  %vector.recur.extract22 = extractelement <8 x i32> %wide.load, i64 6
  br i1 %cmp.n, label %for.cond.cleanup, label %for.body.preheader26

for.body.preheader26:                             ; preds = %for.body.preheader, %middle.block
  %scalar.recur.ph = phi i32 [ %vector.recur.extract, %middle.block ], [ %.pre19, %for.body.preheader ]
  %scalar.recur25.ph = phi i32 [ %vector.recur.extract22, %middle.block ], [ %.pre, %for.body.preheader ]
  %indvars.iv.ph = phi i64 [ %ind.end, %middle.block ], [ 1, %for.body.preheader ]
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %middle.block, %entry
  ret void

for.body:                                         ; preds = %for.body.preheader26, %for.body
  %scalar.recur = phi i32 [ %9, %for.body ], [ %scalar.recur.ph, %for.body.preheader26 ]
  %scalar.recur25 = phi i32 [ %scalar.recur, %for.body ], [ %scalar.recur25.ph, %for.body.preheader26 ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ %indvars.iv.ph, %for.body.preheader26 ]
  %add = add nsw i32 %scalar.recur, %scalar.recur25
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx5 = getelementptr inbounds i32, ptr %a, i64 %indvars.iv.next
  %9 = load i32, ptr %arrayidx5, align 4, !tbaa !4
  %add6 = add nsw i32 %add, %9
  %arrayidx8 = getelementptr inbounds i32, ptr %b, i64 %indvars.iv
  store i32 %add6, ptr %arrayidx8, align 4, !tbaa !4
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !llvm.loop !11
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
!8 = distinct !{!8, !9, !10}
!9 = !{!"llvm.loop.mustprogress"}
!10 = !{!"llvm.loop.isvectorized", i32 1}
!11 = distinct !{!11, !9, !12, !10}
!12 = !{!"llvm.loop.unroll.runtime.disable"}
