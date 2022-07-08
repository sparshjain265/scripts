# Installation

This file illustrates/describes the steps taken to install. For help setting up or installing in future. **Always** refer to the [wiki](https://wiki.archlinux.org/title/Installation_guide) for latest instructions. This is only for a reference to the steps taken in the past.

## Main Installation

0. Prepare the installation media.
1. Boot the live environment.
2. Set the console keyboard layout. (Default is US). Kept it same.
3. Verify the boot mode (UEFI).
4. Connect to the internet. (wifi - using `iwctl`). If facing problems, can connect to phone (iPhone) via usb-cable and tether to connect to the internet (works using `systemd-networkd` and `systemd-resolved`). Note that these network tools are not configured and enabled in the installed system. Need to do it ourselves.
5. Update the system clock. Set timezone. (Use `timedatectl`).
6. Partition the disks. If dual booting windows, an EFI partition should already be present, otherwise create one (preferrably 1GB but many times as low as 250-300MB also works). One root partition (ext4) is necessary for main system. I keep my home directory in the root partition. Finally, a swap partition as well.
    1. Create Partition (use `fdisk`).
    2. Format the partition.
    3. Make Swap.
    4. Swap on.
7. Mount the filesystems (root, boot).
8. Main Installation - this installs the main kernel and packages. Other packages can be installed after chrooting using pacman. Make sure to configure internet properly before any reboot.

    ```[bash]
    # pacstrap /mnt base base-devel linux linux-headers linux-firmware nano vim networkmanager network-manager-applet nm-connection-editor
    ```

9. Generate fstab.

    ```[bash]
    # genfstab -U /mnt >> /mnt/etc/fstab
    ```

10. Change root into new system. `arch-chroot`. If all has been good till here, then in case of any problem, we can safely boot into arch-live-usb, mount appropriate filesystems, and chroot into the system to fix it.

11. Set timezone and hwclock

    ```[bash]
    # ln -sf /usr/share/zoneinfo/{Region}/{City} /etc/localtime
    # hwclock --systohc
    ```

12. Localization - see wiki

13. Network Configuration
    1. Create hostname file
    2. Creates hosts file
    3. Enable/Start NetworkManager
    4. Enable wpa_supplicant

14. Adding user

    ```[bash]
    # passwd
    # useradd -m {username}
    # passwd {username}
    # groupadd sudo libvirt docker
    # usermod -aG network,power,wheel,audio,disk,input,kvm,lp,storage,video,users,sudo,libvirt,docker {username}
    ```

15. Grant sudo privileges by editing the sudoers file with either `visudo` or `nano /etc/sudoers` and uncommenting wheel and sudo groups.

16. Bootloader. I will use systemd-boot. Check wiki for more detail. Sample config files are present in [systemd-boot](systemd-boot).
    1. Intall bootctl `bootctl install`.
    2. Enable systemd-boot-update.
    3. Create /boot/loader/loader.conf
    4. Create /boot/loader/entries/{entry}[-fallback].conf

17. Install microcode (`amd/intel-ucode`)

18. Configure Hibernate.
    1. Configure initramfs
    2. Regenerate initramfs

19. Exit the chroot environment and unmount all the partitions (`umount -R /mnt`), then restart. You have now successfully installed archlinux on your system.

## Post Installation

Now that we have our bare-bones arch-linux installation, let us configure it to our liking.

1. We have already created 1 non-root user with sudo privileges. We can create more users if required.
2. Enable color, parallel downloads and multi-lib (for 32-bit packages) in `/etc/pacman.conf`.
3. Update mirrors using reflector (need to install first)

    ```[bash]
    # reflector --verbose --latest 100 --sort rate --save /etc/pacman.d/mirrorlist
    ```

4. Install some useful tools - pip pynvim is required for some nvim plugins - Install nvim plugins with :PlugInstall command

    ```[bash]
    # pacman -S python python-pip pygmentize htop tmux bash-completion wget which lshw pacman-contrib terminator neovim git github-cli
    $ pip install pynvim
    ```

5. Install `paru` - an AUR helper and a pacman wrapper. Also install `pkgstats` package to help arch devs with package info.

6. GUI - Current laptop has a MUX switch and the following configuration only works in *hybrid* mode. Yet to figure out how to make it work in both *hybrid* and *dGPU* modes. (Somehow, the same setup works in both modes right now - and laptop display gives 240Hz refresh rate only with dGPU. Seems like intel GPU only supports 60Hz and nvidia GPU supports 60Hz and 240Hz)

    1. Display Driver - I have nvidia graphics card

        ```[bash]
        # pacman -S nvidia nvidia-utils nvidia-settings lib32-nvidia-utils nvidia-prime
        ```

        Create update hook as described on wiki.

    2. Display Server - I use Xorg here, another alternative is Wayland.

        ```[bash]
        # pacman -S xorg xorg-server xorg-apps xorg-xinit xorg-xinput xterm
        ```

    3. Window Manager - I use i3, other options are sway or even full fledged DE like Gnome, KDE, Xfce.

        ```[bash]
        # pacman -S i3 numlockx
        ```

    4. Display Manager - I use lightdm, other options are GDM, SDDM, LXDM, etc.

        1. Install

            ```[bash]
            # pacman -S lightdm lightdm-gtk-greeter
            ```

        2. Configure - `/etc/lightdm/lightdm.conf`. Under `[Seat:*]` add `display-setup-script=/etc/lightdm/display_setup.sh`. [display_setup.sh](lightdm/display_setup.sh) is present in the [lightdm](lightdm) directory. Also add `greeter-setup-script=/usr/bin/numlockx on` and `logind-check-graphical=true`.

        3. Enable lightdm service.

    5. Additional fonts and icons

        ```[bash]
        # pacman -S noto-fonts noto-fonts-emoji ttf-ubuntu-font-family ttf-dejavu ttf-freefont ttf-liberation ttf-droid ttf-inconsolata ttf-roboto ttf-font-awesome papirus-icon-theme
        ```

    6. Additional tools

        ```[bash]
        # pacman -S ranger rofi conky dmenu dunst xdg-user-dirs
        $ xdg-user-dirs-update
        ```

7. Sound Drivers and utilities

    ```[bash]
    # pacman -S alsa alsa-utils alsa-tools pipewire pipewire-alsa pipewire-pulse pipewire-jack pavucontrol helvum
    ```

8. Power management with systemd: laptop events - see wiki - use tlpui to change settings easily.

    ```[bash]
    # pacman -S acpi acpid tlp
    # systemctl enable tlp
    $ paru -S tlpui

9. Trackpad settings: modify `/etc/X11/xorg.conf.d/30-touchpad.conf` according to [30-touchpad.conf](xorg/30-touchpad.conf).

10. Bluetooth

    ```[bash]
    # pacman -S blueman bluez-utils
    # systemctl enable bluetooth blueman-mechanism
    ```

11. Other applications: firefox, xdg-desktop-portal for good integration of sandboxed apps, libreoffice, transmission, vlc, neofetch, man for man-pages, vscode, google chrome, discord, telegram, paru (to track via paru itself), oomox/themix + lxappearance for themes, zathura for pdf, gnome-screenshot + xclip for screenshots, calendar, calculator, polkit for authentication agent, i3ipc for column-layout script, acpilight for better brightness management, feh for background, thefuck coz why not, ntfs-3g for NTFS support, i3-resurrect to save and restore layout, vim-plug for vim/nvim plugin manager, bash-complete-alias for bash completion on aliases, arandr and autorandr for display setup, fscrypt to encrypt certain directories, mlocate for file find, sysstat for system stats, acpi_call-dkms lm-sensors asus-fan-control for laptop fan control, brightnessctl asus-kbd-backlight for backlit keyboard

    ```[bash]
    # pacman -S firefox xdg-desktop-portal xdg-desktop-portal-gnome libreoffice transmission-gtk vlc neofetch man zathura gnome-screenshot xclip gnome-calendar gnome-calculator polkit-gnome acpilight feh ntfs-3g arandr autorandr fscrypt mlocate sysstat lm-sensors acpi_call-dkms
    $ paru -S paru visual-studio-code-bin google-chrome themix-full-git lxappearance thefuck i3-resurrect vim-plug bash-complete-alias asus-fan-control asus-kbd-backlight discord telegram-desktop
    $ pip install i3ipc
    # updatedb
    # systemctl enable asus-kbd-backlight
    ```

12. May want to install gnome DE for its useful softwares. May cause problems, only install if necessary.

13. Using autorandr to automatically set up display resolution, refresh rates, and dpi based on detected monitor set up. The current config files can be found in [autorandr](autorandr).

14. ASUS ROG specific (optional) - See [ASUS Linux](https://asus-linux.org/wiki/arch-guide/) for details.

    1. Enable g14 repo in pacman.conf and run a full system update (`sudo pacman -Syu`).
    2. Install `asusctl`, `supergfxctl` and `asusctltray-git` for customization, etc. Note that `asusctl` conflicts with `tlp` which is a dependency for `tlpui`, hence may need to remove that manually. `supergfxctl` is only useful in intel+nvidia graphics mode but not in dedicated nvidia graphics mode.

        ```[bash]
        # pacman -S asusctl supergfxctl
        # systemctl enable --now power-profiles-daemon supergfxd
        $ systemctl --user enable --now asusd-user asus-notify
        $ paru -S asusctltray-git
        ```

    3. You may also want to install custom kernels for some driver fixes, hardware support, etc. If you are using custom kernel, use the `nvidia-dkms` package as the regular `nvidia` package works only with stock arch kernel. You may also need to update the corresponding **pacman hook** to update the initramfs after nvidia driver upgrade. Even more optional. All features work so far without using the custom kernel.

        ```[bash]
        # pacman -S linux-g14 linux-g14-headers nvidia-dkms
        ```

    4. Update your bootloader to give you option to boot into these kernels.

    5. Create `~/.Xmodmap` file using `xmodmap -pke > ~/.Xmodmap` and add `XF86Game` to `keycode 248` to recognise `ASUS ROG Keystone` as game key.

Follow [README](README.md) for further customization.
