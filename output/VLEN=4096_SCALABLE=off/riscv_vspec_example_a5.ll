; ModuleID = 'riscv_vspec_example_a5.c'
source_filename = "riscv_vspec_example_a5.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
target triple = "riscv64"

; Function Attrs: argmemonly nofree nosync nounwind
define dso_local void @saxpy(i64 noundef %n, float noundef %a, ptr nocapture noundef readonly %x, ptr nocapture noundef %y) local_unnamed_addr #0 {
entry:
  %cmp8 = icmp sgt i64 %n, 0
  br i1 %cmp8, label %iter.check, label %for.end

iter.check:                                       ; preds = %entry
  %min.iters.check = icmp ult i64 %n, 64
  br i1 %min.iters.check, label %for.body.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %iter.check
  %0 = shl i64 %n, 2
  %uglygep = getelementptr i8, ptr %y, i64 %0
  %uglygep10 = getelementptr i8, ptr %x, i64 %0
  %bound0 = icmp ugt ptr %uglygep10, %y
  %bound1 = icmp ugt ptr %uglygep, %x
  %found.conflict = and i1 %bound0, %bound1
  br i1 %found.conflict, label %for.body.preheader, label %vector.main.loop.iter.check

vector.main.loop.iter.check:                      ; preds = %vector.memcheck
  %min.iters.check11 = icmp ult i64 %n, 256
  br i1 %min.iters.check11, label %vec.epilog.ph, label %vector.ph

vector.ph:                                        ; preds = %vector.main.loop.iter.check
  %n.vec = and i64 %n, -256
  %broadcast.splatinsert = insertelement <128 x float> poison, float %a, i64 0
  %broadcast.splat = shufflevector <128 x float> %broadcast.splatinsert, <128 x float> poison, <128 x i32> zeroinitializer
  %broadcast.splatinsert15 = insertelement <128 x float> poison, float %a, i64 0
  %broadcast.splat16 = shufflevector <128 x float> %broadcast.splatinsert15, <128 x float> poison, <128 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %1 = getelementptr inbounds float, ptr %x, i64 %index
  %wide.load = load <128 x float>, ptr %1, align 4, !tbaa !4, !alias.scope !8
  %2 = getelementptr inbounds float, ptr %1, i64 128
  %wide.load12 = load <128 x float>, ptr %2, align 4, !tbaa !4, !alias.scope !8
  %3 = getelementptr inbounds float, ptr %y, i64 %index
  %wide.load13 = load <128 x float>, ptr %3, align 4, !tbaa !4, !alias.scope !11, !noalias !8
  %4 = getelementptr inbounds float, ptr %3, i64 128
  %wide.load14 = load <128 x float>, ptr %4, align 4, !tbaa !4, !alias.scope !11, !noalias !8
  %5 = call <128 x float> @llvm.fmuladd.v128f32(<128 x float> %broadcast.splat, <128 x float> %wide.load, <128 x float> %wide.load13)
  %6 = call <128 x float> @llvm.fmuladd.v128f32(<128 x float> %broadcast.splat16, <128 x float> %wide.load12, <128 x float> %wide.load14)
  store <128 x float> %5, ptr %3, align 4, !tbaa !4, !alias.scope !11, !noalias !8
  store <128 x float> %6, ptr %4, align 4, !tbaa !4, !alias.scope !11, !noalias !8
  %index.next = add nuw i64 %index, 256
  %7 = icmp eq i64 %index.next, %n.vec
  br i1 %7, label %middle.block, label %vector.body, !llvm.loop !13

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.vec, %n
  br i1 %cmp.n, label %for.end, label %vec.epilog.iter.check

vec.epilog.iter.check:                            ; preds = %middle.block
  %n.vec.remaining = and i64 %n, 192
  %min.epilog.iters.check = icmp eq i64 %n.vec.remaining, 0
  br i1 %min.epilog.iters.check, label %for.body.preheader, label %vec.epilog.ph

vec.epilog.ph:                                    ; preds = %vector.main.loop.iter.check, %vec.epilog.iter.check
  %vec.epilog.resume.val = phi i64 [ %n.vec, %vec.epilog.iter.check ], [ 0, %vector.main.loop.iter.check ]
  %n.vec18 = and i64 %n, -64
  %broadcast.splatinsert23 = insertelement <64 x float> poison, float %a, i64 0
  %broadcast.splat24 = shufflevector <64 x float> %broadcast.splatinsert23, <64 x float> poison, <64 x i32> zeroinitializer
  br label %vec.epilog.vector.body

vec.epilog.vector.body:                           ; preds = %vec.epilog.vector.body, %vec.epilog.ph
  %offset.idx = phi i64 [ %vec.epilog.resume.val, %vec.epilog.ph ], [ %index.next25, %vec.epilog.vector.body ]
  %8 = getelementptr inbounds float, ptr %x, i64 %offset.idx
  %wide.load21 = load <64 x float>, ptr %8, align 4, !tbaa !4, !alias.scope !16
  %9 = getelementptr inbounds float, ptr %y, i64 %offset.idx
  %wide.load22 = load <64 x float>, ptr %9, align 4, !tbaa !4, !alias.scope !19, !noalias !16
  %10 = call <64 x float> @llvm.fmuladd.v64f32(<64 x float> %broadcast.splat24, <64 x float> %wide.load21, <64 x float> %wide.load22)
  store <64 x float> %10, ptr %9, align 4, !tbaa !4, !alias.scope !19, !noalias !16
  %index.next25 = add nuw i64 %offset.idx, 64
  %11 = icmp eq i64 %index.next25, %n.vec18
  br i1 %11, label %vec.epilog.middle.block, label %vec.epilog.vector.body, !llvm.loop !21

vec.epilog.middle.block:                          ; preds = %vec.epilog.vector.body
  %cmp.n19 = icmp eq i64 %n.vec18, %n
  br i1 %cmp.n19, label %for.end, label %for.body.preheader

for.body.preheader:                               ; preds = %vector.memcheck, %iter.check, %vec.epilog.iter.check, %vec.epilog.middle.block
  %i.09.ph = phi i64 [ 0, %iter.check ], [ 0, %vector.memcheck ], [ %n.vec, %vec.epilog.iter.check ], [ %n.vec18, %vec.epilog.middle.block ]
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %for.body
  %i.09 = phi i64 [ %inc, %for.body ], [ %i.09.ph, %for.body.preheader ]
  %arrayidx = getelementptr inbounds float, ptr %x, i64 %i.09
  %12 = load float, ptr %arrayidx, align 4, !tbaa !4
  %arrayidx1 = getelementptr inbounds float, ptr %y, i64 %i.09
  %13 = load float, ptr %arrayidx1, align 4, !tbaa !4
  %14 = tail call float @llvm.fmuladd.f32(float %a, float %12, float %13)
  store float %14, ptr %arrayidx1, align 4, !tbaa !4
  %inc = add nuw nsw i64 %i.09, 1
  %exitcond.not = icmp eq i64 %inc, %n
  br i1 %exitcond.not, label %for.end, label %for.body, !llvm.loop !23

for.end:                                          ; preds = %for.body, %middle.block, %vec.epilog.middle.block, %entry
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare <128 x float> @llvm.fmuladd.v128f32(<128 x float>, <128 x float>, <128 x float>) #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare <64 x float> @llvm.fmuladd.v64f32(<64 x float>, <64 x float>, <64 x float>) #2

attributes #0 = { argmemonly nofree nosync nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+v,+f,+m,+c,+d,+zba,-save-restore" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!16 = !{!17}
!17 = distinct !{!17, !18}
!18 = distinct !{!18, !"LVerDomain"}
!19 = !{!20}
!20 = distinct !{!20, !18}
!21 = distinct !{!21, !14, !15, !22}
!22 = !{!"llvm.loop.unroll.runtime.disable"}
!23 = distinct !{!23, !14, !15}
