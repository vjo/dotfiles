#!/usr/bin/env bash

if npm_loc="$(type -p npm)" || [ -z "$npm_loc" ]; then
    app_list=(
        'castnow'
        'tldr'
        'keybase-installer'
    )

    for app in "${app_list[@]}"
    do
        npm install -g $app
    done
else
    echo "Please, install node";
fi
