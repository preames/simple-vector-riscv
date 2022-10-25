; ModuleID = 'pairwise_dotproduct_fp32.c'
source_filename = "pairwise_dotproduct_fp32.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
target triple = "riscv64"

; Function Attrs: argmemonly nofree nosync nounwind
define dso_local void @pairwise_dotproduct_fp32(i32 noundef signext %len, ptr nocapture noundef writeonly %a, ptr nocapture noundef readonly %b, ptr nocapture noundef readonly %c) local_unnamed_addr #0 {
entry:
  %div22 = and i32 %len, -2
  %cmp24.not = icmp eq i32 %div22, 0
  br i1 %cmp24.not, label %for.cond.cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  %0 = zext i32 %div22 to i64
  %1 = add nsw i64 %0, -1
  %2 = lshr i64 %1, 1
  %3 = add nuw i64 %2, 1
  %4 = tail call i64 @llvm.vscale.i64()
  %5 = shl i64 %4, 1
  %6 = tail call i64 @llvm.umax.i64(i64 %5, i64 12)
  %min.iters.check = icmp ult i64 %3, %6
  br i1 %min.iters.check, label %for.body.preheader36, label %vector.memcheck

vector.memcheck:                                  ; preds = %for.body.preheader
  %7 = add nsw i64 %0, -1
  %8 = lshr i64 %7, 1
  %9 = shl i64 %8, 2
  %10 = add i64 %9, 4
  %uglygep = getelementptr i8, ptr %a, i64 %10
  %11 = shl i64 %8, 3
  %12 = add i64 %11, 8
  %uglygep28 = getelementptr i8, ptr %b, i64 %12
  %uglygep29 = getelementptr i8, ptr %c, i64 %12
  %bound0 = icmp ugt ptr %uglygep28, %a
  %bound1 = icmp ugt ptr %uglygep, %b
  %found.conflict = and i1 %bound0, %bound1
  %bound030 = icmp ugt ptr %uglygep29, %a
  %bound131 = icmp ugt ptr %uglygep, %c
  %found.conflict32 = and i1 %bound030, %bound131
  %conflict.rdx = or i1 %found.conflict, %found.conflict32
  br i1 %conflict.rdx, label %for.body.preheader36, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %13 = tail call i64 @llvm.vscale.i64()
  %14 = shl i64 %13, 1
  %n.mod.vf = urem i64 %3, %14
  %n.vec = sub i64 %3, %n.mod.vf
  %ind.end = shl i64 %n.vec, 1
  %15 = tail call <vscale x 2 x i64> @llvm.experimental.stepvector.nxv2i64()
  %16 = shl <vscale x 2 x i64> %15, shufflevector (<vscale x 2 x i64> insertelement (<vscale x 2 x i64> poison, i64 1, i32 0), <vscale x 2 x i64> poison, <vscale x 2 x i32> zeroinitializer)
  %17 = tail call i64 @llvm.vscale.i64()
  %18 = shl i64 %17, 2
  %.splatinsert = insertelement <vscale x 2 x i64> poison, i64 %18, i64 0
  %.splat = shufflevector <vscale x 2 x i64> %.splatinsert, <vscale x 2 x i64> poison, <vscale x 2 x i32> zeroinitializer
  %19 = tail call i64 @llvm.vscale.i64()
  %20 = shl i64 %19, 1
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <vscale x 2 x i64> [ %16, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %offset.idx = and i64 %index, 9223372036854775806
  %21 = getelementptr inbounds float, ptr %b, <vscale x 2 x i64> %vec.ind
  %wide.masked.gather = tail call <vscale x 2 x float> @llvm.masked.gather.nxv2f32.nxv2p0(<vscale x 2 x ptr> %21, i32 4, <vscale x 2 x i1> shufflevector (<vscale x 2 x i1> insertelement (<vscale x 2 x i1> poison, i1 true, i32 0), <vscale x 2 x i1> poison, <vscale x 2 x i32> zeroinitializer), <vscale x 2 x float> poison), !tbaa !4, !alias.scope !8
  %22 = getelementptr inbounds float, ptr %c, <vscale x 2 x i64> %vec.ind
  %wide.masked.gather33 = tail call <vscale x 2 x float> @llvm.masked.gather.nxv2f32.nxv2p0(<vscale x 2 x ptr> %22, i32 4, <vscale x 2 x i1> shufflevector (<vscale x 2 x i1> insertelement (<vscale x 2 x i1> poison, i1 true, i32 0), <vscale x 2 x i1> poison, <vscale x 2 x i32> zeroinitializer), <vscale x 2 x float> poison), !tbaa !4, !alias.scope !11
  %23 = or <vscale x 2 x i64> %vec.ind, shufflevector (<vscale x 2 x i64> insertelement (<vscale x 2 x i64> poison, i64 1, i32 0), <vscale x 2 x i64> poison, <vscale x 2 x i32> zeroinitializer)
  %24 = getelementptr inbounds float, ptr %b, <vscale x 2 x i64> %23
  %wide.masked.gather34 = tail call <vscale x 2 x float> @llvm.masked.gather.nxv2f32.nxv2p0(<vscale x 2 x ptr> %24, i32 4, <vscale x 2 x i1> shufflevector (<vscale x 2 x i1> insertelement (<vscale x 2 x i1> poison, i1 true, i32 0), <vscale x 2 x i1> poison, <vscale x 2 x i32> zeroinitializer), <vscale x 2 x float> poison), !tbaa !4, !alias.scope !8
  %25 = getelementptr inbounds float, ptr %c, <vscale x 2 x i64> %23
  %wide.masked.gather35 = tail call <vscale x 2 x float> @llvm.masked.gather.nxv2f32.nxv2p0(<vscale x 2 x ptr> %25, i32 4, <vscale x 2 x i1> shufflevector (<vscale x 2 x i1> insertelement (<vscale x 2 x i1> poison, i1 true, i32 0), <vscale x 2 x i1> poison, <vscale x 2 x i32> zeroinitializer), <vscale x 2 x float> poison), !tbaa !4, !alias.scope !11
  %26 = fmul <vscale x 2 x float> %wide.masked.gather34, %wide.masked.gather35
  %27 = tail call <vscale x 2 x float> @llvm.fmuladd.nxv2f32(<vscale x 2 x float> %wide.masked.gather, <vscale x 2 x float> %wide.masked.gather33, <vscale x 2 x float> %26)
  %28 = getelementptr inbounds float, ptr %a, i64 %offset.idx
  store <vscale x 2 x float> %27, ptr %28, align 4, !tbaa !4, !alias.scope !13, !noalias !15
  %index.next = add nuw i64 %index, %20
  %vec.ind.next = add <vscale x 2 x i64> %vec.ind, %.splat
  %29 = icmp eq i64 %index.next, %n.vec
  br i1 %29, label %middle.block, label %vector.body, !llvm.loop !16

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.cond.cleanup, label %for.body.preheader36

for.body.preheader36:                             ; preds = %vector.memcheck, %for.body.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %for.body.preheader ], [ %ind.end, %middle.block ]
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %middle.block, %entry
  ret void

for.body:                                         ; preds = %for.body.preheader36, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ %indvars.iv.ph, %for.body.preheader36 ]
  %arrayidx = getelementptr inbounds float, ptr %b, i64 %indvars.iv
  %30 = load float, ptr %arrayidx, align 4, !tbaa !4
  %arrayidx2 = getelementptr inbounds float, ptr %c, i64 %indvars.iv
  %31 = load float, ptr %arrayidx2, align 4, !tbaa !4
  %32 = or i64 %indvars.iv, 1
  %arrayidx5 = getelementptr inbounds float, ptr %b, i64 %32
  %33 = load float, ptr %arrayidx5, align 4, !tbaa !4
  %arrayidx8 = getelementptr inbounds float, ptr %c, i64 %32
  %34 = load float, ptr %arrayidx8, align 4, !tbaa !4
  %mul9 = fmul float %33, %34
  %35 = tail call float @llvm.fmuladd.f32(float %30, float %31, float %mul9)
  %36 = lshr exact i64 %indvars.iv, 1
  %arrayidx12 = getelementptr inbounds float, ptr %a, i64 %36
  store float %35, ptr %arrayidx12, align 4, !tbaa !4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 2
  %cmp = icmp ult i64 %indvars.iv.next, %0
  br i1 %cmp, label %for.body, label %for.cond.cleanup, !llvm.loop !19
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i64 @llvm.vscale.i64() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.umax.i64(i64, i64) #3

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare <vscale x 2 x i64> @llvm.experimental.stepvector.nxv2i64() #2

; Function Attrs: nocallback nofree nosync nounwind readonly willreturn
declare <vscale x 2 x float> @llvm.masked.gather.nxv2f32.nxv2p0(<vscale x 2 x ptr>, i32 immarg, <vscale x 2 x i1>, <vscale x 2 x float>) #4

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare <vscale x 2 x float> @llvm.fmuladd.nxv2f32(<vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float>) #3

attributes #0 = { argmemonly nofree nosync nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+v,+f,+m,+c,+d,+zba,+zbb,+zbc,+zbs,-save-restore" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nocallback nofree nosync nounwind readonly willreturn }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 6d859266803e2a9060c4e8770f92cc2c7bd05a3b)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!9}
!9 = distinct !{!9, !10}
!10 = distinct !{!10, !"LVerDomain"}
!11 = !{!12}
!12 = distinct !{!12, !10}
!13 = !{!14}
!14 = distinct !{!14, !10}
!15 = !{!9, !12}
!16 = distinct !{!16, !17, !18}
!17 = !{!"llvm.loop.mustprogress"}
!18 = !{!"llvm.loop.isvectorized", i32 1}
!19 = distinct !{!19, !17, !18}
