; ModuleID = 'vector_add_i32.c'
source_filename = "vector_add_i32.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
target triple = "riscv64"

; Function Attrs: argmemonly nofree norecurse nosync nounwind
define dso_local void @vector_add_i32(ptr nocapture noundef %a, i32 noundef signext %a_len, i32 noundef signext %b) local_unnamed_addr #0 {
entry:
  %cmp3.not = icmp eq i32 %a_len, 0
  br i1 %cmp3.not, label %for.cond.cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %a_len to i64
  %0 = call i64 @llvm.vscale.i64()
  %1 = shl i64 %0, 2
  %min.iters.check = icmp ugt i64 %1, %wide.trip.count
  br i1 %min.iters.check, label %for.body.preheader8, label %vector.ph

vector.ph:                                        ; preds = %for.body.preheader
  %2 = call i64 @llvm.vscale.i64()
  %3 = shl i64 %2, 2
  %n.mod.vf = urem i64 %wide.trip.count, %3
  %n.vec = sub nuw nsw i64 %wide.trip.count, %n.mod.vf
  %broadcast.splatinsert = insertelement <vscale x 2 x i32> poison, i32 %b, i64 0
  %broadcast.splat = shufflevector <vscale x 2 x i32> %broadcast.splatinsert, <vscale x 2 x i32> poison, <vscale x 2 x i32> zeroinitializer
  %broadcast.splatinsert6 = insertelement <vscale x 2 x i32> poison, i32 %b, i64 0
  %broadcast.splat7 = shufflevector <vscale x 2 x i32> %broadcast.splatinsert6, <vscale x 2 x i32> poison, <vscale x 2 x i32> zeroinitializer
  %4 = call i32 @llvm.vscale.i32()
  %5 = shl i32 %4, 1
  %6 = sext i32 %5 to i64
  %7 = call i32 @llvm.vscale.i32()
  %8 = shl i32 %7, 1
  %9 = sext i32 %8 to i64
  %10 = call i64 @llvm.vscale.i64()
  %11 = shl i64 %10, 2
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %12 = getelementptr inbounds i32, ptr %a, i64 %index
  %wide.load = load <vscale x 2 x i32>, ptr %12, align 4, !tbaa !4
  %13 = getelementptr inbounds i32, ptr %12, i64 %6
  %wide.load5 = load <vscale x 2 x i32>, ptr %13, align 4, !tbaa !4
  %14 = add nsw <vscale x 2 x i32> %wide.load, %broadcast.splat
  %15 = add nsw <vscale x 2 x i32> %wide.load5, %broadcast.splat7
  store <vscale x 2 x i32> %14, ptr %12, align 4, !tbaa !4
  %16 = getelementptr inbounds i32, ptr %12, i64 %9
  store <vscale x 2 x i32> %15, ptr %16, align 4, !tbaa !4
  %index.next = add nuw i64 %index, %11
  %17 = icmp eq i64 %index.next, %n.vec
  br i1 %17, label %middle.block, label %vector.body, !llvm.loop !8

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.cond.cleanup, label %for.body.preheader8

for.body.preheader8:                              ; preds = %for.body.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %for.body.preheader ], [ %n.vec, %middle.block ]
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %middle.block, %entry
  ret void

for.body:                                         ; preds = %for.body.preheader8, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ %indvars.iv.ph, %for.body.preheader8 ]
  %arrayidx = getelementptr inbounds i32, ptr %a, i64 %indvars.iv
  %18 = load i32, ptr %arrayidx, align 4, !tbaa !4
  %add = add nsw i32 %18, %b
  store i32 %add, ptr %arrayidx, align 4, !tbaa !4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !llvm.loop !11
}

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i64 @llvm.vscale.i64() #1

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i32 @llvm.vscale.i32() #1

attributes #0 = { argmemonly nofree norecurse nosync nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+v,+f,+m,+c,+d,+zba,+zbb,+zbc,+zbs,-save-restore" }
attributes #1 = { nocallback nofree nosync nounwind readnone willreturn }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 15.0.0 (https://github.com/llvm/llvm-project.git 1e451369d2017830d3dbddec24063170b7aca0de)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = distinct !{!8, !9, !10}
!9 = !{!"llvm.loop.mustprogress"}
!10 = !{!"llvm.loop.isvectorized", i32 1}
!11 = distinct !{!11, !9, !12, !10}
!12 = !{!"llvm.loop.unroll.runtime.disable"}
