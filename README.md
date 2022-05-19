# scripts (for arch)

This repo contains a template bash script and any personal scripts created for portability.

Required symlinks and chmods are listed below.

## symlinks `ln -s <source> <destination>`

1. [bashrc](bashrc) -> ~/.bashrc
2. [bash_aliases](bash_aliases) -> ~/.bash_aliases
3. [update](update) -> ~/bin/update
4. [i3](i3) -> ~/.config/i3
5. [i3/i3blocks.conf](i3/i3blocks.conf) -> ~/.i3blocks.conf
6. [dunst](dunst) -> ~/.config/dunst
7. [pulseaudio-ctl](pulseaudio-ctl) -> ~/.config/pulseaudio-ctl (Only if using `pulseaudio-ctl`)
8. [reflector](reflector) -> /etc/xdg/reflector
9. [profile](profile) -> ~/.profile
10. [nvim](nvim) -> ~/.config/nvim
11. [setOverleafGit](setOverleafGit) -> ~/bin/setOverleafGit
12. [inputrc](inputrc) -> ~/.inputrc

## chmod +x

1. [i3/column-layout](i3/column-layout)
2. [i3/bin/*](i3/bin)
3. [i3/blocklets/*](i3/blocklets)

## Other settings

1. Change rofi themes by running `rofi-theme-selector`
2. Export display and icon themes by running `oomox`, then select them by running `lxappearance`
3. `:PlugInstall` to install nvim plugins
4. The following for submodule ease in git
 * git config --global alias.clone-all 'clone --recurse-submodules'
 * git config --global alias.pull-all 'pull --recurse-submodules'

## Dependencies/Packages/Nice-to-haves

0. `paru` as AUR-helper (replaces `yay`)
1. `lightdm` display manager for login
2. `i3` window manager
3. `rofi` for menus
4. `dunst` for notification
5. [oomox](https://github.com/themix-project/oomox) (`yay -S themix-full-git`) to get themes and `lxappearance` to apply the theme
6. `gnome-screenshot` and `xclip` for screenshot
7. [i3ipc](https://pypi.org/project/i3ipc/) (`pip3 install i3ipc`) for column-layout script
8. `acpilight` for better brightness management
9. `ttf-font-awesome` for font-awesome
10. `feh` for background
11. `blueman` for bluetooth manager
12. [thefuck](https://github.com/nvbn/thefuck) coz why not ;)
13. `ntfs-3g` for ntfs support
14. `pulseaudio`, `pulseaudio-alsa`, <!-- `pulseaudio-ctl` --> and `pavucontrol` for audio management
15. `i3-resurrect` to save and restore layout
16. `bluez-utils` for media keys in bluetooth headset
17. `reflector` to update mirror list (use `mirror` as alias defined in bash_aliases)
18. `polkit-gnome` for authentication agent
19. `vim-plug` for nvim plugin manager
20. `bash-complete-alias` for bash completion on bash_aliases
21. `autorandr` for automatic multi-monitor setup
22. `fscrypt` to encrypt certain directories
