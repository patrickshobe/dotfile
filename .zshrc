source "${HOME}/.zgen/zgen.zsh"
[[ -n $TMUX ]] && export TERM="xterm-256color"
ZSH_DISABLE_COMPFIX="true"
# if the init script doesn't exist
if ! zgen saved; then

  # specify plugins here
  zgen oh-my-zsh
  zgen oh-my-zsh plugins/fzf
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/themes
  zgen oh-my-zsh custom/plugins/zsh-autosuggestions
  zgen oh-my-zsh custom/plugins/fzf-tab
  zgen load zsh-users/zsh-syntax-highlighting

  # generate the init script from plugins above
  zgen save
fi
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS

export EDITOR=nvim
export ZK_NOTEBOOK_DIR=~/zk

alias :q='exit'
alias be='bundle exec'
alias !!!='exit'
alias cc="clear && tmux clear-history"
alias vi=nvim
#alias ctags="`brew --prefix`/bin/ctags"
alias mux='tmux attach -t'
alias routes="rake routes | fzf -e"
alias a="arch -x86_64"
alias ibrew="arch -x86_64 brew"
alias pec='rspec --drb --format p'
alias splork='RAILS_ENV=test bundle exec spork'
alias cop='git status -s --porcelain | cut -c4- | xargs rubocop --force-exclusion'
alias cop-branch='git diff --name-only master... | xargs rubocop --force-exclusion'
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#5c6370"


export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
alias usenvm='[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' # This loads nvm
ctags=/usr/local/bin/ctags

export FZF_DEFAULT_COMMAND='fd --type f'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

###-tns-completion-start-###
if [ -f /Users/pat/.tnsrc ]; then 
    source /Users/pat/.tnsrc 
fi

gch() {
	git for-each-ref --format='%(refname:short)' refs/heads | fzf | xargs git checkout
}
release () { git checkout -b FE-release/$(date '+%Y-%m-%d'); }

usenvm() {
  export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
}

eval "$(starship init zsh)"

zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_BEEP

eval "$(rbenv init -)"
