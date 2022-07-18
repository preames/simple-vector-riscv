; ModuleID = 'sparsevec_init_i32.c'
source_filename = "sparsevec_init_i32.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
target triple = "riscv64"

; Function Attrs: argmemonly nofree norecurse nosync nounwind
define dso_local void @sparsevec_init_i32(i32 noundef signext %len, ptr nocapture noundef writeonly %a, ptr nocapture noundef readonly %aidx) local_unnamed_addr #0 {
entry:
  %cmp6.not = icmp eq i32 %len, 0
  br i1 %cmp6.not, label %for.cond.cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %len to i64
  %min.iters.check = icmp ult i32 %len, 128
  br i1 %min.iters.check, label %for.body.preheader8, label %vector.ph

vector.ph:                                        ; preds = %for.body.preheader
  %n.vec = and i64 %wide.trip.count, 4294967168
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <128 x i32> [ <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63, i32 64, i32 65, i32 66, i32 67, i32 68, i32 69, i32 70, i32 71, i32 72, i32 73, i32 74, i32 75, i32 76, i32 77, i32 78, i32 79, i32 80, i32 81, i32 82, i32 83, i32 84, i32 85, i32 86, i32 87, i32 88, i32 89, i32 90, i32 91, i32 92, i32 93, i32 94, i32 95, i32 96, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 103, i32 104, i32 105, i32 106, i32 107, i32 108, i32 109, i32 110, i32 111, i32 112, i32 113, i32 114, i32 115, i32 116, i32 117, i32 118, i32 119, i32 120, i32 121, i32 122, i32 123, i32 124, i32 125, i32 126, i32 127>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %0 = getelementptr inbounds i16, ptr %aidx, i64 %index
  %wide.load = load <128 x i16>, ptr %0, align 2, !tbaa !4
  %1 = sext <128 x i16> %wide.load to <128 x i64>
  %2 = getelementptr inbounds i32, ptr %a, <128 x i64> %1
  call void @llvm.masked.scatter.v128i32.v128p0(<128 x i32> %vec.ind, <128 x ptr> %2, i32 4, <128 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>), !tbaa !8
  %index.next = add nuw i64 %index, 128
  %vec.ind.next = add <128 x i32> %vec.ind, <i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128, i32 128>
  %3 = icmp eq i64 %index.next, %n.vec
  br i1 %3, label %middle.block, label %vector.body, !llvm.loop !10

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br i1 %cmp.n, label %for.cond.cleanup, label %for.body.preheader8

for.body.preheader8:                              ; preds = %for.body.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %for.body.preheader ], [ %n.vec, %middle.block ]
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %middle.block, %entry
  ret void

for.body:                                         ; preds = %for.body.preheader8, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ %indvars.iv.ph, %for.body.preheader8 ]
  %arrayidx = getelementptr inbounds i16, ptr %aidx, i64 %indvars.iv
  %4 = load i16, ptr %arrayidx, align 2, !tbaa !4
  %idxprom1 = sext i16 %4 to i64
  %arrayidx2 = getelementptr inbounds i32, ptr %a, i64 %idxprom1
  %5 = trunc i64 %indvars.iv to i32
  store i32 %5, ptr %arrayidx2, align 4, !tbaa !8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !llvm.loop !13
}

; Function Attrs: nocallback nofree nosync nounwind willreturn writeonly
declare void @llvm.masked.scatter.v128i32.v128p0(<128 x i32>, <128 x ptr>, i32 immarg, <128 x i1>) #1

attributes #0 = { argmemonly nofree norecurse nosync nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+v,+f,+m,+c,+d,+zba,+zbb,+zbc,+zbs,-save-restore" }
attributes #1 = { nocallback nofree nosync nounwind willreturn writeonly }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 15.0.0 (https://github.com/llvm/llvm-project.git 1e451369d2017830d3dbddec24063170b7aca0de)"}
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
