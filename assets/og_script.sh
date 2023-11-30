#!/bin/bash

### Thanks to @xelser on GitHub

# prepare files
rm *latte*.svg
rm *frappe*.svg
rm *macchiato*.svg
find . -type f ! -name '*red*' -delete
file-rename 's/red/color/g' *.svg  # Change file-rename to rename for deb distros

# make tmp file to edit
colors=(red orange yellow green aqua blue purple)  # Accent Colour Names
for name in "${colors[@]}"; do
  for f in *.svg; do
    cp -- "$f" "${f%.svg}.tmp"
  done
  file-rename "s/color/${name}/g" *.tmp
done

# change colors
color_val0=(EA6962 E78A4E D8A657 A9B665 89B482 7DAEA3 D3869B)  # Main Colours
for i in "${!colors[@]}"; do
  sed -i "s/F38BA8/${color_val0[i]}/g" *${colors[i]}*.tmp
done

color_val1=(BB544E B86E3E AC8445 879150 6D9068 648B82 A86B7C)  # Darker Colours
for i in "${!colors[@]}"; do
  sed -i "s/DF7794/${color_val1[i]}/g" *${colors[i]}*.tmp
done

# Final Renaming & Colouring
file-rename 's/cat-/gruv-mat-/g' *.tmp  # Theme Name
file-rename 's/mocha-/hard-dark-/g' *.tmp  # Flavour Name
sed -i 's/CDD6F4/D4BE98/g' *.tmp  # color of the white file section
sed -i 's/313244/3C3836/g' *.tmp  # color of the middle symbol

# save file
for f in *.tmp; do
  mv -- "$f" "${f%.tmp}.svg"
done

rm -rf *mocha*.svg
