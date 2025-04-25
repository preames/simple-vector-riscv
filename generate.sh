
set -e
set -x
python gen-makefile.py > Makefile
make -j
