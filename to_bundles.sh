#!/usr/bin/env bash
# to_bundles.sh
# Make executable: chmod u+x to_bundles.sh
# Refactor a page named `X.md` to `content/<section>/X/index.md` to use the
# new page bundles and featured image system
# - E.g. a post `content/post/X.md` is converted to `content/post/X/index.md`
# Credit: George Cushen, Lélio Brun, Nathan Genetzky - MIT License
# https://github.com/wowchemy/hugo-assistant

refactor_pages_to_page_bundles()
{
  # Check that the command was run from the site root.
  if [ ! -d ./content/ ]; then
    echo "Please run the script from the root folder of your site" >&2
    exit 1
  fi
  # Iterate over pages except index.md and _index.md.
  local files="$(find ./content/ -iname '*.md' -not -iname '*index.md')"
  for file in ${files}; do
    local pagedir="${file%.md}"

    echo "${file} -> ${pagedir}/index.md"
    if [ ! -d "${pagedir}" ]; then
      mkdir "${pagedir}"
    fi

    mv "${file}" "${pagedir}/index.md"
  done
}

# Bash Strict Mode
set -eu

# To debug, uncomment line below:
# set -x
refactor_pages_to_page_bundles "$@"
