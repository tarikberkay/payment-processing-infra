#!/bin/bash
PID_FILE="/tmp/write_hello.pid"
echo $$ > "$PID_FILE"
while true; do
  echo "Hello world" >> /tmp/hello.txt
  sleep 10
done



# İzin Verme İçin:
# chmod +x scripts/write_hello.sh