#!/bin/bash

SCRIPTDIR=$(cd $(dirname $0); pwd)
. $SCRIPTDIR/env.sh
. $SCRIPTDIR/build_common.sh

DOWNLOAD_FILE=${DOWNLOADDIR}/ffi-v$LIBFFI_VERSION.tar.gz

# ダウンロード
download https://github.com/libffi/libffi/archive/refs/tags/v$LIBFFI_VERSION.tar.gz $DOWNLOAD_FILE
extract $DOWNLOAD_FILE $SRCDIR/ffi-v$LIBFFI_VERSION

cd $SRCDIR/ffi-v$LIBFFI_VERSION
./autogen.sh
./configure --host=$TARGET \
	--prefix=$PREFIX \
	--enable-static \
	--enable-shared

make -j$(nproc)
make install
