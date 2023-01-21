#!/bin/bash

printf "\nDotfile INSTALLING ...\n\n"

bash ~/.harleys-dotfiles/src/deploy.sh \
    --config bash.profile.conf \
    --temp bash.profile.conf \
    --target ~/.bash_profile

bash ~/.harleys-dotfiles/src/deploy.sh \
    --config git.conf \
    --temp git.conf \
    --target ~/.gitconfig

bash ~/.harleys-dotfiles/src/deploy.sh \
    --config "i3.base.conf i3.custom.conf" \
    --temp i3.conf \
    --target ~/.config/i3/config

bash ~/.harleys-dotfiles/src/deploy.sh \
    --config i3.status.conf \
    --temp i3.status.conf \
    --target ~/.i3status.conf

bash ~/.harleys-dotfiles/src/deploy.sh \
    --config rc.conf \
    --temp rc.conf \
    --target ~/.config/ranger/rc.conf

printf "\nDotfiles INSTALLED.\n\n"
