# VSCode NVIM Configs
This is a config for using neovim inside vscode only.

## Quickstart
- Install Neovim (make sure to use the neovim version supported by the neovim vscode extension)
- Install nevoim extension for vscode
- Configure neovim binary path in the extension setting
- ensure that nevoim works in vscode
- install packer by cloning them in the nvim plugins directory (the full command is available in its repo)
- install all plugin (leap) by just opening up vscode (packer is only loaded in nvim if in vscode mode) and entering :PackerInstall
- you are good to go :)


## HJKL outside of vim
In windows, you can easily use powertoys. In Ubuntu, you can configure xmodmaps:
in Ubuntu, try this:
xmodmap -e "keycode 133 = Mode_switch" # set Super_l as the "Mode_switch"
xmodmap -e "keycode 43 = h H h Left" # h
xmodmap -e "keycode 44 = j J j Down" # j
xmodmap -e "keycode 45 = k K k Up" # k
xmodmap -e "keycode 46 = l L l Right" # l
and then set these up in your ~/.profile to be set on boot
(https://askubuntu.com/questions/465924/how-to-map-modifier-hjkl-to-arrow-key-functionality)

or maybe this?
https://github.com/sezanzeb/input-remapper?tab=readme-ov-file

this seems promising for arch linux:
https://wiki.archlinux.org/title/X_keyboard_extension#Caps_hjkl_as_vimlike_arrow_keys


## Cool tricks
You can use multi cursor from visual line/block with ma/mA or mi/mI
