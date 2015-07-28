#!/usr/bin/bash

## Parse arguments:

LINKAGE="${1}"
OPT="${2}"

SRC_DIR="gmp-6.0.0"
CONF_SCRIPT="../${SRC_DIR}/configure"

CPUNAME="coreisbr"
VENDORNAME="w64"
BUILD_OSNAME="cygwin"
HOST_OSNAME="mingw32"
TARGET_OSNAME="${HOST_OSNAME}"

CONF_OPTS="--enable-cxx"
case "${LINKAGE}" in
    "static")
	CONF_OPTS="${CONF_OPTS} --disable-shared --enable-static"
	WORK_DIR="${SRC_DIR}_${TARGET_OSNAME}-static"
	;;
    "shared")
	CONF_OPTS="${CONF_OPTS} --disable-static --enable-shared"
	WORK_DIR="${SRC_DIR}_${TARGET_OSNAME}-shared"
	;;
    *)
	echo ERROR: Unknown linkage option.
	exit 1
	;;
esac

case "${OPT}" in
    "optimize")
	OPT_FLAGS="-O4 -g"
	;;
    "debug")
	OPT_FLAGS="-g3"
	;;
    *)
	OPT_FLAGS="-O2"
	;;
esac

BUILD="${CPUNAME}-${VENDORNAME}-${BUILD_OSNAME}"
HOST="${CPUNAME}-${VENDORNAME}-${BUILD_OSNAME}"

CFLAGS="-static-libgcc ${OPT_FLAGS} -pedantic -fomit-frame-pointer -m64 -mtune=corei7 -march=corei7"
CXXFLAGS="-static-libgcc -static-libstdc++ ${OPT_FLAGS} -pedantic -fomit-frame-pointer -m64 -mtune=corei7 -march=corei7"
LDFLAGS="-static-libgcc -static-libstdc++"

CMD="${CONF_SCRIPT} --prefix=${HOME} ${BUILD:+--build=${BUILD}} ${HOST:+--host=${HOST}} ${CONF_OPTS:+${CONF_OPTS}} ${CFLAGS:+CFLAGS=\"${CFLAGS}\"} ${CXXFLAGS:+CXXFLAGS=\"${CXXFLAGS}\"} ${LDFLAGS:+LDFLAGS=\"${LDFLAGS}\"}"

## Execution phase:

source setenv-mingw32.bash
mkdir -p ${WORK_DIR}
pushd ${WORK_DIR}

make clean || true
make distclean || true

echo ${CMD}
eval ${CMD}

make -j
make check -i

popd
