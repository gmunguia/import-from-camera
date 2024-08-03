#!/bin/sh

set -e

# Avoid the file from growing indefinitely. We capture logs via journald anyway.
rm -f ./airnef/appdata/airnefcmd-log-lifetime.txt

mkdir -p ./airnef/appdata/images

while true
do
  python ./airnef/airnefcmd.py \
    --ipaddress $CAMERA_IP_ADDRESS \
    --action "getfiles" \
    --startdate "$IMPORT_FROM_DATE" \
    --transferorder oldestfirst \
    --retrydelaysecs 20 \
    --outputdir ./airnef/appdata/images \
    --downloadexec 'immich' 'upload' '~~delete' '~~yes' '~~key' "$IMMICH_API_KEY" '~~server' "$IMMICH_SERVER_URL" '@pf@'
  sleep 20
done
