#!/bin/bash
############################################################
#
# deploy.sh 
#
# This script will take config files, build them, and 
# symlink them to the user's target configuration files.
#
# This file takes 3 parameters:
# -t | --target:    The target config file path to symlink.
# -p | --temp:      The temp filename to generated in /tmp.
# -c | --config     The conf files (use space-separated 
#                   values if multiple conf files require
#                   concatnating); relative to /etc folder.
#                       
############################################################

# get cli variables
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -t|--target) target="$2"; shift ;;
        -p|--temp) temp="$2"; shift ;;
        -c|--config) config="$2"; shift ;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

# in case config has multiple files, split them into an array
IFS=' ' read -r -a configarray <<< "$config"

# concatnate config strings 
CONFIG=""
for element in "${configarray[@]}"
do
    RAW=$(cat ~/.harleys-dotfiles/etc/$element)
    CONFIG+=$RAW$'\n'$'\n'
done

# write to tmp file
cat > ~/.harleys-dotfiles/tmp/$temp <<-EOF 
$CONFIG 
EOF

# symlink to a variable
ln -fs ~/.harleys-dotfiles/tmp/$temp $target 
printf "\nDotfiles installed ... $target.\n\n"
