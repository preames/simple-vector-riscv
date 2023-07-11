; ModuleID = 'pairwise_dotproduct_fp32.c'
source_filename = "pairwise_dotproduct_fp32.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64-unknown-unknown"

; Function Attrs: nofree nosync nounwind memory(argmem: readwrite) vscale_range(2,1024)
define dso_local void @pairwise_dotproduct_fp32(i32 noundef signext %len, ptr nocapture noundef writeonly %a, ptr nocapture noundef readonly %b, ptr nocapture noundef readonly %c) local_unnamed_addr #0 {
entry:
  %div22 = and i32 %len, -2
  %cmp24.not = icmp eq i32 %div22, 0
  br i1 %cmp24.not, label %for.cond.cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  %0 = zext i32 %div22 to i64
  %1 = add nsw i64 %0, -1
  %2 = lshr i64 %1, 1
  %3 = add nuw i64 %2, 1
  %min.iters.check = icmp ult i32 %div22, 31
  br i1 %min.iters.check, label %for.body.preheader37, label %vector.memcheck

vector.memcheck:                                  ; preds = %for.body.preheader
  %4 = add nsw i64 %0, -1
  %5 = lshr i64 %4, 1
  %6 = shl i64 %5, 2
  %7 = add i64 %6, 4
  %scevgep = getelementptr i8, ptr %a, i64 %7
  %8 = shl i64 %5, 3
  %9 = add i64 %8, 8
  %scevgep28 = getelementptr i8, ptr %b, i64 %9
  %scevgep29 = getelementptr i8, ptr %c, i64 %9
  %bound0 = icmp ugt ptr %scevgep28, %a
  %bound1 = icmp ugt ptr %scevgep, %b
  %found.conflict = and i1 %bound0, %bound1
  %bound030 = icmp ugt ptr %scevgep29, %a
  %bound131 = icmp ugt ptr %scevgep, %c
  %found.conflict32 = and i1 %bound030, %bound131
  %conflict.rdx = or i1 %found.conflict, %found.conflict32
  br i1 %conflict.rdx, label %for.body.preheader37, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %n.vec = and i64 %3, -8
  %ind.end = shl i64 %n.vec, 1
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %offset.idx = shl i64 %index, 1
  %10 = getelementptr inbounds float, ptr %b, i64 %offset.idx
  %wide.vec = load <16 x float>, ptr %10, align 4, !tbaa !4
  %strided.vec = shufflevector <16 x float> %wide.vec, <16 x float> poison, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 8, i32 10, i32 12, i32 14>
  %11 = getelementptr inbounds float, ptr %c, i64 %offset.idx
  %wide.vec34 = load <16 x float>, ptr %11, align 4, !tbaa !4
  %strided.vec35 = shufflevector <16 x float> %wide.vec34, <16 x float> poison, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 8, i32 10, i32 12, i32 14>
  %12 = fmul <16 x float> %wide.vec, %wide.vec34
  %13 = shufflevector <16 x float> %12, <16 x float> poison, <8 x i32> <i32 1, i32 3, i32 5, i32 7, i32 9, i32 11, i32 13, i32 15>
  %14 = tail call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %strided.vec, <8 x float> %strided.vec35, <8 x float> %13)
  %15 = and i64 %index, 9223372036854775800
  %16 = getelementptr inbounds float, ptr %a, i64 %15
  store <8 x float> %14, ptr %16, align 4, !tbaa !4, !alias.scope !8, !noalias !11
  %index.next = add nuw i64 %index, 8
  %17 = icmp eq i64 %index.next, %n.vec
  br i1 %17, label %middle.block, label %vector.body, !llvm.loop !14

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %3, %n.vec
  br i1 %cmp.n, label %for.cond.cleanup, label %for.body.preheader37

for.body.preheader37:                             ; preds = %vector.memcheck, %for.body.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %for.body.preheader ], [ %ind.end, %middle.block ]
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %middle.block, %entry
  ret void

for.body:                                         ; preds = %for.body.preheader37, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ %indvars.iv.ph, %for.body.preheader37 ]
  %arrayidx = getelementptr inbounds float, ptr %b, i64 %indvars.iv
  %18 = load float, ptr %arrayidx, align 4, !tbaa !4
  %arrayidx2 = getelementptr inbounds float, ptr %c, i64 %indvars.iv
  %19 = load float, ptr %arrayidx2, align 4, !tbaa !4
  %20 = or i64 %indvars.iv, 1
  %arrayidx5 = getelementptr inbounds float, ptr %b, i64 %20
  %21 = load float, ptr %arrayidx5, align 4, !tbaa !4
  %arrayidx8 = getelementptr inbounds float, ptr %c, i64 %20
  %22 = load float, ptr %arrayidx8, align 4, !tbaa !4
  %mul9 = fmul float %21, %22
  %23 = tail call float @llvm.fmuladd.f32(float %18, float %19, float %mul9)
  %24 = lshr exact i64 %indvars.iv, 1
  %arrayidx12 = getelementptr inbounds float, ptr %a, i64 %24
  store float %23, ptr %arrayidx12, align 4, !tbaa !4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 2
  %cmp = icmp ult i64 %indvars.iv.next, %0
  br i1 %cmp, label %for.body, label %for.cond.cleanup, !llvm.loop !18
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
!11 = !{!12, !13}
!12 = distinct !{!12, !10}
!13 = distinct !{!13, !10}
!14 = distinct !{!14, !15, !16, !17}
!15 = !{!"llvm.loop.mustprogress"}
!16 = !{!"llvm.loop.isvectorized", i32 1}
!17 = !{!"llvm.loop.unroll.runtime.disable"}
!18 = distinct !{!18, !15, !16}
