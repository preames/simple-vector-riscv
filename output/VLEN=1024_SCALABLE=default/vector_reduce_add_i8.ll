; ModuleID = 'vector_reduce_add_i8.c'
source_filename = "vector_reduce_add_i8.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64-unknown-unknown"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: read) vscale_range(2,1024)
define dso_local signext i32 @vector_reduce_add_i32(ptr nocapture noundef readonly %a, i32 noundef signext %a_len) local_unnamed_addr #0 {
entry:
  %cmp4.not = icmp eq i32 %a_len, 0
  br i1 %cmp4.not, label %for.cond.cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %a_len to i64
  %0 = tail call i64 @llvm.vscale.i64()
  %1 = shl nuw nsw i64 %0, 2
  %min.iters.check = icmp ugt i64 %1, %wide.trip.count
  br i1 %min.iters.check, label %for.body.preheader7, label %vector.ph

vector.ph:                                        ; preds = %for.body.preheader
  %2 = tail call i64 @llvm.vscale.i64()
  %3 = shl nuw nsw i64 %2, 2
  %n.mod.vf = urem i64 %wide.trip.count, %3
  %n.vec = sub nuw nsw i64 %wide.trip.count, %n.mod.vf
  %4 = tail call i64 @llvm.vscale.i64()
  %5 = shl nuw nsw i64 %4, 2
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.phi = phi <vscale x 4 x i32> [ zeroinitializer, %vector.ph ], [ %8, %vector.body ]
  %6 = getelementptr inbounds i8, ptr %a, i64 %index
  %wide.load = load <vscale x 4 x i8>, ptr %6, align 1, !tbaa !4
  %7 = zext <vscale x 4 x i8> %wide.load to <vscale x 4 x i32>
  %8 = add <vscale x 4 x i32> %vec.phi, %7
  %index.next = add nuw i64 %index, %5
  %9 = icmp eq i64 %index.next, %n.vec
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !7

middle.block:                                     ; preds = %vector.body
  %10 = tail call i32 @llvm.vector.reduce.add.nxv4i32(<vscale x 4 x i32> %8)
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.cond.cleanup, label %for.body.preheader7

for.body.preheader7:                              ; preds = %for.body.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %for.body.preheader ], [ %n.vec, %middle.block ]
  %sum.05.ph = phi i32 [ 0, %for.body.preheader ], [ %10, %middle.block ]
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %middle.block, %entry
  %sum.0.lcssa = phi i32 [ 0, %entry ], [ %10, %middle.block ], [ %add, %for.body ]
  ret i32 %sum.0.lcssa

for.body:                                         ; preds = %for.body.preheader7, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ %indvars.iv.ph, %for.body.preheader7 ]
  %sum.05 = phi i32 [ %add, %for.body ], [ %sum.05.ph, %for.body.preheader7 ]
  %arrayidx = getelementptr inbounds i8, ptr %a, i64 %indvars.iv
  %11 = load i8, ptr %arrayidx, align 1, !tbaa !4
  %conv = zext i8 %11 to i32
  %add = add nuw nsw i32 %sum.05, %conv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !llvm.loop !11
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare i64 @llvm.vscale.i64() #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.add.nxv4i32(<vscale x 4 x i32>) #2

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: read) vscale_range(2,1024) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv64" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,+v,+zba,+zbb,+zbc,+zbs,+zicsr,+zifencei,+zve32f,+zve32x,+zve64d,+zve64f,+zve64x,+zvl128b,+zvl32b,+zvl64b,-e,-experimental-smaia,-experimental-ssaia,-experimental-zca,-experimental-zcb,-experimental-zcd,-experimental-zcf,-experimental-zcmp,-experimental-zcmt,-experimental-zfa,-experimental-zicond,-experimental-zihintntl,-experimental-ztso,-experimental-zvbb,-experimental-zvbc,-experimental-zvfh,-experimental-zvkg,-experimental-zvkn,-experimental-zvkned,-experimental-zvkng,-experimental-zvknha,-experimental-zvknhb,-experimental-zvks,-experimental-zvksed,-experimental-zvksg,-experimental-zvksh,-experimental-zvkt,-h,-save-restore,-svinval,-svnapot,-svpbmt,-xsfvcp,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-zawrs,-zbkb,-zbkc,-zbkx,-zdinx,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zicbom,-zicbop,-zicboz,-zicntr,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvl1024b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl4096b,-zvl512b,-zvl65536b,-zvl8192b" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(none) }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64d"}
!2 = !{i32 8, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 17.0.0 (https://github.com/llvm/llvm-project.git 8c3a8d17c8a154894895c48a304a04df9ece4328)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = distinct !{!7, !8, !9, !10}
!8 = !{!"llvm.loop.mustprogress"}
!9 = !{!"llvm.loop.isvectorized", i32 1}
!10 = !{!"llvm.loop.unroll.runtime.disable"}
!11 = distinct !{!11, !8, !10, !9}
