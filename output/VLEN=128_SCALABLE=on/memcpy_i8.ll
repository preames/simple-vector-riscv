; ModuleID = 'memcpy_i8.c'
source_filename = "memcpy_i8.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
target triple = "riscv64-unknown-unknown"

; Function Attrs: argmemonly nofree norecurse nosync nounwind vscale_range(2,1024)
define dso_local void @my_memcpy(i32 noundef signext %len, ptr nocapture noundef writeonly %a, ptr nocapture noundef readonly %b) local_unnamed_addr #0 {
entry:
  %b9 = ptrtoint ptr %b to i64
  %a8 = ptrtoint ptr %a to i64
  %cmp6.not = icmp eq i32 %len, 0
  br i1 %cmp6.not, label %for.cond.cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %len to i64
  %0 = tail call i64 @llvm.vscale.i64()
  %1 = shl nuw nsw i64 %0, 4
  %min.iters.check = icmp ugt i64 %1, %wide.trip.count
  br i1 %min.iters.check, label %for.body.preheader11, label %vector.memcheck

vector.memcheck:                                  ; preds = %for.body.preheader
  %2 = tail call i64 @llvm.vscale.i64()
  %3 = shl nuw nsw i64 %2, 4
  %4 = sub i64 %a8, %b9
  %diff.check = icmp ult i64 %4, %3
  br i1 %diff.check, label %for.body.preheader11, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %5 = tail call i64 @llvm.vscale.i64()
  %6 = shl nuw nsw i64 %5, 4
  %n.mod.vf = urem i64 %wide.trip.count, %6
  %n.vec = sub nuw nsw i64 %wide.trip.count, %n.mod.vf
  %7 = tail call i32 @llvm.vscale.i32()
  %8 = shl nuw nsw i32 %7, 3
  %9 = zext i32 %8 to i64
  %10 = tail call i32 @llvm.vscale.i32()
  %11 = shl nuw nsw i32 %10, 3
  %12 = zext i32 %11 to i64
  %13 = tail call i64 @llvm.vscale.i64()
  %14 = shl nuw nsw i64 %13, 4
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %15 = getelementptr inbounds i8, ptr %b, i64 %index
  %wide.load = load <vscale x 8 x i8>, ptr %15, align 1, !tbaa !4
  %16 = getelementptr inbounds i8, ptr %15, i64 %9
  %wide.load10 = load <vscale x 8 x i8>, ptr %16, align 1, !tbaa !4
  %17 = getelementptr inbounds i8, ptr %a, i64 %index
  store <vscale x 8 x i8> %wide.load, ptr %17, align 1, !tbaa !4
  %18 = getelementptr inbounds i8, ptr %17, i64 %12
  store <vscale x 8 x i8> %wide.load10, ptr %18, align 1, !tbaa !4
  %index.next = add nuw i64 %index, %14
  %19 = icmp eq i64 %index.next, %n.vec
  br i1 %19, label %middle.block, label %vector.body, !llvm.loop !7

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.cond.cleanup, label %for.body.preheader11

for.body.preheader11:                             ; preds = %vector.memcheck, %for.body.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %for.body.preheader ], [ %n.vec, %middle.block ]
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %middle.block, %entry
  ret void

for.body:                                         ; preds = %for.body.preheader11, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ %indvars.iv.ph, %for.body.preheader11 ]
  %arrayidx = getelementptr inbounds i8, ptr %b, i64 %indvars.iv
  %20 = load i8, ptr %arrayidx, align 1, !tbaa !4
  %arrayidx2 = getelementptr inbounds i8, ptr %a, i64 %indvars.iv
  store i8 %20, ptr %arrayidx2, align 1, !tbaa !4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !llvm.loop !10
}

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i64 @llvm.vscale.i64() #1

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i32 @llvm.vscale.i32() #1

attributes #0 = { argmemonly nofree norecurse nosync nounwind vscale_range(2,1024) "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,+v,+zba,+zbb,+zbc,+zbs,+zve32f,+zve32x,+zve64d,+zve64f,+zve64x,+zvl128b,+zvl32b,+zvl64b,-save-restore" }
attributes #1 = { nocallback nofree nosync nounwind readnone willreturn }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64d"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 6d859266803e2a9060c4e8770f92cc2c7bd05a3b)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = distinct !{!7, !8, !9}
!8 = !{!"llvm.loop.mustprogress"}
!9 = !{!"llvm.loop.isvectorized", i32 1}
!10 = distinct !{!10, !8, !9}
