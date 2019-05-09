#!/usr/bin/env zsh

# Nuno Mariz ZSH Theme

# GIT
ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[yellow]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}•%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Customized git status, oh-my-zsh currently does not allow render dirty status before branch
git_prompt_info() {
    local cb=$(current_branch)
    if [ -n "$cb" ]; then
        echo "$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
    fi
}

# Add (ssh) for remote connections via ssh
ssh_connection() {
    if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
        echo " %{$fg_bold[red]%}(ssh)%{$reset_color%}"
    fi
}

# Add Python version from Pyenv
python_version() {
    echo " %{$fg_bold[grey]%}[Python $(pyenv_prompt_info)]%{$reset_color%}"
}

setopt prompt_subst
PROMPT='%{$fg_bold[green]%}%n@%m%{$reset_color%} %{$fg_bold[blue]%}%~%{$reset_color%} %{$fg[cyan]%}[%D{%H:%M:%S}]$(ssh_connection) $(git_prompt_info)%{$reset_color%}%B
$%b '
RPS1="%(?..%{$fg_bold[red]%}%? ↵%{$reset_color%})"
