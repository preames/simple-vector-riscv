
CLANG=~/llvm-dev/build/bin/clang-15
TARGET_OPTS="--target=riscv64 -mllvm -riscv-v-vector-bits-min=128 -Xclang -target-feature -Xclang +v,+f,+m,+c,+d,+zba"
#TARGET_OPTS="-target riscv64 -march=rv64gcv_zvl128b -mllvm -riscv-v-vector-bits-min=-1"
echo $TARGET_OPTS

# uncmment if you want command lines
#set -x
for f in *.c; do
    echo "Compiling $f.."; 
    $CLANG -S $f $TARGET_OPTS -O2
    $CLANG -S $f $TARGET_OPTS -O2 -emit-llvm
done
