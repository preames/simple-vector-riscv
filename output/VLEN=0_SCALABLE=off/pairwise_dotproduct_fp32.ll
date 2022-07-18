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
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %entry
  ret void

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %for.body ]
  %arrayidx = getelementptr inbounds float, ptr %b, i64 %indvars.iv
  %1 = load float, ptr %arrayidx, align 4, !tbaa !4
  %arrayidx2 = getelementptr inbounds float, ptr %c, i64 %indvars.iv
  %2 = load float, ptr %arrayidx2, align 4, !tbaa !4
  %3 = or i64 %indvars.iv, 1
  %arrayidx5 = getelementptr inbounds float, ptr %b, i64 %3
  %4 = load float, ptr %arrayidx5, align 4, !tbaa !4
  %arrayidx8 = getelementptr inbounds float, ptr %c, i64 %3
  %5 = load float, ptr %arrayidx8, align 4, !tbaa !4
  %mul9 = fmul float %4, %5
  %6 = tail call float @llvm.fmuladd.f32(float %1, float %2, float %mul9)
  %7 = lshr exact i64 %indvars.iv, 1
  %arrayidx12 = getelementptr inbounds float, ptr %a, i64 %7
  store float %6, ptr %arrayidx12, align 4, !tbaa !4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 2
  %cmp = icmp ult i64 %indvars.iv.next, %0
  br i1 %cmp, label %for.body, label %for.cond.cleanup, !llvm.loop !8
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

attributes #0 = { argmemonly nofree nosync nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+v,+f,+m,+c,+d,+zba,+zbb,+zbc,+zbs,-save-restore" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 15.0.0 (https://github.com/llvm/llvm-project.git 1e451369d2017830d3dbddec24063170b7aca0de)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
