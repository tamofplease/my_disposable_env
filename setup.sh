#!/bin/bash

# 1. Screen Saverを切る
defaults -currentHost write com.apple.screensaver idleTime 0

# 3. スペースの自動並び替えをOFFにする
defaults write com.apple.dock mru-spaces -bool false

# 4. Command + 数字でDesktopの切り替えができるようにする
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 545 "{enabled = 1; value = { parameters = (65535, 1, 0); type = standard; }; }"
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 546 "{enabled = 1; value = { parameters = (65535, 2, 0); type = standard; }; }"
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 547 "{enabled = 1; value = { parameters = (65535, 3, 0); type = standard; }; }"
# 上記のコマンドは Command + 1, Command + 2, Command + 3 に対応します。Command + 4, Command + 5, ...を追加するには、545, 546, 547 の部分を適切な数字に置き換えてください。

# 5. BottomNavをdefaultで非表示にする
defaults write com.apple.dock autohide -bool true

# Kill Dockプロセスして設定を反映させる
killall Dock
