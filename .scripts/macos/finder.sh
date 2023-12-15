#!/bin/bash

## Configure Finder.


# When opening a new window, start in the home directory.
defaults write com.apple.finder NewWindowTargetPath "file://$HOME"

# Show file extensions.
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show hidden files.
defaults write com.apple.finder AppleShowAllFiles -bool true

# Don't warn about changing a file extension.
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Disable window animations and Get Info animations in Finder.
defaults write com.apple.finder DisableAllAnimations -bool true

# Show Path Bar.
defaults write com.apple.finder ShowPathbar -bool true

# Show Status Bar.
defaults write com.apple.finder ShowStatusBar -bool true

# Show Tab Bar.
defaults write com.apple.finder ShowTabView -bool true

# Display full path in window titles.
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Don't clutter network volumes with .DS_Store files.
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Warn before emptying the Trash.
defaults write com.apple.finder WarnOnEmptyTrash -bool true

# Empty Trash securely by default.
defaults write com.apple.finder EmptyTrashSecurely -bool true

# Use list view in all Finder windows by default. Other view modes: 'icnv', 'Nlsv', 'Flwv'.
defaults write com.apple.finder FXPreferredViewStyle -string 'clmv'

# Show the ~/Library folder.
chflags nohidden ~/Library

# Set sidebar icon size to medium.
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2

# Don't show any special icons on desktop.
defaults write ShowExternalHardDrivesOnDesktop -bool false
defaults write ShowHardDrivesOnDesktop -bool false
defaults write ShowRemovableMediaOnDesktop -bool false
defaults write ShowMountedServersOnDesktop -bool false

# Enable spring loading for directories, with no delay.
defaults write NSGlobalDomain com.apple.springing.enabled -bool true
defaults write NSGlobalDomain com.apple.springing.delay -float 0

# Enable Sharing & Permissions section in Info panels for files and directories.
defaults write com.apple.finder FXInfoPanesExpanded -dict Privileges -bool false

# Show Sidebar
defaults write com.apple.finder ShowSidebar -bool true

# Save screen captures in `Pictures` instead of `Desktop`.
defaults write com.apple.screencapture location ~/Pictures/screen_captures

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

killall SystemUIServer

# Restart Finder so settings will take effect.
killall Finder


sudo defaults write /.Spotlight-V100/VolumeConfiguration.plist Exclusions -array-add "$HOME/Downloads"
# From http://superuser.com/a/591462 -- didn't seem to work.
touch ~/Downloads/.metadata_never_index
