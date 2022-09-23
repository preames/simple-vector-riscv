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
  br i1 %cmp10.not, label %for.cond.cleanup, label %iter.check

iter.check:                                       ; preds = %entry
  %wide.trip.count = zext i32 %N to i64
  %min.iters.check = icmp ult i32 %N, 256
  br i1 %min.iters.check, label %for.body.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %iter.check
  %0 = sub i64 %c12, %a13
  %diff.check = icmp ult i64 %0, 1024
  %1 = sub i64 %c12, %b14
  %diff.check15 = icmp ult i64 %1, 1024
  %conflict.rdx = or i1 %diff.check, %diff.check15
  br i1 %conflict.rdx, label %for.body.preheader, label %vector.main.loop.iter.check

vector.main.loop.iter.check:                      ; preds = %vector.memcheck
  %min.iters.check16 = icmp ult i32 %N, 1024
  br i1 %min.iters.check16, label %vec.epilog.ph, label %vector.ph

vector.ph:                                        ; preds = %vector.main.loop.iter.check
  %n.vec = and i64 %wide.trip.count, 4294966272
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %2 = getelementptr inbounds i8, ptr %a, i64 %index
  %wide.load = load <512 x i8>, ptr %2, align 1, !tbaa !4
  %3 = getelementptr inbounds i8, ptr %2, i64 512
  %wide.load17 = load <512 x i8>, ptr %3, align 1, !tbaa !4
  %4 = getelementptr inbounds i8, ptr %b, i64 %index
  %wide.load18 = load <512 x i8>, ptr %4, align 1, !tbaa !4
  %5 = getelementptr inbounds i8, ptr %4, i64 512
  %wide.load19 = load <512 x i8>, ptr %5, align 1, !tbaa !4
  %6 = sub <512 x i8> %wide.load, %wide.load18
  %7 = sub <512 x i8> %wide.load17, %wide.load19
  %8 = tail call <512 x i8> @llvm.abs.v512i8(<512 x i8> %6, i1 false)
  %9 = tail call <512 x i8> @llvm.abs.v512i8(<512 x i8> %7, i1 false)
  %10 = getelementptr inbounds i8, ptr %c, i64 %index
  store <512 x i8> %8, ptr %10, align 1, !tbaa !4
  %11 = getelementptr inbounds i8, ptr %10, i64 512
  store <512 x i8> %9, ptr %11, align 1, !tbaa !4
  %index.next = add nuw i64 %index, 1024
  %12 = icmp eq i64 %index.next, %n.vec
  br i1 %12, label %middle.block, label %vector.body, !llvm.loop !7

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br i1 %cmp.n, label %for.cond.cleanup, label %vec.epilog.iter.check

vec.epilog.iter.check:                            ; preds = %middle.block
  %n.vec.remaining = and i64 %wide.trip.count, 768
  %min.epilog.iters.check = icmp eq i64 %n.vec.remaining, 0
  br i1 %min.epilog.iters.check, label %for.body.preheader, label %vec.epilog.ph

vec.epilog.ph:                                    ; preds = %vector.main.loop.iter.check, %vec.epilog.iter.check
  %vec.epilog.resume.val = phi i64 [ %n.vec, %vec.epilog.iter.check ], [ 0, %vector.main.loop.iter.check ]
  %n.vec21 = and i64 %wide.trip.count, 4294967040
  br label %vec.epilog.vector.body

vec.epilog.vector.body:                           ; preds = %vec.epilog.vector.body, %vec.epilog.ph
  %offset.idx = phi i64 [ %vec.epilog.resume.val, %vec.epilog.ph ], [ %index.next26, %vec.epilog.vector.body ]
  %13 = getelementptr inbounds i8, ptr %a, i64 %offset.idx
  %wide.load24 = load <256 x i8>, ptr %13, align 1, !tbaa !4
  %14 = getelementptr inbounds i8, ptr %b, i64 %offset.idx
  %wide.load25 = load <256 x i8>, ptr %14, align 1, !tbaa !4
  %15 = sub <256 x i8> %wide.load24, %wide.load25
  %16 = tail call <256 x i8> @llvm.abs.v256i8(<256 x i8> %15, i1 false)
  %17 = getelementptr inbounds i8, ptr %c, i64 %offset.idx
  store <256 x i8> %16, ptr %17, align 1, !tbaa !4
  %index.next26 = add nuw i64 %offset.idx, 256
  %18 = icmp eq i64 %index.next26, %n.vec21
  br i1 %18, label %vec.epilog.middle.block, label %vec.epilog.vector.body, !llvm.loop !10

vec.epilog.middle.block:                          ; preds = %vec.epilog.vector.body
  %cmp.n22 = icmp eq i64 %n.vec21, %wide.trip.count
  br i1 %cmp.n22, label %for.cond.cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %vector.memcheck, %iter.check, %vec.epilog.iter.check, %vec.epilog.middle.block
  %indvars.iv.ph = phi i64 [ 0, %iter.check ], [ 0, %vector.memcheck ], [ %n.vec, %vec.epilog.iter.check ], [ %n.vec21, %vec.epilog.middle.block ]
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %middle.block, %vec.epilog.middle.block, %entry
  ret void

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ %indvars.iv.ph, %for.body.preheader ]
  %arrayidx = getelementptr inbounds i8, ptr %a, i64 %indvars.iv
  %19 = load i8, ptr %arrayidx, align 1, !tbaa !4
  %arrayidx2 = getelementptr inbounds i8, ptr %b, i64 %indvars.iv
  %20 = load i8, ptr %arrayidx2, align 1, !tbaa !4
  %sub.i = sub i8 %19, %20
  %21 = tail call i8 @llvm.abs.i8(i8 %sub.i, i1 false)
  %arrayidx5 = getelementptr inbounds i8, ptr %c, i64 %indvars.iv
  store i8 %21, ptr %arrayidx5, align 1, !tbaa !4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !llvm.loop !12
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i8 @llvm.abs.i8(i8, i1 immarg) #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare <512 x i8> @llvm.abs.v512i8(<512 x i8>, i1 immarg) #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare <256 x i8> @llvm.abs.v256i8(<256 x i8>, i1 immarg) #2

attributes #0 = { mustprogress nofree norecurse nosync nounwind readnone willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+v,+f,+m,+c,+d,+zba,+zbb,+zbc,+zbs,-save-restore" }
attributes #1 = { argmemonly nofree nosync nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+v,+f,+m,+c,+d,+zba,+zbb,+zbc,+zbs,-save-restore" }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 954c1ed009d423ca9593ee63479a9394a23864fd)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = distinct !{!7, !8, !9}
!8 = !{!"llvm.loop.mustprogress"}
!9 = !{!"llvm.loop.isvectorized", i32 1}
!10 = distinct !{!10, !8, !9, !11}
!11 = !{!"llvm.loop.unroll.runtime.disable"}
!12 = distinct !{!12, !8, !9}
