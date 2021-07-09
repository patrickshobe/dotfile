source "${HOME}/.zgen/zgen.zsh"
ZSH_DISABLE_COMPFIX="true"
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
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS

export EDITOR=nvim

alias :q='exit'
alias !!!='exit'
alias cc="clear && tmux clear-history"
alias vi=nvim
alias dc=docker-compose
#alias ctags="`brew --prefix`/bin/ctags"
alias mux='tmux attach -t'
alias routes="rake routes | fzf -e"
alias a="arch -x86_64"
alias ibrew="arch -x86_64 brew"
alias ctags='/usr/local/bin/ctags'
alias pec='rspec --drb --format p'
alias be='bundle exec'
alias splork='RAILS_ENV=test bundle exec spork'
alias cop='git status -s --porcelain | cut -c4- | xargs rubocop --force-exclusion'
alias cop-branch='git diff --name-only master... | xargs rubocop --force-exclusion'



export FZF_DEFAULT_COMMAND='fd --type f'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

###-tns-completion-start-###
if [ -f /Users/pat/.tnsrc ]; then 
    source /Users/pat/.tnsrc 
fi

eval "$(starship init zsh)"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:/usr/local/opt/mysql@5.6/bin"
export AWS_VAULT_PROMPT=osascript
export AWS_VAULT_KEYCHAIN_NAME=login
export HOUSECALL='pro'

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
ctags=/usr/local/bin/ctags
export TERM=xterm-256color-italic
eval "$(rbenv init -)"
export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/lib"
