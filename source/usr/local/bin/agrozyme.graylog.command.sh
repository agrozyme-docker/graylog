#!/bin/bash
set -euo pipefail

function main() {
  agrozyme.alpine.function.sh change_core
  rm -f /tmp/graylog.pid
  chown -R core:core /usr/share/graylog/data /usr/share/graylog/log
  exec su-exec core /usr/share/graylog/bin/graylogctl run
}

main "$@"
