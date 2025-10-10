#!/bin/bash

SCRIPTDIR=$(cd $(dirname $0); pwd)
. $SCRIPTDIR/env.sh
. $SCRIPTDIR/build_common.sh

URL=https://github.com/PCRE2Project/pcre2/archive/refs/tags/pcre2-$PCRE2_VERSION.tar.gz
DOWNLOAD_FILE=${DOWNLOADDIR}/pcre2-$PCRE2_VERSION.tar.gz
EXTRACT_DIR=$SRCDIR/pcre2-$PCRE2_VERSION

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
