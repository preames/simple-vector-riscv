; ModuleID = 'vector_andnot_i64.c'
source_filename = "vector_andnot_i64.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64-unknown-unknown"

; Function Attrs: argmemonly nofree norecurse nosync nounwind vscale_range(4,1024)
define dso_local void @vector_andnot_i64(ptr nocapture noundef %a, ptr nocapture noundef readonly %b, i32 noundef signext %a_len) local_unnamed_addr #0 {
entry:
  %cmp10.not = icmp eq i32 %a_len, 0
  br i1 %cmp10.not, label %for.cond.cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %a_len to i64
  %min.iters.check = icmp ult i32 %a_len, 8
  br i1 %min.iters.check, label %for.body.preheader16, label %vector.memcheck

vector.memcheck:                                  ; preds = %for.body.preheader
  %0 = shl nuw nsw i64 %wide.trip.count, 3
  %uglygep = getelementptr i8, ptr %a, i64 %0
  %uglygep12 = getelementptr i8, ptr %b, i64 %0
  %bound0 = icmp ugt ptr %uglygep12, %a
  %bound1 = icmp ugt ptr %uglygep, %b
  %found.conflict = and i1 %bound0, %bound1
  br i1 %found.conflict, label %for.body.preheader16, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %n.vec = and i64 %wide.trip.count, 4294967288
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %1 = getelementptr inbounds i64, ptr %a, i64 %index
  %wide.load = load <4 x i64>, ptr %1, align 8, !tbaa !4, !alias.scope !8, !noalias !11
  %2 = getelementptr inbounds i64, ptr %1, i64 4
  %wide.load13 = load <4 x i64>, ptr %2, align 8, !tbaa !4, !alias.scope !8, !noalias !11
  %3 = getelementptr inbounds i64, ptr %b, i64 %index
  %wide.load14 = load <4 x i64>, ptr %3, align 8, !tbaa !4, !alias.scope !11
  %4 = getelementptr inbounds i64, ptr %3, i64 4
  %wide.load15 = load <4 x i64>, ptr %4, align 8, !tbaa !4, !alias.scope !11
  %5 = xor <4 x i64> %wide.load14, <i64 -1, i64 -1, i64 -1, i64 -1>
  %6 = xor <4 x i64> %wide.load15, <i64 -1, i64 -1, i64 -1, i64 -1>
  %7 = and <4 x i64> %wide.load, %5
  %8 = and <4 x i64> %wide.load13, %6
  store <4 x i64> %7, ptr %1, align 8, !tbaa !4, !alias.scope !8, !noalias !11
  store <4 x i64> %8, ptr %2, align 8, !tbaa !4, !alias.scope !8, !noalias !11
  %index.next = add nuw i64 %index, 8
  %9 = icmp eq i64 %index.next, %n.vec
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !13

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br i1 %cmp.n, label %for.cond.cleanup, label %for.body.preheader16

for.body.preheader16:                             ; preds = %vector.memcheck, %for.body.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %for.body.preheader ], [ %n.vec, %middle.block ]
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %middle.block, %entry
  ret void

for.body:                                         ; preds = %for.body.preheader16, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ %indvars.iv.ph, %for.body.preheader16 ]
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

attributes #0 = { argmemonly nofree norecurse nosync nounwind vscale_range(4,1024) "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,+v,+zba,+zbb,+zbc,+zbs,+zve32f,+zve32x,+zve64d,+zve64f,+zve64x,+zvl128b,+zvl256b,+zvl32b,+zvl64b,-save-restore" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64d"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 9472a810ed33bc9e655484f43047eed07d50bc16)"}
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
