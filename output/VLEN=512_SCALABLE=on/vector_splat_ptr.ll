; ModuleID = 'vector_splat_ptr.c'
source_filename = "vector_splat_ptr.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64-unknown-unknown"

; Function Attrs: argmemonly nofree norecurse nosync nounwind writeonly vscale_range(8,1024)
define dso_local void @vector_splat_ptr(ptr nocapture noundef writeonly %a, ptr noundef %v, i32 noundef signext %a_len) local_unnamed_addr #0 {
entry:
  %cmp3.not = icmp eq i32 %a_len, 0
  br i1 %cmp3.not, label %for.cond.cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %a_len to i64
  %0 = tail call i64 @llvm.vscale.i64()
  %min.iters.check = icmp ugt i64 %0, %wide.trip.count
  br i1 %min.iters.check, label %for.body.preheader5, label %vector.ph

vector.ph:                                        ; preds = %for.body.preheader
  %1 = tail call i64 @llvm.vscale.i64()
  %n.mod.vf = urem i64 %wide.trip.count, %1
  %n.vec = sub nuw nsw i64 %wide.trip.count, %n.mod.vf
  %broadcast.splatinsert = insertelement <vscale x 1 x ptr> poison, ptr %v, i64 0
  %broadcast.splat = shufflevector <vscale x 1 x ptr> %broadcast.splatinsert, <vscale x 1 x ptr> poison, <vscale x 1 x i32> zeroinitializer
  %2 = tail call i64 @llvm.vscale.i64()
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %3 = getelementptr inbounds ptr, ptr %a, i64 %index
  store <vscale x 1 x ptr> %broadcast.splat, ptr %3, align 8, !tbaa !4
  %index.next = add nuw i64 %index, %2
  %4 = icmp eq i64 %index.next, %n.vec
  br i1 %4, label %middle.block, label %vector.body, !llvm.loop !8

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.cond.cleanup, label %for.body.preheader5

for.body.preheader5:                              ; preds = %for.body.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %for.body.preheader ], [ %n.vec, %middle.block ]
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %middle.block, %entry
  ret void

for.body:                                         ; preds = %for.body.preheader5, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ %indvars.iv.ph, %for.body.preheader5 ]
  %arrayidx = getelementptr inbounds ptr, ptr %a, i64 %indvars.iv
  store ptr %v, ptr %arrayidx, align 8, !tbaa !4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !llvm.loop !11
}

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i64 @llvm.vscale.i64() #1

attributes #0 = { argmemonly nofree norecurse nosync nounwind writeonly vscale_range(8,1024) "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,+v,+zba,+zbb,+zbc,+zbs,+zve32f,+zve32x,+zve64d,+zve64f,+zve64x,+zvl128b,+zvl256b,+zvl32b,+zvl512b,+zvl64b,-save-restore" }
attributes #1 = { nocallback nofree nosync nounwind readnone willreturn }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64d"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 9472a810ed33bc9e655484f43047eed07d50bc16)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"any pointer", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = distinct !{!8, !9, !10}
!9 = !{!"llvm.loop.mustprogress"}
!10 = !{!"llvm.loop.isvectorized", i32 1}
!11 = distinct !{!11, !9, !12, !10}
!12 = !{!"llvm.loop.unroll.runtime.disable"}
