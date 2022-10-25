; ModuleID = 'sparsevec_reduce_add_i32.c'
source_filename = "sparsevec_reduce_add_i32.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
target triple = "riscv64"

; Function Attrs: argmemonly nofree norecurse nosync nounwind readonly
define dso_local signext i32 @sparsevec_reduce_add_i32(i32 noundef signext %len, ptr nocapture noundef readonly %a, ptr nocapture noundef readonly %aidx) local_unnamed_addr #0 {
entry:
  %cmp6.not = icmp eq i32 %len, 0
  br i1 %cmp6.not, label %for.cond.cleanup, label %iter.check

iter.check:                                       ; preds = %entry
  %wide.trip.count = zext i32 %len to i64
  %min.iters.check = icmp ult i32 %len, 64
  br i1 %min.iters.check, label %for.body.preheader, label %vector.main.loop.iter.check

vector.main.loop.iter.check:                      ; preds = %iter.check
  %min.iters.check9 = icmp ult i32 %len, 256
  br i1 %min.iters.check9, label %vec.epilog.ph, label %vector.ph

vector.ph:                                        ; preds = %vector.main.loop.iter.check
  %n.vec = and i64 %wide.trip.count, 4294967040
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.phi = phi <128 x i32> [ zeroinitializer, %vector.ph ], [ %6, %vector.body ]
  %vec.phi10 = phi <128 x i32> [ zeroinitializer, %vector.ph ], [ %7, %vector.body ]
  %0 = getelementptr inbounds i16, ptr %aidx, i64 %index
  %wide.load = load <128 x i16>, ptr %0, align 2, !tbaa !4
  %1 = getelementptr inbounds i16, ptr %0, i64 128
  %wide.load11 = load <128 x i16>, ptr %1, align 2, !tbaa !4
  %2 = sext <128 x i16> %wide.load to <128 x i64>
  %3 = sext <128 x i16> %wide.load11 to <128 x i64>
  %4 = getelementptr inbounds i32, ptr %a, <128 x i64> %2
  %5 = getelementptr inbounds i32, ptr %a, <128 x i64> %3
  %wide.masked.gather = tail call <128 x i32> @llvm.masked.gather.v128i32.v128p0(<128 x ptr> %4, i32 4, <128 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>, <128 x i32> poison), !tbaa !8
  %wide.masked.gather12 = tail call <128 x i32> @llvm.masked.gather.v128i32.v128p0(<128 x ptr> %5, i32 4, <128 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>, <128 x i32> poison), !tbaa !8
  %6 = add <128 x i32> %wide.masked.gather, %vec.phi
  %7 = add <128 x i32> %wide.masked.gather12, %vec.phi10
  %index.next = add nuw i64 %index, 256
  %8 = icmp eq i64 %index.next, %n.vec
  br i1 %8, label %middle.block, label %vector.body, !llvm.loop !10

middle.block:                                     ; preds = %vector.body
  %bin.rdx = add <128 x i32> %7, %6
  %9 = tail call i32 @llvm.vector.reduce.add.v128i32(<128 x i32> %bin.rdx)
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br i1 %cmp.n, label %for.cond.cleanup, label %vec.epilog.iter.check

vec.epilog.iter.check:                            ; preds = %middle.block
  %n.vec.remaining = and i64 %wide.trip.count, 192
  %min.epilog.iters.check = icmp eq i64 %n.vec.remaining, 0
  br i1 %min.epilog.iters.check, label %for.body.preheader, label %vec.epilog.ph

vec.epilog.ph:                                    ; preds = %vector.main.loop.iter.check, %vec.epilog.iter.check
  %bc.merge.rdx = phi i32 [ 0, %vector.main.loop.iter.check ], [ %9, %vec.epilog.iter.check ]
  %vec.epilog.resume.val = phi i64 [ 0, %vector.main.loop.iter.check ], [ %n.vec, %vec.epilog.iter.check ]
  %n.vec14 = and i64 %wide.trip.count, 4294967232
  %10 = insertelement <64 x i32> <i32 poison, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, i32 %bc.merge.rdx, i64 0
  br label %vec.epilog.vector.body

vec.epilog.vector.body:                           ; preds = %vec.epilog.vector.body, %vec.epilog.ph
  %offset.idx = phi i64 [ %vec.epilog.resume.val, %vec.epilog.ph ], [ %index.next20, %vec.epilog.vector.body ]
  %vec.phi17 = phi <64 x i32> [ %10, %vec.epilog.ph ], [ %14, %vec.epilog.vector.body ]
  %11 = getelementptr inbounds i16, ptr %aidx, i64 %offset.idx
  %wide.load18 = load <64 x i16>, ptr %11, align 2, !tbaa !4
  %12 = sext <64 x i16> %wide.load18 to <64 x i64>
  %13 = getelementptr inbounds i32, ptr %a, <64 x i64> %12
  %wide.masked.gather19 = tail call <64 x i32> @llvm.masked.gather.v64i32.v64p0(<64 x ptr> %13, i32 4, <64 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>, <64 x i32> poison), !tbaa !8
  %14 = add <64 x i32> %wide.masked.gather19, %vec.phi17
  %index.next20 = add nuw i64 %offset.idx, 64
  %15 = icmp eq i64 %index.next20, %n.vec14
  br i1 %15, label %vec.epilog.middle.block, label %vec.epilog.vector.body, !llvm.loop !13

vec.epilog.middle.block:                          ; preds = %vec.epilog.vector.body
  %16 = tail call i32 @llvm.vector.reduce.add.v64i32(<64 x i32> %14)
  %cmp.n15 = icmp eq i64 %n.vec14, %wide.trip.count
  br i1 %cmp.n15, label %for.cond.cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %iter.check, %vec.epilog.iter.check, %vec.epilog.middle.block
  %indvars.iv.ph = phi i64 [ 0, %iter.check ], [ %n.vec, %vec.epilog.iter.check ], [ %n.vec14, %vec.epilog.middle.block ]
  %res.07.ph = phi i32 [ 0, %iter.check ], [ %9, %vec.epilog.iter.check ], [ %16, %vec.epilog.middle.block ]
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %middle.block, %vec.epilog.middle.block, %entry
  %res.0.lcssa = phi i32 [ 0, %entry ], [ %9, %middle.block ], [ %16, %vec.epilog.middle.block ], [ %add, %for.body ]
  ret i32 %res.0.lcssa

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ %indvars.iv.ph, %for.body.preheader ]
  %res.07 = phi i32 [ %add, %for.body ], [ %res.07.ph, %for.body.preheader ]
  %arrayidx = getelementptr inbounds i16, ptr %aidx, i64 %indvars.iv
  %17 = load i16, ptr %arrayidx, align 2, !tbaa !4
  %idxprom1 = sext i16 %17 to i64
  %arrayidx2 = getelementptr inbounds i32, ptr %a, i64 %idxprom1
  %18 = load i32, ptr %arrayidx2, align 4, !tbaa !8
  %add = add nsw i32 %18, %res.07
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !llvm.loop !15
}

; Function Attrs: nocallback nofree nosync nounwind readonly willreturn
declare <128 x i32> @llvm.masked.gather.v128i32.v128p0(<128 x ptr>, i32 immarg, <128 x i1>, <128 x i32>) #1

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i32 @llvm.vector.reduce.add.v128i32(<128 x i32>) #2

; Function Attrs: nocallback nofree nosync nounwind readonly willreturn
declare <64 x i32> @llvm.masked.gather.v64i32.v64p0(<64 x ptr>, i32 immarg, <64 x i1>, <64 x i32>) #1

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i32 @llvm.vector.reduce.add.v64i32(<64 x i32>) #2

attributes #0 = { argmemonly nofree norecurse nosync nounwind readonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+v,+f,+m,+c,+d,+zba,+zbb,+zbc,+zbs,-save-restore" }
attributes #1 = { nocallback nofree nosync nounwind readonly willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone willreturn }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 6d859266803e2a9060c4e8770f92cc2c7bd05a3b)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"short", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!9, !9, i64 0}
!9 = !{!"int", !6, i64 0}
!10 = distinct !{!10, !11, !12}
!11 = !{!"llvm.loop.mustprogress"}
!12 = !{!"llvm.loop.isvectorized", i32 1}
!13 = distinct !{!13, !11, !12, !14}
!14 = !{!"llvm.loop.unroll.runtime.disable"}
!15 = distinct !{!15, !11, !14, !12}
