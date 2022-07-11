; ModuleID = 'riscv_vspec_example_a2.c'
source_filename = "riscv_vspec_example_a2.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
target triple = "riscv64"

; Function Attrs: argmemonly nofree norecurse nosync nounwind
define dso_local void @example_a2(ptr nocapture noundef readonly %a, ptr nocapture noundef writeonly %b, ptr nocapture noundef readonly %c, i32 noundef signext %n) local_unnamed_addr #0 {
entry:
  %c17 = ptrtoint ptr %c to i64
  %a16 = ptrtoint ptr %a to i64
  %b15 = ptrtoint ptr %b to i64
  %cmp13.not = icmp eq i32 %n, 0
  br i1 %cmp13.not, label %for.cond.cleanup, label %iter.check

iter.check:                                       ; preds = %entry
  %wide.trip.count = zext i32 %n to i64
  %min.iters.check = icmp ult i32 %n, 8
  br i1 %min.iters.check, label %for.body.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %iter.check
  %0 = sub i64 %b15, %a16
  %diff.check = icmp ult i64 %0, 16
  %1 = sub i64 %b15, %c17
  %diff.check18 = icmp ult i64 %1, 16
  %conflict.rdx = or i1 %diff.check, %diff.check18
  br i1 %conflict.rdx, label %for.body.preheader, label %vector.main.loop.iter.check

vector.main.loop.iter.check:                      ; preds = %vector.memcheck
  %min.iters.check19 = icmp ult i32 %n, 16
  br i1 %min.iters.check19, label %vec.epilog.ph, label %vector.ph

vector.ph:                                        ; preds = %vector.main.loop.iter.check
  %n.vec = and i64 %wide.trip.count, 4294967280
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %2 = getelementptr inbounds i8, ptr %a, i64 %index
  %wide.load = load <16 x i8>, ptr %2, align 1, !tbaa !4
  %3 = icmp ult <16 x i8> %wide.load, <i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5>
  %4 = getelementptr i8, ptr %c, i64 %index
  %wide.masked.load = call <16 x i8> @llvm.masked.load.v16i8.p0(ptr %4, i32 1, <16 x i1> %3, <16 x i8> poison), !tbaa !4
  %predphi = select <16 x i1> %3, <16 x i8> %wide.masked.load, <16 x i8> <i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1>
  %5 = getelementptr inbounds i8, ptr %b, i64 %index
  store <16 x i8> %predphi, ptr %5, align 1, !tbaa !4
  %index.next = add nuw i64 %index, 16
  %6 = icmp eq i64 %index.next, %n.vec
  br i1 %6, label %middle.block, label %vector.body, !llvm.loop !7

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br i1 %cmp.n, label %for.cond.cleanup, label %vec.epilog.iter.check

vec.epilog.iter.check:                            ; preds = %middle.block
  %n.vec.remaining = and i64 %wide.trip.count, 8
  %min.epilog.iters.check.not.not = icmp eq i64 %n.vec.remaining, 0
  br i1 %min.epilog.iters.check.not.not, label %for.body.preheader, label %vec.epilog.ph

vec.epilog.ph:                                    ; preds = %vector.main.loop.iter.check, %vec.epilog.iter.check
  %vec.epilog.resume.val = phi i64 [ %n.vec, %vec.epilog.iter.check ], [ 0, %vector.main.loop.iter.check ]
  %n.vec21 = and i64 %wide.trip.count, 4294967288
  br label %vec.epilog.vector.body

vec.epilog.vector.body:                           ; preds = %vec.epilog.vector.body, %vec.epilog.ph
  %offset.idx = phi i64 [ %vec.epilog.resume.val, %vec.epilog.ph ], [ %index.next27, %vec.epilog.vector.body ]
  %7 = getelementptr inbounds i8, ptr %a, i64 %offset.idx
  %wide.load24 = load <8 x i8>, ptr %7, align 1, !tbaa !4
  %8 = icmp ult <8 x i8> %wide.load24, <i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5>
  %9 = getelementptr i8, ptr %c, i64 %offset.idx
  %wide.masked.load25 = call <8 x i8> @llvm.masked.load.v8i8.p0(ptr %9, i32 1, <8 x i1> %8, <8 x i8> poison), !tbaa !4
  %predphi26 = select <8 x i1> %8, <8 x i8> %wide.masked.load25, <8 x i8> <i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1>
  %10 = getelementptr inbounds i8, ptr %b, i64 %offset.idx
  store <8 x i8> %predphi26, ptr %10, align 1, !tbaa !4
  %index.next27 = add nuw i64 %offset.idx, 8
  %11 = icmp eq i64 %index.next27, %n.vec21
  br i1 %11, label %vec.epilog.middle.block, label %vec.epilog.vector.body, !llvm.loop !10

vec.epilog.middle.block:                          ; preds = %vec.epilog.vector.body
  %cmp.n22 = icmp eq i64 %n.vec21, %wide.trip.count
  br i1 %cmp.n22, label %for.cond.cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %vector.memcheck, %iter.check, %vec.epilog.iter.check, %vec.epilog.middle.block
  %indvars.iv.ph = phi i64 [ 0, %iter.check ], [ 0, %vector.memcheck ], [ %n.vec, %vec.epilog.iter.check ], [ %n.vec21, %vec.epilog.middle.block ]
  br label %for.body

for.cond.cleanup:                                 ; preds = %cond.end, %middle.block, %vec.epilog.middle.block, %entry
  ret void

for.body:                                         ; preds = %for.body.preheader, %cond.end
  %indvars.iv = phi i64 [ %indvars.iv.next, %cond.end ], [ %indvars.iv.ph, %for.body.preheader ]
  %arrayidx = getelementptr inbounds i8, ptr %a, i64 %indvars.iv
  %12 = load i8, ptr %arrayidx, align 1, !tbaa !4
  %cmp1 = icmp ult i8 %12, 5
  br i1 %cmp1, label %cond.true, label %cond.end

cond.true:                                        ; preds = %for.body
  %arrayidx4 = getelementptr inbounds i8, ptr %c, i64 %indvars.iv
  %13 = load i8, ptr %arrayidx4, align 1, !tbaa !4
  br label %cond.end

cond.end:                                         ; preds = %for.body, %cond.true
  %cond.off0 = phi i8 [ %13, %cond.true ], [ 1, %for.body ]
  %arrayidx8 = getelementptr inbounds i8, ptr %b, i64 %indvars.iv
  store i8 %cond.off0, ptr %arrayidx8, align 1, !tbaa !4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !llvm.loop !12
}

; Function Attrs: argmemonly nocallback nofree nosync nounwind readonly willreturn
declare <16 x i8> @llvm.masked.load.v16i8.p0(ptr, i32 immarg, <16 x i1>, <16 x i8>) #1

; Function Attrs: argmemonly nocallback nofree nosync nounwind readonly willreturn
declare <8 x i8> @llvm.masked.load.v8i8.p0(ptr, i32 immarg, <8 x i1>, <8 x i8>) #1

attributes #0 = { argmemonly nofree norecurse nosync nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+v,+f,+m,+c,+d,+zba,-save-restore" }
attributes #1 = { argmemonly nocallback nofree nosync nounwind readonly willreturn }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 15.0.0 (https://github.com/llvm/llvm-project.git c7fd7512a5c5b133665bfecbe2e9748c0607286e)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = distinct !{!7, !8, !9}
!8 = !{!"llvm.loop.mustprogress"}
!9 = !{!"llvm.loop.isvectorized", i32 1}
!10 = distinct !{!10, !8, !9, !11}
!11 = !{!"llvm.loop.unroll.runtime.disable"}
!12 = distinct !{!12, !8, !9}
