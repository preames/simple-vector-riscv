; ModuleID = 'aos_reduce_sum_i64.c'
source_filename = "aos_reduce_sum_i64.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64-unknown-unknown"

%struct.T = type { i64, i64, i64, i64, i64, i64, i64 }

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: read) vscale_range(2,1024)
define dso_local signext i32 @aos_reduce_sum_i64(i32 noundef signext %len, ptr nocapture noundef readonly %a) local_unnamed_addr #0 {
entry:
  %cmp4.not = icmp eq i32 %len, 0
  br i1 %cmp4.not, label %for.cond.cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %len to i64
  %0 = tail call i64 @llvm.vscale.i64()
  %1 = shl nuw nsw i64 %0, 1
  %min.iters.check.not = icmp ult i64 %1, %wide.trip.count
  br i1 %min.iters.check.not, label %vector.ph, label %for.body.preheader7

vector.ph:                                        ; preds = %for.body.preheader
  %2 = tail call i64 @llvm.vscale.i64()
  %3 = shl nuw nsw i64 %2, 1
  %n.mod.vf = urem i64 %wide.trip.count, %3
  %4 = icmp eq i64 %n.mod.vf, 0
  %5 = select i1 %4, i64 %3, i64 %n.mod.vf
  %n.vec = sub nsw i64 %wide.trip.count, %5
  %6 = tail call <vscale x 2 x i64> @llvm.experimental.stepvector.nxv2i64()
  %7 = tail call i64 @llvm.vscale.i64()
  %8 = shl nuw nsw i64 %7, 1
  %.splatinsert = insertelement <vscale x 2 x i64> poison, i64 %8, i64 0
  %.splat = shufflevector <vscale x 2 x i64> %.splatinsert, <vscale x 2 x i64> poison, <vscale x 2 x i32> zeroinitializer
  %9 = tail call i64 @llvm.vscale.i64()
  %10 = shl nuw nsw i64 %9, 1
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <vscale x 2 x i64> [ %6, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %vec.phi = phi <vscale x 2 x i64> [ zeroinitializer, %vector.ph ], [ %12, %vector.body ]
  %11 = getelementptr inbounds %struct.T, ptr %a, <vscale x 2 x i64> %vec.ind, i32 6
  %wide.masked.gather = tail call <vscale x 2 x i64> @llvm.masked.gather.nxv2i64.nxv2p0(<vscale x 2 x ptr> %11, i32 8, <vscale x 2 x i1> shufflevector (<vscale x 2 x i1> insertelement (<vscale x 2 x i1> poison, i1 true, i64 0), <vscale x 2 x i1> poison, <vscale x 2 x i32> zeroinitializer), <vscale x 2 x i64> poison), !tbaa !4
  %12 = add <vscale x 2 x i64> %wide.masked.gather, %vec.phi
  %index.next = add nuw i64 %index, %10
  %vec.ind.next = add <vscale x 2 x i64> %vec.ind, %.splat
  %13 = icmp eq i64 %index.next, %n.vec
  br i1 %13, label %middle.block, label %vector.body, !llvm.loop !9

middle.block:                                     ; preds = %vector.body
  %14 = tail call i64 @llvm.vector.reduce.add.nxv2i64(<vscale x 2 x i64> %12)
  br label %for.body.preheader7

for.body.preheader7:                              ; preds = %for.body.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %for.body.preheader ], [ %n.vec, %middle.block ]
  %sum.05.ph = phi i64 [ 0, %for.body.preheader ], [ %14, %middle.block ]
  br label %for.body

for.cond.cleanup.loopexit:                        ; preds = %for.body
  %15 = trunc i64 %add to i32
  br label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit, %entry
  %sum.0.lcssa = phi i32 [ 0, %entry ], [ %15, %for.cond.cleanup.loopexit ]
  ret i32 %sum.0.lcssa

for.body:                                         ; preds = %for.body.preheader7, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ %indvars.iv.ph, %for.body.preheader7 ]
  %sum.05 = phi i64 [ %add, %for.body ], [ %sum.05.ph, %for.body.preheader7 ]
  %g = getelementptr inbounds %struct.T, ptr %a, i64 %indvars.iv, i32 6
  %16 = load i64, ptr %g, align 8, !tbaa !4
  %add = add nsw i64 %16, %sum.05
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond.cleanup.loopexit, label %for.body, !llvm.loop !13
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare i64 @llvm.vscale.i64() #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i64> @llvm.experimental.stepvector.nxv2i64() #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(read)
declare <vscale x 2 x i64> @llvm.masked.gather.nxv2i64.nxv2p0(<vscale x 2 x ptr>, i32 immarg, <vscale x 2 x i1>, <vscale x 2 x i64>) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.add.nxv2i64(<vscale x 2 x i64>) #3

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: read) vscale_range(2,1024) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv64" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,+v,+zba,+zbb,+zbc,+zbs,+zicsr,+zifencei,+zve32f,+zve32x,+zve64d,+zve64f,+zve64x,+zvl128b,+zvl32b,+zvl64b,-e,-experimental-smaia,-experimental-ssaia,-experimental-zca,-experimental-zcb,-experimental-zcd,-experimental-zcf,-experimental-zcmp,-experimental-zcmt,-experimental-zfa,-experimental-zicond,-experimental-zihintntl,-experimental-ztso,-experimental-zvbb,-experimental-zvbc,-experimental-zvfh,-experimental-zvkg,-experimental-zvkn,-experimental-zvkned,-experimental-zvkng,-experimental-zvknha,-experimental-zvknhb,-experimental-zvks,-experimental-zvksed,-experimental-zvksg,-experimental-zvksh,-experimental-zvkt,-h,-save-restore,-svinval,-svnapot,-svpbmt,-xsfvcp,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-zawrs,-zbkb,-zbkc,-zbkx,-zdinx,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zicbom,-zicbop,-zicboz,-zicntr,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvl1024b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl4096b,-zvl512b,-zvl65536b,-zvl8192b" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(none) }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(read) }
attributes #3 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64d"}
!2 = !{i32 8, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 17.0.0 (https://github.com/llvm/llvm-project.git 8c3a8d17c8a154894895c48a304a04df9ece4328)"}
!4 = !{!5, !6, i64 48}
!5 = !{!"T", !6, i64 0, !6, i64 8, !6, i64 16, !6, i64 24, !6, i64 32, !6, i64 40, !6, i64 48}
!6 = !{!"long", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = distinct !{!9, !10, !11, !12}
!10 = !{!"llvm.loop.mustprogress"}
!11 = !{!"llvm.loop.isvectorized", i32 1}
!12 = !{!"llvm.loop.unroll.runtime.disable"}
!13 = distinct !{!13, !10, !12, !11}
