#!/usr/bin/env bash

echo "Set up keyboard stuff"
set -x

defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
# KeyRepeat: 120, 90, 60, 30, 12, 6, 2
# InitialKeyRepeat: 120, 94, 68, 35, 25, 15
defaults write -g KeyRepeat -int 2
defaults write -g InitialKeyRepeat -int 15


# Remaps
# 
# Caps-Lock to Escape (https://stackoverflow.com/questions/127591/using-caps-lock-as-esc-in-mac-os-x/46460200#46460200D 
# CMD -> Options
# Options -> CMD
hidutil property --set '{
  "UserKeyMapping": [
    {"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x700000029},
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

# Not sure we can kill the dock always, since yabai injects into it
#killall Dock 

# Stop iTunes from responding to the keyboard media keys
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null

# Expand save panel by default
# https://www.defaults-write.com/expand-save-panel-default/
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true


# Disable all animnations
# https://www.reddit.com/r/MacOS/comments/11p10ho/can_you_disable_macos_animations/
defaults write -g NSScrollViewRubberbanding -int 0
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false
defaults write -g NSScrollAnimationEnabled -bool false
defaults write -g NSWindowResizeTime -float 0.001
defaults write -g QLPanelAnimationDuration -float 0
defaults write -g NSScrollViewRubberbanding -bool false
defaults write -g NSDocumentRevisionsWindowTransformAnimation -bool false
defaults write -g NSToolbarFullScreenAnimationDuration -float 0
defaults write -g NSBrowserColumnAnimationSpeedMultiplier -float 0
defaults write com.apple.dock autohide-time-modifier -float 0
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock expose-animation-duration -float 0
defaults write com.apple.dock springboard-show-duration -float 0
defaults write com.apple.dock springboard-hide-duration -float 0
defaults write com.apple.dock springboard-page-duration -float 0
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write com.apple.Mail DisableSendAnimations -bool true
defaults write com.apple.Mail DisableReplyAnimations -bool true
defaults write NSGlobalDomain NSWindowResizeTime .001

# disable spelling correction
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

# Disables auto capitalization
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disables "smart" dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disables automatic period substitutions
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Disables smart quotes 
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# always search in specific folder in finder
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# always show scrollbars
defaults write -g AppleShowScrollBars -string "Always"


# https://www.reddit.com/r/MacOS/comments/we8ztm/comment/mzx8551/
# autohide dock
osascript -e 'tell application "System Events" to set frontApp to name of first application process whose frontmost is true' -e 'tell application "System Events" to tell dock preferences to set autohide menu bar to (frontApp is not "Finder")'

