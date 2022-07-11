; ModuleID = 'riscv_vspec_example_a2.c'
source_filename = "riscv_vspec_example_a2.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
target triple = "riscv64"

; Function Attrs: argmemonly nofree norecurse nosync nounwind
define dso_local void @example_a2(ptr nocapture noundef readonly %a, ptr nocapture noundef writeonly %b, ptr nocapture noundef readonly %c, i32 noundef signext %n) local_unnamed_addr #0 {
entry:
  %c17 = ptrtoint ptr %c to i64
  %a16 = ptrtoint ptr %a to i64
  %b15 = ptrtoint ptr %b to i64
  %cmp13.not = icmp eq i32 %n, 0
  br i1 %cmp13.not, label %for.cond.cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %n to i64
  %min.iters.check = icmp ult i32 %n, 128
  br i1 %min.iters.check, label %for.body.preheader22, label %vector.memcheck

vector.memcheck:                                  ; preds = %for.body.preheader
  %0 = call i64 @llvm.vscale.i64()
  %1 = shl i64 %0, 4
  %2 = sub i64 %b15, %a16
  %diff.check = icmp ult i64 %2, %1
  %3 = call i64 @llvm.vscale.i64()
  %4 = shl i64 %3, 4
  %5 = sub i64 %b15, %c17
  %diff.check18 = icmp ult i64 %5, %4
  %conflict.rdx = or i1 %diff.check, %diff.check18
  br i1 %conflict.rdx, label %for.body.preheader22, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %6 = call i64 @llvm.vscale.i64()
  %7 = shl i64 %6, 4
  %n.mod.vf = urem i64 %wide.trip.count, %7
  %n.vec = sub nuw nsw i64 %wide.trip.count, %n.mod.vf
  %8 = call i32 @llvm.vscale.i32()
  %9 = shl i32 %8, 3
  %10 = sext i32 %9 to i64
  %11 = call i32 @llvm.vscale.i32()
  %12 = shl i32 %11, 3
  %13 = sext i32 %12 to i64
  %14 = call i32 @llvm.vscale.i32()
  %15 = shl i32 %14, 3
  %16 = sext i32 %15 to i64
  %17 = call i64 @llvm.vscale.i64()
  %18 = shl i64 %17, 4
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %19 = getelementptr inbounds i8, ptr %a, i64 %index
  %wide.load = load <vscale x 8 x i8>, ptr %19, align 1, !tbaa !4
  %20 = getelementptr inbounds i8, ptr %19, i64 %10
  %wide.load19 = load <vscale x 8 x i8>, ptr %20, align 1, !tbaa !4
  %21 = icmp ult <vscale x 8 x i8> %wide.load, shufflevector (<vscale x 8 x i8> insertelement (<vscale x 8 x i8> poison, i8 5, i32 0), <vscale x 8 x i8> poison, <vscale x 8 x i32> zeroinitializer)
  %22 = icmp ult <vscale x 8 x i8> %wide.load19, shufflevector (<vscale x 8 x i8> insertelement (<vscale x 8 x i8> poison, i8 5, i32 0), <vscale x 8 x i8> poison, <vscale x 8 x i32> zeroinitializer)
  %23 = getelementptr i8, ptr %c, i64 %index
  %wide.masked.load = call <vscale x 8 x i8> @llvm.masked.load.nxv8i8.p0(ptr %23, i32 1, <vscale x 8 x i1> %21, <vscale x 8 x i8> poison), !tbaa !4
  %24 = getelementptr i8, ptr %23, i64 %13
  %wide.masked.load20 = call <vscale x 8 x i8> @llvm.masked.load.nxv8i8.p0(ptr %24, i32 1, <vscale x 8 x i1> %22, <vscale x 8 x i8> poison), !tbaa !4
  %predphi = select <vscale x 8 x i1> %21, <vscale x 8 x i8> %wide.masked.load, <vscale x 8 x i8> shufflevector (<vscale x 8 x i8> insertelement (<vscale x 8 x i8> poison, i8 1, i32 0), <vscale x 8 x i8> poison, <vscale x 8 x i32> zeroinitializer)
  %predphi21 = select <vscale x 8 x i1> %22, <vscale x 8 x i8> %wide.masked.load20, <vscale x 8 x i8> shufflevector (<vscale x 8 x i8> insertelement (<vscale x 8 x i8> poison, i8 1, i32 0), <vscale x 8 x i8> poison, <vscale x 8 x i32> zeroinitializer)
  %25 = getelementptr inbounds i8, ptr %b, i64 %index
  store <vscale x 8 x i8> %predphi, ptr %25, align 1, !tbaa !4
  %26 = getelementptr inbounds i8, ptr %25, i64 %16
  store <vscale x 8 x i8> %predphi21, ptr %26, align 1, !tbaa !4
  %index.next = add nuw i64 %index, %18
  %27 = icmp eq i64 %index.next, %n.vec
  br i1 %27, label %middle.block, label %vector.body, !llvm.loop !7

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.cond.cleanup, label %for.body.preheader22

for.body.preheader22:                             ; preds = %vector.memcheck, %for.body.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %for.body.preheader ], [ %n.vec, %middle.block ]
  br label %for.body

for.cond.cleanup:                                 ; preds = %cond.end, %middle.block, %entry
  ret void

for.body:                                         ; preds = %for.body.preheader22, %cond.end
  %indvars.iv = phi i64 [ %indvars.iv.next, %cond.end ], [ %indvars.iv.ph, %for.body.preheader22 ]
  %arrayidx = getelementptr inbounds i8, ptr %a, i64 %indvars.iv
  %28 = load i8, ptr %arrayidx, align 1, !tbaa !4
  %cmp1 = icmp ult i8 %28, 5
  br i1 %cmp1, label %cond.true, label %cond.end

cond.true:                                        ; preds = %for.body
  %arrayidx4 = getelementptr inbounds i8, ptr %c, i64 %indvars.iv
  %29 = load i8, ptr %arrayidx4, align 1, !tbaa !4
  br label %cond.end

cond.end:                                         ; preds = %for.body, %cond.true
  %cond.off0 = phi i8 [ %29, %cond.true ], [ 1, %for.body ]
  %arrayidx8 = getelementptr inbounds i8, ptr %b, i64 %indvars.iv
  store i8 %cond.off0, ptr %arrayidx8, align 1, !tbaa !4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !llvm.loop !10
}

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i64 @llvm.vscale.i64() #1

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i32 @llvm.vscale.i32() #1

; Function Attrs: argmemonly nocallback nofree nosync nounwind readonly willreturn
declare <vscale x 8 x i8> @llvm.masked.load.nxv8i8.p0(ptr, i32 immarg, <vscale x 8 x i1>, <vscale x 8 x i8>) #2

attributes #0 = { argmemonly nofree norecurse nosync nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+v,+f,+m,+c,+d,+zba,-save-restore" }
attributes #1 = { nocallback nofree nosync nounwind readnone willreturn }
attributes #2 = { argmemonly nocallback nofree nosync nounwind readonly willreturn }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 15.0.0 (https://github.com/llvm/llvm-project.git c7fd7512a5c5b133665bfecbe2e9748c0607286e)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = distinct !{!7, !8, !9}
!8 = !{!"llvm.loop.mustprogress"}
!9 = !{!"llvm.loop.isvectorized", i32 1}
!10 = distinct !{!10, !8, !9}
