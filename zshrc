# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# !/bin/zsh#!/bin/bash
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/owencraston/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="agnoster_kube_context"
# ZSH_THEME="spaceship"
# ZSH_THEME="agnoster"
# ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_MODE="awesome-patched"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-syntax-highlighting
)

ZSH_DISABLE_COMPFIX="true"
source $ZSH/oh-my-zsh.sh

# source /usr/local/share/chruby/chruby.sh
DEFAULT_USER=`whoami`
# User configuration


# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
# 	export EDITOR=vim
# else
# 	export EDITOR=nvim
# fi
# set editor enviroment variable to neovim
export EDITOR=nvim
# Compilation flags
# export ARCHFLAGS="-arch x86_64"
# set git editor as neovim
export GIT_EDITOR=nvim
# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"
# config PATH
export PATH=/usr/local/bin:$PATH
export PATH=/install/prefix/bin:$PATH
# export C_INCLUDE_PATH=/install/prefix/include:$C_INCLUDE_PATH
# export CPLUS_INCLUDE_PATH=/install/prefix/include:$CPLUS_INCLUDE_PATH
# export LIBRARY_PATH=/install/prefix/lib:$LIBRARY_PATH
# export DYLD_LIBRARY_PATH=/install/prefix/lib:$LD_LIBRARY_PATH
 #Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias refresh="source ~/.zshrc"
alias cdp="cd ~/src/personal"
alias cdc="cd ~/src/consensys"
alias cdmm="cd ~/src/consensys/metamask-mobile"
alias cdme="cd ~/src/consensys/metamask-extension"
alias cdnv="cd ~/.config/nvim"
alias cddf="cd ~/dotfiles"

[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh

# starscrem config
# export HADOOP_USER_NAME=owencraston
# export HDFS_USER=owencraston
# export HADOOP_CONF_DIR=$HOME/src/github.com/Shopify/starscream/.dev/starscream/spark/current/conf/conf.cloudera.yarn

# compdef _chctx chctx
# compdef _chns chns
# go
GOPATH=$HOME/go
fpath+=${ZDOTDIR:-~}/.zsh_functions
fpath+=${ZDOTDIR:-~}/.zsh_functions

# android studio
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export JAVA_HOME="/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
# export PATH="/usr/local/sbin:$PATH"


# [[ -f /opt/dev/sh/chruby/chruby.sh ]] && type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; }

# [[ -x /usr/local/bin/brew ]] && eval $(/usr/local/bin/brew shellenv)
if [ "$(arch)" = "arm64" ]; then
  eval $(/opt/homebrew/bin/brew shellenv);
else
  eval $(/usr/local/bin/brew shellenv);
fi

# export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
# export PATH="$PATH:$GEM_HOME/bin"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"


# source $(brew --prefix)/opt/chruby/share/chruby/chruby.sh
# source $(brew --prefix)/opt/chruby/share/chruby/auto.sh

source ~/powerlevel10k/powerlevel10k.zsh-theme
source /Users/owencraston/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# https://github.com/OWASP/SecureCodingDojo/wiki/Deploying-with-Docker
export DATA_DIR=~/dojofiles
export CHALLENGE_MASTER_SALT=7f976668fecb0021c73671d2a57b845c350e5fdc0fbc8db866c37a775165cbf7

# pnpm
export PNPM_HOME="/Users/owencraston/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Created by `pipx` on 2023-11-19 20:22:03
export PATH="$PATH:/Users/owencraston/Library/Python/3.11/bin"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/owencraston/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/owencraston/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/owencraston/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/owencraston/google-cloud-sdk/completion.zsh.inc'; fi
export PATH="/path/to/postgres/bin:$PATH"
