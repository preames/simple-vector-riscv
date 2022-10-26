; ModuleID = 'aos_reduce_sum_i32.c'
source_filename = "aos_reduce_sum_i32.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
target triple = "riscv64-unknown-unknown"

%struct.T = type { i64, i64, i64, i64, i64, i64, i32, i32 }

; Function Attrs: argmemonly nofree norecurse nosync nounwind readonly vscale_range(8,1024)
define dso_local signext i32 @aos_reduce_sum_i32(i32 noundef signext %len, ptr nocapture noundef readonly %a) local_unnamed_addr #0 {
entry:
  %cmp4.not = icmp eq i32 %len, 0
  br i1 %cmp4.not, label %for.cond.cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %len to i64
  %0 = tail call i64 @llvm.vscale.i64()
  %1 = shl nuw nsw i64 %0, 2
  %min.iters.check = icmp ugt i64 %1, %wide.trip.count
  br i1 %min.iters.check, label %for.body.preheader10, label %vector.ph

vector.ph:                                        ; preds = %for.body.preheader
  %2 = tail call i64 @llvm.vscale.i64()
  %3 = shl nuw nsw i64 %2, 2
  %n.mod.vf = urem i64 %wide.trip.count, %3
  %n.vec = sub nuw nsw i64 %wide.trip.count, %n.mod.vf
  %4 = tail call <vscale x 2 x i64> @llvm.experimental.stepvector.nxv2i64()
  %5 = tail call i64 @llvm.vscale.i64()
  %6 = shl nuw nsw i64 %5, 1
  %.splatinsert = insertelement <vscale x 2 x i64> poison, i64 %6, i64 0
  %.splat = shufflevector <vscale x 2 x i64> %.splatinsert, <vscale x 2 x i64> poison, <vscale x 2 x i32> zeroinitializer
  %7 = tail call i64 @llvm.vscale.i64()
  %8 = shl nuw nsw i64 %7, 2
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <vscale x 2 x i64> [ %4, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %vec.phi = phi <vscale x 2 x i32> [ zeroinitializer, %vector.ph ], [ %11, %vector.body ]
  %vec.phi8 = phi <vscale x 2 x i32> [ zeroinitializer, %vector.ph ], [ %12, %vector.body ]
  %step.add = add <vscale x 2 x i64> %vec.ind, %.splat
  %9 = getelementptr inbounds %struct.T, ptr %a, <vscale x 2 x i64> %vec.ind, i32 6
  %10 = getelementptr inbounds %struct.T, ptr %a, <vscale x 2 x i64> %step.add, i32 6
  %wide.masked.gather = tail call <vscale x 2 x i32> @llvm.masked.gather.nxv2i32.nxv2p0(<vscale x 2 x ptr> %9, i32 8, <vscale x 2 x i1> shufflevector (<vscale x 2 x i1> insertelement (<vscale x 2 x i1> poison, i1 true, i32 0), <vscale x 2 x i1> poison, <vscale x 2 x i32> zeroinitializer), <vscale x 2 x i32> poison), !tbaa !4
  %wide.masked.gather9 = tail call <vscale x 2 x i32> @llvm.masked.gather.nxv2i32.nxv2p0(<vscale x 2 x ptr> %10, i32 8, <vscale x 2 x i1> shufflevector (<vscale x 2 x i1> insertelement (<vscale x 2 x i1> poison, i1 true, i32 0), <vscale x 2 x i1> poison, <vscale x 2 x i32> zeroinitializer), <vscale x 2 x i32> poison), !tbaa !4
  %11 = add <vscale x 2 x i32> %wide.masked.gather, %vec.phi
  %12 = add <vscale x 2 x i32> %wide.masked.gather9, %vec.phi8
  %index.next = add nuw i64 %index, %8
  %vec.ind.next = add <vscale x 2 x i64> %step.add, %.splat
  %13 = icmp eq i64 %index.next, %n.vec
  br i1 %13, label %middle.block, label %vector.body, !llvm.loop !10

middle.block:                                     ; preds = %vector.body
  %bin.rdx = add <vscale x 2 x i32> %12, %11
  %14 = tail call i32 @llvm.vector.reduce.add.nxv2i32(<vscale x 2 x i32> %bin.rdx)
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.cond.cleanup, label %for.body.preheader10

for.body.preheader10:                             ; preds = %for.body.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %for.body.preheader ], [ %n.vec, %middle.block ]
  %sum.05.ph = phi i32 [ 0, %for.body.preheader ], [ %14, %middle.block ]
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %middle.block, %entry
  %sum.0.lcssa = phi i32 [ 0, %entry ], [ %14, %middle.block ], [ %add, %for.body ]
  ret i32 %sum.0.lcssa

for.body:                                         ; preds = %for.body.preheader10, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ %indvars.iv.ph, %for.body.preheader10 ]
  %sum.05 = phi i32 [ %add, %for.body ], [ %sum.05.ph, %for.body.preheader10 ]
  %g = getelementptr inbounds %struct.T, ptr %a, i64 %indvars.iv, i32 6
  %15 = load i32, ptr %g, align 8, !tbaa !4
  %add = add nsw i32 %15, %sum.05
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !llvm.loop !13
}

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i64 @llvm.vscale.i64() #1

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare <vscale x 2 x i64> @llvm.experimental.stepvector.nxv2i64() #1

; Function Attrs: nocallback nofree nosync nounwind readonly willreturn
declare <vscale x 2 x i32> @llvm.masked.gather.nxv2i32.nxv2p0(<vscale x 2 x ptr>, i32 immarg, <vscale x 2 x i1>, <vscale x 2 x i32>) #2

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i32 @llvm.vector.reduce.add.nxv2i32(<vscale x 2 x i32>) #1

attributes #0 = { argmemonly nofree norecurse nosync nounwind readonly vscale_range(8,1024) "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,+v,+zba,+zbb,+zbc,+zbs,+zve32f,+zve32x,+zve64d,+zve64f,+zve64x,+zvl128b,+zvl256b,+zvl32b,+zvl512b,+zvl64b,-save-restore" }
attributes #1 = { nocallback nofree nosync nounwind readnone willreturn }
attributes #2 = { nocallback nofree nosync nounwind readonly willreturn }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64d"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 269bc684e7a0c3f727ea5e74270112585acaf55d)"}
!4 = !{!5, !9, i64 48}
!5 = !{!"T", !6, i64 0, !6, i64 8, !6, i64 16, !6, i64 24, !6, i64 32, !6, i64 40, !9, i64 48, !9, i64 52}
!6 = !{!"long", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = distinct !{!10, !11, !12}
!11 = !{!"llvm.loop.mustprogress"}
!12 = !{!"llvm.loop.isvectorized", i32 1}
!13 = distinct !{!13, !11, !14, !12}
!14 = !{!"llvm.loop.unroll.runtime.disable"}
