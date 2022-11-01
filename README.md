# Luis's dotfiles

**Warning**: Don’t blindly use my settings unless you know what that entails. Use at your own risk!

## PowerShell setup (Windows)

- [Nerd fonts](https://github.com/ryanoasis/nerd-fonts) - Powerline-patched fonts. I use Hack.
- [Scoop](https://scoop.sh/) - A command-line installer
- [Oh My Posh](https://ohmyposh.dev/) - Prompt theme engine
- [Terminal Icons](https://github.com/devblackops/Terminal-Icons) - Folder and file icons
- [PSReadLine](https://docs.microsoft.com/en-us/powershell/module/psreadline/) - Cmdlets for customizing the editing environment, used for autocompletion
- [z](https://www.powershellgallery.com/packages/z) - Directory jumper
- [PSFzf](https://github.com/kelleyma49/PSFzf) - Fuzzy finder

## Arch linux setup

- [Arch linux](https://archlinux.org) - A simple, lightweight distribution
- [GRUB](https://wiki.archlinux.org/title/GRUB#UEFI_systems) - Grub is a boot loader
- [Xorg](https://wiki.archlinux.org/title/Xorg) - Display server
- [Xinit](https://wiki.archlinux.org/title/xinit) - Start window managers
- [Firefox](https://wiki.archlinux.org/title/firefox) - Web browser
- [AwesomeWM](https://wiki.archlinux.org/title/awesome) - Tiling window manager
- [Picom](https://wiki.archlinux.org/title/picom) - Standalone compositor for Xorg
- [Alacritty](https://wiki.archlinux.org/title/Alacritty) - Terminal
- [Nitrogen](https://wiki.archlinux.org/title/nitrogen)- Desktop wallpaper

Create in the home directory a file named .xinittrc

```
cp /etc/X11/xinitxinitrc /home/{username}/.xinitrc

vim .xinitrc
```

Add these in the last lines, and delete end lines

```
nitrogen --restore &
picom &
exec awesome
```

## Neovim setup

Requires [Neovim](https://neovim.io/) (>= 0.8)

