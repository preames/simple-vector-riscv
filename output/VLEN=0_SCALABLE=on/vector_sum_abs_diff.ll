; ModuleID = 'vector_sum_abs_diff.c'
source_filename = "vector_sum_abs_diff.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
target triple = "riscv64"

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define dso_local signext i8 @sub(i8 noundef signext %a, i8 noundef signext %b) local_unnamed_addr #0 {
entry:
  %sub = sub i8 %a, %b
  ret i8 %sub
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define dso_local signext i8 @myabs(i8 noundef signext %c) local_unnamed_addr #0 {
entry:
  %0 = tail call i8 @llvm.abs.i8(i8 %c, i1 false)
  ret i8 %0
}

; Function Attrs: argmemonly nofree nosync nounwind
define dso_local void @vector_sum_abs_diff(ptr nocapture noundef writeonly %c, ptr nocapture noundef readonly %a, ptr nocapture noundef readonly %b, i32 noundef signext %N) local_unnamed_addr #1 {
entry:
  %cmp26.not = icmp ult i32 %N, 8
  br i1 %cmp26.not, label %for.cond.cleanup, label %for.cond1.preheader.preheader

for.cond1.preheader.preheader:                    ; preds = %entry
  %div23 = lshr i32 %N, 3
  %wide.trip.count = zext i32 %div23 to i64
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.preheader, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader.preheader ], [ %indvars.iv.next, %for.cond1.preheader ]
  %0 = shl i64 %indvars.iv, 3
  %arrayidx = getelementptr inbounds i8, ptr %a, i64 %0
  %1 = load i8, ptr %arrayidx, align 1, !tbaa !4
  %arrayidx6 = getelementptr inbounds i8, ptr %b, i64 %0
  %2 = load i8, ptr %arrayidx6, align 1, !tbaa !4
  %sub = sub i8 %1, %2
  %3 = tail call i8 @llvm.abs.i8(i8 %sub, i1 false) #3
  %conv9 = sext i8 %3 to i32
  %4 = or i64 %0, 1
  %arrayidx.1 = getelementptr inbounds i8, ptr %a, i64 %4
  %5 = load i8, ptr %arrayidx.1, align 1, !tbaa !4
  %arrayidx6.1 = getelementptr inbounds i8, ptr %b, i64 %4
  %6 = load i8, ptr %arrayidx6.1, align 1, !tbaa !4
  %sub.1 = sub i8 %5, %6
  %7 = tail call i8 @llvm.abs.i8(i8 %sub.1, i1 false) #3
  %conv9.1 = sext i8 %7 to i32
  %add10.1 = add nsw i32 %conv9, %conv9.1
  %8 = or i64 %0, 2
  %arrayidx.2 = getelementptr inbounds i8, ptr %a, i64 %8
  %9 = load i8, ptr %arrayidx.2, align 1, !tbaa !4
  %arrayidx6.2 = getelementptr inbounds i8, ptr %b, i64 %8
  %10 = load i8, ptr %arrayidx6.2, align 1, !tbaa !4
  %sub.2 = sub i8 %9, %10
  %11 = tail call i8 @llvm.abs.i8(i8 %sub.2, i1 false) #3
  %conv9.2 = sext i8 %11 to i32
  %add10.2 = add nsw i32 %add10.1, %conv9.2
  %12 = or i64 %0, 3
  %arrayidx.3 = getelementptr inbounds i8, ptr %a, i64 %12
  %13 = load i8, ptr %arrayidx.3, align 1, !tbaa !4
  %arrayidx6.3 = getelementptr inbounds i8, ptr %b, i64 %12
  %14 = load i8, ptr %arrayidx6.3, align 1, !tbaa !4
  %sub.3 = sub i8 %13, %14
  %15 = tail call i8 @llvm.abs.i8(i8 %sub.3, i1 false) #3
  %conv9.3 = sext i8 %15 to i32
  %add10.3 = add nsw i32 %add10.2, %conv9.3
  %16 = or i64 %0, 4
  %arrayidx.4 = getelementptr inbounds i8, ptr %a, i64 %16
  %17 = load i8, ptr %arrayidx.4, align 1, !tbaa !4
  %arrayidx6.4 = getelementptr inbounds i8, ptr %b, i64 %16
  %18 = load i8, ptr %arrayidx6.4, align 1, !tbaa !4
  %sub.4 = sub i8 %17, %18
  %19 = tail call i8 @llvm.abs.i8(i8 %sub.4, i1 false) #3
  %conv9.4 = sext i8 %19 to i32
  %add10.4 = add nsw i32 %add10.3, %conv9.4
  %20 = or i64 %0, 5
  %arrayidx.5 = getelementptr inbounds i8, ptr %a, i64 %20
  %21 = load i8, ptr %arrayidx.5, align 1, !tbaa !4
  %arrayidx6.5 = getelementptr inbounds i8, ptr %b, i64 %20
  %22 = load i8, ptr %arrayidx6.5, align 1, !tbaa !4
  %sub.5 = sub i8 %21, %22
  %23 = tail call i8 @llvm.abs.i8(i8 %sub.5, i1 false) #3
  %conv9.5 = sext i8 %23 to i32
  %add10.5 = add nsw i32 %add10.4, %conv9.5
  %24 = or i64 %0, 6
  %arrayidx.6 = getelementptr inbounds i8, ptr %a, i64 %24
  %25 = load i8, ptr %arrayidx.6, align 1, !tbaa !4
  %arrayidx6.6 = getelementptr inbounds i8, ptr %b, i64 %24
  %26 = load i8, ptr %arrayidx6.6, align 1, !tbaa !4
  %sub.6 = sub i8 %25, %26
  %27 = tail call i8 @llvm.abs.i8(i8 %sub.6, i1 false) #3
  %conv9.6 = sext i8 %27 to i32
  %add10.6 = add nsw i32 %add10.5, %conv9.6
  %28 = or i64 %0, 7
  %arrayidx.7 = getelementptr inbounds i8, ptr %a, i64 %28
  %29 = load i8, ptr %arrayidx.7, align 1, !tbaa !4
  %arrayidx6.7 = getelementptr inbounds i8, ptr %b, i64 %28
  %30 = load i8, ptr %arrayidx6.7, align 1, !tbaa !4
  %sub.7 = sub i8 %29, %30
  %31 = tail call i8 @llvm.abs.i8(i8 %sub.7, i1 false) #3
  %conv9.7 = sext i8 %31 to i32
  %add10.7 = add nsw i32 %add10.6, %conv9.7
  %arrayidx12 = getelementptr inbounds i32, ptr %c, i64 %indvars.iv
  store i32 %add10.7, ptr %arrayidx12, align 4, !tbaa !7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.cond1.preheader, !llvm.loop !9

for.cond.cleanup:                                 ; preds = %for.cond1.preheader, %entry
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i8 @llvm.abs.i8(i8, i1 immarg) #2

attributes #0 = { mustprogress nofree norecurse nosync nounwind readnone willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+v,+f,+m,+c,+d,+zba,-save-restore" }
attributes #1 = { argmemonly nofree nosync nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+v,+f,+m,+c,+d,+zba,-save-restore" }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 15.0.0 (https://github.com/llvm/llvm-project.git dde2a7fb6da46da2b2f765fa569d8fddb4270eb6)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !5, i64 0}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
