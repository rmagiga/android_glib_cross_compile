#!/bin/bash

SCRIPTDIR=$(cd $(dirname $0); pwd)
. $SCRIPTDIR/env.sh
. $SCRIPTDIR/build_common.sh

DOWNLOAD_FILE=${DOWNLOADDIR}/gettext-$GETTEXT_VERSION.tar.gz

# ダウンロード
download https://ftpmirror.gnu.org/gettext/gettext-$GETTEXT_VERSION.tar.gz $DOWNLOAD_FILE
extract $DOWNLOAD_FILE $SRCDIR/gettext-$GETTEXT_VERSION

cd $SRCDIR/gettext-$GETTEXT_VERSION
./configure --host=$TARGET \
	--prefix=$PREFIX \
	--enable-static \
	--enable-shared

make -j$(nproc)
make install
