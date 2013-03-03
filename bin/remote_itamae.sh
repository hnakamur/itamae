#!/bin/sh
set -e

# ITAMAE_HOME must not have slash at end
ITAMAE_HOME=/root/itamae
export ITAMAE_HOME

usage() {
  cat <<EOF 1>&2
Usage: $0 host...
EOF
}

if [ $# -eq 0 ]; then
  usage
  exit 1
fi

remote_itamae__sync_cookbooks() {
  for host in "$@"; do
    rsync -avz --delete --rsync-path='sudo rsync' --exclude .git \
      ${ITAMAE_HOME}/ ${host}:${ITAMAE_HOME} &
  done
  wait
}

remote_itamae__run() {
  for host in "$@"; do
    ssh ${host} sudo ${ITAMAE_HOME}/bin/itamae.sh &
  done
  wait
}

remote_itamae__sync_cookbooks "$@"
remote_itamae__run "$@"
