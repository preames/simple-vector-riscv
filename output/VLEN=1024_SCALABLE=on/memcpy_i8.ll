; ModuleID = 'memcpy_i8.c'
source_filename = "memcpy_i8.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
target triple = "riscv64"

; Function Attrs: argmemonly nofree norecurse nosync nounwind
define dso_local void @my_memcpy(i32 noundef signext %len, ptr nocapture noundef writeonly %a, ptr nocapture noundef readonly %b) local_unnamed_addr #0 {
entry:
  %b9 = ptrtoint ptr %b to i64
  %a8 = ptrtoint ptr %a to i64
  %cmp6.not = icmp eq i32 %len, 0
  br i1 %cmp6.not, label %for.cond.cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %len to i64
  %min.iters.check = icmp ult i32 %len, 128
  br i1 %min.iters.check, label %for.body.preheader11, label %vector.memcheck

vector.memcheck:                                  ; preds = %for.body.preheader
  %0 = call i64 @llvm.vscale.i64()
  %1 = shl i64 %0, 4
  %2 = sub i64 %a8, %b9
  %diff.check = icmp ult i64 %2, %1
  br i1 %diff.check, label %for.body.preheader11, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %3 = call i64 @llvm.vscale.i64()
  %4 = shl i64 %3, 4
  %n.mod.vf = urem i64 %wide.trip.count, %4
  %n.vec = sub nuw nsw i64 %wide.trip.count, %n.mod.vf
  %5 = call i32 @llvm.vscale.i32()
  %6 = shl i32 %5, 3
  %7 = sext i32 %6 to i64
  %8 = call i32 @llvm.vscale.i32()
  %9 = shl i32 %8, 3
  %10 = sext i32 %9 to i64
  %11 = call i64 @llvm.vscale.i64()
  %12 = shl i64 %11, 4
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %13 = getelementptr inbounds i8, ptr %b, i64 %index
  %wide.load = load <vscale x 8 x i8>, ptr %13, align 1, !tbaa !4
  %14 = getelementptr inbounds i8, ptr %13, i64 %7
  %wide.load10 = load <vscale x 8 x i8>, ptr %14, align 1, !tbaa !4
  %15 = getelementptr inbounds i8, ptr %a, i64 %index
  store <vscale x 8 x i8> %wide.load, ptr %15, align 1, !tbaa !4
  %16 = getelementptr inbounds i8, ptr %15, i64 %10
  store <vscale x 8 x i8> %wide.load10, ptr %16, align 1, !tbaa !4
  %index.next = add nuw i64 %index, %12
  %17 = icmp eq i64 %index.next, %n.vec
  br i1 %17, label %middle.block, label %vector.body, !llvm.loop !7

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
  %18 = load i8, ptr %arrayidx, align 1, !tbaa !4
  %arrayidx2 = getelementptr inbounds i8, ptr %a, i64 %indvars.iv
  store i8 %18, ptr %arrayidx2, align 1, !tbaa !4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !llvm.loop !10
}

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i64 @llvm.vscale.i64() #1

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i32 @llvm.vscale.i32() #1

attributes #0 = { argmemonly nofree norecurse nosync nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+v,+f,+m,+c,+d,+zba,+zbb,+zbc,+zbs,-save-restore" }
attributes #1 = { nocallback nofree nosync nounwind readnone willreturn }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 15.0.0 (https://github.com/llvm/llvm-project.git dde2a7fb6da46da2b2f765fa569d8fddb4270eb6)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = distinct !{!7, !8, !9}
!8 = !{!"llvm.loop.mustprogress"}
!9 = !{!"llvm.loop.isvectorized", i32 1}
!10 = distinct !{!10, !8, !9}
