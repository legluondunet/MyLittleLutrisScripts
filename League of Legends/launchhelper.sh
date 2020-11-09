#!/bin/bash
$(dirname "$0")/syscall_check.sh
process=LeagueClientUx.exe
uxpid=$(timeout 4m sh -c "until pidof ${process}; do sleep 1; done")
if [[ ! -n $uxpid ]]; then
  echo "Could not find process ${process}"
  exit 1
fi
echo "LeagueClientUx pid: ${uxpid}"
port=$(xargs -0 < /proc/${uxpid}/cmdline \
  | sed -n 's/.*--app-port=\([[:digit:]]*\).*/\1/p')
if [[ ! -n $port ]]; then
  echo "Could not find port"
  exit 1
fi
echo "Waiting for port ${port}"

kill -STOP ${uxpid}
timeout 5m /bin/bash -c "
until openssl s_client -connect :${port} <<< Q > /dev/null 2>&1; do
  sleep 1
done"
kill -CONT ${uxpid}