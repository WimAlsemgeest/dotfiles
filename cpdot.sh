#!/bin/bash

# Check to see if git command line installed in this machine
IS_GIT_AVAILABLE="$(git --version)"
if [[ $IS_GIT_AVAILABLE == *"version"* ]]; then
  echo "Git is available."
else
  echo "Git is not available."
  exit 1
fi

cp $HOME/{.bashrc,.bash_aliases,.vimrc} .

# Check git status
gs="$(git status | grep -i "modified")"
echo "${gs}"

# If there is a new change
if [[ $gs == *"modified"* ]]; then
  echo "New files.. pushing..."
fi

# Push to git
git add -u;
git commit -m "New backup `date +'%Y-%m-%d %H:%M:%S'`";
git push

