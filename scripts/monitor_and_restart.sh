#!/bin/bash
FILE="/tmp/hello.txt"
PID_FILE="/tmp/write_hello.pid"

if [ -f "$FILE" ]; then
  count=$(wc -l < "$FILE")
  if [ "$count" -ge 10 ]; then
    [ -f "$PID_FILE" ] && kill "$(cat "$PID_FILE")" && rm "$PID_FILE"
    rm "$FILE"
    nohup bash /mnt/data/payment-processing-infra/scripts/write_hello.sh \
      > /dev/null 2>&1 &
  fi
fi


# İzin Vermek İçin:
# chmod +x scripts/monitor_and_restart.sh
