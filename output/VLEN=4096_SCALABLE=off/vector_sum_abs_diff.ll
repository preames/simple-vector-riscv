; ModuleID = 'vector_sum_abs_diff.c'
source_filename = "vector_sum_abs_diff.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64-unknown-unknown"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) vscale_range(2,1024)
define dso_local signext i8 @sub(i8 noundef signext %a, i8 noundef signext %b) local_unnamed_addr #0 {
entry:
  %sub = sub i8 %a, %b
  ret i8 %sub
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none) vscale_range(2,1024)
define dso_local signext i8 @myabs(i8 noundef signext %c) local_unnamed_addr #1 {
entry:
  %spec.select = tail call i8 @llvm.abs.i8(i8 %c, i1 false)
  ret i8 %spec.select
}

; Function Attrs: nofree nosync nounwind memory(argmem: readwrite) vscale_range(2,1024)
define dso_local void @vector_sum_abs_diff(ptr nocapture noundef writeonly %c, ptr nocapture noundef readonly %a, ptr nocapture noundef readonly %b, i32 noundef signext %N) local_unnamed_addr #2 {
entry:
  %cmp26.not = icmp ult i32 %N, 8
  br i1 %cmp26.not, label %for.cond.cleanup, label %for.cond1.preheader.preheader

for.cond1.preheader.preheader:                    ; preds = %entry
  %div23 = lshr i32 %N, 3
  %wide.trip.count = zext i32 %div23 to i64
  %min.iters.check = icmp ult i32 %N, 64
  br i1 %min.iters.check, label %for.cond1.preheader.preheader51, label %vector.memcheck

vector.memcheck:                                  ; preds = %for.cond1.preheader.preheader
  %0 = shl nuw nsw i64 %wide.trip.count, 2
  %scevgep = getelementptr i8, ptr %c, i64 %0
  %1 = shl nuw nsw i64 %wide.trip.count, 3
  %scevgep30 = getelementptr i8, ptr %a, i64 %1
  %scevgep31 = getelementptr i8, ptr %b, i64 %1
  %bound0 = icmp ugt ptr %scevgep30, %c
  %bound1 = icmp ugt ptr %scevgep, %a
  %found.conflict = and i1 %bound0, %bound1
  %bound032 = icmp ugt ptr %scevgep31, %c
  %bound133 = icmp ugt ptr %scevgep, %b
  %found.conflict34 = and i1 %bound032, %bound133
  %conflict.rdx = or i1 %found.conflict, %found.conflict34
  br i1 %conflict.rdx, label %for.cond1.preheader.preheader51, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %n.vec = and i64 %wide.trip.count, 536870904
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %2 = shl nuw i64 %index, 3
  %3 = getelementptr inbounds i8, ptr %a, i64 %2
  %wide.vec = load <64 x i8>, ptr %3, align 1, !tbaa !4
  %4 = getelementptr inbounds i8, ptr %b, i64 %2
  %wide.vec42 = load <64 x i8>, ptr %4, align 1, !tbaa !4
  %5 = sub <64 x i8> %wide.vec, %wide.vec42
  %6 = shufflevector <64 x i8> %5, <64 x i8> poison, <8 x i32> <i32 0, i32 8, i32 16, i32 24, i32 32, i32 40, i32 48, i32 56>
  %7 = tail call <8 x i8> @llvm.abs.v8i8(<8 x i8> %6, i1 false)
  %8 = sext <8 x i8> %7 to <8 x i32>
  %9 = sub <64 x i8> %wide.vec, %wide.vec42
  %10 = shufflevector <64 x i8> %9, <64 x i8> poison, <8 x i32> <i32 1, i32 9, i32 17, i32 25, i32 33, i32 41, i32 49, i32 57>
  %11 = tail call <8 x i8> @llvm.abs.v8i8(<8 x i8> %10, i1 false)
  %12 = sext <8 x i8> %11 to <8 x i32>
  %13 = add nsw <8 x i32> %8, %12
  %14 = sub <64 x i8> %wide.vec, %wide.vec42
  %15 = shufflevector <64 x i8> %14, <64 x i8> poison, <8 x i32> <i32 2, i32 10, i32 18, i32 26, i32 34, i32 42, i32 50, i32 58>
  %16 = tail call <8 x i8> @llvm.abs.v8i8(<8 x i8> %15, i1 false)
  %17 = sext <8 x i8> %16 to <8 x i32>
  %18 = add nsw <8 x i32> %13, %17
  %19 = sub <64 x i8> %wide.vec, %wide.vec42
  %20 = shufflevector <64 x i8> %19, <64 x i8> poison, <8 x i32> <i32 3, i32 11, i32 19, i32 27, i32 35, i32 43, i32 51, i32 59>
  %21 = tail call <8 x i8> @llvm.abs.v8i8(<8 x i8> %20, i1 false)
  %22 = sext <8 x i8> %21 to <8 x i32>
  %23 = add nsw <8 x i32> %18, %22
  %24 = sub <64 x i8> %wide.vec, %wide.vec42
  %25 = shufflevector <64 x i8> %24, <64 x i8> poison, <8 x i32> <i32 4, i32 12, i32 20, i32 28, i32 36, i32 44, i32 52, i32 60>
  %26 = tail call <8 x i8> @llvm.abs.v8i8(<8 x i8> %25, i1 false)
  %27 = sext <8 x i8> %26 to <8 x i32>
  %28 = add nsw <8 x i32> %23, %27
  %29 = sub <64 x i8> %wide.vec, %wide.vec42
  %30 = shufflevector <64 x i8> %29, <64 x i8> poison, <8 x i32> <i32 5, i32 13, i32 21, i32 29, i32 37, i32 45, i32 53, i32 61>
  %31 = tail call <8 x i8> @llvm.abs.v8i8(<8 x i8> %30, i1 false)
  %32 = sext <8 x i8> %31 to <8 x i32>
  %33 = add nsw <8 x i32> %28, %32
  %34 = sub <64 x i8> %wide.vec, %wide.vec42
  %35 = shufflevector <64 x i8> %34, <64 x i8> poison, <8 x i32> <i32 6, i32 14, i32 22, i32 30, i32 38, i32 46, i32 54, i32 62>
  %36 = tail call <8 x i8> @llvm.abs.v8i8(<8 x i8> %35, i1 false)
  %37 = sext <8 x i8> %36 to <8 x i32>
  %38 = add nsw <8 x i32> %33, %37
  %39 = sub <64 x i8> %wide.vec, %wide.vec42
  %40 = shufflevector <64 x i8> %39, <64 x i8> poison, <8 x i32> <i32 7, i32 15, i32 23, i32 31, i32 39, i32 47, i32 55, i32 63>
  %41 = tail call <8 x i8> @llvm.abs.v8i8(<8 x i8> %40, i1 false)
  %42 = sext <8 x i8> %41 to <8 x i32>
  %43 = add nsw <8 x i32> %38, %42
  %44 = getelementptr inbounds i32, ptr %c, i64 %index
  store <8 x i32> %43, ptr %44, align 4, !tbaa !7, !alias.scope !9, !noalias !12
  %index.next = add nuw i64 %index, 8
  %45 = icmp eq i64 %index.next, %n.vec
  br i1 %45, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br i1 %cmp.n, label %for.cond.cleanup, label %for.cond1.preheader.preheader51

for.cond1.preheader.preheader51:                  ; preds = %vector.memcheck, %for.cond1.preheader.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %for.cond1.preheader.preheader ], [ %n.vec, %middle.block ]
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.preheader51, %for.cond1.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.cond1.preheader ], [ %indvars.iv.ph, %for.cond1.preheader.preheader51 ]
  %46 = shl nuw i64 %indvars.iv, 3
  %arrayidx = getelementptr inbounds i8, ptr %a, i64 %46
  %arrayidx6 = getelementptr inbounds i8, ptr %b, i64 %46
  %47 = load <8 x i8>, ptr %arrayidx, align 1, !tbaa !4
  %48 = load <8 x i8>, ptr %arrayidx6, align 1, !tbaa !4
  %49 = sub <8 x i8> %47, %48
  %50 = tail call <8 x i8> @llvm.abs.v8i8(<8 x i8> %49, i1 false)
  %51 = sext <8 x i8> %50 to <8 x i32>
  %52 = tail call i32 @llvm.vector.reduce.add.v8i32(<8 x i32> %51)
  %arrayidx12 = getelementptr inbounds i32, ptr %c, i64 %indvars.iv
  store i32 %52, ptr %arrayidx12, align 4, !tbaa !7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.cond1.preheader, !llvm.loop !19

for.cond.cleanup:                                 ; preds = %for.cond1.preheader, %middle.block, %entry
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.abs.i8(i8, i1 immarg) #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i8> @llvm.abs.v8i8(<8 x i8>, i1 immarg) #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.add.v8i32(<8 x i32>) #3

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) vscale_range(2,1024) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv64" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,+v,+zba,+zbb,+zbc,+zbs,+zicsr,+zifencei,+zve32f,+zve32x,+zve64d,+zve64f,+zve64x,+zvl128b,+zvl32b,+zvl64b,-e,-experimental-smaia,-experimental-ssaia,-experimental-zca,-experimental-zcb,-experimental-zcd,-experimental-zcf,-experimental-zcmp,-experimental-zcmt,-experimental-zfa,-experimental-zicond,-experimental-zihintntl,-experimental-ztso,-experimental-zvbb,-experimental-zvbc,-experimental-zvfh,-experimental-zvkg,-experimental-zvkn,-experimental-zvkned,-experimental-zvkng,-experimental-zvknha,-experimental-zvknhb,-experimental-zvks,-experimental-zvksed,-experimental-zvksg,-experimental-zvksh,-experimental-zvkt,-h,-save-restore,-svinval,-svnapot,-svpbmt,-xsfvcp,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-zawrs,-zbkb,-zbkc,-zbkx,-zdinx,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zicbom,-zicbop,-zicboz,-zicntr,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvl1024b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl4096b,-zvl512b,-zvl65536b,-zvl8192b" }
attributes #1 = { mustprogress nofree nosync nounwind willreturn memory(none) vscale_range(2,1024) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv64" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,+v,+zba,+zbb,+zbc,+zbs,+zicsr,+zifencei,+zve32f,+zve32x,+zve64d,+zve64f,+zve64x,+zvl128b,+zvl32b,+zvl64b,-e,-experimental-smaia,-experimental-ssaia,-experimental-zca,-experimental-zcb,-experimental-zcd,-experimental-zcf,-experimental-zcmp,-experimental-zcmt,-experimental-zfa,-experimental-zicond,-experimental-zihintntl,-experimental-ztso,-experimental-zvbb,-experimental-zvbc,-experimental-zvfh,-experimental-zvkg,-experimental-zvkn,-experimental-zvkned,-experimental-zvkng,-experimental-zvknha,-experimental-zvknhb,-experimental-zvks,-experimental-zvksed,-experimental-zvksg,-experimental-zvksh,-experimental-zvkt,-h,-save-restore,-svinval,-svnapot,-svpbmt,-xsfvcp,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-zawrs,-zbkb,-zbkc,-zbkx,-zdinx,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zicbom,-zicbop,-zicboz,-zicntr,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvl1024b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl4096b,-zvl512b,-zvl65536b,-zvl8192b" }
attributes #2 = { nofree nosync nounwind memory(argmem: readwrite) vscale_range(2,1024) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv64" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,+v,+zba,+zbb,+zbc,+zbs,+zicsr,+zifencei,+zve32f,+zve32x,+zve64d,+zve64f,+zve64x,+zvl128b,+zvl32b,+zvl64b,-e,-experimental-smaia,-experimental-ssaia,-experimental-zca,-experimental-zcb,-experimental-zcd,-experimental-zcf,-experimental-zcmp,-experimental-zcmt,-experimental-zfa,-experimental-zicond,-experimental-zihintntl,-experimental-ztso,-experimental-zvbb,-experimental-zvbc,-experimental-zvfh,-experimental-zvkg,-experimental-zvkn,-experimental-zvkned,-experimental-zvkng,-experimental-zvknha,-experimental-zvknhb,-experimental-zvks,-experimental-zvksed,-experimental-zvksg,-experimental-zvksh,-experimental-zvkt,-h,-save-restore,-svinval,-svnapot,-svpbmt,-xsfvcp,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-zawrs,-zbkb,-zbkc,-zbkx,-zdinx,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zicbom,-zicbop,-zicboz,-zicntr,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvl1024b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl4096b,-zvl512b,-zvl65536b,-zvl8192b" }
attributes #3 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64d"}
!2 = !{i32 8, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 17.0.0 (https://github.com/llvm/llvm-project.git 8c3a8d17c8a154894895c48a304a04df9ece4328)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !5, i64 0}
!9 = !{!10}
!10 = distinct !{!10, !11}
!11 = distinct !{!11, !"LVerDomain"}
!12 = !{!13, !14}
!13 = distinct !{!13, !11}
!14 = distinct !{!14, !11}
!15 = distinct !{!15, !16, !17, !18}
!16 = !{!"llvm.loop.mustprogress"}
!17 = !{!"llvm.loop.isvectorized", i32 1}
!18 = !{!"llvm.loop.unroll.runtime.disable"}
!19 = distinct !{!19, !16, !17}
