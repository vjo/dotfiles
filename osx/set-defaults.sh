#!/usr/bin/env bash

# Screencapture
echo "Create ~/Pictures/screencaptures if it does not exists"
mkdir -p ~/Pictures/screencaptures
echo "Set screenshots location to ~/Pictures/screencaptures"
defaults write com.apple.screencapture location ~/Pictures/screencaptures

# Keyboard & Mouse
echo "Set a shorter delay until key repeat"
defaults write NSGlobalDomain InitialKeyRepeat -int 15
echo "Set a fast key repeat rate"
defaults write NSGlobalDomain KeyRepeat -int 2
echo "Set mouse speed to resonable fast"
defaults write NSGlobalDomain com.apple.mouse.scaling -float 3
echo "Disable natural scrolling"
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Dock
echo "Set dock size to 36px"
defaults write com.apple.dock tilesize -int 36
echo "Disable dock magnification"
defaults write com.apple.dock magnification -bool false
echo "Show battery percentage"
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# Menu bar
echo "Set clock date format to HH:mm no flashing separators"
defaults write com.apple.menuextra.clock DateFormat -string "HH:mm"
defaults write com.apple.menuextra.clock FlashDateSeparators -bool false
echo "Set clock to digital"
defaults write com.apple.menuextra.clock IsAnalog -bool false

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

# Spell checker
echo "Disable automatic spelling correction"
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain NSSpellCheckerAutomaticallyIdentifiesLanguages -bool true

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
echo "Set graphite OSX appearance"
defaults write NSGlobalDomain AppleAquaColorVariant -int 6
echo "Set highlight color to purple"
defaults write NSGlobalDomain AppleHighlightColor -string "0.913700 0.721600 1.000000"
echo "Enable AirDrop over Ethernet and on unsupported Macs running Lion"
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true
echo "Save document to disk by default (not to cloud)"
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
echo "Avoid creating .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
echo "Disable auto-correct"
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
echo "Disable smart dashes as they’re annoying when typing code"
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
echo "Require password immediatly after sleep or screen saver begins"
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

echo "Kill affected applications"
for app in Finder Dock Mail SystemUIServer; do killall "$app" >/dev/null 2>&1; done
