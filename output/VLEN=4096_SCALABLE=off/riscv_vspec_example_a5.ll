; ModuleID = 'riscv_vspec_example_a5.c'
source_filename = "riscv_vspec_example_a5.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64-unknown-unknown"

; Function Attrs: nofree nosync nounwind memory(argmem: readwrite) vscale_range(2,1024)
define dso_local void @saxpy(i64 noundef %n, float noundef %a, ptr nocapture noundef readonly %x, ptr nocapture noundef %y) local_unnamed_addr #0 {
entry:
  %cmp8 = icmp sgt i64 %n, 0
  br i1 %cmp8, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %min.iters.check = icmp ult i64 %n, 16
  br i1 %min.iters.check, label %for.body.preheader16, label %vector.memcheck

vector.memcheck:                                  ; preds = %for.body.preheader
  %0 = shl i64 %n, 2
  %scevgep = getelementptr i8, ptr %y, i64 %0
  %scevgep10 = getelementptr i8, ptr %x, i64 %0
  %bound0 = icmp ugt ptr %scevgep10, %y
  %bound1 = icmp ugt ptr %scevgep, %x
  %found.conflict = and i1 %bound0, %bound1
  br i1 %found.conflict, label %for.body.preheader16, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %n.vec = and i64 %n, -16
  %broadcast.splatinsert = insertelement <8 x float> poison, float %a, i64 0
  %broadcast.splat = shufflevector <8 x float> %broadcast.splatinsert, <8 x float> poison, <8 x i32> zeroinitializer
  %broadcast.splatinsert14 = insertelement <8 x float> poison, float %a, i64 0
  %broadcast.splat15 = shufflevector <8 x float> %broadcast.splatinsert14, <8 x float> poison, <8 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %1 = getelementptr inbounds float, ptr %x, i64 %index
  %wide.load = load <8 x float>, ptr %1, align 4, !tbaa !4, !alias.scope !8
  %2 = getelementptr inbounds float, ptr %1, i64 8
  %wide.load11 = load <8 x float>, ptr %2, align 4, !tbaa !4, !alias.scope !8
  %3 = getelementptr inbounds float, ptr %y, i64 %index
  %wide.load12 = load <8 x float>, ptr %3, align 4, !tbaa !4, !alias.scope !11, !noalias !8
  %4 = getelementptr inbounds float, ptr %3, i64 8
  %wide.load13 = load <8 x float>, ptr %4, align 4, !tbaa !4, !alias.scope !11, !noalias !8
  %5 = tail call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %broadcast.splat, <8 x float> %wide.load, <8 x float> %wide.load12)
  %6 = tail call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %broadcast.splat15, <8 x float> %wide.load11, <8 x float> %wide.load13)
  store <8 x float> %5, ptr %3, align 4, !tbaa !4, !alias.scope !11, !noalias !8
  store <8 x float> %6, ptr %4, align 4, !tbaa !4, !alias.scope !11, !noalias !8
  %index.next = add nuw i64 %index, 16
  %7 = icmp eq i64 %index.next, %n.vec
  br i1 %7, label %middle.block, label %vector.body, !llvm.loop !13

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.vec, %n
  br i1 %cmp.n, label %for.end, label %for.body.preheader16

for.body.preheader16:                             ; preds = %vector.memcheck, %for.body.preheader, %middle.block
  %i.09.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %for.body.preheader ], [ %n.vec, %middle.block ]
  br label %for.body

for.body:                                         ; preds = %for.body.preheader16, %for.body
  %i.09 = phi i64 [ %inc, %for.body ], [ %i.09.ph, %for.body.preheader16 ]
  %arrayidx = getelementptr inbounds float, ptr %x, i64 %i.09
  %8 = load float, ptr %arrayidx, align 4, !tbaa !4
  %arrayidx1 = getelementptr inbounds float, ptr %y, i64 %i.09
  %9 = load float, ptr %arrayidx1, align 4, !tbaa !4
  %10 = tail call float @llvm.fmuladd.f32(float %a, float %8, float %9)
  store float %10, ptr %arrayidx1, align 4, !tbaa !4
  %inc = add nuw nsw i64 %i.09, 1
  %exitcond.not = icmp eq i64 %inc, %n
  br i1 %exitcond.not, label %for.end, label %for.body, !llvm.loop !17

for.end:                                          ; preds = %for.body, %middle.block, %entry
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x float> @llvm.fmuladd.v8f32(<8 x float>, <8 x float>, <8 x float>) #2

attributes #0 = { nofree nosync nounwind memory(argmem: readwrite) vscale_range(2,1024) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv64" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,+v,+zba,+zbb,+zbc,+zbs,+zicsr,+zifencei,+zve32f,+zve32x,+zve64d,+zve64f,+zve64x,+zvl128b,+zvl32b,+zvl64b,-e,-experimental-smaia,-experimental-ssaia,-experimental-zacas,-experimental-zfa,-experimental-zfbfmin,-experimental-zicond,-experimental-zihintntl,-experimental-ztso,-experimental-zvbb,-experimental-zvbc,-experimental-zvfbfmin,-experimental-zvfbfwma,-experimental-zvfh,-experimental-zvkg,-experimental-zvkn,-experimental-zvknc,-experimental-zvkned,-experimental-zvkng,-experimental-zvknha,-experimental-zvknhb,-experimental-zvks,-experimental-zvksc,-experimental-zvksed,-experimental-zvksg,-experimental-zvksh,-experimental-zvkt,-h,-save-restore,-svinval,-svnapot,-svpbmt,-xsfcie,-xsfvcp,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-zawrs,-zbkb,-zbkc,-zbkx,-zca,-zcb,-zcd,-zcf,-zcmp,-zcmt,-zdinx,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zicbom,-zicbop,-zicboz,-zicntr,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvl1024b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl4096b,-zvl512b,-zvl65536b,-zvl8192b" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64d"}
!2 = !{i32 8, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 17.0.0 (https://github.com/llvm/llvm-project.git e2d7d988115c1b67b0175be5d6bc95153945b5be)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!9}
!9 = distinct !{!9, !10}
!10 = distinct !{!10, !"LVerDomain"}
!11 = !{!12}
!12 = distinct !{!12, !10}
!13 = distinct !{!13, !14, !15, !16}
!14 = !{!"llvm.loop.mustprogress"}
!15 = !{!"llvm.loop.isvectorized", i32 1}
!16 = !{!"llvm.loop.unroll.runtime.disable"}
!17 = distinct !{!17, !14, !15}
