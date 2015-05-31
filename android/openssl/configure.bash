#!/bin/bash

MAKE_BUILD_OPTIONS="-j 2"

if [ $# -lt 3 ]; then
	echo "Usage: $0 OPENSSL_DIR OPENSSL_OPTIONS PREFIX_DIR"
	echo "    OPENSSL_DIR      A directory which includes source codes."
	echo "    OPENSSL_OPTIONS  Options to configure OpenSSL."
	echo "    PREFIX_DIR       A directory for installation."
fi

OPENSSL_DIR="$1"
OPENSSL_OPTIONS="$2"
OPENSSL_PREFIX="$3"

for x in $OPENSSL_DIR; do
	if [ ! -d $x ]; then
		echo Error: it is not directory: $x
		exit 1
	fi
done

OPENSSL_CONFIG="./config"

pushd $OPENSSL_DIR

sed -e 's/-soname=$$SHLIB$$SHLIB_SOVER$$SHLIB_SUFFIX/-soname=$$SHLIB/g' < Makefile.shared > Makefile.shared.1
mv -f Makefile.shared.1 Makefile.shared
# sed -e 's/-o $$SHLIB$$SHLIB_SOVER$$SHLIB_SUFFIX/-o $$SHLIB/g' < Makefile.shared > Makefile.shared.1
# mv -f Makefile.shared.1 Makefile.shared


cmd="$OPENSSL_CONFIG --prefix=$OPENSSL_PREFIX $OPENSSL_OPTIONS"
echo Execute: $cmd
$cmd | tee ../config.log

# sed -e 's/SHLIB_EXT=.so.$(SHLIB_MAJOR).$(SHLIB_MINOR)/SHLIB_EXT=.so/g' < Makefile > Makefile.1
# mv -f Makefile.1 Makefile
