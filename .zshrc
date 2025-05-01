# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export GOPATH=$HOME/go/
export PATH=$GOPATH/bin:$PATH
export PATH=/opt/homebrew/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/bin/qmk_toolchains_macosARM64/bin:$PATH
export PATH=/opt/homebrew/opt/python@3.13/libexec/bin:$PATH

eval "$(rbenv init - zsh)"

# Path to your oh-my-zsh installation.
# export ZSH="$HOME/.oh-my-zsh"

# fnm
FNM_PATH="$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# source $ZSH/oh-my-zsh.sh

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  # eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/mountnugget.toml)"
  eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/moonfly.toml)"
fi

if [ -f ~/.aliases ]; then
  . ~/.aliases
fi

if [ -f ~/.envrc ]; then
  . ~/.envrc
fi
# Load Zoxide
eval "$(zoxide init zsh)"

# # Load fzf
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
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"

# bun completions
[ -s "/Users/dennis.vandenberg/.bun/_bun" ] && source "/Users/dennis.vandenberg/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
