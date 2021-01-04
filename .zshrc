source "${HOME}/.zgen/zgen.zsh"
export FZF_BASE=/path/to/fzf/install/dir
# if the init script doesn't exist
if ! zgen saved; then

  # specify plugins here
  zgen oh-my-zsh
  zgen oh-my-zsh plugins/dotenv
  zgen oh-my-zsh plugins/fzf
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/zsh-interactive-cd
  zgen oh-my-zsh plugins/vi-mode
  zgen oh-my-zsh plugins/themes
  zgen load zsh-users/zsh-syntax-highlighting

  # generate the init script from plugins above
  zgen save
fi

export EDITOR=nvim

alias :q='exit'
alias TERM=xterm-256color tmux
alias vi=nvim
alias dc=docker-compose
#alias ctags="`brew --prefix`/bin/ctags"
alias mux='tmux attach -t'
alias routes="rails routes | fzf -e"
alias a="arch -x86_64"
alias ibrew="arch -x86_64 brew"
alias ctags='/usr/local/bin/ctags'



export FZF_DEFAULT_COMMAND='fd --type f'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

###-tns-completion-start-###
if [ -f /Users/pat/.tnsrc ]; then 
    source /Users/pat/.tnsrc 
fi

eval "$(rbenv init -)"
eval "$(starship init zsh)"
