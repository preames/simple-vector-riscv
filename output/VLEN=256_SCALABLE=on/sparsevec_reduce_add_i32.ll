; ModuleID = 'sparsevec_reduce_add_i32.c'
source_filename = "sparsevec_reduce_add_i32.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
target triple = "riscv64"

; Function Attrs: argmemonly nofree norecurse nosync nounwind readonly
define dso_local signext i32 @sparsevec_reduce_add_i32(i32 noundef signext %len, ptr nocapture noundef readonly %a, ptr nocapture noundef readonly %aidx) local_unnamed_addr #0 {
entry:
  %cmp6.not = icmp eq i32 %len, 0
  br i1 %cmp6.not, label %for.cond.cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %len to i64
  %min.iters.check = icmp ult i32 %len, 16
  br i1 %min.iters.check, label %for.body.preheader12, label %vector.ph

vector.ph:                                        ; preds = %for.body.preheader
  %n.vec = and i64 %wide.trip.count, 4294967280
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.phi = phi <8 x i32> [ zeroinitializer, %vector.ph ], [ %6, %vector.body ]
  %vec.phi9 = phi <8 x i32> [ zeroinitializer, %vector.ph ], [ %7, %vector.body ]
  %0 = getelementptr inbounds i16, ptr %aidx, i64 %index
  %wide.load = load <8 x i16>, ptr %0, align 2, !tbaa !4
  %1 = getelementptr inbounds i16, ptr %0, i64 8
  %wide.load10 = load <8 x i16>, ptr %1, align 2, !tbaa !4
  %2 = sext <8 x i16> %wide.load to <8 x i64>
  %3 = sext <8 x i16> %wide.load10 to <8 x i64>
  %4 = getelementptr inbounds i32, ptr %a, <8 x i64> %2
  %5 = getelementptr inbounds i32, ptr %a, <8 x i64> %3
  %wide.masked.gather = call <8 x i32> @llvm.masked.gather.v8i32.v8p0(<8 x ptr> %4, i32 4, <8 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>, <8 x i32> undef), !tbaa !8
  %wide.masked.gather11 = call <8 x i32> @llvm.masked.gather.v8i32.v8p0(<8 x ptr> %5, i32 4, <8 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>, <8 x i32> undef), !tbaa !8
  %6 = add <8 x i32> %wide.masked.gather, %vec.phi
  %7 = add <8 x i32> %wide.masked.gather11, %vec.phi9
  %index.next = add nuw i64 %index, 16
  %8 = icmp eq i64 %index.next, %n.vec
  br i1 %8, label %middle.block, label %vector.body, !llvm.loop !10

middle.block:                                     ; preds = %vector.body
  %bin.rdx = add <8 x i32> %7, %6
  %9 = call i32 @llvm.vector.reduce.add.v8i32(<8 x i32> %bin.rdx)
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br i1 %cmp.n, label %for.cond.cleanup, label %for.body.preheader12

for.body.preheader12:                             ; preds = %for.body.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %for.body.preheader ], [ %n.vec, %middle.block ]
  %res.07.ph = phi i32 [ 0, %for.body.preheader ], [ %9, %middle.block ]
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %middle.block, %entry
  %res.0.lcssa = phi i32 [ 0, %entry ], [ %9, %middle.block ], [ %add, %for.body ]
  ret i32 %res.0.lcssa

for.body:                                         ; preds = %for.body.preheader12, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ %indvars.iv.ph, %for.body.preheader12 ]
  %res.07 = phi i32 [ %add, %for.body ], [ %res.07.ph, %for.body.preheader12 ]
  %arrayidx = getelementptr inbounds i16, ptr %aidx, i64 %indvars.iv
  %10 = load i16, ptr %arrayidx, align 2, !tbaa !4
  %idxprom1 = sext i16 %10 to i64
  %arrayidx2 = getelementptr inbounds i32, ptr %a, i64 %idxprom1
  %11 = load i32, ptr %arrayidx2, align 4, !tbaa !8
  %add = add nsw i32 %11, %res.07
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !llvm.loop !13
}

; Function Attrs: nocallback nofree nosync nounwind readonly willreturn
declare <8 x i32> @llvm.masked.gather.v8i32.v8p0(<8 x ptr>, i32 immarg, <8 x i1>, <8 x i32>) #1

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i32 @llvm.vector.reduce.add.v8i32(<8 x i32>) #2

attributes #0 = { argmemonly nofree norecurse nosync nounwind readonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+v,+f,+m,+c,+d,+zba,-save-restore" }
attributes #1 = { nocallback nofree nosync nounwind readonly willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone willreturn }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 15.0.0 (https://github.com/llvm/llvm-project.git 875ee0ed1c5af58cb4909f239093e25a35d7a21a)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"short", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!9, !9, i64 0}
!9 = !{!"int", !6, i64 0}
!10 = distinct !{!10, !11, !12}
!11 = !{!"llvm.loop.mustprogress"}
!12 = !{!"llvm.loop.isvectorized", i32 1}
!13 = distinct !{!13, !11, !14, !12}
!14 = !{!"llvm.loop.unroll.runtime.disable"}
