# PC setup

Config stored in [github repo](https://github.com/gfeun/dotfiles)

## Desktop Environment

- Distribution : [Debian](https://www.debian.org/) 10 net-install
- Init Daemon : [Systemd](https://freedesktop.org/wiki/Software/systemd/)
- X Display Manager : [Lightdm](https://github.com/canonical/lightdm)
- Window Manager : [i3wm](https://i3wm.org/)
- Window compositor : [picom](https://github.com/yshui/picom) | Manages transparency, animations
- Status Bar : [py3status](https://github.com/ultrabug/py3status)
- Sound : [PulseAudio](https://www.freedesktop.org/wiki/Software/PulseAudio/)
- Notification Daemon : [Dunst](https://dunst-project.org/)
- Network manager : [NetworkManager](https://gitlab.freedesktop.org/NetworkManager/NetworkManager)
- Blue light filter : [Redshift](http://jonls.dk/redshift/)
- Web Browser : [Mozilla Firefox](https://www.mozilla.org/en-US/firefox/new/)
- Additional package manager for utilities not in Debian : [Homebrew](https://brew.sh/)
- Clipboard manager : [copyq](https://github.com/hluk/CopyQ)
- Screenshot tool : [Flameshot](https://github.com/flameshot-org/flameshot)

## Terminal

- Terminal : kitty (previously urxvt)
- Shell : zsh with [Oh my zsh](https://ohmyz.sh/) [powerline10k](https://github.com/romkatv/powerlevel10k)
- Theme : base16 using [base16-manager](https://github.com/base16-manager/base16-manager) (solarized dark 256 theme)
  - `base16-manager set solarized-dark-256`

## Editor

- Neovim with [Vim Plug](https://github.com/junegunn/vim-plug) see [.config/nvim/init.vim]()

## Main Utilities

- [fzf](https://github.com/junegunn/fzf) - installed using vim plug
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [bat](https://github.com/sharkdp/bat)
