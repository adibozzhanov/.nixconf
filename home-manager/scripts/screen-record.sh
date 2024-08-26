#!/bin/bash

CLIPFILE="/home/bzv/screen-recordings/rec-$(date +%F_%T).mp4"

pkill "wf-recorder" \
    || (wf-recorder \
      -c libx264 \
      -f $CLIPFILE \
      -g "$(slurp && notify-send 'Recording Started')" \
      && notify-send \
       --action="Open file"\
       "Recording Saved"\
    | if [ -p /dev/stdin ] && [ "$(cat)" = "0" ]; then nautilus -s $CLIPFILE; fi \
    )
