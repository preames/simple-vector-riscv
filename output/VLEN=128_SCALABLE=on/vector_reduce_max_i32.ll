; ModuleID = 'vector_reduce_max_i32.c'
source_filename = "vector_reduce_max_i32.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64-unknown-unknown"

; Function Attrs: argmemonly nofree norecurse nosync nounwind readonly vscale_range(2,1024)
define dso_local signext i32 @vector_reduce_max_i32(ptr nocapture noundef readonly %a, i32 noundef signext %a_len) local_unnamed_addr #0 {
entry:
  %cmp10.not = icmp eq i32 %a_len, 0
  br i1 %cmp10.not, label %for.cond.cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %a_len to i64
  %0 = tail call i64 @llvm.vscale.i64()
  %1 = shl nuw nsw i64 %0, 2
  %min.iters.check = icmp ugt i64 %1, %wide.trip.count
  br i1 %min.iters.check, label %for.body.preheader15, label %vector.ph

vector.ph:                                        ; preds = %for.body.preheader
  %2 = tail call i64 @llvm.vscale.i64()
  %3 = shl nuw nsw i64 %2, 2
  %n.mod.vf = urem i64 %wide.trip.count, %3
  %n.vec = sub nuw nsw i64 %wide.trip.count, %n.mod.vf
  %4 = tail call i32 @llvm.vscale.i32()
  %5 = shl nuw nsw i32 %4, 1
  %6 = zext i32 %5 to i64
  %7 = tail call i64 @llvm.vscale.i64()
  %8 = shl nuw nsw i64 %7, 2
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.phi = phi <vscale x 2 x i32> [ shufflevector (<vscale x 2 x i32> insertelement (<vscale x 2 x i32> poison, i32 -987654321, i32 0), <vscale x 2 x i32> poison, <vscale x 2 x i32> zeroinitializer), %vector.ph ], [ %11, %vector.body ]
  %vec.phi13 = phi <vscale x 2 x i32> [ shufflevector (<vscale x 2 x i32> insertelement (<vscale x 2 x i32> poison, i32 -987654321, i32 0), <vscale x 2 x i32> poison, <vscale x 2 x i32> zeroinitializer), %vector.ph ], [ %12, %vector.body ]
  %9 = getelementptr inbounds i32, ptr %a, i64 %index
  %wide.load = load <vscale x 2 x i32>, ptr %9, align 4, !tbaa !4
  %10 = getelementptr inbounds i32, ptr %9, i64 %6
  %wide.load14 = load <vscale x 2 x i32>, ptr %10, align 4, !tbaa !4
  %11 = tail call <vscale x 2 x i32> @llvm.smax.nxv2i32(<vscale x 2 x i32> %wide.load, <vscale x 2 x i32> %vec.phi)
  %12 = tail call <vscale x 2 x i32> @llvm.smax.nxv2i32(<vscale x 2 x i32> %wide.load14, <vscale x 2 x i32> %vec.phi13)
  %index.next = add nuw i64 %index, %8
  %13 = icmp eq i64 %index.next, %n.vec
  br i1 %13, label %middle.block, label %vector.body, !llvm.loop !8

middle.block:                                     ; preds = %vector.body
  %14 = tail call <vscale x 2 x i32> @llvm.smax.nxv2i32(<vscale x 2 x i32> %11, <vscale x 2 x i32> %12)
  %15 = tail call i32 @llvm.vector.reduce.smax.nxv2i32(<vscale x 2 x i32> %14)
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.cond.cleanup, label %for.body.preheader15

for.body.preheader15:                             ; preds = %for.body.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %for.body.preheader ], [ %n.vec, %middle.block ]
  %max.011.ph = phi i32 [ -987654321, %for.body.preheader ], [ %15, %middle.block ]
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %middle.block, %entry
  %max.0.lcssa = phi i32 [ -987654321, %entry ], [ %15, %middle.block ], [ %17, %for.body ]
  ret i32 %max.0.lcssa

for.body:                                         ; preds = %for.body.preheader15, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ %indvars.iv.ph, %for.body.preheader15 ]
  %max.011 = phi i32 [ %17, %for.body ], [ %max.011.ph, %for.body.preheader15 ]
  %arrayidx = getelementptr inbounds i32, ptr %a, i64 %indvars.iv
  %16 = load i32, ptr %arrayidx, align 4, !tbaa !4
  %17 = tail call i32 @llvm.smax.i32(i32 %16, i32 %max.011)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !llvm.loop !11
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #1

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i64 @llvm.vscale.i64() #2

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i32 @llvm.vscale.i32() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare <vscale x 2 x i32> @llvm.smax.nxv2i32(<vscale x 2 x i32>, <vscale x 2 x i32>) #1

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i32 @llvm.vector.reduce.smax.nxv2i32(<vscale x 2 x i32>) #2

attributes #0 = { argmemonly nofree norecurse nosync nounwind readonly vscale_range(2,1024) "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,+v,+zba,+zbb,+zbc,+zbs,+zve32f,+zve32x,+zve64d,+zve64f,+zve64x,+zvl128b,+zvl32b,+zvl64b,-save-restore" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone willreturn }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64d"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 9472a810ed33bc9e655484f43047eed07d50bc16)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = distinct !{!8, !9, !10}
!9 = !{!"llvm.loop.mustprogress"}
!10 = !{!"llvm.loop.isvectorized", i32 1}
!11 = distinct !{!11, !9, !12, !10}
!12 = !{!"llvm.loop.unroll.runtime.disable"}
