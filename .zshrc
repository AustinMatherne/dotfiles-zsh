# Zplug
source ~/.zplug/init.zsh
zplug load

# fzf
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
export FZF_COMPLETION_TRIGGER=,,
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The Fuck
eval '$(thefuck --alias)'

if [ "$HOST" != "USAL0157" ]; then
  # git-extras auto completion.
  source ~/.git-extras/etc/git-extras-completion.zsh

  # LS_COLORS
  eval $(dircolors -b $HOME/.ls_colors/LS_COLORS)

fi

if [ "$HOST" != "pangoDev" ]; then
  # Base16 Shell
  BASE16_SHELL=$HOME/.config/base16-shell/
  eval "$($BASE16_SHELL/profile_helper.sh)"
fi

if [ "$HOST" = "pangoDev" ]; then
  # gibo-completion
  source ~/.gibo/gibo-completion.zsh
fi

if [ "$HOST" != "pangoDesktop" ]; then
  # Heroku Toolbelt
  export PATH="/usr/local/heroku/bin:$PATH"

  # pyenv
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"

  # rbenv
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"

  # gvm
  [[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

  # rustup
  export PATH="$HOME/.cargo/bin:$PATH"

  # NVM
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
fi

