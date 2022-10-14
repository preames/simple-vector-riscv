; ModuleID = 'vector_add_i64.c'
source_filename = "vector_add_i64.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
target triple = "riscv64"

; Function Attrs: argmemonly nofree norecurse nosync nounwind
define dso_local void @vector_add_i64(ptr nocapture noundef %a, i32 noundef signext %a_len, i64 noundef %b) local_unnamed_addr #0 {
entry:
  %cmp3.not = icmp eq i32 %a_len, 0
  br i1 %cmp3.not, label %for.cond.cleanup, label %iter.check

iter.check:                                       ; preds = %entry
  %wide.trip.count = zext i32 %a_len to i64
  %min.iters.check = icmp ult i32 %a_len, 32
  br i1 %min.iters.check, label %for.body.preheader, label %vector.main.loop.iter.check

vector.main.loop.iter.check:                      ; preds = %iter.check
  %min.iters.check5 = icmp ult i32 %a_len, 128
  br i1 %min.iters.check5, label %vec.epilog.ph, label %vector.ph

vector.ph:                                        ; preds = %vector.main.loop.iter.check
  %n.vec = and i64 %wide.trip.count, 4294967168
  %broadcast.splatinsert = insertelement <64 x i64> poison, i64 %b, i64 0
  %broadcast.splat = shufflevector <64 x i64> %broadcast.splatinsert, <64 x i64> poison, <64 x i32> zeroinitializer
  %broadcast.splatinsert7 = insertelement <64 x i64> poison, i64 %b, i64 0
  %broadcast.splat8 = shufflevector <64 x i64> %broadcast.splatinsert7, <64 x i64> poison, <64 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %0 = getelementptr inbounds i64, ptr %a, i64 %index
  %wide.load = load <64 x i64>, ptr %0, align 8, !tbaa !4
  %1 = getelementptr inbounds i64, ptr %0, i64 64
  %wide.load6 = load <64 x i64>, ptr %1, align 8, !tbaa !4
  %2 = add nsw <64 x i64> %wide.load, %broadcast.splat
  %3 = add nsw <64 x i64> %wide.load6, %broadcast.splat8
  store <64 x i64> %2, ptr %0, align 8, !tbaa !4
  store <64 x i64> %3, ptr %1, align 8, !tbaa !4
  %index.next = add nuw i64 %index, 128
  %4 = icmp eq i64 %index.next, %n.vec
  br i1 %4, label %middle.block, label %vector.body, !llvm.loop !8

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br i1 %cmp.n, label %for.cond.cleanup, label %vec.epilog.iter.check

vec.epilog.iter.check:                            ; preds = %middle.block
  %n.vec.remaining = and i64 %wide.trip.count, 96
  %min.epilog.iters.check = icmp eq i64 %n.vec.remaining, 0
  br i1 %min.epilog.iters.check, label %for.body.preheader, label %vec.epilog.ph

vec.epilog.ph:                                    ; preds = %vector.main.loop.iter.check, %vec.epilog.iter.check
  %vec.epilog.resume.val = phi i64 [ %n.vec, %vec.epilog.iter.check ], [ 0, %vector.main.loop.iter.check ]
  %n.vec10 = and i64 %wide.trip.count, 4294967264
  %broadcast.splatinsert14 = insertelement <32 x i64> poison, i64 %b, i64 0
  %broadcast.splat15 = shufflevector <32 x i64> %broadcast.splatinsert14, <32 x i64> poison, <32 x i32> zeroinitializer
  br label %vec.epilog.vector.body

vec.epilog.vector.body:                           ; preds = %vec.epilog.vector.body, %vec.epilog.ph
  %offset.idx = phi i64 [ %vec.epilog.resume.val, %vec.epilog.ph ], [ %index.next16, %vec.epilog.vector.body ]
  %5 = getelementptr inbounds i64, ptr %a, i64 %offset.idx
  %wide.load13 = load <32 x i64>, ptr %5, align 8, !tbaa !4
  %6 = add nsw <32 x i64> %wide.load13, %broadcast.splat15
  store <32 x i64> %6, ptr %5, align 8, !tbaa !4
  %index.next16 = add nuw i64 %offset.idx, 32
  %7 = icmp eq i64 %index.next16, %n.vec10
  br i1 %7, label %vec.epilog.middle.block, label %vec.epilog.vector.body, !llvm.loop !11

vec.epilog.middle.block:                          ; preds = %vec.epilog.vector.body
  %cmp.n11 = icmp eq i64 %n.vec10, %wide.trip.count
  br i1 %cmp.n11, label %for.cond.cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %iter.check, %vec.epilog.iter.check, %vec.epilog.middle.block
  %indvars.iv.ph = phi i64 [ 0, %iter.check ], [ %n.vec, %vec.epilog.iter.check ], [ %n.vec10, %vec.epilog.middle.block ]
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %middle.block, %vec.epilog.middle.block, %entry
  ret void

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ %indvars.iv.ph, %for.body.preheader ]
  %arrayidx = getelementptr inbounds i64, ptr %a, i64 %indvars.iv
  %8 = load i64, ptr %arrayidx, align 8, !tbaa !4
  %add = add nsw i64 %8, %b
  store i64 %add, ptr %arrayidx, align 8, !tbaa !4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !llvm.loop !13
}

attributes #0 = { argmemonly nofree norecurse nosync nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+v,+f,+m,+c,+d,+zba,+zbb,+zbc,+zbs,-save-restore" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 6e4f504575fce7ce9a29c00697acb4043b19badf)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"long", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = distinct !{!8, !9, !10}
!9 = !{!"llvm.loop.mustprogress"}
!10 = !{!"llvm.loop.isvectorized", i32 1}
!11 = distinct !{!11, !9, !10, !12}
!12 = !{!"llvm.loop.unroll.runtime.disable"}
!13 = distinct !{!13, !9, !12, !10}
