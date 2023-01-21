#!/bin/bash
############################################################
#
# setup.sh
#
# Harley's .dotfiles Setup Script 
#
############################################################

printf "Dotfiles INITIALISING ... \n"

############################################################
# Install Dependencies
############################################################

printf "\nDotfile dependencies INSTALLING ... \n\n"
bash ~/.harleys-dotfiles/src/dependencies.sh
printf "\nDotfile dependencies INSTALLED ... \n\n"

############################################################
# Setup System Configurations
############################################################

bash ~/.harleys-dotfiles/src/bashrc-update.sh
bash ~/.harleys-dotfiles/bin/dotfiles-update.sh

############################################################
