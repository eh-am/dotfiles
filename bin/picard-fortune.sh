#!/usr/bin/env bash

icat='kitty +kitten icat'

clear
$icat --clear
$icat --align=center ~/projects/picard-tips-fortune/picard.png

# print aligned to center
# TODO: add boxes -d stone if it fits
fort=$(fortune ~/projects/picard-tips-fortune/)
COLUMNS=$(tput cols)
printf "%*s\n" $(((${#fort}+$COLUMNS)/2)) "$fort"
