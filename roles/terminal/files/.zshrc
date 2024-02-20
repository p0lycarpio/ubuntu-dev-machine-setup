HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

setopt autocd beep extendedglob nomatch notify
zstyle :compinstall filename '/home/arsene/.zshrc'
autoload -Uz compinit
compinit

# source antidote and load plugins in ~/.zsh_plugins.txt
source ${ZDOTDIR:-~}/.antidote/antidote.zsh
antidote load
