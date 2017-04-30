# Zsh options
setopt AUTO_CD
setopt AUTO_PUSHD
setopt CDABLE_VARS
setopt CHASE_LINKS
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_TO_HOME
setopt AUTO_LIST
setopt AUTO_MENU
setopt COMPLETE_IN_WORD
setopt HASH_LIST_ALL
setopt BRACE_CCL
setopt EXTENDED_GLOB
setopt GLOB_DOTS
setopt NO_NO_MATCH
setopt UNSET
setopt BANG_HIST
setopt EXTENDED_HISTORY
setopt HIST_BEEP
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt NO_CLOBBER
setopt CORRECT
setopt NO_FLOW_CONTROL
setopt INTERACTIVE_COMMENTS
setopt RC_QUOTES
setopt LONG_LIST_JOBS
setopt NOTIFY
setopt PROMPT_SUBST
setopt NO_SH_WORD_SPLIT

# Persistent rehash
zstyle ':completion:*' rehash true

# Ensure path arrays do not contain duplicates
typeset -gU cdpath fpath mailpath path

# Zsh variables
export HISTFILE=${HOME}/.zhistory
export HISTSIZE=10000
export SAVEHIST=10000

# Editors
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

# Less options
export LESS='-F -g -i -M -R -S -w -X -z-4'
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

# User executables
export PATH="$HOME/bin:$PATH"

# Lock screen
if [ "$HOST" = "pangoDesktop" ]; then
  # Alias to append white space buffer to XLock username prompt
  alias xlock='xlock -username "Username: "'
fi

# Temporary Files
if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$LOGNAME"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"

# Smart URLs
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

# Magically expand dots in path ... to ../..
function rationalise-dot() {
  local MATCH
  if [[ $LBUFFER =~ '(^|/| | |'$'\n''|\||;|&)\.\.$' && ! $LBUFFER = p4* ]]; then
    LBUFFER+=/..
  else
    zle self-insert
  fi
}

zle -N rationalise-dot
bindkey . rationalise-dot
bindkey -M isearch . self-insert

# Zsh EasyMotion
bindkey -M vicmd ',' zce

# Zsh vi mode
bindkey -v
bindkey -M vicmd 'r' redo
bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^[[3~' delete-char
export KEYTIMEOUT=1

# Users zsh completions
fpath=(~/.zsh/completions $fpath)
autoload -U compinit && compinit

# Auto suggestions
bindkey '^ ' autosuggest-accept

# Substring history
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# zaw
bindkey '^R' zaw-history
zstyle ':filter-select' max-lines 10
zstyle ':filter-select' case-insensitive yes
zstyle ':filter-select' extended-search yes
zstyle ':filter-select' hist-find-no-dups yes

# Alias for listing directly installed npm packages
alias npmls='npm ls --depth=0'

# Alias for improved ls command
alias l='ls -oAh'

# Alias for shorter clear command
alias c='clear'

# Alias for shorter vim
alias v=vim

# Alias for shorter git
alias g=git

# Alias for httpie with https
alias https='http --default-scheme=https'

# Alias for improved tree command
alias t='tree -ACDash'

# Alias for shorter history command
alias h='history'

if [ "$HOST" = "USAL0157" ]; then
  # Alias for gulp server
  alias up='yarn install --no-lockfile && gulp clean && gulp serve --max-old-space-size=8192'

  # Alias for gulp testing
  alias t='gulp test'

  # Alias for gulp watch testing
  alias ta='gulp test:auto'

  # Alias for local-gateay
  alias lg="cd $HOME/repos/local-gateway && ./local-gateway.sh"
fi

# Alias for creating a directory and immediately changing into it
function take() {
  mkdir -p $1
  cd $1
}

