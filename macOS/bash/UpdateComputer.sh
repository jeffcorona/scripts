#!/bin/zsh

### variables ###
update=$(softwareupdate -l)

if [[ "$update" == "No new software available." ]]; then
  echo "No update available"
else
  echo "Update found"
fi
