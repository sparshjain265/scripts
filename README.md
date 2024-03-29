# scripts

This repo contains a template bash script and any personal scripts created for portability. They work on my primary `archlinux` setup but should work on any linux (or even unix) based system with minor tweeks. Unmaintained versions of the scripts that I used in my `ubuntu` setup prior to switching to arch can be found in [this](https://github.com/sparshjain265/scripts/tree/ubuntu) branch. This [master](https://github.com/sparshjain265/scripts/tree/master) branch as merged the [arch](https://github.com/sparshjain265/scripts/tree/arch) branch to itself and hence the [arch](https://github.com/sparshjain265/scripts/tree/arch) branch will no longer be updated.

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
* [kitty](kitty) -> ~/.config/kitty
* [ranger](ranger) -> ~/.config/ranger

## chmod +x

* [i3/column-layout](i3/column-layout)
* [i3/bin/*](i3/bin)
* [i3/blocklets/*](i3/blocklets)

## Other settings

* Change rofi themes by running `rofi-theme-selector`
* Export display and icon themes by running `oomox`, then select them by running `lxappearance`
* `:PlugInstall` to install nvim plugins
* `:PlugUpdate` to update the plugins and `:PlugUpgrade` to upgrade vim-plug itself
* The following for submodule ease in git
    * git config --global alias.clone-all 'clone --recurse-submodules'
    * git config --global alias.pull-all 'pull --recurse-submodules'

## Dependencies/Packages/Nice-to-haves

* `paru` as AUR-helper (replaces `yay`)
* `lightdm` display manager for login
* `i3` window manager
* `rofi` for menus
* `dunst` for notification
* [oomox](https://github.com/themix-project/oomox) (`yay -S themix-full-git`) to get themes and `lxappearance` to apply the theme
* `gnome-screenshot` and `xclip` for screenshot
* [i3ipc](https://pypi.org/project/i3ipc/) (`pip3 install i3ipc`) for column-layout script
* `acpilight` for better brightness management
* `ttf-font-awesome` for font-awesome
* `nerd-fonts` and `nerd-fonts-meta` for nerd fonts
* `feh` for background
* `blueman` for bluetooth manager
* [thefuck](https://github.com/nvbn/thefuck) coz why not ;)
* `ntfs-3g` for ntfs support
* `alsa alsa-utils alsa-tools pipewire pipewire-alsa pipewire-pulse pipewire-jack pavucontrol helvum` for audio management
* `i3-resurrect` to save and restore layout
* `i3-swallow` for `swallow` command in i3
* `bluez-utils` for media keys in bluetooth headset
* `reflector` to update mirror list (use `mirror` as alias defined in bash_aliases)
* `polkit-gnome` for authentication agent
* `bash-complete-alias` for bash completion on bash_aliases
* `arandr` and `autorandr` for automatic multi-monitor setup
* `fscrypt` to encrypt certain directories
* `fzf`, `fzf-extras`, and `fzf-tab-completion-git` for fuzzy search (optional dependencies: `ctags`, `fasd`, `rl_custom_function-git`)
* `kitty` for GPU rendering fast terminal emulator
* `ranger` for tui file manager
* `nvim` for neovim
* `vim-plug` (or `vim-plug-neo`) for nvim plugin manager
* `nvim-packer` for lua based nvim plugin manager
* `pynvim` (`pip install pynvim`) for python support in nvim
* `sudo npm install -g neovim` for node support in nvim
* `interception-caps2esc` from [caps2esc](https://gitlab.com/interception/linux/plugins/caps2esc) and configure `/etc/interception/udevmon.yaml` with the following data:

    ```[yaml]
    - JOB: "intercept -g $DEVNODE | caps2esc | uinput -d $DEVNODE"
    DEVICE:
    EVENTS:
    EV_KEY: [[KEY_CAPSLOCK, KEY_ESC]]
    ```

    so that Caps Lock and Esc keys are swapped, and the Caps Lock key also behaves like Ctrl in combination with other keys
* `python-powerline` and `powerline-fonts` for patched fonts in nvim plugins
* `chafa imagemagick ffmpegthumbnailer poppler epub-thumbnailer-git fontpreview` for telescope preview in nvim
