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

4. Install some useful tools

    ```[bash]
    # pacman -S python pygmentize htop tmux bash-completion wget which lshw pacman-contrib terminator neovim git
    ```

5. Install `paru` - an AUR helper and a pacman wrapper. Also install `pkgstats` package to help arch devs with package info.

6. GUI - Current laptop has a MUX switch and the following configuration only works in *hybrid* mode. Yet to figure out how to make it work in both *hybrid* and *dGPU* modes.

    1. Display Driver - I have nvidia graphics card, if integrated, it may help to install integrated graphics driver as well - intel in my case.

        ```[bash]
        # pacman -S xf86-video-intel
        # pacman -S nvidia-dkms nvidia-utils nvidia-settings lib32-nvidia-utils nvidia-prime lib32-opencl-nvidia opencl-nvidia libvdpau lib32-libvdpau libxnvctrl vulkan-icd-loader lib32-vulkan-icd-loader vkd3d lib32-vkd3d opencl-headers opencl-clhpp vulkan-validation-layers lib32-vulkan-validation-layers
        ```
		Create update hook as described on wiki.

    2. Display Server - I use Xorg here, another alternative is Wayland.

        ```[bash]
        # pacman -S xorg xorg-server xorg-apps xorg-xinit
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
        # pacman -S noto-fonts ttf-ubuntu-font-family ttf-dejavu ttf-freefont ttf-liberation ttf-droid ttf-inconsolata ttf-roboto ttf-font-awesome papirus-icon-theme
        ```

    6. Additional tools

        ```[bash]
        # pacman -S ranger rofi conky dmenu xdg-user-dirs
        # xdg-user-dirs-update
        ```

7. Sound Drivers and utilities

    ```[bash]
    # pacman -S alsa alsa-utils alsa-tools pipewire pipewire-alsa pipewire-pulse pipewire-jack pavucontrol helvum
    ```

8. Other applications: firefox, xdg-desktop-portal for good integration of sandboxed apps, libreoffice, transmission, vlc, neofetch, man for man-pages, vscode, google chrome

    ```[bash]
    # pacman -S firefox xdg-desktop-portal xdg-desktop-portal-gnome libreoffice transmission-gtk vlc neofetch man
    $ paru -S visual-studio-code-bin google-chrome
    ```

9. Power management with systemd: laptop events - see wiki

    ```[bash]
    # pacman -S acpid tlp
    # systemctl enable tlp
    $ paru -S tlpui

10. Trackpad settings: modify `/etc/X11/xorg.conf.d/30-touchpad.conf` according to [30-touchpad.conf](xorg/30-touchpad.conf).

11. May want to install gnome DE for its useful softwares.

12. Follow [README](README.md) for further customization.
