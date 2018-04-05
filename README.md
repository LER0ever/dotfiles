Dotfiles
=========

Personal dotfiles backup from my Manjaro Linux

## Software flavor
- i3-gaps
- polybar
- cmus
- zsh (oh-my-zsh)
- vim (.)
- emacs (spacemacs)
- nitrogen

## Installation
```bash
# this installs oh-my-zsh
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
# whatever package manager
## Dependency for i3
sudo pacman -S i3-gaps nitrogen rofi polybar
## Dependency for CLI utils
sudo pacman -S neovim python-neovim emacs ctags cmake gcc g++
# Copy the entire repo to home folder
cp -r .* ~/
# Optional: setup editors
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
curl -sLf https://raw.githubusercontent.com/LER0ever/EverVim/master/Boot-EverVim.sh | bash
```

## Screenshots
![](https://i.imgur.com/vW4EXAm.jpg)

## License
Apache 2.0
