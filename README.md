# scripts (for arch)

This repo contains a template bash script and any personal scripts created for portability.

Required symlinks and chmods are listed below.

## symlinks `ln -s <source> <destination>`

* [bash_profile](bash_profile) -> ~/.bash_profile
* [bashrc](bashrc) -> ~/.bashrc
* [bash_aliases](bash_aliases) -> ~/.bash_aliases
* [bin](bin) -> ~/bin
* [i3](i3) -> ~/.config/i3
* [i3/i3blocks.conf](i3/i3blocks.conf) -> ~/.i3blocks.conf
* [dunst](dunst) -> ~/.config/dunst
* [pulseaudio-ctl](pulseaudio-ctl) -> ~/.config/pulseaudio-ctl (Only if using `pulseaudio-ctl`)
* [reflector](reflector) -> /etc/xdg/reflector
* [profile](profile) -> ~/.profile
* [nvim](nvim) -> ~/.config/nvim
* [inputrc](inputrc) -> ~/.inputrc
* [gtk-2.0](gtk-2.0) -> ~/.config/gtk-2.0
* [gtk-3.0](gtk-3.0) -> ~/.config/gtk-3.0
* [gtk-4.0](gtk-4.0) -> ~/.config/gtk-4.0
* [picom](picom) -> ~/.config/picom
* [terminator](terminator) -> ~/.config/terminator
* [ranger](ranger) -> ~/.config/ranger

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
14. `alsa alsa-utils alsa-tools pipewire pipewire-alsa pipewire-pulse pipewire-jack pavucontrol helvum` for audio management
15. `i3-resurrect` to save and restore layout
16. `bluez-utils` for media keys in bluetooth headset
17. `reflector` to update mirror list (use `mirror` as alias defined in bash_aliases)
18. `polkit-gnome` for authentication agent
19. `vim-plug` for nvim plugin manager
20. `bash-complete-alias` for bash completion on bash_aliases
21. `arandr` and `autorandr` for automatic multi-monitor setup
22. `fscrypt` to encrypt certain directories
23. `fzf`, `fzf-extras`, and `fzf-tab-completion-git` for fuzzy search (optional dependencies: `ctags`, `fasd`, `rl_custom_function-git`)
24. `ranger` for tui file manager.
