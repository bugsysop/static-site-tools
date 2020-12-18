#!/bin/bash
# git_push.sh [06.2018]
# Source:
# https://medium.com/@thisisAbdus/how-to-automate-your-github-add-commit-and-push-command-using-a-simple-bash-script-45714fbb459d
# Copy at root of Hugo project
# Make executable: chmod u+x img_names.sh
# Usage: ./git_push.sh "Your commit message here"
git add -A
git commit -m "$1"
git push origin master
