My Dotfiles
===================

This is a collection of my personal dotfiles that I have configured to my liking throughout the years. At the moment, it's a bit of a manual process in terms of setting up the symbolic links.  In the future I might add an installer script which would handle all of that automatically.

Vim
-------
![](http://g.recordit.co/QnXY0zCi1F.gif)

#### First Steps
Get [Vundle]:
```
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/dotfiles/.vim/bundle/Vundle.vim
```

Create symlinks
```sh
$ ln -s dotfiles/.vim/ ~/
$ ln -s dotfiles/vimrc ~/.vimrc
```

Then open up Vim and run

```
:PluginInstall
```

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
* [commentary.vim](https://github.com/tpope/vim-commentary)


[Vundle]:http://github.com/VundleVim/Vundle.vim

iTerm2
-------

#### Text
Regular Font: `14pt Monaco`
Vertical line height: `1.4`
Non-ASCII Font: `14pt Source Code Powerline`

#### Colors
[base16-tomorrow-dark-256](https://github.com/chriskempson/base16-iterm2/blob/master/base16-tomorrow.dark.256.itermcolors)

Phoenix
-------

![](http://g.recordit.co/vYtCxSFH2N.gif)

I use [Phoenix](https://github.com/kasper/phoenix), a lightweight OS X window and app manager scriptable with JavaScript. Phoenix is extremely customizable to where you can even set up key bindings to open up certain applications at a certain split. Since I use [Alfred](https://www.alfredapp.com/) to open up my applications, I only use Phoenix for quickly resizing my windows.

My prefix key is `Ctrl + Option + Command`.

* Full screen split: `<Prefix> space`
* 50% top split: `<Prefix> up`
* 50% right split: `<Prefix> right`
* 50% bottom split: `<Prefix> down`
* 50% left split: `<Prefix> left`
