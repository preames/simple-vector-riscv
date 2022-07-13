; ModuleID = 'vector_reduce_max_i32.c'
source_filename = "vector_reduce_max_i32.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
target triple = "riscv64"

; Function Attrs: argmemonly nofree norecurse nosync nounwind readonly
define dso_local signext i32 @vector_reduce_max_i32(ptr nocapture noundef readonly %a, i32 noundef signext %a_len) local_unnamed_addr #0 {
entry:
  %cmp10.not = icmp eq i32 %a_len, 0
  br i1 %cmp10.not, label %for.cond.cleanup, label %iter.check

iter.check:                                       ; preds = %entry
  %wide.trip.count = zext i32 %a_len to i64
  %min.iters.check = icmp ult i32 %a_len, 8
  br i1 %min.iters.check, label %for.body.preheader, label %vector.main.loop.iter.check

vector.main.loop.iter.check:                      ; preds = %iter.check
  %min.iters.check13 = icmp ult i32 %a_len, 32
  br i1 %min.iters.check13, label %vec.epilog.ph, label %vector.ph

vector.ph:                                        ; preds = %vector.main.loop.iter.check
  %n.vec = and i64 %wide.trip.count, 4294967264
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.phi = phi <16 x i32> [ <i32 -987654321, i32 -987654321, i32 -987654321, i32 -987654321, i32 -987654321, i32 -987654321, i32 -987654321, i32 -987654321, i32 -987654321, i32 -987654321, i32 -987654321, i32 -987654321, i32 -987654321, i32 -987654321, i32 -987654321, i32 -987654321>, %vector.ph ], [ %2, %vector.body ]
  %vec.phi14 = phi <16 x i32> [ <i32 -987654321, i32 -987654321, i32 -987654321, i32 -987654321, i32 -987654321, i32 -987654321, i32 -987654321, i32 -987654321, i32 -987654321, i32 -987654321, i32 -987654321, i32 -987654321, i32 -987654321, i32 -987654321, i32 -987654321, i32 -987654321>, %vector.ph ], [ %3, %vector.body ]
  %0 = getelementptr inbounds i32, ptr %a, i64 %index
  %wide.load = load <16 x i32>, ptr %0, align 4, !tbaa !4
  %1 = getelementptr inbounds i32, ptr %0, i64 16
  %wide.load15 = load <16 x i32>, ptr %1, align 4, !tbaa !4
  %2 = call <16 x i32> @llvm.smax.v16i32(<16 x i32> %wide.load, <16 x i32> %vec.phi)
  %3 = call <16 x i32> @llvm.smax.v16i32(<16 x i32> %wide.load15, <16 x i32> %vec.phi14)
  %index.next = add nuw i64 %index, 32
  %4 = icmp eq i64 %index.next, %n.vec
  br i1 %4, label %middle.block, label %vector.body, !llvm.loop !8

middle.block:                                     ; preds = %vector.body
  %5 = call <16 x i32> @llvm.smax.v16i32(<16 x i32> %2, <16 x i32> %3)
  %6 = call i32 @llvm.vector.reduce.smax.v16i32(<16 x i32> %5)
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br i1 %cmp.n, label %for.cond.cleanup, label %vec.epilog.iter.check

vec.epilog.iter.check:                            ; preds = %middle.block
  %n.vec.remaining = and i64 %wide.trip.count, 24
  %min.epilog.iters.check = icmp eq i64 %n.vec.remaining, 0
  br i1 %min.epilog.iters.check, label %for.body.preheader, label %vec.epilog.ph

vec.epilog.ph:                                    ; preds = %vector.main.loop.iter.check, %vec.epilog.iter.check
  %bc.merge.rdx = phi i32 [ -987654321, %vector.main.loop.iter.check ], [ %6, %vec.epilog.iter.check ]
  %vec.epilog.resume.val = phi i64 [ 0, %vector.main.loop.iter.check ], [ %n.vec, %vec.epilog.iter.check ]
  %n.vec17 = and i64 %wide.trip.count, 4294967288
  %minmax.ident.splatinsert = insertelement <8 x i32> poison, i32 %bc.merge.rdx, i64 0
  %minmax.ident.splat = shufflevector <8 x i32> %minmax.ident.splatinsert, <8 x i32> poison, <8 x i32> zeroinitializer
  br label %vec.epilog.vector.body

vec.epilog.vector.body:                           ; preds = %vec.epilog.vector.body, %vec.epilog.ph
  %offset.idx = phi i64 [ %vec.epilog.resume.val, %vec.epilog.ph ], [ %index.next22, %vec.epilog.vector.body ]
  %vec.phi20 = phi <8 x i32> [ %minmax.ident.splat, %vec.epilog.ph ], [ %8, %vec.epilog.vector.body ]
  %7 = getelementptr inbounds i32, ptr %a, i64 %offset.idx
  %wide.load21 = load <8 x i32>, ptr %7, align 4, !tbaa !4
  %8 = call <8 x i32> @llvm.smax.v8i32(<8 x i32> %wide.load21, <8 x i32> %vec.phi20)
  %index.next22 = add nuw i64 %offset.idx, 8
  %9 = icmp eq i64 %index.next22, %n.vec17
  br i1 %9, label %vec.epilog.middle.block, label %vec.epilog.vector.body, !llvm.loop !11

vec.epilog.middle.block:                          ; preds = %vec.epilog.vector.body
  %10 = call i32 @llvm.vector.reduce.smax.v8i32(<8 x i32> %8)
  %cmp.n18 = icmp eq i64 %n.vec17, %wide.trip.count
  br i1 %cmp.n18, label %for.cond.cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %iter.check, %vec.epilog.iter.check, %vec.epilog.middle.block
  %indvars.iv.ph = phi i64 [ 0, %iter.check ], [ %n.vec, %vec.epilog.iter.check ], [ %n.vec17, %vec.epilog.middle.block ]
  %max.011.ph = phi i32 [ -987654321, %iter.check ], [ %6, %vec.epilog.iter.check ], [ %10, %vec.epilog.middle.block ]
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %middle.block, %vec.epilog.middle.block, %entry
  %max.0.lcssa = phi i32 [ -987654321, %entry ], [ %6, %middle.block ], [ %10, %vec.epilog.middle.block ], [ %12, %for.body ]
  ret i32 %max.0.lcssa

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ %indvars.iv.ph, %for.body.preheader ]
  %max.011 = phi i32 [ %12, %for.body ], [ %max.011.ph, %for.body.preheader ]
  %arrayidx = getelementptr inbounds i32, ptr %a, i64 %indvars.iv
  %11 = load i32, ptr %arrayidx, align 4, !tbaa !4
  %12 = tail call i32 @llvm.smax.i32(i32 %11, i32 %max.011)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !llvm.loop !13
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare <16 x i32> @llvm.smax.v16i32(<16 x i32>, <16 x i32>) #1

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i32 @llvm.vector.reduce.smax.v16i32(<16 x i32>) #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare <8 x i32> @llvm.smax.v8i32(<8 x i32>, <8 x i32>) #1

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i32 @llvm.vector.reduce.smax.v8i32(<8 x i32>) #2

attributes #0 = { argmemonly nofree norecurse nosync nounwind readonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+v,+f,+m,+c,+d,+zba,+zbb,+zbc,+zbs,-save-restore" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone willreturn }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 15.0.0 (https://github.com/llvm/llvm-project.git dde2a7fb6da46da2b2f765fa569d8fddb4270eb6)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = distinct !{!8, !9, !10}
!9 = !{!"llvm.loop.mustprogress"}
!10 = !{!"llvm.loop.isvectorized", i32 1}
!11 = distinct !{!11, !9, !10, !12}
!12 = !{!"llvm.loop.unroll.runtime.disable"}
!13 = distinct !{!13, !9, !12, !10}
