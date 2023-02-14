; ModuleID = 'vector_overlap_i32.c'
source_filename = "vector_overlap_i32.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64-unknown-unknown"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite) vscale_range(2,1024)
define dso_local void @vector_overlap(ptr noalias nocapture noundef readonly %a, ptr noalias nocapture noundef writeonly %b, i32 noundef signext %N) local_unnamed_addr #0 {
entry:
  %cmp16 = icmp ugt i32 %N, 1
  br i1 %cmp16, label %for.body.preheader, label %for.cond.cleanup

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %N to i64
  %.pre = load i32, ptr %a, align 4, !tbaa !4
  %arrayidx2.phi.trans.insert = getelementptr inbounds i32, ptr %a, i64 1
  %.pre19 = load i32, ptr %arrayidx2.phi.trans.insert, align 4, !tbaa !4
  %0 = add nsw i64 %wide.trip.count, -1
  %1 = tail call i64 @llvm.vscale.i64()
  %2 = shl nuw nsw i64 %1, 2
  %min.iters.check = icmp ult i64 %0, %2
  br i1 %min.iters.check, label %for.body.preheader25, label %vector.ph

vector.ph:                                        ; preds = %for.body.preheader
  %3 = tail call i64 @llvm.vscale.i64()
  %4 = shl nuw nsw i64 %3, 2
  %n.mod.vf = urem i64 %0, %4
  %n.vec = sub nsw i64 %0, %n.mod.vf
  %ind.end = add nsw i64 %n.vec, 1
  %5 = tail call i32 @llvm.vscale.i32()
  %6 = shl nuw nsw i32 %5, 2
  %7 = add nsw i32 %6, -1
  %vector.recur.init = insertelement <vscale x 4 x i32> poison, i32 %.pre19, i32 %7
  %8 = tail call i32 @llvm.vscale.i32()
  %9 = shl nuw nsw i32 %8, 2
  %10 = add nsw i32 %9, -1
  %vector.recur.init20 = insertelement <vscale x 4 x i32> poison, i32 %.pre, i32 %10
  %11 = tail call i64 @llvm.vscale.i64()
  %12 = shl nuw nsw i64 %11, 2
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vector.recur = phi <vscale x 4 x i32> [ %vector.recur.init, %vector.ph ], [ %wide.load, %vector.body ]
  %vector.recur21 = phi <vscale x 4 x i32> [ %vector.recur.init20, %vector.ph ], [ %15, %vector.body ]
  %offset.idx = or i64 %index, 1
  %13 = or i64 %index, 2
  %14 = getelementptr inbounds i32, ptr %a, i64 %13
  %wide.load = load <vscale x 4 x i32>, ptr %14, align 4, !tbaa !4
  %15 = tail call <vscale x 4 x i32> @llvm.experimental.vector.splice.nxv4i32(<vscale x 4 x i32> %vector.recur, <vscale x 4 x i32> %wide.load, i32 -1)
  %16 = tail call <vscale x 4 x i32> @llvm.experimental.vector.splice.nxv4i32(<vscale x 4 x i32> %vector.recur21, <vscale x 4 x i32> %15, i32 -1)
  %17 = add nsw <vscale x 4 x i32> %15, %16
  %18 = add nsw <vscale x 4 x i32> %17, %wide.load
  %19 = getelementptr inbounds i32, ptr %b, i64 %offset.idx
  store <vscale x 4 x i32> %18, ptr %19, align 4, !tbaa !4
  %index.next = add nuw i64 %index, %12
  %20 = icmp eq i64 %index.next, %n.vec
  br i1 %20, label %middle.block, label %vector.body, !llvm.loop !8

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  %21 = tail call i32 @llvm.vscale.i32()
  %22 = shl nuw nsw i32 %21, 2
  %23 = add nsw i32 %22, -1
  %vector.recur.extract = extractelement <vscale x 4 x i32> %wide.load, i32 %23
  %24 = tail call i32 @llvm.vscale.i32()
  %25 = shl nuw nsw i32 %24, 2
  %26 = add nsw i32 %25, -1
  %vector.recur.extract22 = extractelement <vscale x 4 x i32> %15, i32 %26
  br i1 %cmp.n, label %for.cond.cleanup, label %for.body.preheader25

for.body.preheader25:                             ; preds = %for.body.preheader, %middle.block
  %scalar.recur.ph = phi i32 [ %vector.recur.extract, %middle.block ], [ %.pre19, %for.body.preheader ]
  %scalar.recur24.ph = phi i32 [ %vector.recur.extract22, %middle.block ], [ %.pre, %for.body.preheader ]
  %indvars.iv.ph = phi i64 [ %ind.end, %middle.block ], [ 1, %for.body.preheader ]
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %middle.block, %entry
  ret void

for.body:                                         ; preds = %for.body.preheader25, %for.body
  %scalar.recur = phi i32 [ %27, %for.body ], [ %scalar.recur.ph, %for.body.preheader25 ]
  %scalar.recur24 = phi i32 [ %scalar.recur, %for.body ], [ %scalar.recur24.ph, %for.body.preheader25 ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ %indvars.iv.ph, %for.body.preheader25 ]
  %add = add nsw i32 %scalar.recur, %scalar.recur24
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx5 = getelementptr inbounds i32, ptr %a, i64 %indvars.iv.next
  %27 = load i32, ptr %arrayidx5, align 4, !tbaa !4
  %add6 = add nsw i32 %add, %27
  %arrayidx8 = getelementptr inbounds i32, ptr %b, i64 %indvars.iv
  store i32 %add6, ptr %arrayidx8, align 4, !tbaa !4
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !llvm.loop !12
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare i64 @llvm.vscale.i64() #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare i32 @llvm.vscale.i32() #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i32> @llvm.experimental.vector.splice.nxv4i32(<vscale x 4 x i32>, <vscale x 4 x i32>, i32 immarg) #1

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: readwrite) vscale_range(2,1024) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv64" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,+v,+zba,+zbb,+zbc,+zbs,+zicsr,+zifencei,+zve32f,+zve32x,+zve64d,+zve64f,+zve64x,+zvl128b,+zvl32b,+zvl64b,-e,-experimental-smaia,-experimental-ssaia,-experimental-zca,-experimental-zcb,-experimental-zcd,-experimental-zcf,-experimental-zcmp,-experimental-zcmt,-experimental-zfa,-experimental-zicond,-experimental-zihintntl,-experimental-ztso,-experimental-zvbb,-experimental-zvbc,-experimental-zvfh,-experimental-zvkg,-experimental-zvkn,-experimental-zvkned,-experimental-zvkng,-experimental-zvknha,-experimental-zvknhb,-experimental-zvks,-experimental-zvksed,-experimental-zvksg,-experimental-zvksh,-experimental-zvkt,-h,-save-restore,-svinval,-svnapot,-svpbmt,-xsfvcp,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-zawrs,-zbkb,-zbkc,-zbkx,-zdinx,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zicbom,-zicbop,-zicboz,-zicntr,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvl1024b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl4096b,-zvl512b,-zvl65536b,-zvl8192b" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(none) }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64d"}
!2 = !{i32 8, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 17.0.0 (https://github.com/llvm/llvm-project.git 8c3a8d17c8a154894895c48a304a04df9ece4328)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = distinct !{!8, !9, !10, !11}
!9 = !{!"llvm.loop.mustprogress"}
!10 = !{!"llvm.loop.isvectorized", i32 1}
!11 = !{!"llvm.loop.unroll.runtime.disable"}
!12 = distinct !{!12, !9, !11, !10}
