#!/usr/bin/env bash

echo "Set up keyboard stuff"
set -x

defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
# KeyRepeat: 120, 90, 60, 30, 12, 6, 2
# InitialKeyRepeat: 120, 94, 68, 35, 25, 15
defaults write -g KeyRepeat -int 2
defaults write -g InitialKeyRepeat -int 15


# Remap Caps-Lock to Escape
# https://stackoverflow.com/questions/127591/using-caps-lock-as-esc-in-mac-os-x/46460200#46460200
hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x700000029}]}'

# CMD -> Options
# Options -> CMD
hidutil property --set '{
  "UserKeyMapping": [
    {
      "HIDKeyboardModifierMappingSrc": 0x7000000E3,
      "HIDKeyboardModifierMappingDst": 0x7000000E2
    },
    {
      "HIDKeyboardModifierMappingSrc": 0x7000000E2,
      "HIDKeyboardModifierMappingDst": 0x7000000E3
    }
  ]
}'

defaults write com.apple.dock autohide  # Autohide dock
defaults write com.apple.dock autohide-time-modifier -float 0.3;

 killall Dock 

# Stop iTunes from responding to the keyboard media keys
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null

# Expand save panel by default
# https://www.defaults-write.com/expand-save-panel-default/
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
