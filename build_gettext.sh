#!/bin/bash

SCRIPTDIR=$(cd $(dirname $0); pwd)
. $SCRIPTDIR/env.sh
. $SCRIPTDIR/build_common.sh

URL=https://ftpmirror.gnu.org/gettext/gettext-$GETTEXT_VERSION.tar.gz
DOWNLOAD_FILE=${DOWNLOADDIR}/gettext-$GETTEXT_VERSION.tar.gz
EXTRACT_DIR=$SRCDIR/gettext-$GETTEXT_VERSION

# ダウンロード
download $URL $DOWNLOAD_FILE
extract $DOWNLOAD_FILE $EXTRACT_DIR

cd $EXTRACT_DIR
./configure --host=$TARGET \
	--prefix=$PREFIX \
	--enable-static \
	--enable-shared \
	--disable-java \
	--disable-d \
	--disable-modula2 \
	--disable-c++ \
	--disable-libasprintf \
	--disable-curses \
	--disable-openmp \
	--disable-acl \
	--disable-xattr \
	--disable-examples

make -j$(nproc)
make install
