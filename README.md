drewrawitz dotfiles
===================

Set zsh as your login shell:

    chsh -s $(which zsh)

Install
-------

Clone onto your laptop:

    git clone git://github.com/drewrawitz/dotfiles.git

Install [rcm](https://github.com/thoughtbot/rcm):

    brew bundle dotfiles/Brewfile

Install:

    rcup -d dotfiles -x README.md

This will create symlinks for config files in your home directory.

You can safely run `rcup` multiple times to update:

    rcup