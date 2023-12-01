# Custom Papirus Folder Icons
This is a script to create custom coloured papirus folder icons which can then be set with the [papirus-folders](https://github.com/PapirusDevelopmentTeam/papirus-folders) script. 

## Colour Specification
![](assets/Images/ColourSpec.png)

- 1 represents the '`col*`' values in the script and there can be multiple of these. Its the primary colour for the icon.
- 2 represents the '`sc_col*`' values in the script and there is an `sc-col` value for each `col` value. Its the secondary colour for the icon.
- 3 represents the '`file_color`' and its the colour of the middle file section. 
- 4 represents the '`symbol_color`' and its the colour of the center symbol. 

## Usage
1. Make sure You have [Papirus Icon Theme](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme) installed (preferably in `~/.local/share/icons`)
2. Also, make sure you have the papirus-folders script installed to your home via [this](https://github.com/PapirusDevelopmentTeam/papirus-folders#install) method.
3. Clone this repository and change to cloned directory:
    ```
    git clone https://github.com/Vibhav201/Custom-Papirus-Folder-Icons
    cd Custom-Papirus-Folder-Icons
    ```
4. The [`changecolours.sh`]() script is the script where you have to specify the colour details. Specify icon colour names (`at line 4`) separated by spaces. <br>
    For example, `colors=(selection comment cyan green orange pink purple red yellow)`
5. Specify the *primary colours* values in the same order as the previous step (`from line 13`) in HEX format (without the `#`).
6. Specify the respective *secondary colours* (`from line 24`) similarly.
7. Specify the *file section color* with the ;`file_color`' variable (`at line 34`).
8. Specify the *center symbol color* with the '`symbol_color`' (`at line 35`)
9. Specify the *theme name* in the place of '`dracula`' (`at line 49`).
10. Specify the *flavour name* in the place of '`std`' (`at line 50`).
> NOTES: <br> 
    1. Remove '`dark-`' from `line 49` if your theme doesn't have flavours and you don't want to specify a flavour name. <br>
    2. Your icon files will be named as `*-theme-flavour-color-*.svg`
11. Copy the `changecolours.sh` and `convert.sh` script files to The `Icons` folder. Make sure they have execution permissions.
12. Run `./convert.sh` from the `Icons/` directory and you have created your custom folder icons.
13. Move the two script files back to the repo's root directory.
14. Run `cp -r Icons/* ~/.local/share/icons/Papirus` from the repo's root if you have installed Papirus for the user. <br>
    If you have installed Papirus system-wide, run `sudo cp -r Icons/* /usr/share/icons/Papirus`.
15. Now, you can set the folder icons you prefer using `papirus-folders` command (that you installed in *step 2*). You can check the steps to use it [here](https://github.com/PapirusDevelopmentTeam/papirus-folders#script-usage).
---

> NOTE: Change all '`file-rename`' occurences to '`rename`' in the `changecolours.sh` script for debian-based distros. This script has been tested on Debian and openSUSE but should work on all distros.

## Thanks to 
- [Papirus Development Team](https://github.com/PapirusDevelopmentTeam)
- [Catppuccin Papirus Folders](https://github.com/catppuccin/papirus-folders) by the amazing [Catppuccin](https://github.com/catppuccin) team
- [@xelser](https://github.com/xelser) for the original script present [here](assets/og_script.sh)
 
