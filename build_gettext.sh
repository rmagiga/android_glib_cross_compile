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
EXTRA_CONF="--disable-rpath \
						--disable-libasprintf \
						--disable-java \
						--disable-native-java \
						--disable-openmp \
						--disable-curses \
						--disable-csharp \
						--disable-acl \
						--disable-d \
						--disable-c++ \
						--disable-modula2 \
						--disable-xattr \
						--disable-dependency-tracking \
						--disable-libtool-lock \
						"

./configure --host=$TARGET \
	--prefix=$PREFIX \
	--enable-static \
	--enable-shared \
	--enable-nls \
	$EXTRA_CONF \
	--disable-examples

make -j$(nproc)
make install
