#!/usr/bin/env bash

# When an external display is added
# Add some more padding
# TODO: identify which display it is
#
# Also System Preferences -> Desktop & Dock -> Mission Control
# Display have separate Spaces = true
# Automatically rearrange Spaces based on most recent use = false



function create_space {
  local space_id="$1"

  yabai -m query --spaces --space "$space_id" > /dev/null || yabai -m space --create
}

create_space 11
create_space 12
create_space 13
create_space 14
create_space 15

TOP_PADDING=20
BOTTOM_PADDING=0
HOR_PADDING=2
yabai -m config --space 11 top_padding     $TOP_PADDING
yabai -m config --space 12 top_padding     $TOP_PADDING
yabai -m config --space 13 top_padding     $TOP_PADDING
yabai -m config --space 14 top_padding     $TOP_PADDING
yabai -m config --space 15 top_padding     $TOP_PADDING

yabai -m config --space 11 bottom_padding  $BOTTOM_PADDING
yabai -m config --space 12 bottom_padding  $BOTTOM_PADDING
yabai -m config --space 13 bottom_padding  $BOTTOM_PADDING
yabai -m config --space 14 bottom_padding  $BOTTOM_PADDING
yabai -m config --space 15 bottom_padding  $BOTTOM_PADDING

yabai -m config --space 11 left_padding    $HOR_PADDING
yabai -m config --space 12 left_padding    $HOR_PADDING
yabai -m config --space 13 left_padding    $HOR_PADDING
yabai -m config --space 14 left_padding    $HOR_PADDING
yabai -m config --space 15 left_padding    $HOR_PADDING

yabai -m config --space 11 right_padding   $HOR_PADDING
yabai -m config --space 12 right_padding   $HOR_PADDING
yabai -m config --space 13 right_padding   $HOR_PADDING
yabai -m config --space 14 right_padding   $HOR_PADDING
yabai -m config --space 15 right_padding   $HOR_PADDING
