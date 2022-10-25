; ModuleID = 'aos_reduce_sum_i32.c'
source_filename = "aos_reduce_sum_i32.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
target triple = "riscv64-unknown-unknown"

%struct.T = type { i64, i64, i64, i64, i64, i64, i32, i32 }

; Function Attrs: argmemonly nofree norecurse nosync nounwind readonly vscale_range(64,1024)
define dso_local signext i32 @aos_reduce_sum_i32(i32 noundef signext %len, ptr nocapture noundef readonly %a) local_unnamed_addr #0 {
entry:
  %cmp4.not = icmp eq i32 %len, 0
  br i1 %cmp4.not, label %for.cond.cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %len to i64
  %min.iters.check = icmp ult i32 %len, 256
  br i1 %min.iters.check, label %for.body.preheader10, label %vector.ph

vector.ph:                                        ; preds = %for.body.preheader
  %n.vec = and i64 %wide.trip.count, 4294967040
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <128 x i64> [ <i64 0, i64 1, i64 2, i64 3, i64 4, i64 5, i64 6, i64 7, i64 8, i64 9, i64 10, i64 11, i64 12, i64 13, i64 14, i64 15, i64 16, i64 17, i64 18, i64 19, i64 20, i64 21, i64 22, i64 23, i64 24, i64 25, i64 26, i64 27, i64 28, i64 29, i64 30, i64 31, i64 32, i64 33, i64 34, i64 35, i64 36, i64 37, i64 38, i64 39, i64 40, i64 41, i64 42, i64 43, i64 44, i64 45, i64 46, i64 47, i64 48, i64 49, i64 50, i64 51, i64 52, i64 53, i64 54, i64 55, i64 56, i64 57, i64 58, i64 59, i64 60, i64 61, i64 62, i64 63, i64 64, i64 65, i64 66, i64 67, i64 68, i64 69, i64 70, i64 71, i64 72, i64 73, i64 74, i64 75, i64 76, i64 77, i64 78, i64 79, i64 80, i64 81, i64 82, i64 83, i64 84, i64 85, i64 86, i64 87, i64 88, i64 89, i64 90, i64 91, i64 92, i64 93, i64 94, i64 95, i64 96, i64 97, i64 98, i64 99, i64 100, i64 101, i64 102, i64 103, i64 104, i64 105, i64 106, i64 107, i64 108, i64 109, i64 110, i64 111, i64 112, i64 113, i64 114, i64 115, i64 116, i64 117, i64 118, i64 119, i64 120, i64 121, i64 122, i64 123, i64 124, i64 125, i64 126, i64 127>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %vec.phi = phi <128 x i32> [ zeroinitializer, %vector.ph ], [ %2, %vector.body ]
  %vec.phi8 = phi <128 x i32> [ zeroinitializer, %vector.ph ], [ %3, %vector.body ]
  %step.add = add <128 x i64> %vec.ind, <i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128>
  %0 = getelementptr inbounds %struct.T, ptr %a, <128 x i64> %vec.ind, i32 6
  %1 = getelementptr inbounds %struct.T, ptr %a, <128 x i64> %step.add, i32 6
  %wide.masked.gather = tail call <128 x i32> @llvm.masked.gather.v128i32.v128p0(<128 x ptr> %0, i32 8, <128 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>, <128 x i32> poison), !tbaa !4
  %wide.masked.gather9 = tail call <128 x i32> @llvm.masked.gather.v128i32.v128p0(<128 x ptr> %1, i32 8, <128 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>, <128 x i32> poison), !tbaa !4
  %2 = add <128 x i32> %wide.masked.gather, %vec.phi
  %3 = add <128 x i32> %wide.masked.gather9, %vec.phi8
  %index.next = add nuw i64 %index, 256
  %vec.ind.next = add <128 x i64> %vec.ind, <i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256, i64 256>
  %4 = icmp eq i64 %index.next, %n.vec
  br i1 %4, label %middle.block, label %vector.body, !llvm.loop !10

middle.block:                                     ; preds = %vector.body
  %bin.rdx = add <128 x i32> %3, %2
  %5 = tail call i32 @llvm.vector.reduce.add.v128i32(<128 x i32> %bin.rdx)
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br i1 %cmp.n, label %for.cond.cleanup, label %for.body.preheader10

for.body.preheader10:                             ; preds = %for.body.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %for.body.preheader ], [ %n.vec, %middle.block ]
  %sum.05.ph = phi i32 [ 0, %for.body.preheader ], [ %5, %middle.block ]
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %middle.block, %entry
  %sum.0.lcssa = phi i32 [ 0, %entry ], [ %5, %middle.block ], [ %add, %for.body ]
  ret i32 %sum.0.lcssa

for.body:                                         ; preds = %for.body.preheader10, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ %indvars.iv.ph, %for.body.preheader10 ]
  %sum.05 = phi i32 [ %add, %for.body ], [ %sum.05.ph, %for.body.preheader10 ]
  %g = getelementptr inbounds %struct.T, ptr %a, i64 %indvars.iv, i32 6
  %6 = load i32, ptr %g, align 8, !tbaa !4
  %add = add nsw i32 %6, %sum.05
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !llvm.loop !13
}

; Function Attrs: nocallback nofree nosync nounwind readonly willreturn
declare <128 x i32> @llvm.masked.gather.v128i32.v128p0(<128 x ptr>, i32 immarg, <128 x i1>, <128 x i32>) #1

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i32 @llvm.vector.reduce.add.v128i32(<128 x i32>) #2

attributes #0 = { argmemonly nofree norecurse nosync nounwind readonly vscale_range(64,1024) "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,+v,+zba,+zbb,+zbc,+zbs,+zve32f,+zve32x,+zve64d,+zve64f,+zve64x,+zvl1024b,+zvl128b,+zvl2048b,+zvl256b,+zvl32b,+zvl4096b,+zvl512b,+zvl64b,-save-restore" }
attributes #1 = { nocallback nofree nosync nounwind readonly willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone willreturn }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64d"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 6d859266803e2a9060c4e8770f92cc2c7bd05a3b)"}
!4 = !{!5, !9, i64 48}
!5 = !{!"T", !6, i64 0, !6, i64 8, !6, i64 16, !6, i64 24, !6, i64 32, !6, i64 40, !9, i64 48, !9, i64 52}
!6 = !{!"long", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = distinct !{!10, !11, !12}
!11 = !{!"llvm.loop.mustprogress"}
!12 = !{!"llvm.loop.isvectorized", i32 1}
!13 = distinct !{!13, !11, !14, !12}
!14 = !{!"llvm.loop.unroll.runtime.disable"}
