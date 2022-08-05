; ModuleID = 'main.c'
source_filename = "main.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
target triple = "riscv64"

; Function Attrs: argmemonly nofree norecurse nosync nounwind
define dso_local void @vector_add_i32(ptr nocapture noundef %a, i32 noundef signext %a_len, i32 noundef signext %b) local_unnamed_addr #0 {
entry:
  %cmp.not4 = icmp eq i32 %a_len, 1
  br i1 %cmp.not4, label %for.cond.cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  %0 = sext i32 %a_len to i64
  %1 = add nsw i64 %0, -1
  %2 = add i32 %a_len, -2
  %3 = zext i32 %2 to i64
  %4 = add nuw nsw i64 %3, 1
  %min.iters.check = icmp ult i32 %2, 7
  br i1 %min.iters.check, label %for.body.preheader7, label %vector.ph

vector.ph:                                        ; preds = %for.body.preheader
  %n.vec = and i64 %4, 8589934584
  %ind.end = sub nsw i64 %1, %n.vec
  %broadcast.splatinsert = insertelement <8 x i32> poison, i32 %b, i64 0
  %broadcast.splat = shufflevector <8 x i32> %broadcast.splatinsert, <8 x i32> poison, <8 x i32> zeroinitializer
  %5 = getelementptr i32, ptr %a, i64 -7
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %offset.idx = sub i64 %1, %index
  %6 = getelementptr i32, ptr %5, i64 %offset.idx
  %wide.load = load <8 x i32>, ptr %6, align 4, !tbaa !4
  %reverse = shufflevector <8 x i32> %wide.load, <8 x i32> poison, <8 x i32> <i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>
  %7 = add nsw <8 x i32> %reverse, %broadcast.splat
  %reverse6 = shufflevector <8 x i32> %7, <8 x i32> poison, <8 x i32> <i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>
  store <8 x i32> %reverse6, ptr %6, align 4, !tbaa !4
  %index.next = add nuw i64 %index, 8
  %8 = icmp eq i64 %index.next, %n.vec
  br i1 %8, label %middle.block, label %vector.body, !llvm.loop !8

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %4, %n.vec
  br i1 %cmp.n, label %for.cond.cleanup, label %for.body.preheader7

for.body.preheader7:                              ; preds = %for.body.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ %1, %for.body.preheader ], [ %ind.end, %middle.block ]
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %middle.block, %entry
  ret void

for.body:                                         ; preds = %for.body.preheader7, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ %indvars.iv.ph, %for.body.preheader7 ]
  %arrayidx = getelementptr inbounds i32, ptr %a, i64 %indvars.iv
  %9 = load i32, ptr %arrayidx, align 4, !tbaa !4
  %add = add nsw i32 %9, %b
  store i32 %add, ptr %arrayidx, align 4, !tbaa !4
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  %10 = and i64 %indvars.iv.next, 4294967295
  %cmp.not = icmp eq i64 %10, 0
  br i1 %cmp.not, label %for.cond.cleanup, label %for.body, !llvm.loop !11
}

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: argmemonly nofree norecurse nosync nounwind readonly
define dso_local signext i32 @vector_reduce_add_i32(ptr nocapture noundef readonly %a, i32 noundef signext %a_len) local_unnamed_addr #2 {
entry:
  %cmp4 = icmp sgt i32 %a_len, 0
  br i1 %cmp4, label %for.body.preheader, label %for.cond.cleanup

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %a_len to i64
  %min.iters.check = icmp ult i32 %a_len, 16
  br i1 %min.iters.check, label %for.body.preheader9, label %vector.ph

vector.ph:                                        ; preds = %for.body.preheader
  %n.vec = and i64 %wide.trip.count, 4294967280
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.phi = phi <8 x i32> [ zeroinitializer, %vector.ph ], [ %2, %vector.body ]
  %vec.phi7 = phi <8 x i32> [ zeroinitializer, %vector.ph ], [ %3, %vector.body ]
  %0 = getelementptr inbounds i32, ptr %a, i64 %index
  %wide.load = load <8 x i32>, ptr %0, align 4, !tbaa !4
  %1 = getelementptr inbounds i32, ptr %0, i64 8
  %wide.load8 = load <8 x i32>, ptr %1, align 4, !tbaa !4
  %2 = add <8 x i32> %wide.load, %vec.phi
  %3 = add <8 x i32> %wide.load8, %vec.phi7
  %index.next = add nuw i64 %index, 16
  %4 = icmp eq i64 %index.next, %n.vec
  br i1 %4, label %middle.block, label %vector.body, !llvm.loop !13

middle.block:                                     ; preds = %vector.body
  %bin.rdx = add <8 x i32> %3, %2
  %5 = tail call i32 @llvm.vector.reduce.add.v8i32(<8 x i32> %bin.rdx)
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br i1 %cmp.n, label %for.cond.cleanup, label %for.body.preheader9

for.body.preheader9:                              ; preds = %for.body.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %for.body.preheader ], [ %n.vec, %middle.block ]
  %sum.05.ph = phi i32 [ 0, %for.body.preheader ], [ %5, %middle.block ]
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %middle.block, %entry
  %sum.0.lcssa = phi i32 [ 0, %entry ], [ %5, %middle.block ], [ %add, %for.body ]
  ret i32 %sum.0.lcssa

for.body:                                         ; preds = %for.body.preheader9, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ %indvars.iv.ph, %for.body.preheader9 ]
  %sum.05 = phi i32 [ %add, %for.body ], [ %sum.05.ph, %for.body.preheader9 ]
  %arrayidx = getelementptr inbounds i32, ptr %a, i64 %indvars.iv
  %6 = load i32, ptr %arrayidx, align 4, !tbaa !4
  %add = add nsw i32 %6, %sum.05
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !llvm.loop !14
}

; Function Attrs: nofree nosync nounwind readnone
define dso_local signext i32 @main() local_unnamed_addr #3 {
entry:
  %a = alloca [2048 x i32], align 4
  call void @llvm.lifetime.start.p0(i64 8192, ptr nonnull %a) #6
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 4 dereferenceable(8192) %a, i8 0, i64 8192, i1 false), !tbaa !4
  %0 = getelementptr i32, ptr %a, i64 -7
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %entry
  %index = phi i64 [ 0, %entry ], [ %index.next, %vector.body ]
  %offset.idx = sub i64 2047, %index
  %1 = getelementptr i32, ptr %0, i64 %offset.idx
  %wide.load = load <8 x i32>, ptr %1, align 4, !tbaa !4
  %2 = add nsw <8 x i32> %wide.load, <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>
  store <8 x i32> %2, ptr %1, align 4, !tbaa !4
  %index.next = add nuw i64 %index, 8
  %3 = icmp eq i64 %index.next, 2040
  br i1 %3, label %for.body.i, label %vector.body, !llvm.loop !15

for.body.i:                                       ; preds = %vector.body
  %arrayidx.i = getelementptr inbounds i32, ptr %a, i64 7
  %4 = load i32, ptr %arrayidx.i, align 4, !tbaa !4
  %add.i = add nsw i32 %4, 1
  store i32 %add.i, ptr %arrayidx.i, align 4, !tbaa !4
  %arrayidx.i.1 = getelementptr inbounds i32, ptr %a, i64 6
  %5 = load i32, ptr %arrayidx.i.1, align 4, !tbaa !4
  %add.i.1 = add nsw i32 %5, 1
  store i32 %add.i.1, ptr %arrayidx.i.1, align 4, !tbaa !4
  %arrayidx.i.2 = getelementptr inbounds i32, ptr %a, i64 5
  %6 = load i32, ptr %arrayidx.i.2, align 4, !tbaa !4
  %add.i.2 = add nsw i32 %6, 1
  store i32 %add.i.2, ptr %arrayidx.i.2, align 4, !tbaa !4
  %arrayidx.i.3 = getelementptr inbounds i32, ptr %a, i64 4
  %7 = load i32, ptr %arrayidx.i.3, align 4, !tbaa !4
  %add.i.3 = add nsw i32 %7, 1
  store i32 %add.i.3, ptr %arrayidx.i.3, align 4, !tbaa !4
  %arrayidx.i.4 = getelementptr inbounds i32, ptr %a, i64 3
  %8 = load i32, ptr %arrayidx.i.4, align 4, !tbaa !4
  %add.i.4 = add nsw i32 %8, 1
  store i32 %add.i.4, ptr %arrayidx.i.4, align 4, !tbaa !4
  %arrayidx.i.5 = getelementptr inbounds i32, ptr %a, i64 2
  %9 = load i32, ptr %arrayidx.i.5, align 4, !tbaa !4
  %add.i.5 = add nsw i32 %9, 1
  store i32 %add.i.5, ptr %arrayidx.i.5, align 4, !tbaa !4
  %arrayidx.i.6 = getelementptr inbounds i32, ptr %a, i64 1
  %10 = load i32, ptr %arrayidx.i.6, align 4, !tbaa !4
  %add.i.6 = add nsw i32 %10, 1
  store i32 %add.i.6, ptr %arrayidx.i.6, align 4, !tbaa !4
  br label %vector.body35

vector.body35:                                    ; preds = %for.body.i, %vector.body35
  %index36 = phi i64 [ %index.next40, %vector.body35 ], [ 0, %for.body.i ]
  %vec.phi = phi <8 x i32> [ %13, %vector.body35 ], [ zeroinitializer, %for.body.i ]
  %vec.phi37 = phi <8 x i32> [ %14, %vector.body35 ], [ zeroinitializer, %for.body.i ]
  %11 = getelementptr inbounds i32, ptr %a, i64 %index36
  %wide.load38 = load <8 x i32>, ptr %11, align 4, !tbaa !4
  %12 = getelementptr inbounds i32, ptr %11, i64 8
  %wide.load39 = load <8 x i32>, ptr %12, align 4, !tbaa !4
  %13 = add <8 x i32> %wide.load38, %vec.phi
  %14 = add <8 x i32> %wide.load39, %vec.phi37
  %index.next40 = add nuw i64 %index36, 16
  %15 = icmp eq i64 %index.next40, 2048
  br i1 %15, label %middle.block30, label %vector.body35, !llvm.loop !16

middle.block30:                                   ; preds = %vector.body35
  %bin.rdx = add <8 x i32> %14, %13
  %16 = tail call i32 @llvm.vector.reduce.add.v8i32(<8 x i32> %bin.rdx)
  %cmp2.not = icmp eq i32 %16, 2048
  br i1 %cmp2.not, label %vector.body46.preheader, label %cleanup

vector.body46.preheader:                          ; preds = %middle.block30
  %17 = getelementptr i32, ptr %a, i64 -7
  br label %vector.body46

vector.body46:                                    ; preds = %vector.body46.preheader, %vector.body46
  %index47 = phi i64 [ %index.next52, %vector.body46 ], [ 0, %vector.body46.preheader ]
  %offset.idx48 = sub i64 2047, %index47
  %18 = getelementptr i32, ptr %17, i64 %offset.idx48
  %wide.load49 = load <8 x i32>, ptr %18, align 4, !tbaa !4
  %19 = add nsw <8 x i32> %wide.load49, <i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1>
  store <8 x i32> %19, ptr %18, align 4, !tbaa !4
  %index.next52 = add nuw i64 %index47, 8
  %20 = icmp eq i64 %index.next52, 2040
  br i1 %20, label %for.body.i18, label %vector.body46, !llvm.loop !17

for.body.i18:                                     ; preds = %vector.body46
  %arrayidx.i14 = getelementptr inbounds i32, ptr %a, i64 7
  %21 = load i32, ptr %arrayidx.i14, align 4, !tbaa !4
  %add.i15 = add nsw i32 %21, -1
  store i32 %add.i15, ptr %arrayidx.i14, align 4, !tbaa !4
  %arrayidx.i14.1 = getelementptr inbounds i32, ptr %a, i64 6
  %22 = load i32, ptr %arrayidx.i14.1, align 4, !tbaa !4
  %add.i15.1 = add nsw i32 %22, -1
  store i32 %add.i15.1, ptr %arrayidx.i14.1, align 4, !tbaa !4
  %arrayidx.i14.2 = getelementptr inbounds i32, ptr %a, i64 5
  %23 = load i32, ptr %arrayidx.i14.2, align 4, !tbaa !4
  %add.i15.2 = add nsw i32 %23, -1
  store i32 %add.i15.2, ptr %arrayidx.i14.2, align 4, !tbaa !4
  %arrayidx.i14.3 = getelementptr inbounds i32, ptr %a, i64 4
  %24 = load i32, ptr %arrayidx.i14.3, align 4, !tbaa !4
  %add.i15.3 = add nsw i32 %24, -1
  store i32 %add.i15.3, ptr %arrayidx.i14.3, align 4, !tbaa !4
  %arrayidx.i14.4 = getelementptr inbounds i32, ptr %a, i64 3
  %25 = load i32, ptr %arrayidx.i14.4, align 4, !tbaa !4
  %add.i15.4 = add nsw i32 %25, -1
  store i32 %add.i15.4, ptr %arrayidx.i14.4, align 4, !tbaa !4
  %arrayidx.i14.5 = getelementptr inbounds i32, ptr %a, i64 2
  %26 = load i32, ptr %arrayidx.i14.5, align 4, !tbaa !4
  %add.i15.5 = add nsw i32 %26, -1
  store i32 %add.i15.5, ptr %arrayidx.i14.5, align 4, !tbaa !4
  %arrayidx.i14.6 = getelementptr inbounds i32, ptr %a, i64 1
  %27 = load i32, ptr %arrayidx.i14.6, align 4, !tbaa !4
  %add.i15.6 = add nsw i32 %27, -1
  store i32 %add.i15.6, ptr %arrayidx.i14.6, align 4, !tbaa !4
  br label %vector.body58

vector.body58:                                    ; preds = %for.body.i18, %vector.body58
  %index59 = phi i64 [ %index.next64, %vector.body58 ], [ 0, %for.body.i18 ]
  %vec.phi60 = phi <8 x i32> [ %30, %vector.body58 ], [ zeroinitializer, %for.body.i18 ]
  %vec.phi61 = phi <8 x i32> [ %31, %vector.body58 ], [ zeroinitializer, %for.body.i18 ]
  %28 = getelementptr inbounds i32, ptr %a, i64 %index59
  %wide.load62 = load <8 x i32>, ptr %28, align 4, !tbaa !4
  %29 = getelementptr inbounds i32, ptr %28, i64 8
  %wide.load63 = load <8 x i32>, ptr %29, align 4, !tbaa !4
  %30 = add <8 x i32> %wide.load62, %vec.phi60
  %31 = add <8 x i32> %wide.load63, %vec.phi61
  %index.next64 = add nuw i64 %index59, 16
  %32 = icmp eq i64 %index.next64, 2048
  br i1 %32, label %middle.block53, label %vector.body58, !llvm.loop !18

middle.block53:                                   ; preds = %vector.body58
  %bin.rdx65 = add <8 x i32> %31, %30
  %33 = tail call i32 @llvm.vector.reduce.add.v8i32(<8 x i32> %bin.rdx65)
  br label %cleanup

cleanup:                                          ; preds = %middle.block53, %middle.block30
  %retval.0 = phi i32 [ -1, %middle.block30 ], [ %33, %middle.block53 ]
  call void @llvm.lifetime.end.p0(i64 8192, ptr nonnull %a) #6
  ret i32 %retval.0
}

; Function Attrs: argmemonly nocallback nofree nounwind willreturn writeonly
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i32 @llvm.vector.reduce.add.v8i32(<8 x i32>) #5

attributes #0 = { argmemonly nofree norecurse nosync nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+v,+f,+m,+c,+d,+zba,+zbb,+zbc,+zbs,-save-restore" }
attributes #1 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #2 = { argmemonly nofree norecurse nosync nounwind readonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+v,+f,+m,+c,+d,+zba,+zbb,+zbc,+zbs,-save-restore" }
attributes #3 = { nofree nosync nounwind readnone "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+v,+f,+m,+c,+d,+zba,+zbb,+zbc,+zbs,-save-restore" }
attributes #4 = { argmemonly nocallback nofree nounwind willreturn writeonly }
attributes #5 = { nocallback nofree nosync nounwind readnone willreturn }
attributes #6 = { nounwind }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 9452450ee564583afc43611f300d26d8c3edd95b)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = distinct !{!8, !9, !10}
!9 = !{!"llvm.loop.mustprogress"}
!10 = !{!"llvm.loop.isvectorized", i32 1}
!11 = distinct !{!11, !9, !12, !10}
!12 = !{!"llvm.loop.unroll.runtime.disable"}
!13 = distinct !{!13, !9, !10}
!14 = distinct !{!14, !9, !12, !10}
!15 = distinct !{!15, !9, !10}
!16 = distinct !{!16, !9, !10}
!17 = distinct !{!17, !9, !10}
!18 = distinct !{!18, !9, !10}
