; ModuleID = 'riscv_vspec_example_a5.c'
source_filename = "riscv_vspec_example_a5.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
target triple = "riscv64"

; Function Attrs: argmemonly nofree nosync nounwind
define dso_local void @saxpy(i64 noundef %n, float noundef %a, ptr nocapture noundef readonly %x, ptr nocapture noundef %y) local_unnamed_addr #0 {
entry:
  %cmp8 = icmp sgt i64 %n, 0
  br i1 %cmp8, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %min.iters.check = icmp ult i64 %n, 8
  br i1 %min.iters.check, label %for.body.preheader16, label %vector.memcheck

vector.memcheck:                                  ; preds = %for.body.preheader
  %0 = shl i64 %n, 2
  %uglygep = getelementptr i8, ptr %y, i64 %0
  %uglygep10 = getelementptr i8, ptr %x, i64 %0
  %bound0 = icmp ugt ptr %uglygep10, %y
  %bound1 = icmp ugt ptr %uglygep, %x
  %found.conflict = and i1 %bound0, %bound1
  br i1 %found.conflict, label %for.body.preheader16, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %1 = call i64 @llvm.vscale.i64()
  %2 = shl i64 %1, 2
  %n.mod.vf = urem i64 %n, %2
  %n.vec = sub nuw i64 %n, %n.mod.vf
  %broadcast.splatinsert = insertelement <vscale x 2 x float> poison, float %a, i64 0
  %broadcast.splat = shufflevector <vscale x 2 x float> %broadcast.splatinsert, <vscale x 2 x float> poison, <vscale x 2 x i32> zeroinitializer
  %broadcast.splatinsert14 = insertelement <vscale x 2 x float> poison, float %a, i64 0
  %broadcast.splat15 = shufflevector <vscale x 2 x float> %broadcast.splatinsert14, <vscale x 2 x float> poison, <vscale x 2 x i32> zeroinitializer
  %3 = call i32 @llvm.vscale.i32()
  %4 = shl i32 %3, 1
  %5 = sext i32 %4 to i64
  %6 = call i32 @llvm.vscale.i32()
  %7 = shl i32 %6, 1
  %8 = sext i32 %7 to i64
  %9 = call i32 @llvm.vscale.i32()
  %10 = shl i32 %9, 1
  %11 = sext i32 %10 to i64
  %12 = call i64 @llvm.vscale.i64()
  %13 = shl i64 %12, 2
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %14 = getelementptr inbounds float, ptr %x, i64 %index
  %wide.load = load <vscale x 2 x float>, ptr %14, align 4, !tbaa !4, !alias.scope !8
  %15 = getelementptr inbounds float, ptr %14, i64 %5
  %wide.load11 = load <vscale x 2 x float>, ptr %15, align 4, !tbaa !4, !alias.scope !8
  %16 = getelementptr inbounds float, ptr %y, i64 %index
  %wide.load12 = load <vscale x 2 x float>, ptr %16, align 4, !tbaa !4, !alias.scope !11, !noalias !8
  %17 = getelementptr inbounds float, ptr %16, i64 %8
  %wide.load13 = load <vscale x 2 x float>, ptr %17, align 4, !tbaa !4, !alias.scope !11, !noalias !8
  %18 = call <vscale x 2 x float> @llvm.fmuladd.nxv2f32(<vscale x 2 x float> %broadcast.splat, <vscale x 2 x float> %wide.load, <vscale x 2 x float> %wide.load12)
  %19 = call <vscale x 2 x float> @llvm.fmuladd.nxv2f32(<vscale x 2 x float> %broadcast.splat15, <vscale x 2 x float> %wide.load11, <vscale x 2 x float> %wide.load13)
  store <vscale x 2 x float> %18, ptr %16, align 4, !tbaa !4, !alias.scope !11, !noalias !8
  %20 = getelementptr inbounds float, ptr %16, i64 %11
  store <vscale x 2 x float> %19, ptr %20, align 4, !tbaa !4, !alias.scope !11, !noalias !8
  %index.next = add nuw i64 %index, %13
  %21 = icmp eq i64 %index.next, %n.vec
  br i1 %21, label %middle.block, label %vector.body, !llvm.loop !13

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.end, label %for.body.preheader16

for.body.preheader16:                             ; preds = %vector.memcheck, %for.body.preheader, %middle.block
  %i.09.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %for.body.preheader ], [ %n.vec, %middle.block ]
  br label %for.body

for.body:                                         ; preds = %for.body.preheader16, %for.body
  %i.09 = phi i64 [ %inc, %for.body ], [ %i.09.ph, %for.body.preheader16 ]
  %arrayidx = getelementptr inbounds float, ptr %x, i64 %i.09
  %22 = load float, ptr %arrayidx, align 4, !tbaa !4
  %arrayidx1 = getelementptr inbounds float, ptr %y, i64 %i.09
  %23 = load float, ptr %arrayidx1, align 4, !tbaa !4
  %24 = tail call float @llvm.fmuladd.f32(float %a, float %22, float %23)
  store float %24, ptr %arrayidx1, align 4, !tbaa !4
  %inc = add nuw nsw i64 %i.09, 1
  %exitcond.not = icmp eq i64 %inc, %n
  br i1 %exitcond.not, label %for.end, label %for.body, !llvm.loop !16

for.end:                                          ; preds = %for.body, %middle.block, %entry
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i64 @llvm.vscale.i64() #2

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i32 @llvm.vscale.i32() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare <vscale x 2 x float> @llvm.fmuladd.nxv2f32(<vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float>) #3

attributes #0 = { argmemonly nofree nosync nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+v,+f,+m,+c,+d,+zba,+zbb,+zbc,+zbs,-save-restore" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 15.0.0 (https://github.com/llvm/llvm-project.git dde2a7fb6da46da2b2f765fa569d8fddb4270eb6)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
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
