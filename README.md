# dotfiles
A repo for managing my dotfile configuration files.

## ZSH
- clone repo in home directory
- setup sym links with `ln -s -f ~/dotfiles/zshrc ~/.zshrc`
- install [powerlevel10k](https://github.com/romkatv/powerlevel10k) and follow prompts
- install [syntax highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md) via `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
`

## Neovim
- `brew install neovim`
- `mkdir ~/.config/nvim`
## - link via `ln -s -f ~/dotfiles/init.vim ~/.config/nvim/init.vim`
- `ln -s /Users/owencraston/dotfiles/init.lua ~/.config/nvim/init.lua`
- install [vim plug](https://github.com/junegunn/vim-plug) via `curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
