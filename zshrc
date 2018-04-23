# !/bin/zsh#!/bin/bash
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/owencraston/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

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
plugins=(git)

source $ZSH/oh-my-zsh.sh

source /usr/local/share/chruby/chruby.sh
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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias cdcc="cd ~/Documents/PersonalDevelopment/coincount/coincount"


[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh

export PATH="$HOME/.yarn/bin:$PATH"
# starscrem config
export HADOOP_USER_NAME=owencraston
export HDFS_USER=owencraston
export HADOOP_CONF_DIR=$HOME/src/github.com/Shopify/starscream/.dev/starscream/spark/current/conf/conf.cloudera.yarn

export PATH=/usr/local/lib/ruby/gems/2.0.0/bin:$PATH
export PATH=/usr/local/opt/ruby20/bin:$PATH

# k8 workflows from https://github.com/KnVerey/k8s-workflow-utils
# chctx
set -eo pipefail

# Fuzzy matches available kubernetes context names for fast context switching
# E.g. if "my-context2" is the only context with "2" in its name, `chctx 2` will switch to it
# Optional second argument to switch namespace at the same time using chns
# Author: Katrina Verey (github.com/KnVerey)

# Suggestion: Add the following to your zshrc and install the completions
# To get fast namespace listing and switching via context names
# Warning: Think through your context names first. E.g. if you're using minikube, you'll need to exclude or unalias it
# or else you'll have a conflict with the executable
#
# local contexts; contexts=($(kubectl config get-contexts -o name))
# for context in $contexts; do
#   alias $context="chctx $context"
# done
#
if [ $1 ]; then
  CONTEXT=$1
else
  name=`basename "$0"`
  echo "Usage: $name CONTEXT [NAMESPACE]"
  exit 1;
fi

if ! [ "$(kubectl config get-contexts ${CONTEXT} -o name 2>/dev/null)" ]; then
  ALL_CONTEXTS=$(kubectl config get-contexts -o name)
  GUESSES=$(echo "$ALL_CONTEXTS" | grep $CONTEXT) || true
  NUM_GUESSES=$(echo "$GUESSES" | wc -w)

  if [ $NUM_GUESSES -eq 1 ]; then
    CONTEXT=$GUESSES
  elif [ $NUM_GUESSES -gt 1 ]; then
    echo -e "\033[0;35mName '$CONTEXT' is ambiguous. Matching contexts:\033[0m"
    echo "$GUESSES"
    exit 1;
  else
    echo -e "\033[0;31mString '$CONTEXT' does not match any available context.\033[0m"
    exit 1;
  fi
fi

kubectl config use-context $CONTEXT

if [ $2 ]; then
  chns $2
fi
# chns
set -eo pipefail
# Fuzzy matches namespace names in the current context for fast namespace switching
# E.g. if "my-hackdays-app-3949-production" is the only app with "hackdays" in the current context,
# `chns hackdays` will switch to it
# Author: Katrina Verey (github.com/KnVerey)

if [ $1 ]; then
  NAMESPACE=$1
else
  name=`basename "$0"`
  echo "Usage: $name NAMESPACE"
  exit 1;
fi

if ! [ "$(kubectl get namespace ${NAMESPACE} 2>/dev/null)" ]; then
  ALL_NAMESPACES=$(kubectl get namespaces -o=custom-columns=NAME:.metadata.name --no-headers)
  GUESSES=$(echo "$ALL_NAMESPACES" | grep $NAMESPACE) || true
  NUM_GUESSES=$(echo "$GUESSES" | wc -w)

  if [ $NUM_GUESSES -eq 1 ]; then
    NAMESPACE=$GUESSES
  elif [ $NUM_GUESSES -gt 1 ]; then
    echo -e "\033[0;35mName '$NAMESPACE' is ambiguous. Matching namespaces:\033[0m"
    echo "$GUESSES"
    exit 1;
  else
    echo -e "\033[0;31mString '$NAMESPACE' does not match any available namespace.\033[0m"
    exit 1;
  fi
fi

CONTEXT=$(kubectl config current-context)
kubectl config set-context $CONTEXT --namespace=$NAMESPACE >/dev/null
echo "Namespace $NAMESPACE set"
#
# exec-pod
set -eo pipefail

# Enters a pod of the given type in the current context / namespace.
# Useful for when you want to exec onto (for example) a pod belonging to the "web" deployment
# and you don't care which one.
# Author: Katrina Verey (github.com/KnVerey)

TYPE=$1;
CONTAINER=$2

if ! [ "$TYPE" ]; then
  name=`basename "$0"`
  echo "Usage: $name POD_TYPE [CONTAINER]";
  exit 1;
fi

POD=$(kubectl get pods -o=custom-columns=NAME:.metadata.name | grep -i --max-count=1 "^${TYPE}");

if ! [ "$POD" ]; then
  echo "No pods of type ${TYPE} found";
  exit 1;
fi

if [ "$CONTAINER" ]; then
  echo "Entering $CONTAINER container of pod $POD"
  kubectl exec -ti "$POD" -c=$CONTAINER -- sh
else
  echo "Entering pod $POD"
  kubectl exec -ti "$POD" -- sh
fi
# kgoom
set -o pipefail

# Returns information about any pods that have containers that have been OOMKilled
# Runs against the current context/namespace by default
# Any args passed to the script  (e.g. namespace, context flags) will be passed to the kubectl command

echo "NAMESPACE  /  NAME  /  CONTAINERS  /  LAST TERMINATION REASON  /  LAST TERMINATION TIME"

kubectl get pods "$@" --output=jsonpath='{ range .items[*] }{.metadata.namespace}    {.metadata.name}    {.status.containerStatuses[*].name}    {.status.containerStatuses[*].lastState.terminated.reason }    {.status.containerStatuses[*].lastState.terminated.finishedAt}{"\n"}{end}' | grep OOMKilled

if [[ $? -ne 0 ]]; then
	echo "None"
fi

exit 0
