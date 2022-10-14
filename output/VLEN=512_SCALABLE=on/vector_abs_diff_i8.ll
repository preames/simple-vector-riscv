; ModuleID = 'vector_abs_diff_i8.c'
source_filename = "vector_abs_diff_i8.c"
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
define dso_local void @vector_abs_diff(ptr nocapture noundef writeonly %c, ptr nocapture noundef readonly %a, ptr nocapture noundef readonly %b, i32 noundef signext %N) local_unnamed_addr #1 {
entry:
  %b14 = ptrtoint ptr %b to i64
  %a13 = ptrtoint ptr %a to i64
  %c12 = ptrtoint ptr %c to i64
  %cmp10.not = icmp eq i32 %N, 0
  br i1 %cmp10.not, label %for.cond.cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %N to i64
  %0 = tail call i64 @llvm.vscale.i64()
  %1 = shl i64 %0, 4
  %2 = tail call i64 @llvm.umax.i64(i64 %1, i64 64)
  %min.iters.check = icmp ugt i64 %2, %wide.trip.count
  br i1 %min.iters.check, label %for.body.preheader19, label %vector.memcheck

vector.memcheck:                                  ; preds = %for.body.preheader
  %3 = tail call i64 @llvm.vscale.i64()
  %4 = shl i64 %3, 4
  %5 = sub i64 %c12, %a13
  %diff.check = icmp ult i64 %5, %4
  %6 = shl i64 %3, 4
  %7 = sub i64 %c12, %b14
  %diff.check15 = icmp ult i64 %7, %6
  %conflict.rdx = or i1 %diff.check, %diff.check15
  br i1 %conflict.rdx, label %for.body.preheader19, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %8 = tail call i64 @llvm.vscale.i64()
  %9 = shl i64 %8, 4
  %n.mod.vf = urem i64 %wide.trip.count, %9
  %n.vec = sub nuw nsw i64 %wide.trip.count, %n.mod.vf
  %10 = tail call i32 @llvm.vscale.i32()
  %11 = shl i32 %10, 3
  %12 = sext i32 %11 to i64
  %13 = tail call i32 @llvm.vscale.i32()
  %14 = shl i32 %13, 3
  %15 = sext i32 %14 to i64
  %16 = tail call i32 @llvm.vscale.i32()
  %17 = shl i32 %16, 3
  %18 = sext i32 %17 to i64
  %19 = tail call i64 @llvm.vscale.i64()
  %20 = shl i64 %19, 4
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %21 = getelementptr inbounds i8, ptr %a, i64 %index
  %wide.load = load <vscale x 8 x i8>, ptr %21, align 1, !tbaa !4
  %22 = getelementptr inbounds i8, ptr %21, i64 %12
  %wide.load16 = load <vscale x 8 x i8>, ptr %22, align 1, !tbaa !4
  %23 = getelementptr inbounds i8, ptr %b, i64 %index
  %wide.load17 = load <vscale x 8 x i8>, ptr %23, align 1, !tbaa !4
  %24 = getelementptr inbounds i8, ptr %23, i64 %15
  %wide.load18 = load <vscale x 8 x i8>, ptr %24, align 1, !tbaa !4
  %25 = sub <vscale x 8 x i8> %wide.load, %wide.load17
  %26 = sub <vscale x 8 x i8> %wide.load16, %wide.load18
  %27 = tail call <vscale x 8 x i8> @llvm.abs.nxv8i8(<vscale x 8 x i8> %25, i1 false)
  %28 = tail call <vscale x 8 x i8> @llvm.abs.nxv8i8(<vscale x 8 x i8> %26, i1 false)
  %29 = getelementptr inbounds i8, ptr %c, i64 %index
  store <vscale x 8 x i8> %27, ptr %29, align 1, !tbaa !4
  %30 = getelementptr inbounds i8, ptr %29, i64 %18
  store <vscale x 8 x i8> %28, ptr %30, align 1, !tbaa !4
  %index.next = add nuw i64 %index, %20
  %31 = icmp eq i64 %index.next, %n.vec
  br i1 %31, label %middle.block, label %vector.body, !llvm.loop !7

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.cond.cleanup, label %for.body.preheader19

for.body.preheader19:                             ; preds = %vector.memcheck, %for.body.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %for.body.preheader ], [ %n.vec, %middle.block ]
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %middle.block, %entry
  ret void

for.body:                                         ; preds = %for.body.preheader19, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ %indvars.iv.ph, %for.body.preheader19 ]
  %arrayidx = getelementptr inbounds i8, ptr %a, i64 %indvars.iv
  %32 = load i8, ptr %arrayidx, align 1, !tbaa !4
  %arrayidx2 = getelementptr inbounds i8, ptr %b, i64 %indvars.iv
  %33 = load i8, ptr %arrayidx2, align 1, !tbaa !4
  %sub.i = sub i8 %32, %33
  %34 = tail call i8 @llvm.abs.i8(i8 %sub.i, i1 false)
  %arrayidx5 = getelementptr inbounds i8, ptr %c, i64 %indvars.iv
  store i8 %34, ptr %arrayidx5, align 1, !tbaa !4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !llvm.loop !10
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i8 @llvm.abs.i8(i8, i1 immarg) #2

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i64 @llvm.vscale.i64() #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.umax.i64(i64, i64) #2

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i32 @llvm.vscale.i32() #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare <vscale x 8 x i8> @llvm.abs.nxv8i8(<vscale x 8 x i8>, i1 immarg) #2

attributes #0 = { mustprogress nofree norecurse nosync nounwind readnone willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+v,+f,+m,+c,+d,+zba,+zbb,+zbc,+zbs,-save-restore" }
attributes #1 = { argmemonly nofree nosync nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+v,+f,+m,+c,+d,+zba,+zbb,+zbc,+zbs,-save-restore" }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone willreturn }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 6e4f504575fce7ce9a29c00697acb4043b19badf)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = distinct !{!7, !8, !9}
!8 = !{!"llvm.loop.mustprogress"}
!9 = !{!"llvm.loop.isvectorized", i32 1}
!10 = distinct !{!10, !8, !9}
