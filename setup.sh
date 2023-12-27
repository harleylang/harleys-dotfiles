#!/bin/bash
############################################################
#
# setup.sh
#
# .harleys-dotfiles Setup Script 
#
############################################################

# install base dependencies
case $OSTYPE in
    'linux-gnu')
        sudo apt-get update
        sudo apt-get upgrade
        sudo apt-get install curl git ansible
        ;;

    *)
        echo "Unknown OS of '$OSTYPE' -- dotfiles failed to install."
        exit 0;
        ;;
esac

# install dotfiles
git clone https://github.com/harleylang/harleys-dotfiles.git ~/.harleys-dotfiles

# run ansible playbook
bash ~/.harleys-dotfiles/update.sh
