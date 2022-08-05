; ModuleID = 'main.c'
source_filename = "main.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
target triple = "riscv64"

; Function Attrs: argmemonly nofree norecurse nosync nounwind
define dso_local void @vector_add_i32(ptr nocapture noundef %a, i32 noundef signext %a_len, i32 noundef signext %b) local_unnamed_addr #0 {
entry:
  %cmp.not4 = icmp eq i32 %a_len, 1
  br i1 %cmp.not4, label %for.cond.cleanup, label %iter.check

iter.check:                                       ; preds = %entry
  %0 = sext i32 %a_len to i64
  %1 = add nsw i64 %0, -1
  %2 = add i32 %a_len, -2
  %3 = zext i32 %2 to i64
  %4 = add nuw nsw i64 %3, 1
  %min.iters.check = icmp ult i32 %2, 15
  br i1 %min.iters.check, label %for.body.preheader, label %vector.main.loop.iter.check

vector.main.loop.iter.check:                      ; preds = %iter.check
  %min.iters.check6 = icmp ult i32 %2, 31
  br i1 %min.iters.check6, label %vec.epilog.ph, label %vector.ph

vector.ph:                                        ; preds = %vector.main.loop.iter.check
  %n.vec = and i64 %4, 8589934560
  %broadcast.splatinsert = insertelement <32 x i32> poison, i32 %b, i64 0
  %broadcast.splat = shufflevector <32 x i32> %broadcast.splatinsert, <32 x i32> poison, <32 x i32> zeroinitializer
  %5 = getelementptr i32, ptr %a, i64 -31
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %offset.idx = sub i64 %1, %index
  %6 = getelementptr i32, ptr %5, i64 %offset.idx
  %wide.load = load <32 x i32>, ptr %6, align 4, !tbaa !4
  %reverse = shufflevector <32 x i32> %wide.load, <32 x i32> poison, <32 x i32> <i32 31, i32 30, i32 29, i32 28, i32 27, i32 26, i32 25, i32 24, i32 23, i32 22, i32 21, i32 20, i32 19, i32 18, i32 17, i32 16, i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>
  %7 = add nsw <32 x i32> %reverse, %broadcast.splat
  %reverse7 = shufflevector <32 x i32> %7, <32 x i32> poison, <32 x i32> <i32 31, i32 30, i32 29, i32 28, i32 27, i32 26, i32 25, i32 24, i32 23, i32 22, i32 21, i32 20, i32 19, i32 18, i32 17, i32 16, i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>
  store <32 x i32> %reverse7, ptr %6, align 4, !tbaa !4
  %index.next = add nuw i64 %index, 32
  %8 = icmp eq i64 %index.next, %n.vec
  br i1 %8, label %middle.block, label %vector.body, !llvm.loop !8

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %4, %n.vec
  br i1 %cmp.n, label %for.cond.cleanup, label %vec.epilog.iter.check

vec.epilog.iter.check:                            ; preds = %middle.block
  %ind.end10 = sub nsw i64 %1, %n.vec
  %n.vec.remaining = and i64 %4, 16
  %min.epilog.iters.check.not.not = icmp eq i64 %n.vec.remaining, 0
  br i1 %min.epilog.iters.check.not.not, label %for.body.preheader, label %vec.epilog.ph

vec.epilog.ph:                                    ; preds = %vector.main.loop.iter.check, %vec.epilog.iter.check
  %vec.epilog.resume.val = phi i64 [ %n.vec, %vec.epilog.iter.check ], [ 0, %vector.main.loop.iter.check ]
  %n.vec9 = and i64 %4, 8589934576
  %ind.end = sub nsw i64 %1, %n.vec9
  %broadcast.splatinsert16 = insertelement <16 x i32> poison, i32 %b, i64 0
  %broadcast.splat17 = shufflevector <16 x i32> %broadcast.splatinsert16, <16 x i32> poison, <16 x i32> zeroinitializer
  %9 = getelementptr i32, ptr %a, i64 -15
  br label %vec.epilog.vector.body

vec.epilog.vector.body:                           ; preds = %vec.epilog.vector.body, %vec.epilog.ph
  %index12 = phi i64 [ %vec.epilog.resume.val, %vec.epilog.ph ], [ %index.next19, %vec.epilog.vector.body ]
  %offset.idx13 = sub i64 %1, %index12
  %10 = getelementptr i32, ptr %9, i64 %offset.idx13
  %wide.load14 = load <16 x i32>, ptr %10, align 4, !tbaa !4
  %reverse15 = shufflevector <16 x i32> %wide.load14, <16 x i32> poison, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>
  %11 = add nsw <16 x i32> %reverse15, %broadcast.splat17
  %reverse18 = shufflevector <16 x i32> %11, <16 x i32> poison, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>
  store <16 x i32> %reverse18, ptr %10, align 4, !tbaa !4
  %index.next19 = add nuw i64 %index12, 16
  %12 = icmp eq i64 %index.next19, %n.vec9
  br i1 %12, label %vec.epilog.middle.block, label %vec.epilog.vector.body, !llvm.loop !11

vec.epilog.middle.block:                          ; preds = %vec.epilog.vector.body
  %cmp.n11 = icmp eq i64 %4, %n.vec9
  br i1 %cmp.n11, label %for.cond.cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %iter.check, %vec.epilog.iter.check, %vec.epilog.middle.block
  %indvars.iv.ph = phi i64 [ %1, %iter.check ], [ %ind.end10, %vec.epilog.iter.check ], [ %ind.end, %vec.epilog.middle.block ]
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %middle.block, %vec.epilog.middle.block, %entry
  ret void

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ %indvars.iv.ph, %for.body.preheader ]
  %arrayidx = getelementptr inbounds i32, ptr %a, i64 %indvars.iv
  %13 = load i32, ptr %arrayidx, align 4, !tbaa !4
  %add = add nsw i32 %13, %b
  store i32 %add, ptr %arrayidx, align 4, !tbaa !4
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  %14 = and i64 %indvars.iv.next, 4294967295
  %cmp.not = icmp eq i64 %14, 0
  br i1 %cmp.not, label %for.cond.cleanup, label %for.body, !llvm.loop !13
}

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: argmemonly nofree norecurse nosync nounwind readonly
define dso_local signext i32 @vector_reduce_add_i32(ptr nocapture noundef readonly %a, i32 noundef signext %a_len) local_unnamed_addr #2 {
entry:
  %cmp4 = icmp sgt i32 %a_len, 0
  br i1 %cmp4, label %iter.check, label %for.cond.cleanup

iter.check:                                       ; preds = %entry
  %wide.trip.count = zext i32 %a_len to i64
  %min.iters.check = icmp ult i32 %a_len, 16
  br i1 %min.iters.check, label %for.body.preheader, label %vector.main.loop.iter.check

vector.main.loop.iter.check:                      ; preds = %iter.check
  %min.iters.check7 = icmp ult i32 %a_len, 64
  br i1 %min.iters.check7, label %vec.epilog.ph, label %vector.ph

vector.ph:                                        ; preds = %vector.main.loop.iter.check
  %n.vec = and i64 %wide.trip.count, 4294967232
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.phi = phi <32 x i32> [ zeroinitializer, %vector.ph ], [ %2, %vector.body ]
  %vec.phi8 = phi <32 x i32> [ zeroinitializer, %vector.ph ], [ %3, %vector.body ]
  %0 = getelementptr inbounds i32, ptr %a, i64 %index
  %wide.load = load <32 x i32>, ptr %0, align 4, !tbaa !4
  %1 = getelementptr inbounds i32, ptr %0, i64 32
  %wide.load9 = load <32 x i32>, ptr %1, align 4, !tbaa !4
  %2 = add <32 x i32> %wide.load, %vec.phi
  %3 = add <32 x i32> %wide.load9, %vec.phi8
  %index.next = add nuw i64 %index, 64
  %4 = icmp eq i64 %index.next, %n.vec
  br i1 %4, label %middle.block, label %vector.body, !llvm.loop !14

middle.block:                                     ; preds = %vector.body
  %bin.rdx = add <32 x i32> %3, %2
  %5 = tail call i32 @llvm.vector.reduce.add.v32i32(<32 x i32> %bin.rdx)
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br i1 %cmp.n, label %for.cond.cleanup, label %vec.epilog.iter.check

vec.epilog.iter.check:                            ; preds = %middle.block
  %n.vec.remaining = and i64 %wide.trip.count, 48
  %min.epilog.iters.check = icmp eq i64 %n.vec.remaining, 0
  br i1 %min.epilog.iters.check, label %for.body.preheader, label %vec.epilog.ph

vec.epilog.ph:                                    ; preds = %vector.main.loop.iter.check, %vec.epilog.iter.check
  %bc.merge.rdx = phi i32 [ 0, %vector.main.loop.iter.check ], [ %5, %vec.epilog.iter.check ]
  %vec.epilog.resume.val = phi i64 [ 0, %vector.main.loop.iter.check ], [ %n.vec, %vec.epilog.iter.check ]
  %n.vec11 = and i64 %wide.trip.count, 4294967280
  %6 = insertelement <16 x i32> <i32 poison, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, i32 %bc.merge.rdx, i64 0
  br label %vec.epilog.vector.body

vec.epilog.vector.body:                           ; preds = %vec.epilog.vector.body, %vec.epilog.ph
  %offset.idx = phi i64 [ %vec.epilog.resume.val, %vec.epilog.ph ], [ %index.next16, %vec.epilog.vector.body ]
  %vec.phi14 = phi <16 x i32> [ %6, %vec.epilog.ph ], [ %8, %vec.epilog.vector.body ]
  %7 = getelementptr inbounds i32, ptr %a, i64 %offset.idx
  %wide.load15 = load <16 x i32>, ptr %7, align 4, !tbaa !4
  %8 = add <16 x i32> %wide.load15, %vec.phi14
  %index.next16 = add nuw i64 %offset.idx, 16
  %9 = icmp eq i64 %index.next16, %n.vec11
  br i1 %9, label %vec.epilog.middle.block, label %vec.epilog.vector.body, !llvm.loop !15

vec.epilog.middle.block:                          ; preds = %vec.epilog.vector.body
  %10 = tail call i32 @llvm.vector.reduce.add.v16i32(<16 x i32> %8)
  %cmp.n12 = icmp eq i64 %n.vec11, %wide.trip.count
  br i1 %cmp.n12, label %for.cond.cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %iter.check, %vec.epilog.iter.check, %vec.epilog.middle.block
  %indvars.iv.ph = phi i64 [ 0, %iter.check ], [ %n.vec, %vec.epilog.iter.check ], [ %n.vec11, %vec.epilog.middle.block ]
  %sum.05.ph = phi i32 [ 0, %iter.check ], [ %5, %vec.epilog.iter.check ], [ %10, %vec.epilog.middle.block ]
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %middle.block, %vec.epilog.middle.block, %entry
  %sum.0.lcssa = phi i32 [ 0, %entry ], [ %5, %middle.block ], [ %10, %vec.epilog.middle.block ], [ %add, %for.body ]
  ret i32 %sum.0.lcssa

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ %indvars.iv.ph, %for.body.preheader ]
  %sum.05 = phi i32 [ %add, %for.body ], [ %sum.05.ph, %for.body.preheader ]
  %arrayidx = getelementptr inbounds i32, ptr %a, i64 %indvars.iv
  %11 = load i32, ptr %arrayidx, align 4, !tbaa !4
  %add = add nsw i32 %11, %sum.05
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !llvm.loop !16
}

; Function Attrs: nofree nosync nounwind readnone
define dso_local signext i32 @main() local_unnamed_addr #3 {
iter.check:
  %a = alloca [2048 x i32], align 4
  call void @llvm.lifetime.start.p0(i64 8192, ptr nonnull %a) #6
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 4 dereferenceable(8192) %a, i8 0, i64 8192, i1 false), !tbaa !4
  %0 = getelementptr i32, ptr %a, i64 -31
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %iter.check
  %index = phi i64 [ 0, %iter.check ], [ %index.next, %vector.body ]
  %offset.idx = sub i64 2047, %index
  %1 = getelementptr i32, ptr %0, i64 %offset.idx
  %wide.load = load <32 x i32>, ptr %1, align 4, !tbaa !4
  %2 = add nsw <32 x i32> %wide.load, <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>
  store <32 x i32> %2, ptr %1, align 4, !tbaa !4
  %index.next = add nuw i64 %index, 32
  %3 = icmp eq i64 %index.next, 2016
  br i1 %3, label %vec.epilog.vector.body, label %vector.body, !llvm.loop !17

vec.epilog.vector.body:                           ; preds = %vector.body
  %4 = getelementptr inbounds i32, ptr %a, i64 16
  %wide.load33 = load <16 x i32>, ptr %4, align 4, !tbaa !4
  %5 = add nsw <16 x i32> %wide.load33, <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>
  store <16 x i32> %5, ptr %4, align 4, !tbaa !4
  %arrayidx.i = getelementptr inbounds i32, ptr %a, i64 15
  %6 = load i32, ptr %arrayidx.i, align 4, !tbaa !4
  %add.i = add nsw i32 %6, 1
  store i32 %add.i, ptr %arrayidx.i, align 4, !tbaa !4
  %arrayidx.i.1 = getelementptr inbounds i32, ptr %a, i64 14
  %7 = load i32, ptr %arrayidx.i.1, align 4, !tbaa !4
  %add.i.1 = add nsw i32 %7, 1
  store i32 %add.i.1, ptr %arrayidx.i.1, align 4, !tbaa !4
  %arrayidx.i.2 = getelementptr inbounds i32, ptr %a, i64 13
  %8 = load i32, ptr %arrayidx.i.2, align 4, !tbaa !4
  %add.i.2 = add nsw i32 %8, 1
  store i32 %add.i.2, ptr %arrayidx.i.2, align 4, !tbaa !4
  %arrayidx.i.3 = getelementptr inbounds i32, ptr %a, i64 12
  %9 = load i32, ptr %arrayidx.i.3, align 4, !tbaa !4
  %add.i.3 = add nsw i32 %9, 1
  store i32 %add.i.3, ptr %arrayidx.i.3, align 4, !tbaa !4
  %arrayidx.i.4 = getelementptr inbounds i32, ptr %a, i64 11
  %10 = load i32, ptr %arrayidx.i.4, align 4, !tbaa !4
  %add.i.4 = add nsw i32 %10, 1
  store i32 %add.i.4, ptr %arrayidx.i.4, align 4, !tbaa !4
  %arrayidx.i.5 = getelementptr inbounds i32, ptr %a, i64 10
  %11 = load i32, ptr %arrayidx.i.5, align 4, !tbaa !4
  %add.i.5 = add nsw i32 %11, 1
  store i32 %add.i.5, ptr %arrayidx.i.5, align 4, !tbaa !4
  %arrayidx.i.6 = getelementptr inbounds i32, ptr %a, i64 9
  %12 = load i32, ptr %arrayidx.i.6, align 4, !tbaa !4
  %add.i.6 = add nsw i32 %12, 1
  store i32 %add.i.6, ptr %arrayidx.i.6, align 4, !tbaa !4
  %arrayidx.i.7 = getelementptr inbounds i32, ptr %a, i64 8
  %13 = load i32, ptr %arrayidx.i.7, align 4, !tbaa !4
  %add.i.7 = add nsw i32 %13, 1
  store i32 %add.i.7, ptr %arrayidx.i.7, align 4, !tbaa !4
  %arrayidx.i.8 = getelementptr inbounds i32, ptr %a, i64 7
  %14 = load i32, ptr %arrayidx.i.8, align 4, !tbaa !4
  %add.i.8 = add nsw i32 %14, 1
  store i32 %add.i.8, ptr %arrayidx.i.8, align 4, !tbaa !4
  %arrayidx.i.9 = getelementptr inbounds i32, ptr %a, i64 6
  %15 = load i32, ptr %arrayidx.i.9, align 4, !tbaa !4
  %add.i.9 = add nsw i32 %15, 1
  store i32 %add.i.9, ptr %arrayidx.i.9, align 4, !tbaa !4
  %arrayidx.i.10 = getelementptr inbounds i32, ptr %a, i64 5
  %16 = load i32, ptr %arrayidx.i.10, align 4, !tbaa !4
  %add.i.10 = add nsw i32 %16, 1
  store i32 %add.i.10, ptr %arrayidx.i.10, align 4, !tbaa !4
  %arrayidx.i.11 = getelementptr inbounds i32, ptr %a, i64 4
  %17 = load i32, ptr %arrayidx.i.11, align 4, !tbaa !4
  %add.i.11 = add nsw i32 %17, 1
  store i32 %add.i.11, ptr %arrayidx.i.11, align 4, !tbaa !4
  %arrayidx.i.12 = getelementptr inbounds i32, ptr %a, i64 3
  %18 = load i32, ptr %arrayidx.i.12, align 4, !tbaa !4
  %add.i.12 = add nsw i32 %18, 1
  store i32 %add.i.12, ptr %arrayidx.i.12, align 4, !tbaa !4
  %arrayidx.i.13 = getelementptr inbounds i32, ptr %a, i64 2
  %19 = load i32, ptr %arrayidx.i.13, align 4, !tbaa !4
  %add.i.13 = add nsw i32 %19, 1
  store i32 %add.i.13, ptr %arrayidx.i.13, align 4, !tbaa !4
  %arrayidx.i.14 = getelementptr inbounds i32, ptr %a, i64 1
  %20 = load i32, ptr %arrayidx.i.14, align 4, !tbaa !4
  %add.i.14 = add nsw i32 %20, 1
  store i32 %add.i.14, ptr %arrayidx.i.14, align 4, !tbaa !4
  br label %vector.body43

vector.body43:                                    ; preds = %vec.epilog.vector.body, %vector.body43
  %index44 = phi i64 [ %index.next48, %vector.body43 ], [ 0, %vec.epilog.vector.body ]
  %vec.phi = phi <32 x i32> [ %23, %vector.body43 ], [ zeroinitializer, %vec.epilog.vector.body ]
  %vec.phi45 = phi <32 x i32> [ %24, %vector.body43 ], [ zeroinitializer, %vec.epilog.vector.body ]
  %21 = getelementptr inbounds i32, ptr %a, i64 %index44
  %wide.load46 = load <32 x i32>, ptr %21, align 4, !tbaa !4
  %22 = getelementptr inbounds i32, ptr %21, i64 32
  %wide.load47 = load <32 x i32>, ptr %22, align 4, !tbaa !4
  %23 = add <32 x i32> %wide.load46, %vec.phi
  %24 = add <32 x i32> %wide.load47, %vec.phi45
  %index.next48 = add nuw i64 %index44, 64
  %25 = icmp eq i64 %index.next48, 2048
  br i1 %25, label %middle.block37, label %vector.body43, !llvm.loop !18

middle.block37:                                   ; preds = %vector.body43
  %bin.rdx = add <32 x i32> %24, %23
  %26 = tail call i32 @llvm.vector.reduce.add.v32i32(<32 x i32> %bin.rdx)
  %cmp2.not = icmp eq i32 %26, 2048
  br i1 %cmp2.not, label %vector.body69.preheader, label %cleanup

vector.body69.preheader:                          ; preds = %middle.block37
  %27 = getelementptr i32, ptr %a, i64 -31
  br label %vector.body69

vector.body69:                                    ; preds = %vector.body69.preheader, %vector.body69
  %index70 = phi i64 [ %index.next75, %vector.body69 ], [ 0, %vector.body69.preheader ]
  %offset.idx71 = sub i64 2047, %index70
  %28 = getelementptr i32, ptr %27, i64 %offset.idx71
  %wide.load72 = load <32 x i32>, ptr %28, align 4, !tbaa !4
  %29 = add nsw <32 x i32> %wide.load72, <i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1>
  store <32 x i32> %29, ptr %28, align 4, !tbaa !4
  %index.next75 = add nuw i64 %index70, 32
  %30 = icmp eq i64 %index.next75, 2016
  br i1 %30, label %vec.epilog.vector.body83, label %vector.body69, !llvm.loop !19

vec.epilog.vector.body83:                         ; preds = %vector.body69
  %31 = getelementptr inbounds i32, ptr %a, i64 16
  %wide.load86 = load <16 x i32>, ptr %31, align 4, !tbaa !4
  %32 = add nsw <16 x i32> %wide.load86, <i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1>
  store <16 x i32> %32, ptr %31, align 4, !tbaa !4
  %arrayidx.i14 = getelementptr inbounds i32, ptr %a, i64 15
  %33 = load i32, ptr %arrayidx.i14, align 4, !tbaa !4
  %add.i15 = add nsw i32 %33, -1
  store i32 %add.i15, ptr %arrayidx.i14, align 4, !tbaa !4
  %arrayidx.i14.1 = getelementptr inbounds i32, ptr %a, i64 14
  %34 = load i32, ptr %arrayidx.i14.1, align 4, !tbaa !4
  %add.i15.1 = add nsw i32 %34, -1
  store i32 %add.i15.1, ptr %arrayidx.i14.1, align 4, !tbaa !4
  %arrayidx.i14.2 = getelementptr inbounds i32, ptr %a, i64 13
  %35 = load i32, ptr %arrayidx.i14.2, align 4, !tbaa !4
  %add.i15.2 = add nsw i32 %35, -1
  store i32 %add.i15.2, ptr %arrayidx.i14.2, align 4, !tbaa !4
  %arrayidx.i14.3 = getelementptr inbounds i32, ptr %a, i64 12
  %36 = load i32, ptr %arrayidx.i14.3, align 4, !tbaa !4
  %add.i15.3 = add nsw i32 %36, -1
  store i32 %add.i15.3, ptr %arrayidx.i14.3, align 4, !tbaa !4
  %arrayidx.i14.4 = getelementptr inbounds i32, ptr %a, i64 11
  %37 = load i32, ptr %arrayidx.i14.4, align 4, !tbaa !4
  %add.i15.4 = add nsw i32 %37, -1
  store i32 %add.i15.4, ptr %arrayidx.i14.4, align 4, !tbaa !4
  %arrayidx.i14.5 = getelementptr inbounds i32, ptr %a, i64 10
  %38 = load i32, ptr %arrayidx.i14.5, align 4, !tbaa !4
  %add.i15.5 = add nsw i32 %38, -1
  store i32 %add.i15.5, ptr %arrayidx.i14.5, align 4, !tbaa !4
  %arrayidx.i14.6 = getelementptr inbounds i32, ptr %a, i64 9
  %39 = load i32, ptr %arrayidx.i14.6, align 4, !tbaa !4
  %add.i15.6 = add nsw i32 %39, -1
  store i32 %add.i15.6, ptr %arrayidx.i14.6, align 4, !tbaa !4
  %arrayidx.i14.7 = getelementptr inbounds i32, ptr %a, i64 8
  %40 = load i32, ptr %arrayidx.i14.7, align 4, !tbaa !4
  %add.i15.7 = add nsw i32 %40, -1
  store i32 %add.i15.7, ptr %arrayidx.i14.7, align 4, !tbaa !4
  %arrayidx.i14.8 = getelementptr inbounds i32, ptr %a, i64 7
  %41 = load i32, ptr %arrayidx.i14.8, align 4, !tbaa !4
  %add.i15.8 = add nsw i32 %41, -1
  store i32 %add.i15.8, ptr %arrayidx.i14.8, align 4, !tbaa !4
  %arrayidx.i14.9 = getelementptr inbounds i32, ptr %a, i64 6
  %42 = load i32, ptr %arrayidx.i14.9, align 4, !tbaa !4
  %add.i15.9 = add nsw i32 %42, -1
  store i32 %add.i15.9, ptr %arrayidx.i14.9, align 4, !tbaa !4
  %arrayidx.i14.10 = getelementptr inbounds i32, ptr %a, i64 5
  %43 = load i32, ptr %arrayidx.i14.10, align 4, !tbaa !4
  %add.i15.10 = add nsw i32 %43, -1
  store i32 %add.i15.10, ptr %arrayidx.i14.10, align 4, !tbaa !4
  %arrayidx.i14.11 = getelementptr inbounds i32, ptr %a, i64 4
  %44 = load i32, ptr %arrayidx.i14.11, align 4, !tbaa !4
  %add.i15.11 = add nsw i32 %44, -1
  store i32 %add.i15.11, ptr %arrayidx.i14.11, align 4, !tbaa !4
  %arrayidx.i14.12 = getelementptr inbounds i32, ptr %a, i64 3
  %45 = load i32, ptr %arrayidx.i14.12, align 4, !tbaa !4
  %add.i15.12 = add nsw i32 %45, -1
  store i32 %add.i15.12, ptr %arrayidx.i14.12, align 4, !tbaa !4
  %arrayidx.i14.13 = getelementptr inbounds i32, ptr %a, i64 2
  %46 = load i32, ptr %arrayidx.i14.13, align 4, !tbaa !4
  %add.i15.13 = add nsw i32 %46, -1
  store i32 %add.i15.13, ptr %arrayidx.i14.13, align 4, !tbaa !4
  %arrayidx.i14.14 = getelementptr inbounds i32, ptr %a, i64 1
  %47 = load i32, ptr %arrayidx.i14.14, align 4, !tbaa !4
  %add.i15.14 = add nsw i32 %47, -1
  store i32 %add.i15.14, ptr %arrayidx.i14.14, align 4, !tbaa !4
  br label %vector.body96

vector.body96:                                    ; preds = %vec.epilog.vector.body83, %vector.body96
  %index97 = phi i64 [ %index.next102, %vector.body96 ], [ 0, %vec.epilog.vector.body83 ]
  %vec.phi98 = phi <32 x i32> [ %50, %vector.body96 ], [ zeroinitializer, %vec.epilog.vector.body83 ]
  %vec.phi99 = phi <32 x i32> [ %51, %vector.body96 ], [ zeroinitializer, %vec.epilog.vector.body83 ]
  %48 = getelementptr inbounds i32, ptr %a, i64 %index97
  %wide.load100 = load <32 x i32>, ptr %48, align 4, !tbaa !4
  %49 = getelementptr inbounds i32, ptr %48, i64 32
  %wide.load101 = load <32 x i32>, ptr %49, align 4, !tbaa !4
  %50 = add <32 x i32> %wide.load100, %vec.phi98
  %51 = add <32 x i32> %wide.load101, %vec.phi99
  %index.next102 = add nuw i64 %index97, 64
  %52 = icmp eq i64 %index.next102, 2048
  br i1 %52, label %middle.block90, label %vector.body96, !llvm.loop !20

middle.block90:                                   ; preds = %vector.body96
  %bin.rdx103 = add <32 x i32> %51, %50
  %53 = tail call i32 @llvm.vector.reduce.add.v32i32(<32 x i32> %bin.rdx103)
  br label %cleanup

cleanup:                                          ; preds = %middle.block90, %middle.block37
  %retval.0 = phi i32 [ -1, %middle.block37 ], [ %53, %middle.block90 ]
  call void @llvm.lifetime.end.p0(i64 8192, ptr nonnull %a) #6
  ret i32 %retval.0
}

; Function Attrs: argmemonly nocallback nofree nounwind willreturn writeonly
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i32 @llvm.vector.reduce.add.v32i32(<32 x i32>) #5

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i32 @llvm.vector.reduce.add.v16i32(<16 x i32>) #5

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
!11 = distinct !{!11, !9, !10, !12}
!12 = !{!"llvm.loop.unroll.runtime.disable"}
!13 = distinct !{!13, !9, !12, !10}
!14 = distinct !{!14, !9, !10}
!15 = distinct !{!15, !9, !10, !12}
!16 = distinct !{!16, !9, !12, !10}
!17 = distinct !{!17, !9, !10}
!18 = distinct !{!18, !9, !10}
!19 = distinct !{!19, !9, !10}
!20 = distinct !{!20, !9, !10}
