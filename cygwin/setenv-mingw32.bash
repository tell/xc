ARCH='x86_64-w64-mingw32'
SYSROOT="/usr/${ARCH}/sys-root"
export AS="${ARCH}-as.exe"
export CC="${ARCH}-gcc.exe"
export CXX="${ARCH}-g++.exe"
export AR="${ARCH}-ar.exe"
export LD="${ARCH}-ld.exe"
export NM="${ARCH}-nm.exe"
export RANLIB="${ARCH}-ranlib.exe"
export OBJDUMP="${ARCH}-objdump.exe"
export STRIP="${ARCH}-strip.exe"

export PATH="${PATH}:${SYSROOT}/mingw/bin"
