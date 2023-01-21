#!/bin/bash

# if bash_profile is NOT sourced in .bashrc, add it
case `grep -Fx ". ~/.bash_profile" ~/.bashrc >/dev/null; echo $?` in
  1)
cat >> ~/.bashrc <<-EOF
# load bash_profile
if [ -f ~/.bash_profile ]; then
  . ~/.bash_profile
fi
EOF
printf "\n.bashrc updated, make sure to restart your terminal!\n\n"
    ;;
esac