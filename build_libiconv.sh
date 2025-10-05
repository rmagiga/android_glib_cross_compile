#!/bin/bash

SCRIPTDIR=$(cd $(dirname $0); pwd)
. $SCRIPTDIR/env.sh
. $SCRIPTDIR/build_common.sh

DOWNLOAD_FILE=${DOWNLOADDIR}/libiconv-$LIBICONV_VERSION.tar.gz

# ダウンロード
download https://ftpmirror.gnu.org/libiconv/libiconv-$LIBICONV_VERSION.tar.gz $DOWNLOAD_FILE
extract $DOWNLOAD_FILE $SRCDIR/libiconv-$LIBICONV_VERSION

cd $SRCDIR/libiconv-$LIBICONV_VERSION
./configure --host=$TARGET \
	--prefix=$PREFIX \
	--enable-static \
	--enable-shared

make -j$(nproc)
make install
