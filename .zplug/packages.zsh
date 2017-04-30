# Self manage updates
zplug "zplug/zplug", hook-build:zplug\ --self-manage

# Completions
zplug "zsh-users/zsh-completions"

# npm completion
zplug "lukechilds/zsh-better-npm-completion"

# gulp completion
zplug "akoenig/gulp.plugin.zsh"

# pip completion
zplug "srijanshetty/zsh-pip-completion"

# AWS completion
zplug "EslamElHusseiny/aws_manager_plugin"

# Newman completion
zplug "selop/newman-autocomplete"

# git aliases
zplug "unixorn/git-extra-commands"

# Auto suggestions
zplug "zsh-users/zsh-autosuggestions"

# Zaw
zplug "zsh-users/zaw"

# Alias suggestions
zplug "djui/alias-tips"

# cdr
zplug "willghatch/zsh-cdr"

# Improved cd
zplug "b4b4r07/enhancd", use:init.sh

# Auto source environment files on cd
zplug "Tarrasch/zsh-autoenv"

# Vim key bindings
zplug "sharat87/zsh-vim-mode"

# EasyMotion for zsh
zplug "hchbaw/zce.zsh"

# ssh helper
zplug "gko/ssh-connect"

# gpg-agent
zplug "axtl/gpg-agent.zsh"

# Window titles
zplug "jreese/zsh-titles"

# Theme
zplug "mafredri/zsh-async"
zplug "sindresorhus/pure", use:pure.zsh, as:theme

# Syntax highlighting
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Substring matching
zplug "zsh-users/zsh-history-substring-search", defer:3

