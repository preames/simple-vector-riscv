; ModuleID = 'riscv_vspec_example_a2.c'
source_filename = "riscv_vspec_example_a2.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
target triple = "riscv64"

; Function Attrs: argmemonly nofree norecurse nosync nounwind
define dso_local void @example_a2(ptr nocapture noundef readonly %a, ptr nocapture noundef writeonly %b, ptr nocapture noundef readonly %c, i32 noundef signext %n) local_unnamed_addr #0 {
entry:
  %cmp13.not = icmp eq i32 %n, 0
  br i1 %cmp13.not, label %for.cond.cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %n to i64
  br label %for.body

for.cond.cleanup:                                 ; preds = %cond.end, %entry
  ret void

for.body:                                         ; preds = %for.body.preheader, %cond.end
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %cond.end ]
  %arrayidx = getelementptr inbounds i8, ptr %a, i64 %indvars.iv
  %0 = load i8, ptr %arrayidx, align 1, !tbaa !4
  %cmp1 = icmp ult i8 %0, 5
  br i1 %cmp1, label %cond.true, label %cond.end

cond.true:                                        ; preds = %for.body
  %arrayidx4 = getelementptr inbounds i8, ptr %c, i64 %indvars.iv
  %1 = load i8, ptr %arrayidx4, align 1, !tbaa !4
  br label %cond.end

cond.end:                                         ; preds = %for.body, %cond.true
  %cond.off0 = phi i8 [ %1, %cond.true ], [ 1, %for.body ]
  %arrayidx8 = getelementptr inbounds i8, ptr %b, i64 %indvars.iv
  store i8 %cond.off0, ptr %arrayidx8, align 1, !tbaa !4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !llvm.loop !7
}

attributes #0 = { argmemonly nofree norecurse nosync nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+v,+f,+m,+c,+d,+zba,+zbb,+zbc,+zbs,-save-restore" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 6d859266803e2a9060c4e8770f92cc2c7bd05a3b)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
