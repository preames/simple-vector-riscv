; ModuleID = 'dotproduct_i32.c'
source_filename = "dotproduct_i32.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
target triple = "riscv64"

; Function Attrs: argmemonly nofree norecurse nosync nounwind readonly
define dso_local signext i32 @dotproduct_i32(i32 noundef signext %len, ptr nocapture noundef readonly %a, ptr nocapture noundef readonly %b) local_unnamed_addr #0 {
entry:
  %cmp7.not = icmp eq i32 %len, 0
  br i1 %cmp7.not, label %for.cond.cleanup, label %iter.check

iter.check:                                       ; preds = %entry
  %wide.trip.count = zext i32 %len to i64
  %min.iters.check = icmp ult i32 %len, 8
  br i1 %min.iters.check, label %for.body.preheader, label %vector.main.loop.iter.check

vector.main.loop.iter.check:                      ; preds = %iter.check
  %min.iters.check10 = icmp ult i32 %len, 32
  br i1 %min.iters.check10, label %vec.epilog.ph, label %vector.ph

vector.ph:                                        ; preds = %vector.main.loop.iter.check
  %n.vec = and i64 %wide.trip.count, 4294967264
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.phi = phi <16 x i32> [ zeroinitializer, %vector.ph ], [ %6, %vector.body ]
  %vec.phi11 = phi <16 x i32> [ zeroinitializer, %vector.ph ], [ %7, %vector.body ]
  %0 = getelementptr inbounds i32, ptr %a, i64 %index
  %wide.load = load <16 x i32>, ptr %0, align 4, !tbaa !4
  %1 = getelementptr inbounds i32, ptr %0, i64 16
  %wide.load12 = load <16 x i32>, ptr %1, align 4, !tbaa !4
  %2 = getelementptr inbounds i32, ptr %b, i64 %index
  %wide.load13 = load <16 x i32>, ptr %2, align 4, !tbaa !4
  %3 = getelementptr inbounds i32, ptr %2, i64 16
  %wide.load14 = load <16 x i32>, ptr %3, align 4, !tbaa !4
  %4 = mul nsw <16 x i32> %wide.load13, %wide.load
  %5 = mul nsw <16 x i32> %wide.load14, %wide.load12
  %6 = add <16 x i32> %4, %vec.phi
  %7 = add <16 x i32> %5, %vec.phi11
  %index.next = add nuw i64 %index, 32
  %8 = icmp eq i64 %index.next, %n.vec
  br i1 %8, label %middle.block, label %vector.body, !llvm.loop !8

middle.block:                                     ; preds = %vector.body
  %bin.rdx = add <16 x i32> %7, %6
  %9 = call i32 @llvm.vector.reduce.add.v16i32(<16 x i32> %bin.rdx)
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br i1 %cmp.n, label %for.cond.cleanup, label %vec.epilog.iter.check

vec.epilog.iter.check:                            ; preds = %middle.block
  %n.vec.remaining = and i64 %wide.trip.count, 24
  %min.epilog.iters.check = icmp eq i64 %n.vec.remaining, 0
  br i1 %min.epilog.iters.check, label %for.body.preheader, label %vec.epilog.ph

vec.epilog.ph:                                    ; preds = %vector.main.loop.iter.check, %vec.epilog.iter.check
  %bc.merge.rdx = phi i32 [ 0, %vector.main.loop.iter.check ], [ %9, %vec.epilog.iter.check ]
  %vec.epilog.resume.val = phi i64 [ 0, %vector.main.loop.iter.check ], [ %n.vec, %vec.epilog.iter.check ]
  %n.vec16 = and i64 %wide.trip.count, 4294967288
  %10 = insertelement <8 x i32> <i32 poison, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, i32 %bc.merge.rdx, i64 0
  br label %vec.epilog.vector.body

vec.epilog.vector.body:                           ; preds = %vec.epilog.vector.body, %vec.epilog.ph
  %offset.idx = phi i64 [ %vec.epilog.resume.val, %vec.epilog.ph ], [ %index.next22, %vec.epilog.vector.body ]
  %vec.phi19 = phi <8 x i32> [ %10, %vec.epilog.ph ], [ %14, %vec.epilog.vector.body ]
  %11 = getelementptr inbounds i32, ptr %a, i64 %offset.idx
  %wide.load20 = load <8 x i32>, ptr %11, align 4, !tbaa !4
  %12 = getelementptr inbounds i32, ptr %b, i64 %offset.idx
  %wide.load21 = load <8 x i32>, ptr %12, align 4, !tbaa !4
  %13 = mul nsw <8 x i32> %wide.load21, %wide.load20
  %14 = add <8 x i32> %13, %vec.phi19
  %index.next22 = add nuw i64 %offset.idx, 8
  %15 = icmp eq i64 %index.next22, %n.vec16
  br i1 %15, label %vec.epilog.middle.block, label %vec.epilog.vector.body, !llvm.loop !11

vec.epilog.middle.block:                          ; preds = %vec.epilog.vector.body
  %16 = call i32 @llvm.vector.reduce.add.v8i32(<8 x i32> %14)
  %cmp.n17 = icmp eq i64 %n.vec16, %wide.trip.count
  br i1 %cmp.n17, label %for.cond.cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %iter.check, %vec.epilog.iter.check, %vec.epilog.middle.block
  %indvars.iv.ph = phi i64 [ 0, %iter.check ], [ %n.vec, %vec.epilog.iter.check ], [ %n.vec16, %vec.epilog.middle.block ]
  %res.08.ph = phi i32 [ 0, %iter.check ], [ %9, %vec.epilog.iter.check ], [ %16, %vec.epilog.middle.block ]
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %middle.block, %vec.epilog.middle.block, %entry
  %res.0.lcssa = phi i32 [ 0, %entry ], [ %9, %middle.block ], [ %16, %vec.epilog.middle.block ], [ %add, %for.body ]
  ret i32 %res.0.lcssa

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ %indvars.iv.ph, %for.body.preheader ]
  %res.08 = phi i32 [ %add, %for.body ], [ %res.08.ph, %for.body.preheader ]
  %arrayidx = getelementptr inbounds i32, ptr %a, i64 %indvars.iv
  %17 = load i32, ptr %arrayidx, align 4, !tbaa !4
  %arrayidx2 = getelementptr inbounds i32, ptr %b, i64 %indvars.iv
  %18 = load i32, ptr %arrayidx2, align 4, !tbaa !4
  %mul = mul nsw i32 %18, %17
  %add = add nsw i32 %mul, %res.08
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !llvm.loop !13
}

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i32 @llvm.vector.reduce.add.v16i32(<16 x i32>) #1

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i32 @llvm.vector.reduce.add.v8i32(<8 x i32>) #1

attributes #0 = { argmemonly nofree norecurse nosync nounwind readonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+v,+f,+m,+c,+d,+zba,-save-restore" }
attributes #1 = { nocallback nofree nosync nounwind readnone willreturn }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 15.0.0 (https://github.com/llvm/llvm-project.git 875ee0ed1c5af58cb4909f239093e25a35d7a21a)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = distinct !{!8, !9, !10}
!9 = !{!"llvm.loop.mustprogress"}
!10 = !{!"llvm.loop.isvectorized", i32 1}
!11 = distinct !{!11, !9, !10, !12}
!12 = !{!"llvm.loop.unroll.runtime.disable"}
!13 = distinct !{!13, !9, !12, !10}
