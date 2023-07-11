; ModuleID = 'vector_addw_i32_i64.c'
source_filename = "vector_addw_i32_i64.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64-unknown-unknown"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite) vscale_range(2,1024)
define dso_local void @test(ptr nocapture noundef %c, ptr nocapture noundef readonly %a, ptr nocapture noundef readonly %b, i32 noundef signext %len) local_unnamed_addr #0 {
entry:
  %cmp11 = icmp sgt i32 %len, 0
  br i1 %cmp11, label %for.body.preheader, label %for.cond.cleanup

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %len to i64
  %min.iters.check = icmp ult i32 %len, 8
  br i1 %min.iters.check, label %for.body.preheader18, label %vector.ph

vector.ph:                                        ; preds = %for.body.preheader
  %n.vec = and i64 %wide.trip.count, 4294967288
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %0 = getelementptr inbounds i32, ptr %a, i64 %index
  %wide.load = load <4 x i32>, ptr %0, align 4, !tbaa !4
  %1 = getelementptr inbounds i32, ptr %0, i64 4
  %wide.load13 = load <4 x i32>, ptr %1, align 4, !tbaa !4
  %2 = sext <4 x i32> %wide.load to <4 x i64>
  %3 = sext <4 x i32> %wide.load13 to <4 x i64>
  %4 = getelementptr inbounds i32, ptr %b, i64 %index
  %wide.load14 = load <4 x i32>, ptr %4, align 4, !tbaa !4
  %5 = getelementptr inbounds i32, ptr %4, i64 4
  %wide.load15 = load <4 x i32>, ptr %5, align 4, !tbaa !4
  %6 = sext <4 x i32> %wide.load14 to <4 x i64>
  %7 = sext <4 x i32> %wide.load15 to <4 x i64>
  %8 = add nsw <4 x i64> %6, %2
  %9 = add nsw <4 x i64> %7, %3
  %10 = getelementptr inbounds i64, ptr %c, i64 %index
  %wide.load16 = load <4 x i64>, ptr %10, align 8, !tbaa !8
  %11 = getelementptr inbounds i64, ptr %10, i64 4
  %wide.load17 = load <4 x i64>, ptr %11, align 8, !tbaa !8
  %12 = add nsw <4 x i64> %8, %wide.load16
  %13 = add nsw <4 x i64> %9, %wide.load17
  store <4 x i64> %12, ptr %10, align 8, !tbaa !8
  store <4 x i64> %13, ptr %11, align 8, !tbaa !8
  %index.next = add nuw i64 %index, 8
  %14 = icmp eq i64 %index.next, %n.vec
  br i1 %14, label %middle.block, label %vector.body, !llvm.loop !10

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br i1 %cmp.n, label %for.cond.cleanup, label %for.body.preheader18

for.body.preheader18:                             ; preds = %for.body.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %for.body.preheader ], [ %n.vec, %middle.block ]
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %middle.block, %entry
  ret void

for.body:                                         ; preds = %for.body.preheader18, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ %indvars.iv.ph, %for.body.preheader18 ]
  %arrayidx = getelementptr inbounds i32, ptr %a, i64 %indvars.iv
  %15 = load i32, ptr %arrayidx, align 4, !tbaa !4
  %conv = sext i32 %15 to i64
  %arrayidx2 = getelementptr inbounds i32, ptr %b, i64 %indvars.iv
  %16 = load i32, ptr %arrayidx2, align 4, !tbaa !4
  %conv3 = sext i32 %16 to i64
  %add = add nsw i64 %conv3, %conv
  %arrayidx5 = getelementptr inbounds i64, ptr %c, i64 %indvars.iv
  %17 = load i64, ptr %arrayidx5, align 8, !tbaa !8
  %add6 = add nsw i64 %add, %17
  store i64 %add6, ptr %arrayidx5, align 8, !tbaa !8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !llvm.loop !14
}

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: readwrite) vscale_range(2,1024) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv64" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,+v,+zba,+zbb,+zbc,+zbs,+zicsr,+zifencei,+zve32f,+zve32x,+zve64d,+zve64f,+zve64x,+zvl128b,+zvl32b,+zvl64b,-e,-experimental-smaia,-experimental-ssaia,-experimental-zacas,-experimental-zfa,-experimental-zfbfmin,-experimental-zicond,-experimental-zihintntl,-experimental-ztso,-experimental-zvbb,-experimental-zvbc,-experimental-zvfbfmin,-experimental-zvfbfwma,-experimental-zvfh,-experimental-zvkg,-experimental-zvkn,-experimental-zvknc,-experimental-zvkned,-experimental-zvkng,-experimental-zvknha,-experimental-zvknhb,-experimental-zvks,-experimental-zvksc,-experimental-zvksed,-experimental-zvksg,-experimental-zvksh,-experimental-zvkt,-h,-save-restore,-svinval,-svnapot,-svpbmt,-xsfcie,-xsfvcp,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-zawrs,-zbkb,-zbkc,-zbkx,-zca,-zcb,-zcd,-zcf,-zcmp,-zcmt,-zdinx,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zicbom,-zicbop,-zicboz,-zicntr,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvl1024b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl4096b,-zvl512b,-zvl65536b,-zvl8192b" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64d"}
!2 = !{i32 8, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 17.0.0 (https://github.com/llvm/llvm-project.git e2d7d988115c1b67b0175be5d6bc95153945b5be)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!9, !9, i64 0}
!9 = !{!"long", !6, i64 0}
!10 = distinct !{!10, !11, !12, !13}
!11 = !{!"llvm.loop.mustprogress"}
!12 = !{!"llvm.loop.isvectorized", i32 1}
!13 = !{!"llvm.loop.unroll.runtime.disable"}
!14 = distinct !{!14, !11, !13, !12}
