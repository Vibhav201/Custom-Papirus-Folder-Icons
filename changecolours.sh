#!/bin/bash

# make tmp file to edit
colors=(selection comment cyan green orange pink purple red yellow)  # Accent Colour Names
for name in "${colors[@]}"; do
  for f in *.svg; do
    cp -- "$f" "${f%.svg}.tmp"
  done
  file-rename "s/color/${name}/g" *.tmp
done

# Accent Colour Values
col1=44475A
col2=6272A4
col3=8be9fd
col4=50fa7b
col5=ffb86c
col6=ff79c6
col7=bd93f9
col8=ff5555
col9=f1fa8c

# Secondary Colour Values
sc_col1=1f212a
sc_col2=4a567c
sc_col3=75c5d5
sc_col4=44d267
sc_col5=d79b5b
sc_col6=d766a8
sc_col7=a582db
sc_col8=d74848
sc_col9=ccd276

file_color=f8f8f2
symbol_color=282a36

# change colors
color_val0=($col1 $col2 $col3 $col4 $col5 $col6 $col7 $col8 $col9)  # Accent Colours
for i in "${!colors[@]}"; do
  sed -i "s/F38BA8/${color_val0[i]}/g" *${colors[i]}*.tmp
done

color_val1=($sc_col1 $sc_col2 $sc_col3 $sc_col4 $sc_col5 $sc_col6 $sc_col7 $sc_col8 $sc_col9)  # Secondary Colours (Rear Leaflet)
for i in "${!colors[@]}"; do
  sed -i "s/DF7794/${color_val1[i]}/g" *${colors[i]}*.tmp
done

# Final Renaming & Colouring
file-rename 's/cat-/dracula-/g' *.tmp  # Theme Name
file-rename 's/mocha-/std-/g' *.tmp  # Flavour Name
sed -i "s/CDD6F4/${file_color}/g" *.tmp  # color of the middle file section
sed -i "s/313244/${symbol_color}/g" *.tmp  # color of the center symbol

# save file
for f in *.tmp; do
  mv -- "$f" "${f%.tmp}.svg"
done

rm -rf *mocha*.svg

