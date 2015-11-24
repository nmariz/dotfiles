#
# Makefile for dotfiles
#
# Install oh-my-zsh first
#
# Via curl:
# sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#
# Via wget:
# sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
#
# !!! Make sure you backup your stuff first !!!
#

DOTFILES := ${PWD}
TARGET   := ${HOME}
VUNDLE   := ${TARGET}/.vim/bundle/Vundle.vim

help:
	@echo "Makefile for dotfiles                                        "
	@echo "                                                             "
	@echo "Usage:                                                       "
	@echo "   make all                         install everything       "
	@echo "   make install_zsh                 install zsh conf         "
	@echo "   make install_vim                 install vim conf         "
	@echo "   make install_tmux                install tmux conf        "
	@echo "   make install_git                 install git conf         "
	@echo "                                                             "
	@echo "All install commands are also available as clean commands to "
	@echo "remove installed files                                       "
	@echo "                                                             "

all: install_zsh install_vim install_git install_tmux
	@echo ""
	@echo "All done."

install_zsh: clean_zsh
	ln -sf ${DOTFILES}/zsh/zshrc ${TARGET}/.zshrc
	mkdir -p ${TARGET}/.oh-my-zsh/custom
	ln -sf ${DOTFILES}/zsh/nmariz.zsh-theme ${TARGET}/.oh-my-zsh/custom/nmariz.zsh-theme

clean_zsh:
	rm -rf ${TARGET}/.zshrc
	rm -rf ${TARGET}/.oh-my-zsh/custom/nmariz.zsh-theme

install_vim: clean_vim
	@echo "Installing vundle for vim"
	mkdir -p ${TARGET}/.vim/bundle
	[ -d ${VUNDLE} ] || git clone "https://github.com/gmarik/Vundle.vim.git" ${VUNDLE}
	ln -s ${DOTFILES}/vim/vimrc ${TARGET}/.vimrc
	@echo "NOTE: Don't forget to install the plugins from command line: vim +PluginInstall +qall"

clean_vim:
	rm -rf ~/.vimrc
	rm -rf ~/.vim

install_tmux: clean_tmux
	ln -sf ${DOTFILES}/tmux/tmux.conf ~/.tmux.conf

clean_tmux:
	rm -rf ${TARGET}/.tmux.conf

install_git: clean_git
	ln -sf ${DOTFILES}/git/gitconfig ~/.gitconfig
	ln -sf ${DOTFILES}/git/gitmessage ~/.gitmessage

clean_git:
	rm -rf ${TARGET}/.gitconfig
	rm -rf ${TARGET}/.gitmessage
