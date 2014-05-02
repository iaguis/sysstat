#!/bin/sh
if [ $# -lt 2 ]
then
    echo "USE: $0 NDK_DIR ARCH"
    echo "  ARCH: 32 | 64"
    exit 0
fi

NDK_DIR="$1"
ARCH_ARG="$2"
if [ "${ARCH_ARG}" == 64 ]
then
    ARCH="x86_64"
else
    ARCH="x86"
fi
export CC="$NDK_DIR/toolchains/arm-linux-androideabi-4.6/prebuilt/linux-${ARCH}/bin/arm-linux-androideabi-gcc --sysroot=${NDK_DIR}/platforms/android-14/arch-arm/"
export SA_DIR="/data/log/sa"
./configure --host=arm-linux --disable-nls
make
