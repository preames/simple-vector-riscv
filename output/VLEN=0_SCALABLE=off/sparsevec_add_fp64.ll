; ModuleID = 'sparsevec_add_fp64.c'
source_filename = "sparsevec_add_fp64.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
target triple = "riscv64"

; Function Attrs: argmemonly nofree norecurse nosync nounwind
define dso_local void @sparsevec_add_i32(i32 noundef signext %len, ptr nocapture noundef %a, ptr nocapture noundef readonly %aidx, ptr nocapture noundef readonly %b, ptr nocapture noundef readonly %bidx) local_unnamed_addr #0 {
entry:
  %cmp10.not = icmp eq i32 %len, 0
  br i1 %cmp10.not, label %for.cond.cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %len to i64
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %entry
  ret void

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %for.body ]
  %arrayidx = getelementptr inbounds i32, ptr %bidx, i64 %indvars.iv
  %0 = load i32, ptr %arrayidx, align 4, !tbaa !4
  %idxprom1 = sext i32 %0 to i64
  %arrayidx2 = getelementptr inbounds double, ptr %b, i64 %idxprom1
  %1 = load double, ptr %arrayidx2, align 8, !tbaa !8
  %arrayidx4 = getelementptr inbounds i32, ptr %aidx, i64 %indvars.iv
  %2 = load i32, ptr %arrayidx4, align 4, !tbaa !4
  %idxprom5 = sext i32 %2 to i64
  %arrayidx6 = getelementptr inbounds double, ptr %a, i64 %idxprom5
  %3 = load double, ptr %arrayidx6, align 8, !tbaa !8
  %add = fadd double %1, %3
  store double %add, ptr %arrayidx6, align 8, !tbaa !8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !llvm.loop !10
}

attributes #0 = { argmemonly nofree norecurse nosync nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+v,+f,+m,+c,+d,+zba,+zbb,+zbc,+zbs,-save-restore" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 15.0.0 (https://github.com/llvm/llvm-project.git 1e451369d2017830d3dbddec24063170b7aca0de)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!9, !9, i64 0}
!9 = !{!"double", !6, i64 0}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
