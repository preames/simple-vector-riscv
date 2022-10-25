; ModuleID = 'aos_reduce_sum_i64.c'
source_filename = "aos_reduce_sum_i64.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
target triple = "riscv64"

%struct.T = type { i64, i64, i64, i64, i64, i64, i64 }

; Function Attrs: argmemonly nofree norecurse nosync nounwind readonly
define dso_local signext i32 @aos_reduce_sum_i64(i32 noundef signext %len, ptr nocapture noundef readonly %a) local_unnamed_addr #0 {
entry:
  %cmp4.not = icmp eq i32 %len, 0
  br i1 %cmp4.not, label %for.cond.cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %len to i64
  %min.iters.check = icmp ult i32 %len, 4
  br i1 %min.iters.check, label %for.body.preheader10, label %vector.ph

vector.ph:                                        ; preds = %for.body.preheader
  %n.vec = and i64 %wide.trip.count, 4294967292
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <2 x i64> [ <i64 0, i64 1>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %vec.phi = phi <2 x i64> [ zeroinitializer, %vector.ph ], [ %2, %vector.body ]
  %vec.phi8 = phi <2 x i64> [ zeroinitializer, %vector.ph ], [ %3, %vector.body ]
  %step.add = add <2 x i64> %vec.ind, <i64 2, i64 2>
  %0 = getelementptr inbounds %struct.T, ptr %a, <2 x i64> %vec.ind, i32 6
  %1 = getelementptr inbounds %struct.T, ptr %a, <2 x i64> %step.add, i32 6
  %wide.masked.gather = tail call <2 x i64> @llvm.masked.gather.v2i64.v2p0(<2 x ptr> %0, i32 8, <2 x i1> <i1 true, i1 true>, <2 x i64> poison), !tbaa !4
  %wide.masked.gather9 = tail call <2 x i64> @llvm.masked.gather.v2i64.v2p0(<2 x ptr> %1, i32 8, <2 x i1> <i1 true, i1 true>, <2 x i64> poison), !tbaa !4
  %2 = add <2 x i64> %wide.masked.gather, %vec.phi
  %3 = add <2 x i64> %wide.masked.gather9, %vec.phi8
  %index.next = add nuw i64 %index, 4
  %vec.ind.next = add <2 x i64> %vec.ind, <i64 4, i64 4>
  %4 = icmp eq i64 %index.next, %n.vec
  br i1 %4, label %middle.block, label %vector.body, !llvm.loop !9

middle.block:                                     ; preds = %vector.body
  %bin.rdx = add <2 x i64> %3, %2
  %5 = tail call i64 @llvm.vector.reduce.add.v2i64(<2 x i64> %bin.rdx)
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br i1 %cmp.n, label %for.cond.cleanup.loopexit, label %for.body.preheader10

for.body.preheader10:                             ; preds = %for.body.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %for.body.preheader ], [ %n.vec, %middle.block ]
  %sum.05.ph = phi i64 [ 0, %for.body.preheader ], [ %5, %middle.block ]
  br label %for.body

for.cond.cleanup.loopexit:                        ; preds = %for.body, %middle.block
  %add.lcssa = phi i64 [ %5, %middle.block ], [ %add, %for.body ]
  %6 = trunc i64 %add.lcssa to i32
  br label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit, %entry
  %sum.0.lcssa = phi i32 [ 0, %entry ], [ %6, %for.cond.cleanup.loopexit ]
  ret i32 %sum.0.lcssa

for.body:                                         ; preds = %for.body.preheader10, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ %indvars.iv.ph, %for.body.preheader10 ]
  %sum.05 = phi i64 [ %add, %for.body ], [ %sum.05.ph, %for.body.preheader10 ]
  %g = getelementptr inbounds %struct.T, ptr %a, i64 %indvars.iv, i32 6
  %7 = load i64, ptr %g, align 8, !tbaa !4
  %add = add nsw i64 %7, %sum.05
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond.cleanup.loopexit, label %for.body, !llvm.loop !12
}

; Function Attrs: nocallback nofree nosync nounwind readonly willreturn
declare <2 x i64> @llvm.masked.gather.v2i64.v2p0(<2 x ptr>, i32 immarg, <2 x i1>, <2 x i64>) #1

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i64 @llvm.vector.reduce.add.v2i64(<2 x i64>) #2

attributes #0 = { argmemonly nofree norecurse nosync nounwind readonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+v,+f,+m,+c,+d,+zba,+zbb,+zbc,+zbs,-save-restore" }
attributes #1 = { nocallback nofree nosync nounwind readonly willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone willreturn }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 6d859266803e2a9060c4e8770f92cc2c7bd05a3b)"}
!4 = !{!5, !6, i64 48}
!5 = !{!"T", !6, i64 0, !6, i64 8, !6, i64 16, !6, i64 24, !6, i64 32, !6, i64 40, !6, i64 48}
!6 = !{!"long", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.mustprogress"}
!11 = !{!"llvm.loop.isvectorized", i32 1}
!12 = distinct !{!12, !10, !13, !11}
!13 = !{!"llvm.loop.unroll.runtime.disable"}