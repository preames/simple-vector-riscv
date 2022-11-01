; ModuleID = 'sparsevec_reduce_add_i32.c'
source_filename = "sparsevec_reduce_add_i32.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64-unknown-unknown"

; Function Attrs: argmemonly nofree norecurse nosync nounwind readonly vscale_range(16,1024)
define dso_local signext i32 @sparsevec_reduce_add_i32(i32 noundef signext %len, ptr nocapture noundef readonly %a, ptr nocapture noundef readonly %aidx) local_unnamed_addr #0 {
entry:
  %cmp6.not = icmp eq i32 %len, 0
  br i1 %cmp6.not, label %for.cond.cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %len to i64
  %0 = tail call i64 @llvm.vscale.i64()
  %1 = shl nuw nsw i64 %0, 2
  %min.iters.check = icmp ugt i64 %1, %wide.trip.count
  br i1 %min.iters.check, label %for.body.preheader12, label %vector.ph

vector.ph:                                        ; preds = %for.body.preheader
  %2 = tail call i64 @llvm.vscale.i64()
  %3 = shl nuw nsw i64 %2, 2
  %n.mod.vf = urem i64 %wide.trip.count, %3
  %n.vec = sub nuw nsw i64 %wide.trip.count, %n.mod.vf
  %4 = tail call i32 @llvm.vscale.i32()
  %5 = shl nuw nsw i32 %4, 1
  %6 = zext i32 %5 to i64
  %7 = tail call i64 @llvm.vscale.i64()
  %8 = shl nuw nsw i64 %7, 2
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.phi = phi <vscale x 2 x i32> [ zeroinitializer, %vector.ph ], [ %15, %vector.body ]
  %vec.phi9 = phi <vscale x 2 x i32> [ zeroinitializer, %vector.ph ], [ %16, %vector.body ]
  %9 = getelementptr inbounds i16, ptr %aidx, i64 %index
  %wide.load = load <vscale x 2 x i16>, ptr %9, align 2, !tbaa !4
  %10 = getelementptr inbounds i16, ptr %9, i64 %6
  %wide.load10 = load <vscale x 2 x i16>, ptr %10, align 2, !tbaa !4
  %11 = sext <vscale x 2 x i16> %wide.load to <vscale x 2 x i64>
  %12 = sext <vscale x 2 x i16> %wide.load10 to <vscale x 2 x i64>
  %13 = getelementptr inbounds i32, ptr %a, <vscale x 2 x i64> %11
  %14 = getelementptr inbounds i32, ptr %a, <vscale x 2 x i64> %12
  %wide.masked.gather = tail call <vscale x 2 x i32> @llvm.masked.gather.nxv2i32.nxv2p0(<vscale x 2 x ptr> %13, i32 4, <vscale x 2 x i1> shufflevector (<vscale x 2 x i1> insertelement (<vscale x 2 x i1> poison, i1 true, i32 0), <vscale x 2 x i1> poison, <vscale x 2 x i32> zeroinitializer), <vscale x 2 x i32> poison), !tbaa !8
  %wide.masked.gather11 = tail call <vscale x 2 x i32> @llvm.masked.gather.nxv2i32.nxv2p0(<vscale x 2 x ptr> %14, i32 4, <vscale x 2 x i1> shufflevector (<vscale x 2 x i1> insertelement (<vscale x 2 x i1> poison, i1 true, i32 0), <vscale x 2 x i1> poison, <vscale x 2 x i32> zeroinitializer), <vscale x 2 x i32> poison), !tbaa !8
  %15 = add <vscale x 2 x i32> %wide.masked.gather, %vec.phi
  %16 = add <vscale x 2 x i32> %wide.masked.gather11, %vec.phi9
  %index.next = add nuw i64 %index, %8
  %17 = icmp eq i64 %index.next, %n.vec
  br i1 %17, label %middle.block, label %vector.body, !llvm.loop !10

middle.block:                                     ; preds = %vector.body
  %bin.rdx = add <vscale x 2 x i32> %16, %15
  %18 = tail call i32 @llvm.vector.reduce.add.nxv2i32(<vscale x 2 x i32> %bin.rdx)
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.cond.cleanup, label %for.body.preheader12

for.body.preheader12:                             ; preds = %for.body.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %for.body.preheader ], [ %n.vec, %middle.block ]
  %res.07.ph = phi i32 [ 0, %for.body.preheader ], [ %18, %middle.block ]
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %middle.block, %entry
  %res.0.lcssa = phi i32 [ 0, %entry ], [ %18, %middle.block ], [ %add, %for.body ]
  ret i32 %res.0.lcssa

for.body:                                         ; preds = %for.body.preheader12, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ %indvars.iv.ph, %for.body.preheader12 ]
  %res.07 = phi i32 [ %add, %for.body ], [ %res.07.ph, %for.body.preheader12 ]
  %arrayidx = getelementptr inbounds i16, ptr %aidx, i64 %indvars.iv
  %19 = load i16, ptr %arrayidx, align 2, !tbaa !4
  %idxprom1 = sext i16 %19 to i64
  %arrayidx2 = getelementptr inbounds i32, ptr %a, i64 %idxprom1
  %20 = load i32, ptr %arrayidx2, align 4, !tbaa !8
  %add = add nsw i32 %20, %res.07
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !llvm.loop !13
}

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i64 @llvm.vscale.i64() #1

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i32 @llvm.vscale.i32() #1

; Function Attrs: nocallback nofree nosync nounwind readonly willreturn
declare <vscale x 2 x i32> @llvm.masked.gather.nxv2i32.nxv2p0(<vscale x 2 x ptr>, i32 immarg, <vscale x 2 x i1>, <vscale x 2 x i32>) #2

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i32 @llvm.vector.reduce.add.nxv2i32(<vscale x 2 x i32>) #1

attributes #0 = { argmemonly nofree norecurse nosync nounwind readonly vscale_range(16,1024) "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,+v,+zba,+zbb,+zbc,+zbs,+zve32f,+zve32x,+zve64d,+zve64f,+zve64x,+zvl1024b,+zvl128b,+zvl256b,+zvl32b,+zvl512b,+zvl64b,-save-restore" }
attributes #1 = { nocallback nofree nosync nounwind readnone willreturn }
attributes #2 = { nocallback nofree nosync nounwind readonly willreturn }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64d"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 9472a810ed33bc9e655484f43047eed07d50bc16)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"short", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!9, !9, i64 0}
!9 = !{!"int", !6, i64 0}
!10 = distinct !{!10, !11, !12}
!11 = !{!"llvm.loop.mustprogress"}
!12 = !{!"llvm.loop.isvectorized", i32 1}
!13 = distinct !{!13, !11, !14, !12}
!14 = !{!"llvm.loop.unroll.runtime.disable"}
