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
  %min.iters.check = icmp ult i32 %N, 128
  br i1 %min.iters.check, label %for.cond1.preheader.preheader50, label %vector.memcheck

vector.memcheck:                                  ; preds = %for.cond1.preheader.preheader
  %0 = shl nuw nsw i64 %wide.trip.count, 2
  %uglygep = getelementptr i8, ptr %c, i64 %0
  %1 = shl nuw nsw i64 %wide.trip.count, 3
  %uglygep30 = getelementptr i8, ptr %a, i64 %1
  %uglygep31 = getelementptr i8, ptr %b, i64 %1
  %bound0 = icmp ugt ptr %uglygep30, %c
  %bound1 = icmp ugt ptr %uglygep, %a
  %found.conflict = and i1 %bound0, %bound1
  %bound032 = icmp ugt ptr %uglygep31, %c
  %bound133 = icmp ugt ptr %uglygep, %b
  %found.conflict34 = and i1 %bound032, %bound133
  %conflict.rdx = or i1 %found.conflict, %found.conflict34
  br i1 %conflict.rdx, label %for.cond1.preheader.preheader50, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %n.vec = and i64 %wide.trip.count, 536870896
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <16 x i64> [ <i64 0, i64 1, i64 2, i64 3, i64 4, i64 5, i64 6, i64 7, i64 8, i64 9, i64 10, i64 11, i64 12, i64 13, i64 14, i64 15>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %2 = shl <16 x i64> %vec.ind, <i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3>
  %3 = getelementptr inbounds i8, ptr %a, <16 x i64> %2
  %wide.masked.gather = call <16 x i8> @llvm.masked.gather.v16i8.v16p0(<16 x ptr> %3, i32 1, <16 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>, <16 x i8> undef), !tbaa !4, !alias.scope !7
  %4 = getelementptr inbounds i8, ptr %b, <16 x i64> %2
  %wide.masked.gather35 = call <16 x i8> @llvm.masked.gather.v16i8.v16p0(<16 x ptr> %4, i32 1, <16 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>, <16 x i8> undef), !tbaa !4, !alias.scope !10
  %5 = sub <16 x i8> %wide.masked.gather, %wide.masked.gather35
  %6 = call <16 x i8> @llvm.abs.v16i8(<16 x i8> %5, i1 false)
  %7 = sext <16 x i8> %6 to <16 x i32>
  %8 = or <16 x i64> %2, <i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1>
  %9 = getelementptr inbounds i8, ptr %a, <16 x i64> %8
  %wide.masked.gather36 = call <16 x i8> @llvm.masked.gather.v16i8.v16p0(<16 x ptr> %9, i32 1, <16 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>, <16 x i8> undef), !tbaa !4, !alias.scope !7
  %10 = getelementptr inbounds i8, ptr %b, <16 x i64> %8
  %wide.masked.gather37 = call <16 x i8> @llvm.masked.gather.v16i8.v16p0(<16 x ptr> %10, i32 1, <16 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>, <16 x i8> undef), !tbaa !4, !alias.scope !10
  %11 = sub <16 x i8> %wide.masked.gather36, %wide.masked.gather37
  %12 = call <16 x i8> @llvm.abs.v16i8(<16 x i8> %11, i1 false)
  %13 = sext <16 x i8> %12 to <16 x i32>
  %14 = add nsw <16 x i32> %7, %13
  %15 = or <16 x i64> %2, <i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2>
  %16 = getelementptr inbounds i8, ptr %a, <16 x i64> %15
  %wide.masked.gather38 = call <16 x i8> @llvm.masked.gather.v16i8.v16p0(<16 x ptr> %16, i32 1, <16 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>, <16 x i8> undef), !tbaa !4, !alias.scope !7
  %17 = getelementptr inbounds i8, ptr %b, <16 x i64> %15
  %wide.masked.gather39 = call <16 x i8> @llvm.masked.gather.v16i8.v16p0(<16 x ptr> %17, i32 1, <16 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>, <16 x i8> undef), !tbaa !4, !alias.scope !10
  %18 = sub <16 x i8> %wide.masked.gather38, %wide.masked.gather39
  %19 = call <16 x i8> @llvm.abs.v16i8(<16 x i8> %18, i1 false)
  %20 = sext <16 x i8> %19 to <16 x i32>
  %21 = add nsw <16 x i32> %14, %20
  %22 = or <16 x i64> %2, <i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3>
  %23 = getelementptr inbounds i8, ptr %a, <16 x i64> %22
  %wide.masked.gather40 = call <16 x i8> @llvm.masked.gather.v16i8.v16p0(<16 x ptr> %23, i32 1, <16 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>, <16 x i8> undef), !tbaa !4, !alias.scope !7
  %24 = getelementptr inbounds i8, ptr %b, <16 x i64> %22
  %wide.masked.gather41 = call <16 x i8> @llvm.masked.gather.v16i8.v16p0(<16 x ptr> %24, i32 1, <16 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>, <16 x i8> undef), !tbaa !4, !alias.scope !10
  %25 = sub <16 x i8> %wide.masked.gather40, %wide.masked.gather41
  %26 = call <16 x i8> @llvm.abs.v16i8(<16 x i8> %25, i1 false)
  %27 = sext <16 x i8> %26 to <16 x i32>
  %28 = add nsw <16 x i32> %21, %27
  %29 = or <16 x i64> %2, <i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4>
  %30 = getelementptr inbounds i8, ptr %a, <16 x i64> %29
  %wide.masked.gather42 = call <16 x i8> @llvm.masked.gather.v16i8.v16p0(<16 x ptr> %30, i32 1, <16 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>, <16 x i8> undef), !tbaa !4, !alias.scope !7
  %31 = getelementptr inbounds i8, ptr %b, <16 x i64> %29
  %wide.masked.gather43 = call <16 x i8> @llvm.masked.gather.v16i8.v16p0(<16 x ptr> %31, i32 1, <16 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>, <16 x i8> undef), !tbaa !4, !alias.scope !10
  %32 = sub <16 x i8> %wide.masked.gather42, %wide.masked.gather43
  %33 = call <16 x i8> @llvm.abs.v16i8(<16 x i8> %32, i1 false)
  %34 = sext <16 x i8> %33 to <16 x i32>
  %35 = add nsw <16 x i32> %28, %34
  %36 = or <16 x i64> %2, <i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5>
  %37 = getelementptr inbounds i8, ptr %a, <16 x i64> %36
  %wide.masked.gather44 = call <16 x i8> @llvm.masked.gather.v16i8.v16p0(<16 x ptr> %37, i32 1, <16 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>, <16 x i8> undef), !tbaa !4, !alias.scope !7
  %38 = getelementptr inbounds i8, ptr %b, <16 x i64> %36
  %wide.masked.gather45 = call <16 x i8> @llvm.masked.gather.v16i8.v16p0(<16 x ptr> %38, i32 1, <16 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>, <16 x i8> undef), !tbaa !4, !alias.scope !10
  %39 = sub <16 x i8> %wide.masked.gather44, %wide.masked.gather45
  %40 = call <16 x i8> @llvm.abs.v16i8(<16 x i8> %39, i1 false)
  %41 = sext <16 x i8> %40 to <16 x i32>
  %42 = add nsw <16 x i32> %35, %41
  %43 = or <16 x i64> %2, <i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6>
  %44 = getelementptr inbounds i8, ptr %a, <16 x i64> %43
  %wide.masked.gather46 = call <16 x i8> @llvm.masked.gather.v16i8.v16p0(<16 x ptr> %44, i32 1, <16 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>, <16 x i8> undef), !tbaa !4, !alias.scope !7
  %45 = getelementptr inbounds i8, ptr %b, <16 x i64> %43
  %wide.masked.gather47 = call <16 x i8> @llvm.masked.gather.v16i8.v16p0(<16 x ptr> %45, i32 1, <16 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>, <16 x i8> undef), !tbaa !4, !alias.scope !10
  %46 = sub <16 x i8> %wide.masked.gather46, %wide.masked.gather47
  %47 = call <16 x i8> @llvm.abs.v16i8(<16 x i8> %46, i1 false)
  %48 = sext <16 x i8> %47 to <16 x i32>
  %49 = add nsw <16 x i32> %42, %48
  %50 = or <16 x i64> %2, <i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7>
  %51 = getelementptr inbounds i8, ptr %a, <16 x i64> %50
  %wide.masked.gather48 = call <16 x i8> @llvm.masked.gather.v16i8.v16p0(<16 x ptr> %51, i32 1, <16 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>, <16 x i8> undef), !tbaa !4, !alias.scope !7
  %52 = getelementptr inbounds i8, ptr %b, <16 x i64> %50
  %wide.masked.gather49 = call <16 x i8> @llvm.masked.gather.v16i8.v16p0(<16 x ptr> %52, i32 1, <16 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>, <16 x i8> undef), !tbaa !4, !alias.scope !10
  %53 = sub <16 x i8> %wide.masked.gather48, %wide.masked.gather49
  %54 = call <16 x i8> @llvm.abs.v16i8(<16 x i8> %53, i1 false)
  %55 = sext <16 x i8> %54 to <16 x i32>
  %56 = add nsw <16 x i32> %49, %55
  %57 = getelementptr inbounds i32, ptr %c, i64 %index
  store <16 x i32> %56, ptr %57, align 4, !tbaa !12, !alias.scope !14, !noalias !16
  %index.next = add nuw i64 %index, 16
  %vec.ind.next = add <16 x i64> %vec.ind, <i64 16, i64 16, i64 16, i64 16, i64 16, i64 16, i64 16, i64 16, i64 16, i64 16, i64 16, i64 16, i64 16, i64 16, i64 16, i64 16>
  %58 = icmp eq i64 %index.next, %n.vec
  br i1 %58, label %middle.block, label %vector.body, !llvm.loop !17

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br i1 %cmp.n, label %for.cond.cleanup, label %for.cond1.preheader.preheader50

for.cond1.preheader.preheader50:                  ; preds = %vector.memcheck, %for.cond1.preheader.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %for.cond1.preheader.preheader ], [ %n.vec, %middle.block ]
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.preheader50, %for.cond1.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.cond1.preheader ], [ %indvars.iv.ph, %for.cond1.preheader.preheader50 ]
  %59 = shl i64 %indvars.iv, 3
  %arrayidx = getelementptr inbounds i8, ptr %a, i64 %59
  %60 = load i8, ptr %arrayidx, align 1, !tbaa !4
  %arrayidx6 = getelementptr inbounds i8, ptr %b, i64 %59
  %61 = load i8, ptr %arrayidx6, align 1, !tbaa !4
  %sub = sub i8 %60, %61
  %62 = tail call i8 @llvm.abs.i8(i8 %sub, i1 false) #4
  %conv9 = sext i8 %62 to i32
  %63 = or i64 %59, 1
  %arrayidx.1 = getelementptr inbounds i8, ptr %a, i64 %63
  %64 = load i8, ptr %arrayidx.1, align 1, !tbaa !4
  %arrayidx6.1 = getelementptr inbounds i8, ptr %b, i64 %63
  %65 = load i8, ptr %arrayidx6.1, align 1, !tbaa !4
  %sub.1 = sub i8 %64, %65
  %66 = tail call i8 @llvm.abs.i8(i8 %sub.1, i1 false) #4
  %conv9.1 = sext i8 %66 to i32
  %add10.1 = add nsw i32 %conv9, %conv9.1
  %67 = or i64 %59, 2
  %arrayidx.2 = getelementptr inbounds i8, ptr %a, i64 %67
  %68 = load i8, ptr %arrayidx.2, align 1, !tbaa !4
  %arrayidx6.2 = getelementptr inbounds i8, ptr %b, i64 %67
  %69 = load i8, ptr %arrayidx6.2, align 1, !tbaa !4
  %sub.2 = sub i8 %68, %69
  %70 = tail call i8 @llvm.abs.i8(i8 %sub.2, i1 false) #4
  %conv9.2 = sext i8 %70 to i32
  %add10.2 = add nsw i32 %add10.1, %conv9.2
  %71 = or i64 %59, 3
  %arrayidx.3 = getelementptr inbounds i8, ptr %a, i64 %71
  %72 = load i8, ptr %arrayidx.3, align 1, !tbaa !4
  %arrayidx6.3 = getelementptr inbounds i8, ptr %b, i64 %71
  %73 = load i8, ptr %arrayidx6.3, align 1, !tbaa !4
  %sub.3 = sub i8 %72, %73
  %74 = tail call i8 @llvm.abs.i8(i8 %sub.3, i1 false) #4
  %conv9.3 = sext i8 %74 to i32
  %add10.3 = add nsw i32 %add10.2, %conv9.3
  %75 = or i64 %59, 4
  %arrayidx.4 = getelementptr inbounds i8, ptr %a, i64 %75
  %76 = load i8, ptr %arrayidx.4, align 1, !tbaa !4
  %arrayidx6.4 = getelementptr inbounds i8, ptr %b, i64 %75
  %77 = load i8, ptr %arrayidx6.4, align 1, !tbaa !4
  %sub.4 = sub i8 %76, %77
  %78 = tail call i8 @llvm.abs.i8(i8 %sub.4, i1 false) #4
  %conv9.4 = sext i8 %78 to i32
  %add10.4 = add nsw i32 %add10.3, %conv9.4
  %79 = or i64 %59, 5
  %arrayidx.5 = getelementptr inbounds i8, ptr %a, i64 %79
  %80 = load i8, ptr %arrayidx.5, align 1, !tbaa !4
  %arrayidx6.5 = getelementptr inbounds i8, ptr %b, i64 %79
  %81 = load i8, ptr %arrayidx6.5, align 1, !tbaa !4
  %sub.5 = sub i8 %80, %81
  %82 = tail call i8 @llvm.abs.i8(i8 %sub.5, i1 false) #4
  %conv9.5 = sext i8 %82 to i32
  %add10.5 = add nsw i32 %add10.4, %conv9.5
  %83 = or i64 %59, 6
  %arrayidx.6 = getelementptr inbounds i8, ptr %a, i64 %83
  %84 = load i8, ptr %arrayidx.6, align 1, !tbaa !4
  %arrayidx6.6 = getelementptr inbounds i8, ptr %b, i64 %83
  %85 = load i8, ptr %arrayidx6.6, align 1, !tbaa !4
  %sub.6 = sub i8 %84, %85
  %86 = tail call i8 @llvm.abs.i8(i8 %sub.6, i1 false) #4
  %conv9.6 = sext i8 %86 to i32
  %add10.6 = add nsw i32 %add10.5, %conv9.6
  %87 = or i64 %59, 7
  %arrayidx.7 = getelementptr inbounds i8, ptr %a, i64 %87
  %88 = load i8, ptr %arrayidx.7, align 1, !tbaa !4
  %arrayidx6.7 = getelementptr inbounds i8, ptr %b, i64 %87
  %89 = load i8, ptr %arrayidx6.7, align 1, !tbaa !4
  %sub.7 = sub i8 %88, %89
  %90 = tail call i8 @llvm.abs.i8(i8 %sub.7, i1 false) #4
  %conv9.7 = sext i8 %90 to i32
  %add10.7 = add nsw i32 %add10.6, %conv9.7
  %arrayidx12 = getelementptr inbounds i32, ptr %c, i64 %indvars.iv
  store i32 %add10.7, ptr %arrayidx12, align 4, !tbaa !12
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.cond1.preheader, !llvm.loop !20

for.cond.cleanup:                                 ; preds = %for.cond1.preheader, %middle.block, %entry
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i8 @llvm.abs.i8(i8, i1 immarg) #2

; Function Attrs: nocallback nofree nosync nounwind readonly willreturn
declare <16 x i8> @llvm.masked.gather.v16i8.v16p0(<16 x ptr>, i32 immarg, <16 x i1>, <16 x i8>) #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare <16 x i8> @llvm.abs.v16i8(<16 x i8>, i1 immarg) #2

attributes #0 = { mustprogress nofree norecurse nosync nounwind readnone willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+v,+f,+m,+c,+d,+zba,-save-restore" }
attributes #1 = { argmemonly nofree nosync nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+v,+f,+m,+c,+d,+zba,-save-restore" }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readonly willreturn }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 15.0.0 (https://github.com/llvm/llvm-project.git c7fd7512a5c5b133665bfecbe2e9748c0607286e)"}
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
