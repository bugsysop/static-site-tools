#!/bin/bash
# img_sizes.sh - v1.0
# Make executable: chmod u+x img_sizes.sh
#
Help()
{
   echo
   echo "Generate various sizes for all images in working directory:"
   echo
   echo "   1) Large: "
   echo "   2) Medium: "
   echo "   3) Small: "
   echo "   4) Thumbnail: "
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
   echo ' ( •,•)'
   echo ' (")_(")'
   echo
}
Version()
{
   echo
   echo "img_sizes.sh"
   echo "Version: 1.0 (11.2020)"
   echo
   echo "   Need ImageMagic to be present"
   echo "   Tested on MacOS 10.14 (Mojave) and Ubuntu 18.04 LTS"
   echo
}

# Get the options
while getopts ":hmv" option; do
   case $option in
      h) # display Help
         Help
         exit;;
      m) # Display Mascot
         Mascot
         exit;;
      v) #Display version
         Version
         exit;;
     \?) # incorrect option
         echo "Error: Invalid option"
         exit;;
   esac
done

for f in $(find . -type f -iname "*.jpg")
  do
  convert ./"$f" -resize 960x960 -strip -quality 82\> ./"${f%.jpg}_lg.jpg"
  convert ./"$f" -resize 700x700 -strip -quality 82\> ./"${f%.jpg}_md.jpg"
  convert ./"$f" -resize 400x400 -strip -quality 82\> ./"${f%.jpg}_sm.jpg"
  convert ./"$f" -resize 250x250 -strip -quality 82\> ./"${f%.jpg}_thumb.jpg"
done
