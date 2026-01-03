#!/bin/bash

SCRIPTDIR=$(cd $(dirname $0); pwd)
. $SCRIPTDIR/env.sh
. $SCRIPTDIR/build_common.sh

DOWNLOAD_FILE=${DOWNLOADDIR}/glib-$GLIB_VERSION.tar.xz

MAJOR_MINOR=$(echo "$GLIB_VERSION" | awk -F. '{print $1"."$2}')

download https://download.gnome.org/sources/glib/$MAJOR_MINOR/glib-$GLIB_VERSION.tar.xz $DOWNLOAD_FILE
extract $DOWNLOAD_FILE $SRCDIR/glib-$GLIB_VERSION

sed \
  -e "s|{{TARGET}}|$TARGET|g" \
  -e "s|{{TOOLCHAIN}}|$TOOLCHAIN|g" \
  -e "s|{{PREFIX}}|$PREFIX|g" \
  -e "s|{{LIBDIR}}|$LIBDIR|g" \
  -e "s|{{INCLUDEDIR}}|$INCLUDEDIR|g" \
  -e "s|{{ANDROID_API}}|$ANDROID_API|g" \
  cross_file.txt.template > $SRCDIR/glib-$GLIB_VERSION/cross_file.txt

cd $SRCDIR/glib-$GLIB_VERSION
meson setup build --cross-file cross_file.txt \
  -Dtests=false \
  -Dinstalled_tests=false \
  -Dman-pages=disabled \
  -Ddocumentation=false \
  -Dintrospection=disabled \
  -Dnls=disabled \
  -Dselinux=disabled \
  -Dlibmount=disabled \
  -Ddtrace=disabled \
  -Dsystemtap=disabled

cd build
ninja
ninja install
