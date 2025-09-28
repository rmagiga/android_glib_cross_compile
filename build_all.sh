#!/bin/bash

SCRIPTDIR=$(cd $(dirname $0); pwd)


$SCRIPTDIR/setup_ndk.sh
$SCRIPTDIR/build_libiconv.sh
$SCRIPTDIR/build_gettext.sh
$SCRIPTDIR/build_glib.sh