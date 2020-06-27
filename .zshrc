source "${HOME}/.zgen/zgen.zsh"
export FZF_BASE=/path/to/fzf/install/dir
# if the init script doesn't exist
if ! zgen saved; then

  # specify plugins here
  zgen oh-my-zsh
  zgen oh-my-zsh plugins/fzf
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/zsh-interactive-cd
  zgen oh-my-zsh plugins/vi-mode
  zgen oh-my-zsh plugins/themes
  zgen load denysdovhan/spaceship-prompt spaceship
  zgen load zsh-users/zsh-syntax-highlighting

  # generate the init script from plugins above
  zgen save
fi

export EDITOR=nvim

alias :q='exit'
alias TERM=xterm-256color tmux
alias vi=nvim
alias tm=tmuxinator
#alias ctags="`brew --prefix`/bin/ctags"
alias mux='tmux attach -t'

# Spaceship section
SPACESHIP_USER_SHOW=false
SPACESHIP_HOST_PREFIX='⑊ '
SPACESHIP_HOST_SUFFIX=' '
SPACESHIP_HOST_COLOR_SSH=104
SPACESHIP_DIR_COLOR=51
SPACESHIP_PACKAGE_SHOW=false
SPACESHIP_NODE_SHOW=false
SPACESHIP_RUBY_COLOR=160
SPACESHIP_CHAR_COLOR_SUCCESS=46
SPACESHIP_CHAR_COLOR_FAILURE=196
SPACESHIP_CHAR_SYMBOL='◯'
SPACESHIP_CHAR_SUFFIX='  '
SPACESHIP_CHAR_PREFIX=' '
SPACESHIP_GIT_BRANCH_COLOR=208
SPACESHIP_PACKAGE_SHOW=false
SPACESHIP_NODE_SHOW=false
SPACESHIP_DOCKER_SHOW=false
SPACESHIP_VI_MODE_COLOR=15
SPACESHIP_GIT_STATUS_UNTRACKED=''
SPACESHIP_GIT_STATUS_MODIFIED=''

export FZF_DEFAULT_COMMAND='fd --type f'
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/pat/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/pat/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/pat/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/pat/google-cloud-sdk/completion.zsh.inc'; fi


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

