#!/usr/bin/env bash

# source: https://github.com/knazarov/dotfiles/blob/eaa58294735f1048c4ada0060b8827c34391a5e8/bin/popup.sh
TITLE=mylauncher

# These are fine, but slow, which is quite annoying when you want to spawn something
# With them:
# Executed in  349.24 millis    fish           external
# Without:
# Executed in  178.77 millis    fish           external
# So I am letting it hardcoded for now
#SCREEN_WIDTH=`yabai -m query --displays --display | jq .frame.w*2`
#SCREEN_HEIGHT=`yabai -m query --displays --display | jq .frame.h*2`
SCREEN_WIDTH=2560
SCREEN_HEIGHT=1600

TERM_WIDTH=1280
TERM_HEIGHT=1260

let "X=SCREEN_WIDTH/2-TERM_WIDTH/2"
let "Y=SCREEN_HEIGHT/2-TERM_HEIGHT/2"


# TODO: use kitty?
alacritty -t "${TITLE}" \
  -o window.position.x="${X}" \
  -o window.position.y="${Y}" \
  -o window.dimensions.lines=35 \
  -o window.dimensions.columns=80 \
  -o window.decorations=none \
  -e "$1"
