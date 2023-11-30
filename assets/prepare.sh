#!/bin/bash

# prepare files from the Catppuccin papirus-folder repo
rm *latte*.svg
rm *frappe*.svg
rm *macchiato*.svg
find . -type f ! -name '*red*' -delete
file-rename 's/red/color/g' *.svg  # Change file-rename to rename for deb distros
