#!/usr/bin/env bash

if brew_cast_loc="$(type -p brew cast)" || [ -z "$brew_cast_loc" ]; then
    app_list=(
        'firefox'
        'chromium'
        'evernote'
        'spotify'
        'vlc'
        'menumeters'
        'iterm2'
        'spectacle'
        'skype'
        'steam'
        #'pushbullet' not available yet
        'openemu'
        'hubic'
        'tunnelblick'
        'gpgtools'
        'jumpcut'
    )

    for app in "${app_list[@]}"
    do
        brew cask install --appdir="/Applications" $app
    done
fi
