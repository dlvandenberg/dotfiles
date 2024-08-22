# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export NVM_LAZY=1

export GOPATH=$HOME/go/
export PATH=$GOPATH/bin:$PATH
export PATH=/opt/homebrew/bin:$PATH


eval "$(rbenv init - zsh)"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"


# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  nvm
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/mountnugget.toml)"
fi

if [ -f ~/.aliases ]; then
  . ~/.aliases
fi

if [ -f ~/.envrc ]; then
  . ~/.envrc
fi
# Load Zoxide
eval "$(zoxide init zsh)"

# Load fzf
eval "$(fzf --zsh)"

# Configure fzf
alias fzf="fzf --preview 'bat --color=always --style=header,grid --line-range :500 {}'"

# FZF Theme
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:#F6F6F4,fg+:#DFD8A5,bg:#121212,bg+:#322C35
  --color=hl:#64A4B0,hl+:#93C0C8,info:#afaf87,marker:#CABF68
  --color=prompt:#B7B5A4,spinner:#E9D439,pointer:#9F7F93,header:#87afaf
  --color=border:#C9C5BA,label:#aeaeae,query:#d9d9d9
  --border="rounded" --border-label="" --preview-window="border-rounded" --prompt="> "
  --marker=">" --pointer="◆" --separator="─" --scrollbar="│"
  --info="right"'
#
# export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
#   --highlight-line \
#   --info=inline-right \
#   --ansi \
#   --layout=reverse \
#   --border=none
#   --color=bg+:#2e3c64 \
#   --color=bg:#1f2335 \
#   --color=border:#29a4bd \
#   --color=fg:#c0caf5 \
#   --color=gutter:#1f2335 \
#   --color=header:#ff9e64 \
#   --color=hl+:#2ac3de \
#   --color=hl:#2ac3de \
#   --color=info:#545c7e \
#   --color=marker:#ff007c \
#   --color=pointer:#ff007c \
#   --color=prompt:#2ac3de \
#   --color=query:#c0caf5:regular \
#   --color=scrollbar:#29a4bd \
#   --color=separator:#ff9e64 \
#   --color=spinner:#ff007c \
# "
