#!/bin/bash

SCRIPTDIR=$(cd $(dirname $0); pwd)
. $SCRIPTDIR/env.sh
. $SCRIPTDIR/build_common.sh

URL=https://ftpmirror.gnu.org/libiconv/libiconv-$LIBICONV_VERSION.tar.gz
DOWNLOAD_FILE=${DOWNLOADDIR}/libiconv-$LIBICONV_VERSION.tar.gz
EXTRACT_DIR=$SRCDIR/libiconv-$LIBICONV_VERSION

# ダウンロード
download $URL $DOWNLOAD_FILE
extract $DOWNLOAD_FILE $EXTRACT_DIR

cd $EXTRACT_DIR
./configure --host=$TARGET \
	--prefix=$PREFIX \
	--enable-static \
	--enable-shared

make -j$(nproc)
make install
