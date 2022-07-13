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
  %min.iters.check = icmp ult i64 %1, 22
  br i1 %min.iters.check, label %for.body.preheader36, label %vector.memcheck

vector.memcheck:                                  ; preds = %for.body.preheader
  %4 = add nsw i64 %0, -1
  %5 = lshr i64 %4, 1
  %6 = shl i64 %5, 2
  %7 = add i64 %6, 4
  %uglygep = getelementptr i8, ptr %a, i64 %7
  %8 = shl i64 %5, 3
  %9 = add i64 %8, 8
  %uglygep28 = getelementptr i8, ptr %b, i64 %9
  %uglygep29 = getelementptr i8, ptr %c, i64 %9
  %bound0 = icmp ugt ptr %uglygep28, %a
  %bound1 = icmp ugt ptr %uglygep, %b
  %found.conflict = and i1 %bound0, %bound1
  %bound030 = icmp ugt ptr %uglygep29, %a
  %bound131 = icmp ugt ptr %uglygep, %c
  %found.conflict32 = and i1 %bound030, %bound131
  %conflict.rdx = or i1 %found.conflict, %found.conflict32
  br i1 %conflict.rdx, label %for.body.preheader36, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %n.vec = and i64 %3, -4
  %ind.end = shl i64 %n.vec, 1
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 2, i64 4, i64 6>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %offset.idx = and i64 %index, 9223372036854775804
  %10 = getelementptr inbounds float, ptr %b, <4 x i64> %vec.ind
  %wide.masked.gather = call <4 x float> @llvm.masked.gather.v4f32.v4p0(<4 x ptr> %10, i32 4, <4 x i1> <i1 true, i1 true, i1 true, i1 true>, <4 x float> undef), !tbaa !4, !alias.scope !8
  %11 = getelementptr inbounds float, ptr %c, <4 x i64> %vec.ind
  %wide.masked.gather33 = call <4 x float> @llvm.masked.gather.v4f32.v4p0(<4 x ptr> %11, i32 4, <4 x i1> <i1 true, i1 true, i1 true, i1 true>, <4 x float> undef), !tbaa !4, !alias.scope !11
  %12 = or <4 x i64> %vec.ind, <i64 1, i64 1, i64 1, i64 1>
  %13 = getelementptr inbounds float, ptr %b, <4 x i64> %12
  %wide.masked.gather34 = call <4 x float> @llvm.masked.gather.v4f32.v4p0(<4 x ptr> %13, i32 4, <4 x i1> <i1 true, i1 true, i1 true, i1 true>, <4 x float> undef), !tbaa !4, !alias.scope !8
  %14 = getelementptr inbounds float, ptr %c, <4 x i64> %12
  %wide.masked.gather35 = call <4 x float> @llvm.masked.gather.v4f32.v4p0(<4 x ptr> %14, i32 4, <4 x i1> <i1 true, i1 true, i1 true, i1 true>, <4 x float> undef), !tbaa !4, !alias.scope !11
  %15 = fmul <4 x float> %wide.masked.gather34, %wide.masked.gather35
  %16 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %wide.masked.gather, <4 x float> %wide.masked.gather33, <4 x float> %15)
  %17 = getelementptr inbounds float, ptr %a, i64 %offset.idx
  store <4 x float> %16, ptr %17, align 4, !tbaa !4, !alias.scope !13, !noalias !15
  %index.next = add nuw i64 %index, 4
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 8, i64 8, i64 8, i64 8>
  %18 = icmp eq i64 %index.next, %n.vec
  br i1 %18, label %middle.block, label %vector.body, !llvm.loop !16

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %3, %n.vec
  br i1 %cmp.n, label %for.cond.cleanup, label %for.body.preheader36

for.body.preheader36:                             ; preds = %vector.memcheck, %for.body.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %for.body.preheader ], [ %ind.end, %middle.block ]
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %middle.block, %entry
  ret void

for.body:                                         ; preds = %for.body.preheader36, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ %indvars.iv.ph, %for.body.preheader36 ]
  %arrayidx = getelementptr inbounds float, ptr %b, i64 %indvars.iv
  %19 = load float, ptr %arrayidx, align 4, !tbaa !4
  %arrayidx2 = getelementptr inbounds float, ptr %c, i64 %indvars.iv
  %20 = load float, ptr %arrayidx2, align 4, !tbaa !4
  %21 = or i64 %indvars.iv, 1
  %arrayidx5 = getelementptr inbounds float, ptr %b, i64 %21
  %22 = load float, ptr %arrayidx5, align 4, !tbaa !4
  %arrayidx8 = getelementptr inbounds float, ptr %c, i64 %21
  %23 = load float, ptr %arrayidx8, align 4, !tbaa !4
  %mul9 = fmul float %22, %23
  %24 = tail call float @llvm.fmuladd.f32(float %19, float %20, float %mul9)
  %25 = lshr exact i64 %indvars.iv, 1
  %arrayidx12 = getelementptr inbounds float, ptr %a, i64 %25
  store float %24, ptr %arrayidx12, align 4, !tbaa !4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 2
  %cmp = icmp ult i64 %indvars.iv.next, %0
  br i1 %cmp, label %for.body, label %for.cond.cleanup, !llvm.loop !19
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: nocallback nofree nosync nounwind readonly willreturn
declare <4 x float> @llvm.masked.gather.v4f32.v4p0(<4 x ptr>, i32 immarg, <4 x i1>, <4 x float>) #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare <4 x float> @llvm.fmuladd.v4f32(<4 x float>, <4 x float>, <4 x float>) #3

attributes #0 = { argmemonly nofree nosync nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+v,+f,+m,+c,+d,+zba,-save-restore" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readonly willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 15.0.0 (https://github.com/llvm/llvm-project.git dde2a7fb6da46da2b2f765fa569d8fddb4270eb6)"}
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
