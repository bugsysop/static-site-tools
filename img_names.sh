#!/bin/bash
# img_names.sh - v1.0
# Make executable: chmod u+x img_names.sh
#
Help()
{
   echo
   echo "Sanitize images file name in working directory:"
   echo
   echo "   1) Replace spaces with dashes (-)"
   echo "   2) Normalize files extension (.jpe | .jpeg) to .jpg"
   echo "   3) Make names all lowercase"
   echo
   echo "Options:"
   echo "   h     Print this Help"
   echo "   m     Hello World"
   echo "   v     Current version of the script"
   echo
   echo "Syntax:  img_names.sh [-h|m|v]"
   echo
}
Mascot()
{
   echo
   echo ' (\(\'
   echo ' ( – -)'
   echo ' ((‘) (’)'
   echo
}
Version()
{
   echo
   echo "img_names.sh"
   echo "Version: 1.0 (11.2020)"
   echo
   echo "   Pure bash: no dependencies"
   echo "   Tested on MacOS 10.14 (Mojave) and Ubuntu 18.04 LTS"
   echo
}
# Get the options
while getopts ":hmv" option; do
   case $option in
      h) # display Help
         Help
         exit;;

      m) # display Help
         Mascot
         exit;;

      v) # display Help
         Version
         exit;;

     \?) # incorrect option
         echo "Error: Invalid option"
         exit;;
   esac
done

# Blancs
for f1 in *; do
  mv "$f1" $(echo "$f1" | tr ' ' '-');
done
# Extension: jpe
for f2 in *.jpe; do
    mv "$f2" "$(basename "$f2" .jpe).jpg"
done
# Extension: jpeg
for f3 in *.jpeg; do
    mv "$f3" "$(basename "$f3" .jpeg).jpg"
done

# Uppercase
for f4 in $( ls | grep [A-Z] ); do
    mv "$f4" $(echo "$f4" | tr 'A-Z' 'a-z');
done
