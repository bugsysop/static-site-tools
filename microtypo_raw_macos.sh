#!/bin/bash
# microtypo_raw_macos.sh - v0.1
#
# References:
# https://www.gnu.org/software/sed/manual/sed.html
# - https://linuxize.com/post/how-to-use-sed-to-find-and-replace-string-in-files/
# - https://unix.stackexchange.com/posts/174610/
# - https://www.cyberciti.biz/faq/unixlinux-sed-case-insensitive-search-replace-matching/
# - https://www.atrixnet.com/in-line-search-and-replace-in-files-with-real-perl-regular-expressions/
#
# Script is apply to all .md files at first level in a directory
# Pb with MacOS: find need empty '' in -i
# Mode: find . -type f -name "*.md" -print0 | xargs -0 sed -i '' 's///g'
#
find . -type f -name "*.md" -print0 | xargs -0 sed -i '' 's/:/ :/g; s/;/ ;/g; s/!/ !/g; s/\?/ \?/g; s/ \./\./g;s/ ,/,/g'
find . -type f -name "*.md" -print0 | xargs -0 sed -i '' "s/'/’/g"
find . -type f -name "*.md" -print0 | xargs -0 sed -i '' 's/«/« /g; s/»/ »/g; s/“ /“/g; s/ ”/”/g; s/\.\.\./…/g'
# Ménage
find . -type f -name "*.md" -print0 | xargs -0 sed -i '' 's/   / /g; s/  / /g; s/  / /g; s/  / /g; s/ ’/’/g'
find . -type f -name "*.md" -print0 | xargs -0 sed -i '' 's/http :/http:/g; s/https :/https:/g; s/ssh :/ssh:/g'
