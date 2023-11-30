#!/bin/bash

# Find all 'places' subdirectories and execute the script within each of them
find . -type d -name "places" -execdir sh -c 'cd "{}" && ../../changecolours.sh' \;
