#!/bin/sh
set -e

ITAMAE_HOME=/root/itamae
export ITAMAE_HOME

LANG=C
export LANG

. ${ITAMAE_HOME}/functions/sh
. ${ITAMAE_HOME}/functions/itamae_log
itamae__node=`hostname`
. ${ITAMAE_HOME}/nodes/${itamae__node}
itamae_log__config
itamae__main 2>&1 | itamae_log
