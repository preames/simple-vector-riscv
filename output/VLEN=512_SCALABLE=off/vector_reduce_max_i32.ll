; ModuleID = 'vector_reduce_max_i32.c'
source_filename = "vector_reduce_max_i32.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64-unknown-unknown"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: read) vscale_range(8,1024)
define dso_local signext i32 @vector_reduce_max_i32(ptr nocapture noundef readonly %a, i32 noundef signext %a_len) local_unnamed_addr #0 {
entry:
  %cmp10.not = icmp eq i32 %a_len, 0
  br i1 %cmp10.not, label %for.cond.cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %a_len to i64
  %min.iters.check = icmp ult i32 %a_len, 32
  br i1 %min.iters.check, label %for.body.preheader15, label %vector.ph

vector.ph:                                        ; preds = %for.body.preheader
  %n.vec = and i64 %wide.trip.count, 4294967264
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.phi = phi <16 x i32> [ <i32 -987654321, i32 -987654321, i32 -987654321, i32 -987654321, i32 -987654321, i32 -987654321, i32 -987654321, i32 -987654321, i32 -987654321, i32 -987654321, i32 -987654321, i32 -987654321, i32 -987654321, i32 -987654321, i32 -987654321, i32 -987654321>, %vector.ph ], [ %2, %vector.body ]
  %vec.phi13 = phi <16 x i32> [ <i32 -987654321, i32 -987654321, i32 -987654321, i32 -987654321, i32 -987654321, i32 -987654321, i32 -987654321, i32 -987654321, i32 -987654321, i32 -987654321, i32 -987654321, i32 -987654321, i32 -987654321, i32 -987654321, i32 -987654321, i32 -987654321>, %vector.ph ], [ %3, %vector.body ]
  %0 = getelementptr inbounds i32, ptr %a, i64 %index
  %wide.load = load <16 x i32>, ptr %0, align 4, !tbaa !4
  %1 = getelementptr inbounds i32, ptr %0, i64 16
  %wide.load14 = load <16 x i32>, ptr %1, align 4, !tbaa !4
  %2 = tail call <16 x i32> @llvm.smax.v16i32(<16 x i32> %wide.load, <16 x i32> %vec.phi)
  %3 = tail call <16 x i32> @llvm.smax.v16i32(<16 x i32> %wide.load14, <16 x i32> %vec.phi13)
  %index.next = add nuw i64 %index, 32
  %4 = icmp eq i64 %index.next, %n.vec
  br i1 %4, label %middle.block, label %vector.body, !llvm.loop !8

middle.block:                                     ; preds = %vector.body
  %5 = tail call <16 x i32> @llvm.smax.v16i32(<16 x i32> %2, <16 x i32> %3)
  %6 = tail call i32 @llvm.vector.reduce.smax.v16i32(<16 x i32> %5)
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br i1 %cmp.n, label %for.cond.cleanup, label %for.body.preheader15

for.body.preheader15:                             ; preds = %for.body.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %for.body.preheader ], [ %n.vec, %middle.block ]
  %max.011.ph = phi i32 [ -987654321, %for.body.preheader ], [ %6, %middle.block ]
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %middle.block, %entry
  %max.0.lcssa = phi i32 [ -987654321, %entry ], [ %6, %middle.block ], [ %8, %for.body ]
  ret i32 %max.0.lcssa

for.body:                                         ; preds = %for.body.preheader15, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ %indvars.iv.ph, %for.body.preheader15 ]
  %max.011 = phi i32 [ %8, %for.body ], [ %max.011.ph, %for.body.preheader15 ]
  %arrayidx = getelementptr inbounds i32, ptr %a, i64 %indvars.iv
  %7 = load i32, ptr %arrayidx, align 4, !tbaa !4
  %8 = tail call i32 @llvm.smax.i32(i32 %7, i32 %max.011)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !llvm.loop !11
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i32> @llvm.smax.v16i32(<16 x i32>, <16 x i32>) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare i32 @llvm.vector.reduce.smax.v16i32(<16 x i32>) #2

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: read) vscale_range(8,1024) "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv64" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,+v,+zba,+zbb,+zbc,+zbs,+zve32f,+zve32x,+zve64d,+zve64f,+zve64x,+zvl128b,+zvl256b,+zvl32b,+zvl512b,+zvl64b,-save-restore" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(none) }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64d"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 16.0.0 (https://github.com/llvm/llvm-project.git b77533306876fc807e58e355d95d848a0077131f)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = distinct !{!8, !9, !10}
!9 = !{!"llvm.loop.mustprogress"}
!10 = !{!"llvm.loop.isvectorized", i32 1}
!11 = distinct !{!11, !9, !12, !10}
!12 = !{!"llvm.loop.unroll.runtime.disable"}
