# My dotfiles

## Requirements

* Unix-based operating system (Mac OS X or Linux) with [GNU make](https://www.gnu.org/software/make/)
* [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) should be installed
* [Vim](http://www.vim.org/) (v7.4 or more recent) should be installed
* `git` should be installed

## Installation

**!!! Make sure you backup your stuff first !!!**

Install [Powerline Fonts](https://github.com/powerline/fonts/).

Install all:

    $ make all

Or individually:

    $ make install_<name>

Usage:

    $ make help

**Note:** To install the Vim plugins you need to run:

    $ vim +PluginInstall +qall
