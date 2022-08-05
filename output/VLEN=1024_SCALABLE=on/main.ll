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
  %5 = tail call i64 @llvm.vscale.i64()
  %6 = shl i64 %5, 1
  %min.iters.check = icmp ult i64 %4, %6
  br i1 %min.iters.check, label %for.body.preheader8, label %vector.ph

vector.ph:                                        ; preds = %for.body.preheader
  %7 = tail call i64 @llvm.vscale.i64()
  %8 = shl i64 %7, 1
  %n.mod.vf = urem i64 %4, %8
  %n.vec = sub nsw i64 %4, %n.mod.vf
  %ind.end = sub nsw i64 %1, %n.vec
  %broadcast.splatinsert = insertelement <vscale x 2 x i32> poison, i32 %b, i64 0
  %broadcast.splat = shufflevector <vscale x 2 x i32> %broadcast.splatinsert, <vscale x 2 x i32> poison, <vscale x 2 x i32> zeroinitializer
  %9 = tail call i32 @llvm.vscale.i32()
  %.neg = mul i32 %9, -2
  %10 = or i32 %.neg, 1
  %11 = sext i32 %10 to i64
  %12 = tail call i32 @llvm.vscale.i32()
  %.neg7 = mul i32 %12, -2
  %13 = or i32 %.neg7, 1
  %14 = sext i32 %13 to i64
  %15 = tail call i64 @llvm.vscale.i64()
  %16 = shl i64 %15, 1
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %offset.idx = sub i64 %1, %index
  %17 = getelementptr inbounds i32, ptr %a, i64 %offset.idx
  %18 = getelementptr inbounds i32, ptr %17, i64 %11
  %wide.load = load <vscale x 2 x i32>, ptr %18, align 4, !tbaa !4
  %19 = add nsw <vscale x 2 x i32> %wide.load, %broadcast.splat
  %20 = getelementptr inbounds i32, ptr %17, i64 %14
  store <vscale x 2 x i32> %19, ptr %20, align 4, !tbaa !4
  %index.next = add nuw i64 %index, %16
  %21 = icmp eq i64 %index.next, %n.vec
  br i1 %21, label %middle.block, label %vector.body, !llvm.loop !8

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.cond.cleanup, label %for.body.preheader8

for.body.preheader8:                              ; preds = %for.body.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ %1, %for.body.preheader ], [ %ind.end, %middle.block ]
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %middle.block, %entry
  ret void

for.body:                                         ; preds = %for.body.preheader8, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ %indvars.iv.ph, %for.body.preheader8 ]
  %arrayidx = getelementptr inbounds i32, ptr %a, i64 %indvars.iv
  %22 = load i32, ptr %arrayidx, align 4, !tbaa !4
  %add = add nsw i32 %22, %b
  store i32 %add, ptr %arrayidx, align 4, !tbaa !4
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  %23 = and i64 %indvars.iv.next, 4294967295
  %cmp.not = icmp eq i64 %23, 0
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
  %0 = tail call i64 @llvm.vscale.i64()
  %1 = shl i64 %0, 2
  %min.iters.check = icmp ugt i64 %1, %wide.trip.count
  br i1 %min.iters.check, label %for.body.preheader9, label %vector.ph

vector.ph:                                        ; preds = %for.body.preheader
  %2 = tail call i64 @llvm.vscale.i64()
  %3 = shl i64 %2, 2
  %n.mod.vf = urem i64 %wide.trip.count, %3
  %n.vec = sub nuw nsw i64 %wide.trip.count, %n.mod.vf
  %4 = tail call i32 @llvm.vscale.i32()
  %5 = shl i32 %4, 1
  %6 = sext i32 %5 to i64
  %7 = tail call i64 @llvm.vscale.i64()
  %8 = shl i64 %7, 2
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.phi = phi <vscale x 2 x i32> [ zeroinitializer, %vector.ph ], [ %11, %vector.body ]
  %vec.phi7 = phi <vscale x 2 x i32> [ zeroinitializer, %vector.ph ], [ %12, %vector.body ]
  %9 = getelementptr inbounds i32, ptr %a, i64 %index
  %wide.load = load <vscale x 2 x i32>, ptr %9, align 4, !tbaa !4
  %10 = getelementptr inbounds i32, ptr %9, i64 %6
  %wide.load8 = load <vscale x 2 x i32>, ptr %10, align 4, !tbaa !4
  %11 = add <vscale x 2 x i32> %wide.load, %vec.phi
  %12 = add <vscale x 2 x i32> %wide.load8, %vec.phi7
  %index.next = add nuw i64 %index, %8
  %13 = icmp eq i64 %index.next, %n.vec
  br i1 %13, label %middle.block, label %vector.body, !llvm.loop !13

middle.block:                                     ; preds = %vector.body
  %bin.rdx = add <vscale x 2 x i32> %12, %11
  %14 = tail call i32 @llvm.vector.reduce.add.nxv2i32(<vscale x 2 x i32> %bin.rdx)
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.cond.cleanup, label %for.body.preheader9

for.body.preheader9:                              ; preds = %for.body.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %for.body.preheader ], [ %n.vec, %middle.block ]
  %sum.05.ph = phi i32 [ 0, %for.body.preheader ], [ %14, %middle.block ]
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %middle.block, %entry
  %sum.0.lcssa = phi i32 [ 0, %entry ], [ %14, %middle.block ], [ %add, %for.body ]
  ret i32 %sum.0.lcssa

for.body:                                         ; preds = %for.body.preheader9, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ %indvars.iv.ph, %for.body.preheader9 ]
  %sum.05 = phi i32 [ %add, %for.body ], [ %sum.05.ph, %for.body.preheader9 ]
  %arrayidx = getelementptr inbounds i32, ptr %a, i64 %indvars.iv
  %15 = load i32, ptr %arrayidx, align 4, !tbaa !4
  %add = add nsw i32 %15, %sum.05
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
  %0 = tail call i64 @llvm.vscale.i64()
  %1 = and i64 %0, 9223372036854774784
  %min.iters.check.not = icmp eq i64 %1, 0
  br i1 %min.iters.check.not, label %vector.ph, label %for.body.i.preheader

vector.ph:                                        ; preds = %entry
  %2 = tail call i64 @llvm.vscale.i64()
  %3 = shl i64 %2, 1
  %n.mod.vf = urem i64 2047, %3
  %n.vec = xor i64 %n.mod.vf, 2047
  %4 = tail call i32 @llvm.vscale.i32()
  %.neg = mul i32 %4, -2
  %5 = or i32 %.neg, 1
  %6 = sext i32 %5 to i64
  %7 = tail call i32 @llvm.vscale.i32()
  %.neg77 = mul i32 %7, -2
  %8 = or i32 %.neg77, 1
  %9 = sext i32 %8 to i64
  %10 = tail call i64 @llvm.vscale.i64()
  %11 = shl i64 %10, 1
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %offset.idx = sub i64 2047, %index
  %12 = getelementptr inbounds i32, ptr %a, i64 %offset.idx
  %13 = getelementptr inbounds i32, ptr %12, i64 %6
  %wide.load = load <vscale x 2 x i32>, ptr %13, align 4, !tbaa !4
  %14 = add nsw <vscale x 2 x i32> %wide.load, shufflevector (<vscale x 2 x i32> insertelement (<vscale x 2 x i32> poison, i32 1, i32 0), <vscale x 2 x i32> poison, <vscale x 2 x i32> zeroinitializer)
  %15 = getelementptr inbounds i32, ptr %12, i64 %9
  store <vscale x 2 x i32> %14, ptr %15, align 4, !tbaa !4
  %index.next = add nuw i64 %index, %11
  %16 = icmp eq i64 %index.next, %n.vec
  br i1 %16, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.body.i12.preheader, label %for.body.i.preheader

for.body.i.preheader:                             ; preds = %entry, %middle.block
  %indvars.iv.i.ph = phi i64 [ 2047, %entry ], [ %n.mod.vf, %middle.block ]
  br label %for.body.i

for.body.i:                                       ; preds = %for.body.i.preheader, %for.body.i
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %for.body.i ], [ %indvars.iv.i.ph, %for.body.i.preheader ]
  %arrayidx.i = getelementptr inbounds i32, ptr %a, i64 %indvars.iv.i
  %17 = load i32, ptr %arrayidx.i, align 4, !tbaa !4
  %add.i = add nsw i32 %17, 1
  store i32 %add.i, ptr %arrayidx.i, align 4, !tbaa !4
  %indvars.iv.next.i = add nsw i64 %indvars.iv.i, -1
  %18 = and i64 %indvars.iv.next.i, 4294967295
  %cmp.not.i = icmp eq i64 %18, 0
  br i1 %cmp.not.i, label %for.body.i12.preheader, label %for.body.i, !llvm.loop !16

for.body.i12.preheader:                           ; preds = %for.body.i, %middle.block
  %19 = tail call i64 @llvm.vscale.i64()
  %20 = shl i64 %19, 2
  %min.iters.check32 = icmp ugt i64 %20, 2048
  br i1 %min.iters.check32, label %for.body.i12.preheader83, label %vector.ph33

vector.ph33:                                      ; preds = %for.body.i12.preheader
  %21 = tail call i64 @llvm.vscale.i64()
  %22 = shl i64 %21, 2
  %n.mod.vf34 = urem i64 2048, %22
  %n.vec35 = sub nuw nsw i64 2048, %n.mod.vf34
  %23 = tail call i32 @llvm.vscale.i32()
  %24 = shl i32 %23, 1
  %25 = sext i32 %24 to i64
  %26 = tail call i64 @llvm.vscale.i64()
  %27 = shl i64 %26, 2
  br label %vector.body38

vector.body38:                                    ; preds = %vector.body38, %vector.ph33
  %index39 = phi i64 [ 0, %vector.ph33 ], [ %index.next43, %vector.body38 ]
  %vec.phi = phi <vscale x 2 x i32> [ zeroinitializer, %vector.ph33 ], [ %30, %vector.body38 ]
  %vec.phi40 = phi <vscale x 2 x i32> [ zeroinitializer, %vector.ph33 ], [ %31, %vector.body38 ]
  %28 = getelementptr inbounds i32, ptr %a, i64 %index39
  %wide.load41 = load <vscale x 2 x i32>, ptr %28, align 4, !tbaa !4
  %29 = getelementptr inbounds i32, ptr %28, i64 %25
  %wide.load42 = load <vscale x 2 x i32>, ptr %29, align 4, !tbaa !4
  %30 = add <vscale x 2 x i32> %wide.load41, %vec.phi
  %31 = add <vscale x 2 x i32> %wide.load42, %vec.phi40
  %index.next43 = add nuw i64 %index39, %27
  %32 = icmp eq i64 %index.next43, %n.vec35
  br i1 %32, label %middle.block30, label %vector.body38, !llvm.loop !17

middle.block30:                                   ; preds = %vector.body38
  %bin.rdx = add <vscale x 2 x i32> %31, %30
  %33 = tail call i32 @llvm.vector.reduce.add.nxv2i32(<vscale x 2 x i32> %bin.rdx)
  %cmp.n37 = icmp eq i64 %n.mod.vf34, 0
  br i1 %cmp.n37, label %vector_reduce_add_i32.exit, label %for.body.i12.preheader83

for.body.i12.preheader83:                         ; preds = %for.body.i12.preheader, %middle.block30
  %indvars.iv.i8.ph = phi i64 [ 0, %for.body.i12.preheader ], [ %n.vec35, %middle.block30 ]
  %sum.05.i.ph = phi i32 [ 0, %for.body.i12.preheader ], [ %33, %middle.block30 ]
  br label %for.body.i12

for.body.i12:                                     ; preds = %for.body.i12.preheader83, %for.body.i12
  %indvars.iv.i8 = phi i64 [ %indvars.iv.next.i11, %for.body.i12 ], [ %indvars.iv.i8.ph, %for.body.i12.preheader83 ]
  %sum.05.i = phi i32 [ %add.i10, %for.body.i12 ], [ %sum.05.i.ph, %for.body.i12.preheader83 ]
  %arrayidx.i9 = getelementptr inbounds i32, ptr %a, i64 %indvars.iv.i8
  %34 = load i32, ptr %arrayidx.i9, align 4, !tbaa !4
  %add.i10 = add nsw i32 %34, %sum.05.i
  %indvars.iv.next.i11 = add nuw nsw i64 %indvars.iv.i8, 1
  %exitcond.not.i = icmp eq i64 %indvars.iv.next.i11, 2048
  br i1 %exitcond.not.i, label %vector_reduce_add_i32.exit, label %for.body.i12, !llvm.loop !18

vector_reduce_add_i32.exit:                       ; preds = %for.body.i12, %middle.block30
  %add.i10.lcssa = phi i32 [ %33, %middle.block30 ], [ %add.i10, %for.body.i12 ]
  %cmp2.not = icmp eq i32 %add.i10.lcssa, 2048
  br i1 %cmp2.not, label %for.body.i18.preheader, label %cleanup

for.body.i18.preheader:                           ; preds = %vector_reduce_add_i32.exit
  %35 = tail call i64 @llvm.vscale.i64()
  %36 = and i64 %35, 9223372036854774784
  %min.iters.check46.not = icmp eq i64 %36, 0
  br i1 %min.iters.check46.not, label %vector.ph47, label %for.body.i18.preheader82

vector.ph47:                                      ; preds = %for.body.i18.preheader
  %37 = tail call i64 @llvm.vscale.i64()
  %38 = shl i64 %37, 1
  %n.mod.vf48 = urem i64 2047, %38
  %n.vec49 = xor i64 %n.mod.vf48, 2047
  %39 = tail call i32 @llvm.vscale.i32()
  %.neg78 = mul i32 %39, -2
  %40 = or i32 %.neg78, 1
  %41 = sext i32 %40 to i64
  %42 = tail call i32 @llvm.vscale.i32()
  %.neg79 = mul i32 %42, -2
  %43 = or i32 %.neg79, 1
  %44 = sext i32 %43 to i64
  %45 = tail call i64 @llvm.vscale.i64()
  %46 = shl i64 %45, 1
  br label %vector.body53

vector.body53:                                    ; preds = %vector.body53, %vector.ph47
  %index54 = phi i64 [ 0, %vector.ph47 ], [ %index.next59, %vector.body53 ]
  %offset.idx55 = sub i64 2047, %index54
  %47 = getelementptr inbounds i32, ptr %a, i64 %offset.idx55
  %48 = getelementptr inbounds i32, ptr %47, i64 %41
  %wide.load56 = load <vscale x 2 x i32>, ptr %48, align 4, !tbaa !4
  %49 = add nsw <vscale x 2 x i32> %wide.load56, shufflevector (<vscale x 2 x i32> insertelement (<vscale x 2 x i32> poison, i32 -1, i32 0), <vscale x 2 x i32> poison, <vscale x 2 x i32> zeroinitializer)
  %50 = getelementptr inbounds i32, ptr %47, i64 %44
  store <vscale x 2 x i32> %49, ptr %50, align 4, !tbaa !4
  %index.next59 = add nuw i64 %index54, %46
  %51 = icmp eq i64 %index.next59, %n.vec49
  br i1 %51, label %middle.block44, label %vector.body53, !llvm.loop !19

middle.block44:                                   ; preds = %vector.body53
  %cmp.n52 = icmp eq i64 %n.mod.vf48, 0
  br i1 %cmp.n52, label %for.body.i26.preheader, label %for.body.i18.preheader82

for.body.i18.preheader82:                         ; preds = %for.body.i18.preheader, %middle.block44
  %indvars.iv.i13.ph = phi i64 [ 2047, %for.body.i18.preheader ], [ %n.mod.vf48, %middle.block44 ]
  br label %for.body.i18

for.body.i18:                                     ; preds = %for.body.i18.preheader82, %for.body.i18
  %indvars.iv.i13 = phi i64 [ %indvars.iv.next.i16, %for.body.i18 ], [ %indvars.iv.i13.ph, %for.body.i18.preheader82 ]
  %arrayidx.i14 = getelementptr inbounds i32, ptr %a, i64 %indvars.iv.i13
  %52 = load i32, ptr %arrayidx.i14, align 4, !tbaa !4
  %add.i15 = add nsw i32 %52, -1
  store i32 %add.i15, ptr %arrayidx.i14, align 4, !tbaa !4
  %indvars.iv.next.i16 = add nsw i64 %indvars.iv.i13, -1
  %53 = and i64 %indvars.iv.next.i16, 4294967295
  %cmp.not.i17 = icmp eq i64 %53, 0
  br i1 %cmp.not.i17, label %for.body.i26.preheader, label %for.body.i18, !llvm.loop !20

for.body.i26.preheader:                           ; preds = %for.body.i18, %middle.block44
  %54 = tail call i64 @llvm.vscale.i64()
  %55 = shl i64 %54, 2
  %min.iters.check62 = icmp ugt i64 %55, 2048
  br i1 %min.iters.check62, label %for.body.i26.preheader80, label %vector.ph63

vector.ph63:                                      ; preds = %for.body.i26.preheader
  %56 = tail call i64 @llvm.vscale.i64()
  %57 = shl i64 %56, 2
  %n.mod.vf64 = urem i64 2048, %57
  %n.vec65 = sub nuw nsw i64 2048, %n.mod.vf64
  %58 = tail call i32 @llvm.vscale.i32()
  %59 = shl i32 %58, 1
  %60 = sext i32 %59 to i64
  %61 = tail call i64 @llvm.vscale.i64()
  %62 = shl i64 %61, 2
  br label %vector.body68

vector.body68:                                    ; preds = %vector.body68, %vector.ph63
  %index69 = phi i64 [ 0, %vector.ph63 ], [ %index.next74, %vector.body68 ]
  %vec.phi70 = phi <vscale x 2 x i32> [ zeroinitializer, %vector.ph63 ], [ %65, %vector.body68 ]
  %vec.phi71 = phi <vscale x 2 x i32> [ zeroinitializer, %vector.ph63 ], [ %66, %vector.body68 ]
  %63 = getelementptr inbounds i32, ptr %a, i64 %index69
  %wide.load72 = load <vscale x 2 x i32>, ptr %63, align 4, !tbaa !4
  %64 = getelementptr inbounds i32, ptr %63, i64 %60
  %wide.load73 = load <vscale x 2 x i32>, ptr %64, align 4, !tbaa !4
  %65 = add <vscale x 2 x i32> %wide.load72, %vec.phi70
  %66 = add <vscale x 2 x i32> %wide.load73, %vec.phi71
  %index.next74 = add nuw i64 %index69, %62
  %67 = icmp eq i64 %index.next74, %n.vec65
  br i1 %67, label %middle.block60, label %vector.body68, !llvm.loop !21

middle.block60:                                   ; preds = %vector.body68
  %bin.rdx75 = add <vscale x 2 x i32> %66, %65
  %68 = tail call i32 @llvm.vector.reduce.add.nxv2i32(<vscale x 2 x i32> %bin.rdx75)
  %cmp.n67 = icmp eq i64 %n.mod.vf64, 0
  br i1 %cmp.n67, label %cleanup, label %for.body.i26.preheader80

for.body.i26.preheader80:                         ; preds = %for.body.i26.preheader, %middle.block60
  %indvars.iv.i20.ph = phi i64 [ 0, %for.body.i26.preheader ], [ %n.vec65, %middle.block60 ]
  %sum.05.i21.ph = phi i32 [ 0, %for.body.i26.preheader ], [ %68, %middle.block60 ]
  br label %for.body.i26

for.body.i26:                                     ; preds = %for.body.i26.preheader80, %for.body.i26
  %indvars.iv.i20 = phi i64 [ %indvars.iv.next.i24, %for.body.i26 ], [ %indvars.iv.i20.ph, %for.body.i26.preheader80 ]
  %sum.05.i21 = phi i32 [ %add.i23, %for.body.i26 ], [ %sum.05.i21.ph, %for.body.i26.preheader80 ]
  %arrayidx.i22 = getelementptr inbounds i32, ptr %a, i64 %indvars.iv.i20
  %69 = load i32, ptr %arrayidx.i22, align 4, !tbaa !4
  %add.i23 = add nsw i32 %69, %sum.05.i21
  %indvars.iv.next.i24 = add nuw nsw i64 %indvars.iv.i20, 1
  %exitcond.not.i25 = icmp eq i64 %indvars.iv.next.i24, 2048
  br i1 %exitcond.not.i25, label %cleanup, label %for.body.i26, !llvm.loop !22

cleanup:                                          ; preds = %for.body.i26, %middle.block60, %vector_reduce_add_i32.exit
  %retval.0 = phi i32 [ -1, %vector_reduce_add_i32.exit ], [ %68, %middle.block60 ], [ %add.i23, %for.body.i26 ]
  call void @llvm.lifetime.end.p0(i64 8192, ptr nonnull %a) #6
  ret i32 %retval.0
}

; Function Attrs: argmemonly nocallback nofree nounwind willreturn writeonly
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i64 @llvm.vscale.i64() #5

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i32 @llvm.vscale.i32() #5

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i32 @llvm.vector.reduce.add.nxv2i32(<vscale x 2 x i32>) #5

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
!16 = distinct !{!16, !9, !12, !10}
!17 = distinct !{!17, !9, !10}
!18 = distinct !{!18, !9, !12, !10}
!19 = distinct !{!19, !9, !10}
!20 = distinct !{!20, !9, !12, !10}
!21 = distinct !{!21, !9, !10}
!22 = distinct !{!22, !9, !12, !10}
