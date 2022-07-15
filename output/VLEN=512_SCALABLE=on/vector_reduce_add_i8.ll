; ModuleID = 'vector_reduce_add_i8.c'
source_filename = "vector_reduce_add_i8.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
target triple = "riscv64"

; Function Attrs: argmemonly nofree norecurse nosync nounwind readonly
define dso_local signext i32 @vector_reduce_add_i32(ptr nocapture noundef readonly %a, i32 noundef signext %a_len) local_unnamed_addr #0 {
entry:
  %cmp4.not = icmp eq i32 %a_len, 0
  br i1 %cmp4.not, label %for.cond.cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %a_len to i64
  %0 = call i64 @llvm.vscale.i64()
  %1 = shl i64 %0, 2
  %min.iters.check = icmp ugt i64 %1, %wide.trip.count
  br i1 %min.iters.check, label %for.body.preheader9, label %vector.ph

vector.ph:                                        ; preds = %for.body.preheader
  %2 = call i64 @llvm.vscale.i64()
  %3 = shl i64 %2, 2
  %n.mod.vf = urem i64 %wide.trip.count, %3
  %n.vec = sub nuw nsw i64 %wide.trip.count, %n.mod.vf
  %4 = call i32 @llvm.vscale.i32()
  %5 = shl i32 %4, 1
  %6 = sext i32 %5 to i64
  %7 = call i64 @llvm.vscale.i64()
  %8 = shl i64 %7, 2
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.phi = phi <vscale x 2 x i32> [ zeroinitializer, %vector.ph ], [ %13, %vector.body ]
  %vec.phi7 = phi <vscale x 2 x i32> [ zeroinitializer, %vector.ph ], [ %14, %vector.body ]
  %9 = getelementptr inbounds i8, ptr %a, i64 %index
  %wide.load = load <vscale x 2 x i8>, ptr %9, align 1, !tbaa !4
  %10 = getelementptr inbounds i8, ptr %9, i64 %6
  %wide.load8 = load <vscale x 2 x i8>, ptr %10, align 1, !tbaa !4
  %11 = zext <vscale x 2 x i8> %wide.load to <vscale x 2 x i32>
  %12 = zext <vscale x 2 x i8> %wide.load8 to <vscale x 2 x i32>
  %13 = add <vscale x 2 x i32> %vec.phi, %11
  %14 = add <vscale x 2 x i32> %vec.phi7, %12
  %index.next = add nuw i64 %index, %8
  %15 = icmp eq i64 %index.next, %n.vec
  br i1 %15, label %middle.block, label %vector.body, !llvm.loop !7

middle.block:                                     ; preds = %vector.body
  %bin.rdx = add <vscale x 2 x i32> %14, %13
  %16 = call i32 @llvm.vector.reduce.add.nxv2i32(<vscale x 2 x i32> %bin.rdx)
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.cond.cleanup, label %for.body.preheader9

for.body.preheader9:                              ; preds = %for.body.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %for.body.preheader ], [ %n.vec, %middle.block ]
  %sum.05.ph = phi i32 [ 0, %for.body.preheader ], [ %16, %middle.block ]
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %middle.block, %entry
  %sum.0.lcssa = phi i32 [ 0, %entry ], [ %16, %middle.block ], [ %add, %for.body ]
  ret i32 %sum.0.lcssa

for.body:                                         ; preds = %for.body.preheader9, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ %indvars.iv.ph, %for.body.preheader9 ]
  %sum.05 = phi i32 [ %add, %for.body ], [ %sum.05.ph, %for.body.preheader9 ]
  %arrayidx = getelementptr inbounds i8, ptr %a, i64 %indvars.iv
  %17 = load i8, ptr %arrayidx, align 1, !tbaa !4
  %conv = zext i8 %17 to i32
  %add = add nuw nsw i32 %sum.05, %conv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !llvm.loop !10
}

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i64 @llvm.vscale.i64() #1

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i32 @llvm.vscale.i32() #1

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i32 @llvm.vector.reduce.add.nxv2i32(<vscale x 2 x i32>) #1

attributes #0 = { argmemonly nofree norecurse nosync nounwind readonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+v,+f,+m,+c,+d,+zba,+zbb,+zbc,+zbs,-save-restore" }
attributes #1 = { nocallback nofree nosync nounwind readnone willreturn }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 15.0.0 (https://github.com/llvm/llvm-project.git 9153515a7bea9fb9dd4c76f70053a170bf825f35)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = distinct !{!7, !8, !9}
!8 = !{!"llvm.loop.mustprogress"}
!9 = !{!"llvm.loop.isvectorized", i32 1}
!10 = distinct !{!10, !8, !11, !9}
!11 = !{!"llvm.loop.unroll.runtime.disable"}
