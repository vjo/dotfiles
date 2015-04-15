#!/usr/bin/env bash

# Screencapture
echo "Create ~/Pictures/screencaptures if it does not exists"
mkdir -p ~/Pictures/screencaptures
echo "Set screenshots location to ~/Pictures/screencaptures"
defaults write com.apple.screencapture location ~/Pictures/screencaptures

# Keyboard
echo "Set a shorter delay until key repeat"
defaults write NSGlobalDomain InitialKeyRepeat -int 12
echo "Set a fast key repeat rate"
defaults write NSGlobalDomain KeyRepeat -int 1

# Dock
echo "Set the dock size to 36px"
defaults write com.apple.dock tilesize -int 36

# Finder
echo "Display full POSIX path as Finder window title"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
echo "When performing a search, search the current folder by default"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
echo "Disable the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
echo "Show all filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
echo "Show the ~/Library folder"
chflags nohidden ~/Library

# Mail
echo "Disable Mail automatic spell checking"
defaults write com.apple.mail SpellCheckingBehavior -string "NoSpellCheckingEnabled"

# Time Machine
echo "Prevent Time Machine from prompting to use new hard drives as backup volume"
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Activity Monitor
echo "Show the main window when launching Activity Monitor"
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true
echo "Visualize CPU usage in the Activity Monitor Dock icon"
defaults write com.apple.ActivityMonitor IconType -int 5
echo "Show all processes in Activity Monitor"
defaults write com.apple.ActivityMonitor ShowCategory -int 0
echo "Sort Activity Monitor results by CPU usage"
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

# Misc
echo "Set highlight color to green"
defaults write NSGlobalDomain AppleHighlightColor -string "0.764700 0.976500 0.568600"
echo "Enable AirDrop over Ethernet and on unsupported Macs running Lion"
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true
echo "Avoid creating .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
echo "Disable auto-correct"
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

echo "Kill affected applications"
for app in Finder Dock Mail SystemUIServer; do killall "$app" >/dev/null 2>&1; done
