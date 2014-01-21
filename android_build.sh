#!/bin/sh
if [ $# -eq 0 ]
then
    echo "USE: $0 CM_DIR"
    exit 0
fi

CM_DIR="$1"
export CC="$CM_DIR/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.6/bin/arm-linux-androideabi-gcc --sysroot=$CM_DIR/prebuilts/ndk/8/platforms/android-14/arch-arm/"
export SA_DIR="/data/log/sa"
./configure --host=arm-linux --disable-nls
make
