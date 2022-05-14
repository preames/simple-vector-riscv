; ModuleID = 'riscv_vspec_example_a2.c'
source_filename = "riscv_vspec_example_a2.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
target triple = "riscv64"

; Function Attrs: argmemonly nofree norecurse nosync nounwind
define dso_local void @example_a2(ptr nocapture noundef readonly %a, ptr nocapture noundef writeonly %b, ptr nocapture noundef readonly %c, i32 noundef signext %n) local_unnamed_addr #0 {
entry:
  %cmp13.not = icmp eq i32 %n, 0
  br i1 %cmp13.not, label %for.cond.cleanup, label %iter.check

iter.check:                                       ; preds = %entry
  %wide.trip.count = zext i32 %n to i64
  %min.iters.check = icmp ult i32 %n, 8
  br i1 %min.iters.check, label %for.body.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %iter.check
  %uglygep = getelementptr i8, ptr %b, i64 %wide.trip.count
  %uglygep15 = getelementptr i8, ptr %a, i64 %wide.trip.count
  %uglygep16 = getelementptr i8, ptr %c, i64 %wide.trip.count
  %bound0 = icmp ugt ptr %uglygep15, %b
  %bound1 = icmp ugt ptr %uglygep, %a
  %found.conflict = and i1 %bound0, %bound1
  %bound017 = icmp ugt ptr %uglygep16, %b
  %bound118 = icmp ugt ptr %uglygep, %c
  %found.conflict19 = and i1 %bound017, %bound118
  %conflict.rdx = or i1 %found.conflict, %found.conflict19
  br i1 %conflict.rdx, label %for.body.preheader, label %vector.main.loop.iter.check

vector.main.loop.iter.check:                      ; preds = %vector.memcheck
  %min.iters.check20 = icmp ult i32 %n, 16
  br i1 %min.iters.check20, label %vec.epilog.ph, label %vector.ph

vector.ph:                                        ; preds = %vector.main.loop.iter.check
  %n.vec = and i64 %wide.trip.count, 4294967280
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %0 = getelementptr inbounds i8, ptr %a, i64 %index
  %wide.load = load <16 x i8>, ptr %0, align 1, !tbaa !4, !alias.scope !7
  %1 = icmp ult <16 x i8> %wide.load, <i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5>
  %2 = getelementptr i8, ptr %c, i64 %index
  %wide.masked.load = call <16 x i8> @llvm.masked.load.v16i8.p0(ptr %2, i32 1, <16 x i1> %1, <16 x i8> poison), !tbaa !4, !alias.scope !10
  %predphi = select <16 x i1> %1, <16 x i8> %wide.masked.load, <16 x i8> <i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1>
  %3 = getelementptr inbounds i8, ptr %b, i64 %index
  store <16 x i8> %predphi, ptr %3, align 1, !tbaa !4, !alias.scope !12, !noalias !14
  %index.next = add nuw i64 %index, 16
  %4 = icmp eq i64 %index.next, %n.vec
  br i1 %4, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br i1 %cmp.n, label %for.cond.cleanup, label %vec.epilog.iter.check

vec.epilog.iter.check:                            ; preds = %middle.block
  %n.vec.remaining = and i64 %wide.trip.count, 8
  %min.epilog.iters.check.not.not = icmp eq i64 %n.vec.remaining, 0
  br i1 %min.epilog.iters.check.not.not, label %for.body.preheader, label %vec.epilog.ph

vec.epilog.ph:                                    ; preds = %vector.main.loop.iter.check, %vec.epilog.iter.check
  %vec.epilog.resume.val = phi i64 [ %n.vec, %vec.epilog.iter.check ], [ 0, %vector.main.loop.iter.check ]
  %n.vec22 = and i64 %wide.trip.count, 4294967288
  br label %vec.epilog.vector.body

vec.epilog.vector.body:                           ; preds = %vec.epilog.vector.body, %vec.epilog.ph
  %offset.idx = phi i64 [ %vec.epilog.resume.val, %vec.epilog.ph ], [ %index.next28, %vec.epilog.vector.body ]
  %5 = getelementptr inbounds i8, ptr %a, i64 %offset.idx
  %wide.load25 = load <8 x i8>, ptr %5, align 1, !tbaa !4
  %6 = icmp ult <8 x i8> %wide.load25, <i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5, i8 5>
  %7 = getelementptr i8, ptr %c, i64 %offset.idx
  %wide.masked.load26 = call <8 x i8> @llvm.masked.load.v8i8.p0(ptr %7, i32 1, <8 x i1> %6, <8 x i8> poison), !tbaa !4
  %predphi27 = select <8 x i1> %6, <8 x i8> %wide.masked.load26, <8 x i8> <i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1>
  %8 = getelementptr inbounds i8, ptr %b, i64 %offset.idx
  store <8 x i8> %predphi27, ptr %8, align 1, !tbaa !4
  %index.next28 = add nuw i64 %offset.idx, 8
  %9 = icmp eq i64 %index.next28, %n.vec22
  br i1 %9, label %vec.epilog.middle.block, label %vec.epilog.vector.body, !llvm.loop !18

vec.epilog.middle.block:                          ; preds = %vec.epilog.vector.body
  %cmp.n23 = icmp eq i64 %n.vec22, %wide.trip.count
  br i1 %cmp.n23, label %for.cond.cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %vector.memcheck, %iter.check, %vec.epilog.iter.check, %vec.epilog.middle.block
  %indvars.iv.ph = phi i64 [ 0, %iter.check ], [ 0, %vector.memcheck ], [ %n.vec, %vec.epilog.iter.check ], [ %n.vec22, %vec.epilog.middle.block ]
  br label %for.body

for.cond.cleanup:                                 ; preds = %cond.end, %middle.block, %vec.epilog.middle.block, %entry
  ret void

for.body:                                         ; preds = %for.body.preheader, %cond.end
  %indvars.iv = phi i64 [ %indvars.iv.next, %cond.end ], [ %indvars.iv.ph, %for.body.preheader ]
  %arrayidx = getelementptr inbounds i8, ptr %a, i64 %indvars.iv
  %10 = load i8, ptr %arrayidx, align 1, !tbaa !4
  %cmp1 = icmp ult i8 %10, 5
  br i1 %cmp1, label %cond.true, label %cond.end

cond.true:                                        ; preds = %for.body
  %arrayidx4 = getelementptr inbounds i8, ptr %c, i64 %indvars.iv
  %11 = load i8, ptr %arrayidx4, align 1, !tbaa !4
  br label %cond.end

cond.end:                                         ; preds = %for.body, %cond.true
  %cond.off0 = phi i8 [ %11, %cond.true ], [ 1, %for.body ]
  %arrayidx8 = getelementptr inbounds i8, ptr %b, i64 %indvars.iv
  store i8 %cond.off0, ptr %arrayidx8, align 1, !tbaa !4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !llvm.loop !20
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
!3 = !{!"clang version 15.0.0 (https://github.com/llvm/llvm-project.git 98d4547be003bbbf8581939e86bf2f4d9fdb7234)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8}
!8 = distinct !{!8, !9}
!9 = distinct !{!9, !"LVerDomain"}
!10 = !{!11}
!11 = distinct !{!11, !9}
!12 = !{!13}
!13 = distinct !{!13, !9}
!14 = !{!8, !11}
!15 = distinct !{!15, !16, !17}
!16 = !{!"llvm.loop.mustprogress"}
!17 = !{!"llvm.loop.isvectorized", i32 1}
!18 = distinct !{!18, !16, !17, !19}
!19 = !{!"llvm.loop.unroll.runtime.disable"}
!20 = distinct !{!20, !16, !17}
