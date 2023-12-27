#!/bin/bash
############################################################
#
# update.sh
#
# .harleys-dotfiles Update Script 
#
############################################################

# get latest copy of harleys-dotfiles
(cd ~/.harleys-dotfiles && git pull)

# shout about "become" password
echo "Please enter your sudo password when prompted for a 'BECOME' password."
echo "The 'BECOME' password is used by ansible to install dependencies."

# identify args to pass to ansible
EXTRAS=();
if [[ "$#" -gt 0 && "$*" == *aconditional* ]]; then
    EXTRAS+=("aconditional=true");
fi

# run the playbook; if there are args to pass, pass them; else don't
if [[ ${#EXTRAS[@]} -gt 0 ]]; then
    ansible-playbook \
    ~/.harleys-dotfiles/playbook.yaml \
    --connection=local \
    --ask-become-pass \
    -e "${EXTRAS[@]}" \
    -i ~/.harleys-dotfiles/inventory.ini 
else
   ansible-playbook \
    ~/.harleys-dotfiles/playbook.yaml \
    --connection=local \
    --ask-become-pass \
    -i ~/.harleys-dotfiles/inventory.ini 
fi