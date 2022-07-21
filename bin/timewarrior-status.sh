#!/usr/bin/env bash

# This script is called by spacebar
# and spacebar doesn't have the TIMEWARRIORDB env set
# TODO clean this up
# https://github.com/cmacrae/homebrew-formulae/blob/master/spacebar.rb#L46-L50
export TIMEWARRIORDB=/Users/eduardo/projects/vimwiki/timewarrior

TASK=$(timew | sed -n -e 's/^.*Tracking//p' | gsed -e 's/^[ \t]*//')
TIME=$(timew | sed -n -e 's/^.*Total//p' | gsed -e 's/^[ \t]*//')

if [ -z "$TASK" ]; then
  echo ""
 else
  echo "$TASK $TIME"
fi

