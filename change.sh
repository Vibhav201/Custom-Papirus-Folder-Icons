#!/bin/bash

# make tmp file to edit
colors=(dark_grey)
for name in "${colors[@]}"; do
  for f in *.svg; do
    cp -- "$f" "${f%.svg}.tmp"
  done
  file-rename "s/color/${name}/g" *.tmp
done

col=414558  # Main Colour
sc_col=363a49  # Secondary Colour (Rear Leaflet)

file_color=8d93b9
symbol_color=8187aa

# change colors
color_val0=($col)
for i in "${!colors[@]}"; do
  sed -i "s/F38BA8/${color_val0[i]}/g" *${colors[i]}*.tmp
done

color_val1=($sc_col)  # Darker colors for the back part
for i in "${!colors[@]}"; do
  sed -i "s/DF7794/${color_val1[i]}/g" *${colors[i]}*.tmp
done

# cat to gruv
file-rename 's/cat-/dracula-/g' *.tmp  # Theme Name
file-rename 's/mocha-/subtle-/g' *.tmp  # Flavour Name
sed -i "s/CDD6F4/${file_color}/g" *.tmp  # color of white file section
sed -i "s/313244/${symbol_color}/g" *.tmp  # color of middle symbol

# save file
for f in *.tmp; do
  mv -- "$f" "${f%.tmp}.svg"
done

rm -rf *mocha*.svg
