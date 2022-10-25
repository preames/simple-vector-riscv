; ModuleID = 'vector_andnot_i64.c'
source_filename = "vector_andnot_i64.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
target triple = "riscv64-unknown-unknown"

; Function Attrs: argmemonly nofree norecurse nosync nounwind vscale_range(64,1024)
define dso_local void @vector_andnot_i64(ptr nocapture noundef %a, ptr nocapture noundef readonly %b, i32 noundef signext %a_len) local_unnamed_addr #0 {
entry:
  %cmp10.not = icmp eq i32 %a_len, 0
  br i1 %cmp10.not, label %for.cond.cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %a_len to i64
  %0 = tail call i64 @llvm.vscale.i64()
  %1 = tail call i64 @llvm.umax.i64(i64 %0, i64 64)
  %min.iters.check = icmp ugt i64 %1, %wide.trip.count
  br i1 %min.iters.check, label %for.body.preheader14, label %vector.memcheck

vector.memcheck:                                  ; preds = %for.body.preheader
  %2 = shl nuw nsw i64 %wide.trip.count, 3
  %uglygep = getelementptr i8, ptr %a, i64 %2
  %uglygep12 = getelementptr i8, ptr %b, i64 %2
  %bound0 = icmp ugt ptr %uglygep12, %a
  %bound1 = icmp ugt ptr %uglygep, %b
  %found.conflict = and i1 %bound0, %bound1
  br i1 %found.conflict, label %for.body.preheader14, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %3 = tail call i64 @llvm.vscale.i64()
  %n.mod.vf = urem i64 %wide.trip.count, %3
  %n.vec = sub nuw nsw i64 %wide.trip.count, %n.mod.vf
  %4 = tail call i64 @llvm.vscale.i64()
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %5 = getelementptr inbounds i64, ptr %a, i64 %index
  %wide.load = load <vscale x 1 x i64>, ptr %5, align 8, !tbaa !4, !alias.scope !8, !noalias !11
  %6 = getelementptr inbounds i64, ptr %b, i64 %index
  %wide.load13 = load <vscale x 1 x i64>, ptr %6, align 8, !tbaa !4, !alias.scope !11
  %7 = xor <vscale x 1 x i64> %wide.load13, shufflevector (<vscale x 1 x i64> insertelement (<vscale x 1 x i64> poison, i64 -1, i32 0), <vscale x 1 x i64> poison, <vscale x 1 x i32> zeroinitializer)
  %8 = and <vscale x 1 x i64> %wide.load, %7
  store <vscale x 1 x i64> %8, ptr %5, align 8, !tbaa !4, !alias.scope !8, !noalias !11
  %index.next = add nuw i64 %index, %4
  %9 = icmp eq i64 %index.next, %n.vec
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !13

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.cond.cleanup, label %for.body.preheader14

for.body.preheader14:                             ; preds = %vector.memcheck, %for.body.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %for.body.preheader ], [ %n.vec, %middle.block ]
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %middle.block, %entry
  ret void

for.body:                                         ; preds = %for.body.preheader14, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ %indvars.iv.ph, %for.body.preheader14 ]
  %arrayidx = getelementptr inbounds i64, ptr %a, i64 %indvars.iv
  %10 = load i64, ptr %arrayidx, align 8, !tbaa !4
  %arrayidx2 = getelementptr inbounds i64, ptr %b, i64 %indvars.iv
  %11 = load i64, ptr %arrayidx2, align 8, !tbaa !4
  %not = xor i64 %11, -1
  %and = and i64 %10, %not
  store i64 %and, ptr %arrayidx, align 8, !tbaa !4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !llvm.loop !16
}

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i64 @llvm.vscale.i64() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.umax.i64(i64, i64) #2

attributes #0 = { argmemonly nofree norecurse nosync nounwind vscale_range(64,1024) "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,+v,+zba,+zbb,+zbc,+zbs,+zve32f,+zve32x,+zve64d,+zve64f,+zve64x,+zvl1024b,+zvl128b,+zvl2048b,+zvl256b,+zvl32b,+zvl4096b,+zvl512b,+zvl64b,-save-restore" }
attributes #1 = { nocallback nofree nosync nounwind readnone willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64d"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 6d859266803e2a9060c4e8770f92cc2c7bd05a3b)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"long", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!9}
!9 = distinct !{!9, !10}
!10 = distinct !{!10, !"LVerDomain"}
!11 = !{!12}
!12 = distinct !{!12, !10}
!13 = distinct !{!13, !14, !15}
!14 = !{!"llvm.loop.mustprogress"}
!15 = !{!"llvm.loop.isvectorized", i32 1}
!16 = distinct !{!16, !14, !15}
