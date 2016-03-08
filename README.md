My Dotfiles
===================

This is a collection of my personal dotfiles that I have configured to my liking throughout the years. At the moment, it's a bit of a manual process in terms of setting up the symbolic links.  In the future I might add an installer script which would handle all of that automatically.

Vim
-------

#### First Steps
1. Get [Vundle]:
`$ git clone https://github.com/VundleVim/Vundle.vim.git ~/dotfiles/.vim/bundle/Vundle.vim`
1. Create symlinks
```sh
$ ln -s dotfiles/.vim/ ~/
$ ln -s dotfiles/.vimrc ~/.vimrc
```
1. Install plugins by opening up vim and typing: `:PluginInstall`

#### Color Scheme

* [base16-tomorrow-dark](https://github.com/chriskempson/base16-vim)

#### Plugins

* [NERD Tree](https://github.com/scrooloose/nerdtree)
* [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim)
* [Auto Pairs](https://github.com/jiangmiao/auto-pairs)
* [ag.vim](https://github.com/rking/ag.vim)
* [greplace.vim](https://github.com/skwp/greplace.vim)
* [Vim Tmux Navigator](https://github.com/christoomey/vim-tmux-navigator)
* [Tabular](https://github.com/godlygeek/tabular)
* [snipmade.vim](https://github.com/msanders/snipmate.vim)
* [surround.vim](https://github.com/tpope/vim-surround)


[Vundle]:http://github.com/VundleVim/Vundle.vim
