# Default EDITOR
export EDITOR=nvim
export VISUAL=nvim
alias vim=nvim

# For Tmux
export TERM=xterm-256color

# History Stuff
HISTFILE=~/.zhistory
HISTSIZE=50000
SAVEHIST=50000
setopt HIST_IGNORE_ALL_DUPS

# Source Custom Methods
for f in ~/executables/*.sh; do source $f;done

# Add to path
export PATH="$PATH:~/executables:/opt/nvim-linux64/bin"

# I like colors in terminals
autoload -Uz colors && colors

# History
HISTFILE=~/.zhistory
HISTSIZE=50000
SAVEHIST=50000
setopt HIST_IGNORE_ALL_DUPS

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
# the bind key can vary by system, so hit ctrl+z and then arrow
# It will show you the correct keycode :D
bindkey "^[OA" up-line-or-beginning-search # Up
bindkey "^[OB" down-line-or-beginning-search # Down

# Autocomplete Git
autoload -Uz compinit && compinit
autoload -Uz vcs_info

# I like colors in terminals
autoload -Uz colors && colors

# Steal and edit from zsh docs
zstyle ':vcs_info:*' actionformats ' %F{15}[%F{214}%b%F{3}|%F{1}%a%F{15}] %F{220}%u %F{40}%c%f'
zstyle ':vcs_info:*' formats ' %F{15}[%F{214}%b%F{15}] %F{220}%u %F{40}%c%f'
zstyle ':vcs_info:*' enable git

# Git info wrapper
vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
  fi
}

# Update Prompt
setopt prompt_subst
PROMPT="%B%F{66}POD%f% %B%F{45}%~%f%b %B%F{red}%f%b%B%F{10}#%f%b "
RPROMPT='$(vcs_info_wrapper)'
