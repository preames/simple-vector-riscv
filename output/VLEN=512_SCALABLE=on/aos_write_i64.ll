; ModuleID = 'aos_write_i64.c'
source_filename = "aos_write_i64.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
target triple = "riscv64"

%struct.T = type { i64, i64, i64, i64, i64, i64, i64 }

; Function Attrs: argmemonly nofree norecurse nosync nounwind writeonly
define dso_local void @aos_init_i64(i32 noundef signext %len, ptr nocapture noundef writeonly %a) local_unnamed_addr #0 {
entry:
  %cmp3.not = icmp eq i32 %len, 0
  br i1 %cmp3.not, label %for.cond.cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %len to i64
  %0 = tail call i64 @llvm.vscale.i64()
  %min.iters.check = icmp ugt i64 %0, %wide.trip.count
  br i1 %min.iters.check, label %for.body.preheader5, label %vector.ph

vector.ph:                                        ; preds = %for.body.preheader
  %1 = tail call i64 @llvm.vscale.i64()
  %n.mod.vf = urem i64 %wide.trip.count, %1
  %n.vec = sub nuw nsw i64 %wide.trip.count, %n.mod.vf
  %2 = tail call <vscale x 1 x i64> @llvm.experimental.stepvector.nxv1i64()
  %3 = tail call i64 @llvm.vscale.i64()
  %.splatinsert = insertelement <vscale x 1 x i64> poison, i64 %3, i64 0
  %.splat = shufflevector <vscale x 1 x i64> %.splatinsert, <vscale x 1 x i64> poison, <vscale x 1 x i32> zeroinitializer
  %4 = tail call i64 @llvm.vscale.i64()
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <vscale x 1 x i64> [ %2, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %5 = getelementptr inbounds %struct.T, ptr %a, <vscale x 1 x i64> %vec.ind, i32 6
  tail call void @llvm.masked.scatter.nxv1i64.nxv1p0(<vscale x 1 x i64> zeroinitializer, <vscale x 1 x ptr> %5, i32 8, <vscale x 1 x i1> shufflevector (<vscale x 1 x i1> insertelement (<vscale x 1 x i1> poison, i1 true, i32 0), <vscale x 1 x i1> poison, <vscale x 1 x i32> zeroinitializer)), !tbaa !4
  %index.next = add nuw i64 %index, %4
  %vec.ind.next = add <vscale x 1 x i64> %vec.ind, %.splat
  %6 = icmp eq i64 %index.next, %n.vec
  br i1 %6, label %middle.block, label %vector.body, !llvm.loop !9

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.cond.cleanup, label %for.body.preheader5

for.body.preheader5:                              ; preds = %for.body.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %for.body.preheader ], [ %n.vec, %middle.block ]
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %middle.block, %entry
  ret void

for.body:                                         ; preds = %for.body.preheader5, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ %indvars.iv.ph, %for.body.preheader5 ]
  %g = getelementptr inbounds %struct.T, ptr %a, i64 %indvars.iv, i32 6
  store i64 0, ptr %g, align 8, !tbaa !4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !llvm.loop !12
}

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i64 @llvm.vscale.i64() #1

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare <vscale x 1 x i64> @llvm.experimental.stepvector.nxv1i64() #1

; Function Attrs: nocallback nofree nosync nounwind willreturn writeonly
declare void @llvm.masked.scatter.nxv1i64.nxv1p0(<vscale x 1 x i64>, <vscale x 1 x ptr>, i32 immarg, <vscale x 1 x i1>) #2

attributes #0 = { argmemonly nofree norecurse nosync nounwind writeonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+v,+f,+m,+c,+d,+zba,+zbb,+zbc,+zbs,-save-restore" }
attributes #1 = { nocallback nofree nosync nounwind readnone willreturn }
attributes #2 = { nocallback nofree nosync nounwind willreturn writeonly }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 6e4f504575fce7ce9a29c00697acb4043b19badf)"}
!4 = !{!5, !6, i64 48}
!5 = !{!"T", !6, i64 0, !6, i64 8, !6, i64 16, !6, i64 24, !6, i64 32, !6, i64 40, !6, i64 48}
!6 = !{!"long", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.mustprogress"}
!11 = !{!"llvm.loop.isvectorized", i32 1}
!12 = distinct !{!12, !10, !13, !11}
!13 = !{!"llvm.loop.unroll.runtime.disable"}
