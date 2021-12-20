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
	@echo "   make install_zsh                 install zsh config       "
	@echo "   make install_vim                 install vim config       "
	@echo "   make install_nvim                install neovim config    "
	@echo "   make install_emacs               install emacs config     "
	@echo "   make install_tmux                install tmux config      "
	@echo "   make install_git                 install git config       "
	@echo "   make install_x                   install x config         "
	@echo "   make install_compton             install compton config   "
	@echo "   make install_dwm                 install dwm config       "
	@echo "                                                             "
	@echo "All install commands are also available as clean commands to "
	@echo "remove installed files                                       "
	@echo "                                                             "

all: install_zsh install_vim install_emacs install_tmux install_git install_x install_compton install_dwm
	@echo ""
	@echo "All done."

install_zsh: clean_zsh
	ln -sf ${DOTFILES}/zsh/zshrc ${TARGET}/.zshrc
	mkdir -p ${TARGET}/.oh-my-zsh/custom
	ln -sf ${DOTFILES}/zsh/nmariz.zsh-theme ${TARGET}/.oh-my-zsh/custom/nmariz.zsh-theme

clean_zsh:
	@echo "Removing old 'zsh' config..."
	rm -rf ${TARGET}/.zshrc
	rm -rf ${TARGET}/.oh-my-zsh/custom/nmariz.zsh-theme

install_vim: clean_vim
	@echo "Installing Vundle for Vim..."
	mkdir -p ${TARGET}/.vim/bundle
	[ -d ${VUNDLE} ] || git clone "https://github.com/gmarik/Vundle.vim.git" ${VUNDLE}
	ln -s ${DOTFILES}/vim/vimrc ${TARGET}/.vimrc
	@echo "Installing Vim plugins..."
	vim +PluginInstall +qall

clean_vim:
	@echo "Removing old 'vim' config..."
	rm -rf ${TARGET}/.vimrc
	rm -rf ${TARGET}/.vim

install_nvim: clean_nvim
	ln -s ${DOTFILES}/nvim ${TARGET}/.config/nvim
	@echo "Run 'PackerInstall' in nvim..."

clean_nvim:
	@echo "Removing old 'Neovim' config..."
	rm -rf ${TARGET}/.config/nvim

install_emacs: clean_emacs
	mkdir -p ${TARGET}/.emacs.d
	ln -s ${DOTFILES}/emacs/init.el ${TARGET}/.emacs.d
	ln -s ${DOTFILES}/emacs/custom.el ${TARGET}/.emacs.d
	ln -s ${DOTFILES}/emacs/config.org ${TARGET}/.emacs.d
	@echo "Running emacs for installing plugins..."
	emacs -nw

clean_emacs:
	@echo "Removing old 'emacs' config..."
	rm -rf ${TARGET}/.emacs.d

install_tmux: clean_tmux
	ln -sf ${DOTFILES}/tmux/tmux.conf ${TARGET}/.tmux.conf

clean_tmux:
	@echo "Removing old 'tmux' config..."
	rm -rf ${TARGET}/.tmux.conf

install_git: clean_git
	ln -sf ${DOTFILES}/git/gitconfig ${TARGET}/.gitconfig
	ln -sf ${DOTFILES}/git/gitmessage ${TARGET}/.gitmessage
	@echo "\nGit config settings"
	@read -p "user.name: " git_name; \
	sed -i "" -e "s/%%GITNAME%%/$$git_name/" ${TARGET}/.gitconfig
	@read -p "user.email: " git_email; \
	sed -i "" -e "s/%%GITEMAIL%%/$$git_email/" ${TARGET}/.gitconfig

clean_git:
	@echo "Removing old 'git' config..."
	rm -rf ${TARGET}/.gitconfig
	rm -rf ${TARGET}/.gitmessage

install_x: clean_x
	ln -sf ${DOTFILES}/x/Xresources ${TARGET}/.Xresources

clean_x:
	@echo "Removing old '.Xresources' config..."
	rm -rf ${TARGET}/.Xresources

install_compton: clean_compton
	mkdir -p ${TARGET}/.config/compton
	ln -sf ${DOTFILES}/compton/compton.conf ${TARGET}/.config/compton/compton

clean_compton:
	@echo "Removing old 'compton' config..."
	rm -rf ${TARGET}/.config/compton

install_dwm: clean_dwm
	mkdir -p ${TARGET}/.dwm
	ln -sf ${DOTFILES}/dwm/autostart.sh ${TARGET}/.dwm
	chmod +x ${TARGET}/.dwm/autostart.sh

clean_dwm:
	@echo "Removing old 'dwm' config..."
	rm -rf ${TARGET}/.dwm
