#!/bin/bash

SCRIPTDIR=$(cd $(dirname $0); pwd)

$SCRIPTDIR/build_libiconv.sh
$SCRIPTDIR/build_gettext.sh
$SCRIPTDIR/build_pcre2.sh
$SCRIPTDIR/build_glib.sh