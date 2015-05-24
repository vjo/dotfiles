#!/usr/bin/env bash

if ! brew_loc="$(type -p brew)" || [ -z "$brew_loc" ]; then
    echo "Install brew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    app_list =(
        'vim'
        'git'
        'ack'
        'imagemagick'
        'wget'
        'ack'
        'browsertime'
        'fuse4x'
        'libevent'
        'libxml2'
        'openssl'
        'postgresql'
        'speedtest_cli'
        'wget'
        'apparix'
        'fuse4x-kext'
        'libgpg-error'
        'libxslt'
        'osxfuse'
        'pyenv'
        'texi2html'
        'x264'
        'apple-gcc42'
        'chromedriver'
        'gettext'
        'libksba'
        'libyaml'
        'pgcli'
        'readline'
        'tig'
        'xvid'
        'autoconf'
        'faac'
        'imagemagick'
        'libpng'
        'nmap'
        'rlwrap'
        'tmux'
        'xz'
        'automake'
        'ffmpeg'
        'jpeg'
        'libtool'
        'node'
        'sbt'
        'tree'
        'yasm'
        'freetype'
        'lame'
        'libvo-aacenc'
        'ntfs-3g'
        'pkg-config'
        'unrar'
        'caskroom/cask/brew-cask' # Install `brew cask`, see http://caskroom.io/
    )

    for app in "${app_list[@]}"
    do
        brew install $app
    done
fi

# Remove outdated versions
brew cleanup --force

echo "Also consider: https://objective-see.com/products.html"
