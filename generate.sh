CLANG=~/llvm-dev/build/bin/clang-15
TARGET_OPTS="-mllvm -riscv-v-vector-bits-min=128 -Xclang -target-feature -Xclang +v"
echo $TARGET_OPTS

for f in *.c; do
    echo "Compiling $f.."; 
    $CLANG -S --target=riscv64 $f $TARGET_OPTS -O2
    $CLANG -S --target=riscv64 $f $TARGET_OPTS -O2 -emit-llvm
done
