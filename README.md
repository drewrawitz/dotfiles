drewrawitz dotfiles
===================

Screenshot
-------

![](http://i.imgur.com/dSaeMlo.png)

Install
-------

Set zsh as your login shell:

    chsh -s $(which zsh)

Clone onto your laptop:

    git clone https://github.com/drewrawitz/dotfiles.git

Install [rcm](https://github.com/thoughtbot/rcm) & other useful packages:

    brew bundle dotfiles/Brewfile

Install:

    rcup -d dotfiles -x README.md -x Brewfile

This will create symlinks for config files in your home directory.

You can safely run `rcup` multiple times to update:

    rcup
