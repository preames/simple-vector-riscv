; ModuleID = 'dotproduct_i32.c'
source_filename = "dotproduct_i32.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64-unknown-unknown"

; Function Attrs: argmemonly nofree norecurse nosync nounwind readonly vscale_range(16,1024)
define dso_local signext i32 @dotproduct_i32(i32 noundef signext %len, ptr nocapture noundef readonly %a, ptr nocapture noundef readonly %b) local_unnamed_addr #0 {
entry:
  %cmp7.not = icmp eq i32 %len, 0
  br i1 %cmp7.not, label %for.cond.cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %len to i64
  %0 = tail call i64 @llvm.vscale.i64()
  %1 = shl nuw nsw i64 %0, 2
  %min.iters.check = icmp ugt i64 %1, %wide.trip.count
  br i1 %min.iters.check, label %for.body.preheader14, label %vector.ph

vector.ph:                                        ; preds = %for.body.preheader
  %2 = tail call i64 @llvm.vscale.i64()
  %3 = shl nuw nsw i64 %2, 2
  %n.mod.vf = urem i64 %wide.trip.count, %3
  %n.vec = sub nuw nsw i64 %wide.trip.count, %n.mod.vf
  %4 = tail call i32 @llvm.vscale.i32()
  %5 = shl nuw nsw i32 %4, 1
  %6 = zext i32 %5 to i64
  %7 = tail call i32 @llvm.vscale.i32()
  %8 = shl nuw nsw i32 %7, 1
  %9 = zext i32 %8 to i64
  %10 = tail call i64 @llvm.vscale.i64()
  %11 = shl nuw nsw i64 %10, 2
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.phi = phi <vscale x 2 x i32> [ zeroinitializer, %vector.ph ], [ %18, %vector.body ]
  %vec.phi10 = phi <vscale x 2 x i32> [ zeroinitializer, %vector.ph ], [ %19, %vector.body ]
  %12 = getelementptr inbounds i32, ptr %a, i64 %index
  %wide.load = load <vscale x 2 x i32>, ptr %12, align 4, !tbaa !4
  %13 = getelementptr inbounds i32, ptr %12, i64 %6
  %wide.load11 = load <vscale x 2 x i32>, ptr %13, align 4, !tbaa !4
  %14 = getelementptr inbounds i32, ptr %b, i64 %index
  %wide.load12 = load <vscale x 2 x i32>, ptr %14, align 4, !tbaa !4
  %15 = getelementptr inbounds i32, ptr %14, i64 %9
  %wide.load13 = load <vscale x 2 x i32>, ptr %15, align 4, !tbaa !4
  %16 = mul nsw <vscale x 2 x i32> %wide.load12, %wide.load
  %17 = mul nsw <vscale x 2 x i32> %wide.load13, %wide.load11
  %18 = add <vscale x 2 x i32> %16, %vec.phi
  %19 = add <vscale x 2 x i32> %17, %vec.phi10
  %index.next = add nuw i64 %index, %11
  %20 = icmp eq i64 %index.next, %n.vec
  br i1 %20, label %middle.block, label %vector.body, !llvm.loop !8

middle.block:                                     ; preds = %vector.body
  %bin.rdx = add <vscale x 2 x i32> %19, %18
  %21 = tail call i32 @llvm.vector.reduce.add.nxv2i32(<vscale x 2 x i32> %bin.rdx)
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.cond.cleanup, label %for.body.preheader14

for.body.preheader14:                             ; preds = %for.body.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %for.body.preheader ], [ %n.vec, %middle.block ]
  %res.08.ph = phi i32 [ 0, %for.body.preheader ], [ %21, %middle.block ]
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %middle.block, %entry
  %res.0.lcssa = phi i32 [ 0, %entry ], [ %21, %middle.block ], [ %add, %for.body ]
  ret i32 %res.0.lcssa

for.body:                                         ; preds = %for.body.preheader14, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ %indvars.iv.ph, %for.body.preheader14 ]
  %res.08 = phi i32 [ %add, %for.body ], [ %res.08.ph, %for.body.preheader14 ]
  %arrayidx = getelementptr inbounds i32, ptr %a, i64 %indvars.iv
  %22 = load i32, ptr %arrayidx, align 4, !tbaa !4
  %arrayidx2 = getelementptr inbounds i32, ptr %b, i64 %indvars.iv
  %23 = load i32, ptr %arrayidx2, align 4, !tbaa !4
  %mul = mul nsw i32 %23, %22
  %add = add nsw i32 %mul, %res.08
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !llvm.loop !11
}

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i64 @llvm.vscale.i64() #1

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i32 @llvm.vscale.i32() #1

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i32 @llvm.vector.reduce.add.nxv2i32(<vscale x 2 x i32>) #1

attributes #0 = { argmemonly nofree norecurse nosync nounwind readonly vscale_range(16,1024) "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,+v,+zba,+zbb,+zbc,+zbs,+zve32f,+zve32x,+zve64d,+zve64f,+zve64x,+zvl1024b,+zvl128b,+zvl256b,+zvl32b,+zvl512b,+zvl64b,-save-restore" }
attributes #1 = { nocallback nofree nosync nounwind readnone willreturn }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64d"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 16.0.0 (https://github.com/llvm/llvm-project.git a819f6c8d1f4909a1ac3a2eff390236e4e31dba3)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = distinct !{!8, !9, !10}
!9 = !{!"llvm.loop.mustprogress"}
!10 = !{!"llvm.loop.isvectorized", i32 1}
!11 = distinct !{!11, !9, !12, !10}
!12 = !{!"llvm.loop.unroll.runtime.disable"}
