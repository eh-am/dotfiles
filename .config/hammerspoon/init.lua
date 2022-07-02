stackline = require "stackline"
config = require'stackline.conf'

-- for some reason creating an object (as described here https://github.com/AdamWagner/stackline/wiki/Configuring-stackline#initialize-stackline-with-custom-config)
-- didn't work for me
config.paths.yabai = '/opt/homebrew/bin/yabai'
-- config.appearance.showIcons = false

-- bigger = smaller
--config.appearance.radius = 2
config.appearance.size  = 20
config.appearance.iconPadding = 2
-- c.appearance.offset.x = 0
-- c.appearance.offset.y = 0

-- https://github.com/AdamWagner/stackline/issues/44#issuecomment-735340460
config.features.fzyFrameDetect.enabled = false
config.features.fzyFrameDetect.fuzzFactor = 200


stackline:init(config)
