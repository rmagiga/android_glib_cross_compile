#!/bin/bash

SCRIPTDIR=$(cd $(dirname $0); pwd)
. $SCRIPTDIR/env.sh

rm -rf $DOWNLOADDIR
rm -rf $SRCDIR
rm -rf $OUTDIR
rm -rf $ANDROID_NDK_HOME
