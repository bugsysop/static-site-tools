#!/bin/bash
# hugo_build.sh [17.12.2020]
# Remove ./public directory if exist then buil site for production
# Copy at root of Hugo project
# Make executable: chmod u+x hugo_build.sh
# Enjoy
output_dir=./public
[ -d "$output_dir" ] && rm -fr "$output_dir"
./bin/hugo --minify --gc
