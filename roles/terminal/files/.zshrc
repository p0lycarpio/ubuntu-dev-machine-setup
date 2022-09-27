source ~/.antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle ansible
antigen bundle colored-man-pages
#antigen bundle colorize
antigen bundle command-not-found
antigen bundle common-aliases
antigen bundle docker
antigen bundle git
antigen bundle python
antigen bundle sudo
antigen bundle ubuntu
antigen bundle vagrant
antigen bundle yarn

# Syntax highlighting and autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

# Other plugins
antigen bundle lukechilds/zsh-nvm

# pure theme
# https://github.com/sindresorhus/pure
#antigen bundle mafredri/zsh-async
#antigen bundle sindresorhus/pure

# powerlevel10k theme
# https://github.com/romkatv/powerlevel10k
#antigen theme romkatv/powerlevel10k
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

# bullet train theme
# https://github.com/caiogondim/bullet-train.zsh
#antigen theme caiogondim/bullet-train.zsh bullet-train

antigen theme agkozak

# Tell antigen that you're done.
antigen apply

zstyle ':omz:' mode reminder

AGKOZAK_PROMPT_CHAR=( $ %# : )
AGKOZAK_MULTILINE=0

#export PATH=$HOME/bin:/usr/local/bin:$PATH:~/.local/bin
export VAGRANT_DEFAULT_PROVIDER='virtualbox'
export NVM_LAZY_LOAD=true
