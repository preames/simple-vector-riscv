; ModuleID = 'vector_sum_abs_diff.c'
source_filename = "vector_sum_abs_diff.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
target triple = "riscv64"

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define dso_local signext i8 @sub(i8 noundef signext %a, i8 noundef signext %b) local_unnamed_addr #0 {
entry:
  %sub = sub i8 %a, %b
  ret i8 %sub
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define dso_local signext i8 @myabs(i8 noundef signext %c) local_unnamed_addr #0 {
entry:
  %0 = tail call i8 @llvm.abs.i8(i8 %c, i1 false)
  ret i8 %0
}

; Function Attrs: argmemonly nofree nosync nounwind
define dso_local void @vector_sum_abs_diff(ptr nocapture noundef writeonly %c, ptr nocapture noundef readonly %a, ptr nocapture noundef readonly %b, i32 noundef signext %N) local_unnamed_addr #1 {
entry:
  %cmp26.not = icmp ult i32 %N, 8
  br i1 %cmp26.not, label %for.cond.cleanup, label %for.cond1.preheader.preheader

for.cond1.preheader.preheader:                    ; preds = %entry
  %div23 = lshr i32 %N, 3
  %wide.trip.count = zext i32 %div23 to i64
  %0 = tail call i64 @llvm.vscale.i64()
  %1 = shl i64 %0, 1
  %2 = tail call i64 @llvm.umax.i64(i64 %1, i64 8)
  %min.iters.check = icmp ugt i64 %2, %wide.trip.count
  br i1 %min.iters.check, label %for.cond1.preheader.preheader50, label %vector.memcheck

vector.memcheck:                                  ; preds = %for.cond1.preheader.preheader
  %3 = shl nuw nsw i64 %wide.trip.count, 2
  %uglygep = getelementptr i8, ptr %c, i64 %3
  %4 = shl nuw nsw i64 %wide.trip.count, 3
  %uglygep30 = getelementptr i8, ptr %a, i64 %4
  %uglygep31 = getelementptr i8, ptr %b, i64 %4
  %bound0 = icmp ugt ptr %uglygep30, %c
  %bound1 = icmp ugt ptr %uglygep, %a
  %found.conflict = and i1 %bound0, %bound1
  %bound032 = icmp ugt ptr %uglygep31, %c
  %bound133 = icmp ugt ptr %uglygep, %b
  %found.conflict34 = and i1 %bound032, %bound133
  %conflict.rdx = or i1 %found.conflict, %found.conflict34
  br i1 %conflict.rdx, label %for.cond1.preheader.preheader50, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %5 = tail call i64 @llvm.vscale.i64()
  %6 = shl i64 %5, 1
  %n.mod.vf = urem i64 %wide.trip.count, %6
  %n.vec = sub nuw nsw i64 %wide.trip.count, %n.mod.vf
  %7 = tail call <vscale x 2 x i64> @llvm.experimental.stepvector.nxv2i64()
  %8 = tail call i64 @llvm.vscale.i64()
  %9 = shl i64 %8, 1
  %.splatinsert = insertelement <vscale x 2 x i64> poison, i64 %9, i64 0
  %.splat = shufflevector <vscale x 2 x i64> %.splatinsert, <vscale x 2 x i64> poison, <vscale x 2 x i32> zeroinitializer
  %10 = tail call i64 @llvm.vscale.i64()
  %11 = shl i64 %10, 1
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <vscale x 2 x i64> [ %7, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %12 = shl <vscale x 2 x i64> %vec.ind, shufflevector (<vscale x 2 x i64> insertelement (<vscale x 2 x i64> poison, i64 3, i32 0), <vscale x 2 x i64> poison, <vscale x 2 x i32> zeroinitializer)
  %13 = getelementptr inbounds i8, ptr %a, <vscale x 2 x i64> %12
  %wide.masked.gather = tail call <vscale x 2 x i8> @llvm.masked.gather.nxv2i8.nxv2p0(<vscale x 2 x ptr> %13, i32 1, <vscale x 2 x i1> shufflevector (<vscale x 2 x i1> insertelement (<vscale x 2 x i1> poison, i1 true, i32 0), <vscale x 2 x i1> poison, <vscale x 2 x i32> zeroinitializer), <vscale x 2 x i8> poison), !tbaa !4, !alias.scope !7
  %14 = getelementptr inbounds i8, ptr %b, <vscale x 2 x i64> %12
  %wide.masked.gather35 = tail call <vscale x 2 x i8> @llvm.masked.gather.nxv2i8.nxv2p0(<vscale x 2 x ptr> %14, i32 1, <vscale x 2 x i1> shufflevector (<vscale x 2 x i1> insertelement (<vscale x 2 x i1> poison, i1 true, i32 0), <vscale x 2 x i1> poison, <vscale x 2 x i32> zeroinitializer), <vscale x 2 x i8> poison), !tbaa !4, !alias.scope !10
  %15 = sub <vscale x 2 x i8> %wide.masked.gather, %wide.masked.gather35
  %16 = tail call <vscale x 2 x i8> @llvm.abs.nxv2i8(<vscale x 2 x i8> %15, i1 false)
  %17 = sext <vscale x 2 x i8> %16 to <vscale x 2 x i32>
  %18 = or <vscale x 2 x i64> %12, shufflevector (<vscale x 2 x i64> insertelement (<vscale x 2 x i64> poison, i64 1, i32 0), <vscale x 2 x i64> poison, <vscale x 2 x i32> zeroinitializer)
  %19 = getelementptr inbounds i8, ptr %a, <vscale x 2 x i64> %18
  %wide.masked.gather36 = tail call <vscale x 2 x i8> @llvm.masked.gather.nxv2i8.nxv2p0(<vscale x 2 x ptr> %19, i32 1, <vscale x 2 x i1> shufflevector (<vscale x 2 x i1> insertelement (<vscale x 2 x i1> poison, i1 true, i32 0), <vscale x 2 x i1> poison, <vscale x 2 x i32> zeroinitializer), <vscale x 2 x i8> poison), !tbaa !4, !alias.scope !7
  %20 = getelementptr inbounds i8, ptr %b, <vscale x 2 x i64> %18
  %wide.masked.gather37 = tail call <vscale x 2 x i8> @llvm.masked.gather.nxv2i8.nxv2p0(<vscale x 2 x ptr> %20, i32 1, <vscale x 2 x i1> shufflevector (<vscale x 2 x i1> insertelement (<vscale x 2 x i1> poison, i1 true, i32 0), <vscale x 2 x i1> poison, <vscale x 2 x i32> zeroinitializer), <vscale x 2 x i8> poison), !tbaa !4, !alias.scope !10
  %21 = sub <vscale x 2 x i8> %wide.masked.gather36, %wide.masked.gather37
  %22 = tail call <vscale x 2 x i8> @llvm.abs.nxv2i8(<vscale x 2 x i8> %21, i1 false)
  %23 = sext <vscale x 2 x i8> %22 to <vscale x 2 x i32>
  %24 = add nsw <vscale x 2 x i32> %17, %23
  %25 = or <vscale x 2 x i64> %12, shufflevector (<vscale x 2 x i64> insertelement (<vscale x 2 x i64> poison, i64 2, i32 0), <vscale x 2 x i64> poison, <vscale x 2 x i32> zeroinitializer)
  %26 = getelementptr inbounds i8, ptr %a, <vscale x 2 x i64> %25
  %wide.masked.gather38 = tail call <vscale x 2 x i8> @llvm.masked.gather.nxv2i8.nxv2p0(<vscale x 2 x ptr> %26, i32 1, <vscale x 2 x i1> shufflevector (<vscale x 2 x i1> insertelement (<vscale x 2 x i1> poison, i1 true, i32 0), <vscale x 2 x i1> poison, <vscale x 2 x i32> zeroinitializer), <vscale x 2 x i8> poison), !tbaa !4, !alias.scope !7
  %27 = getelementptr inbounds i8, ptr %b, <vscale x 2 x i64> %25
  %wide.masked.gather39 = tail call <vscale x 2 x i8> @llvm.masked.gather.nxv2i8.nxv2p0(<vscale x 2 x ptr> %27, i32 1, <vscale x 2 x i1> shufflevector (<vscale x 2 x i1> insertelement (<vscale x 2 x i1> poison, i1 true, i32 0), <vscale x 2 x i1> poison, <vscale x 2 x i32> zeroinitializer), <vscale x 2 x i8> poison), !tbaa !4, !alias.scope !10
  %28 = sub <vscale x 2 x i8> %wide.masked.gather38, %wide.masked.gather39
  %29 = tail call <vscale x 2 x i8> @llvm.abs.nxv2i8(<vscale x 2 x i8> %28, i1 false)
  %30 = sext <vscale x 2 x i8> %29 to <vscale x 2 x i32>
  %31 = add nsw <vscale x 2 x i32> %24, %30
  %32 = or <vscale x 2 x i64> %12, shufflevector (<vscale x 2 x i64> insertelement (<vscale x 2 x i64> poison, i64 3, i32 0), <vscale x 2 x i64> poison, <vscale x 2 x i32> zeroinitializer)
  %33 = getelementptr inbounds i8, ptr %a, <vscale x 2 x i64> %32
  %wide.masked.gather40 = tail call <vscale x 2 x i8> @llvm.masked.gather.nxv2i8.nxv2p0(<vscale x 2 x ptr> %33, i32 1, <vscale x 2 x i1> shufflevector (<vscale x 2 x i1> insertelement (<vscale x 2 x i1> poison, i1 true, i32 0), <vscale x 2 x i1> poison, <vscale x 2 x i32> zeroinitializer), <vscale x 2 x i8> poison), !tbaa !4, !alias.scope !7
  %34 = getelementptr inbounds i8, ptr %b, <vscale x 2 x i64> %32
  %wide.masked.gather41 = tail call <vscale x 2 x i8> @llvm.masked.gather.nxv2i8.nxv2p0(<vscale x 2 x ptr> %34, i32 1, <vscale x 2 x i1> shufflevector (<vscale x 2 x i1> insertelement (<vscale x 2 x i1> poison, i1 true, i32 0), <vscale x 2 x i1> poison, <vscale x 2 x i32> zeroinitializer), <vscale x 2 x i8> poison), !tbaa !4, !alias.scope !10
  %35 = sub <vscale x 2 x i8> %wide.masked.gather40, %wide.masked.gather41
  %36 = tail call <vscale x 2 x i8> @llvm.abs.nxv2i8(<vscale x 2 x i8> %35, i1 false)
  %37 = sext <vscale x 2 x i8> %36 to <vscale x 2 x i32>
  %38 = add nsw <vscale x 2 x i32> %31, %37
  %39 = or <vscale x 2 x i64> %12, shufflevector (<vscale x 2 x i64> insertelement (<vscale x 2 x i64> poison, i64 4, i32 0), <vscale x 2 x i64> poison, <vscale x 2 x i32> zeroinitializer)
  %40 = getelementptr inbounds i8, ptr %a, <vscale x 2 x i64> %39
  %wide.masked.gather42 = tail call <vscale x 2 x i8> @llvm.masked.gather.nxv2i8.nxv2p0(<vscale x 2 x ptr> %40, i32 1, <vscale x 2 x i1> shufflevector (<vscale x 2 x i1> insertelement (<vscale x 2 x i1> poison, i1 true, i32 0), <vscale x 2 x i1> poison, <vscale x 2 x i32> zeroinitializer), <vscale x 2 x i8> poison), !tbaa !4, !alias.scope !7
  %41 = getelementptr inbounds i8, ptr %b, <vscale x 2 x i64> %39
  %wide.masked.gather43 = tail call <vscale x 2 x i8> @llvm.masked.gather.nxv2i8.nxv2p0(<vscale x 2 x ptr> %41, i32 1, <vscale x 2 x i1> shufflevector (<vscale x 2 x i1> insertelement (<vscale x 2 x i1> poison, i1 true, i32 0), <vscale x 2 x i1> poison, <vscale x 2 x i32> zeroinitializer), <vscale x 2 x i8> poison), !tbaa !4, !alias.scope !10
  %42 = sub <vscale x 2 x i8> %wide.masked.gather42, %wide.masked.gather43
  %43 = tail call <vscale x 2 x i8> @llvm.abs.nxv2i8(<vscale x 2 x i8> %42, i1 false)
  %44 = sext <vscale x 2 x i8> %43 to <vscale x 2 x i32>
  %45 = add nsw <vscale x 2 x i32> %38, %44
  %46 = or <vscale x 2 x i64> %12, shufflevector (<vscale x 2 x i64> insertelement (<vscale x 2 x i64> poison, i64 5, i32 0), <vscale x 2 x i64> poison, <vscale x 2 x i32> zeroinitializer)
  %47 = getelementptr inbounds i8, ptr %a, <vscale x 2 x i64> %46
  %wide.masked.gather44 = tail call <vscale x 2 x i8> @llvm.masked.gather.nxv2i8.nxv2p0(<vscale x 2 x ptr> %47, i32 1, <vscale x 2 x i1> shufflevector (<vscale x 2 x i1> insertelement (<vscale x 2 x i1> poison, i1 true, i32 0), <vscale x 2 x i1> poison, <vscale x 2 x i32> zeroinitializer), <vscale x 2 x i8> poison), !tbaa !4, !alias.scope !7
  %48 = getelementptr inbounds i8, ptr %b, <vscale x 2 x i64> %46
  %wide.masked.gather45 = tail call <vscale x 2 x i8> @llvm.masked.gather.nxv2i8.nxv2p0(<vscale x 2 x ptr> %48, i32 1, <vscale x 2 x i1> shufflevector (<vscale x 2 x i1> insertelement (<vscale x 2 x i1> poison, i1 true, i32 0), <vscale x 2 x i1> poison, <vscale x 2 x i32> zeroinitializer), <vscale x 2 x i8> poison), !tbaa !4, !alias.scope !10
  %49 = sub <vscale x 2 x i8> %wide.masked.gather44, %wide.masked.gather45
  %50 = tail call <vscale x 2 x i8> @llvm.abs.nxv2i8(<vscale x 2 x i8> %49, i1 false)
  %51 = sext <vscale x 2 x i8> %50 to <vscale x 2 x i32>
  %52 = add nsw <vscale x 2 x i32> %45, %51
  %53 = or <vscale x 2 x i64> %12, shufflevector (<vscale x 2 x i64> insertelement (<vscale x 2 x i64> poison, i64 6, i32 0), <vscale x 2 x i64> poison, <vscale x 2 x i32> zeroinitializer)
  %54 = getelementptr inbounds i8, ptr %a, <vscale x 2 x i64> %53
  %wide.masked.gather46 = tail call <vscale x 2 x i8> @llvm.masked.gather.nxv2i8.nxv2p0(<vscale x 2 x ptr> %54, i32 1, <vscale x 2 x i1> shufflevector (<vscale x 2 x i1> insertelement (<vscale x 2 x i1> poison, i1 true, i32 0), <vscale x 2 x i1> poison, <vscale x 2 x i32> zeroinitializer), <vscale x 2 x i8> poison), !tbaa !4, !alias.scope !7
  %55 = getelementptr inbounds i8, ptr %b, <vscale x 2 x i64> %53
  %wide.masked.gather47 = tail call <vscale x 2 x i8> @llvm.masked.gather.nxv2i8.nxv2p0(<vscale x 2 x ptr> %55, i32 1, <vscale x 2 x i1> shufflevector (<vscale x 2 x i1> insertelement (<vscale x 2 x i1> poison, i1 true, i32 0), <vscale x 2 x i1> poison, <vscale x 2 x i32> zeroinitializer), <vscale x 2 x i8> poison), !tbaa !4, !alias.scope !10
  %56 = sub <vscale x 2 x i8> %wide.masked.gather46, %wide.masked.gather47
  %57 = tail call <vscale x 2 x i8> @llvm.abs.nxv2i8(<vscale x 2 x i8> %56, i1 false)
  %58 = sext <vscale x 2 x i8> %57 to <vscale x 2 x i32>
  %59 = add nsw <vscale x 2 x i32> %52, %58
  %60 = or <vscale x 2 x i64> %12, shufflevector (<vscale x 2 x i64> insertelement (<vscale x 2 x i64> poison, i64 7, i32 0), <vscale x 2 x i64> poison, <vscale x 2 x i32> zeroinitializer)
  %61 = getelementptr inbounds i8, ptr %a, <vscale x 2 x i64> %60
  %wide.masked.gather48 = tail call <vscale x 2 x i8> @llvm.masked.gather.nxv2i8.nxv2p0(<vscale x 2 x ptr> %61, i32 1, <vscale x 2 x i1> shufflevector (<vscale x 2 x i1> insertelement (<vscale x 2 x i1> poison, i1 true, i32 0), <vscale x 2 x i1> poison, <vscale x 2 x i32> zeroinitializer), <vscale x 2 x i8> poison), !tbaa !4, !alias.scope !7
  %62 = getelementptr inbounds i8, ptr %b, <vscale x 2 x i64> %60
  %wide.masked.gather49 = tail call <vscale x 2 x i8> @llvm.masked.gather.nxv2i8.nxv2p0(<vscale x 2 x ptr> %62, i32 1, <vscale x 2 x i1> shufflevector (<vscale x 2 x i1> insertelement (<vscale x 2 x i1> poison, i1 true, i32 0), <vscale x 2 x i1> poison, <vscale x 2 x i32> zeroinitializer), <vscale x 2 x i8> poison), !tbaa !4, !alias.scope !10
  %63 = sub <vscale x 2 x i8> %wide.masked.gather48, %wide.masked.gather49
  %64 = tail call <vscale x 2 x i8> @llvm.abs.nxv2i8(<vscale x 2 x i8> %63, i1 false)
  %65 = sext <vscale x 2 x i8> %64 to <vscale x 2 x i32>
  %66 = add nsw <vscale x 2 x i32> %59, %65
  %67 = getelementptr inbounds i32, ptr %c, i64 %index
  store <vscale x 2 x i32> %66, ptr %67, align 4, !tbaa !12, !alias.scope !14, !noalias !16
  %index.next = add nuw i64 %index, %11
  %vec.ind.next = add <vscale x 2 x i64> %vec.ind, %.splat
  %68 = icmp eq i64 %index.next, %n.vec
  br i1 %68, label %middle.block, label %vector.body, !llvm.loop !17

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.cond.cleanup, label %for.cond1.preheader.preheader50

for.cond1.preheader.preheader50:                  ; preds = %vector.memcheck, %for.cond1.preheader.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %for.cond1.preheader.preheader ], [ %n.vec, %middle.block ]
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.preheader50, %for.cond1.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.cond1.preheader ], [ %indvars.iv.ph, %for.cond1.preheader.preheader50 ]
  %69 = shl i64 %indvars.iv, 3
  %arrayidx = getelementptr inbounds i8, ptr %a, i64 %69
  %arrayidx6 = getelementptr inbounds i8, ptr %b, i64 %69
  %70 = load <8 x i8>, ptr %arrayidx, align 1, !tbaa !4
  %71 = load <8 x i8>, ptr %arrayidx6, align 1, !tbaa !4
  %72 = sub <8 x i8> %70, %71
  %73 = tail call <8 x i8> @llvm.abs.v8i8(<8 x i8> %72, i1 false)
  %74 = sext <8 x i8> %73 to <8 x i32>
  %75 = tail call i32 @llvm.vector.reduce.add.v8i32(<8 x i32> %74)
  %arrayidx12 = getelementptr inbounds i32, ptr %c, i64 %indvars.iv
  store i32 %75, ptr %arrayidx12, align 4, !tbaa !12
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.cond1.preheader, !llvm.loop !20

for.cond.cleanup:                                 ; preds = %for.cond1.preheader, %middle.block, %entry
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i8 @llvm.abs.i8(i8, i1 immarg) #2

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i64 @llvm.vscale.i64() #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.umax.i64(i64, i64) #2

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare <vscale x 2 x i64> @llvm.experimental.stepvector.nxv2i64() #3

; Function Attrs: nocallback nofree nosync nounwind readonly willreturn
declare <vscale x 2 x i8> @llvm.masked.gather.nxv2i8.nxv2p0(<vscale x 2 x ptr>, i32 immarg, <vscale x 2 x i1>, <vscale x 2 x i8>) #4

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare <vscale x 2 x i8> @llvm.abs.nxv2i8(<vscale x 2 x i8>, i1 immarg) #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare <8 x i8> @llvm.abs.v8i8(<8 x i8>, i1 immarg) #2

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i32 @llvm.vector.reduce.add.v8i32(<8 x i32>) #3

attributes #0 = { mustprogress nofree norecurse nosync nounwind readnone willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+v,+f,+m,+c,+d,+zba,+zbb,+zbc,+zbs,-save-restore" }
attributes #1 = { argmemonly nofree nosync nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+v,+f,+m,+c,+d,+zba,+zbb,+zbc,+zbs,-save-restore" }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone willreturn }
attributes #4 = { nocallback nofree nosync nounwind readonly willreturn }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 954c1ed009d423ca9593ee63479a9394a23864fd)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8}
!8 = distinct !{!8, !9}
!9 = distinct !{!9, !"LVerDomain"}
!10 = !{!11}
!11 = distinct !{!11, !9}
!12 = !{!13, !13, i64 0}
!13 = !{!"int", !5, i64 0}
!14 = !{!15}
!15 = distinct !{!15, !9}
!16 = !{!8, !11}
!17 = distinct !{!17, !18, !19}
!18 = !{!"llvm.loop.mustprogress"}
!19 = !{!"llvm.loop.isvectorized", i32 1}
!20 = distinct !{!20, !18, !19}
