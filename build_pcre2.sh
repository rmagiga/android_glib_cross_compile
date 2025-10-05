#!/bin/bash

SCRIPTDIR=$(cd $(dirname $0); pwd)
. $SCRIPTDIR/env.sh
. $SCRIPTDIR/build_common.sh

DOWNLOAD_FILE=${DOWNLOADDIR}/pcre2-$PCRE2_VERSION.tar.gz

# ダウンロード
download https://github.com/PCRE2Project/pcre2/archive/refs/tags/pcre2-$PCRE2_VERSION.tar.gz $DOWNLOAD_FILE
extract $DOWNLOAD_FILE $SRCDIR/pcre2-$PCRE2_VERSION

cd $SRCDIR/pcre2-$PCRE2_VERSION
./configure --host=$TARGET \
	--prefix=$PREFIX \
	--enable-static \
	--enable-shared

make -j$(nproc)
make install
