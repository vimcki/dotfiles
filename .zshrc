# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

zstyle ':omz:plugins:nvm' lazy yes
plugins=(git colored-man-pages command-not-found golang vi-mode per-directory-history nvm)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
# VIRTUALENVWRAPPER_PYTHON=$(which python3)
# export WORKON_HOME=$HOME/.virtualenvs
# source /home/user/.local/bin/virtualenvwrapper.sh
#
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
alias docker_clear='docker stop $(docker ps -aq) ; docker rm $(docker ps -aq)'
alias gs='git status'
alias glc='git rev-parse HEAD | xsel'
alias gp='git push || `git push 2>&1 | grep "set-upstream "` 2>&1 | grep "remote:" | grep "git.partnerzy.dcwp.pl" | awk "{print $2}" | xargs brave-browser'
alias ssh='TERM=xterm-256color ssh'
alias fvi='vim `rg --files | fzf`'
alias editor='vim'
alias vi='vim'
alias wd='deactivate 2> /dev/null; wd'
alias ci="<.links grep 'ci=' | awk -F'=' '{print \$2}' | xargs brave-browser"
alias mr="<.links grep 'mr=' | awk -F'=' '{print \$2}' | xargs brave-browser"
alias jira="brave-browser \`<~/.links | grep '^jira=' | awk -F'=' '{print \$2}'\`/browse/\`git rev-parse --abbrev-ref HEAD | awk -F'/' '{print \$1}'\`"

alias t="tmux-sessionizer"
alias n="nvim"

setopt hist_ignore_all_dups
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000

export GOPATH=/home/user/go
export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$GOPATH/bin

bindkey -v
export KEYTIMEOUT=50
# source ~/.oh-my-zsh/themes/ys.zsh-theme
# make backspace work
bindkey "^?" backward-delete-char
# ctrl-w removed word backwards
bindkey '^w' backward-kill-word
# ctrl-r starts searching history backward
bindkey '^r' history-incremental-search-backward

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


per-dir-fzf() { 
  per-directory-history-toggle-history; fzf-history-widget; per-directory-history-toggle-history
}
zle -N per-dir-fzf
bindkey '^e' per-dir-fzf

. "$HOME/.asdf/asdf.sh"

export NVIM_APPNAME="nvim-new"
PATH="$PATH:$HOME/.local/share/nvim/mason/bin"
alias nn='nvim'
PATH="/opt/nvim-linux64/bin:$PATH"

export VISUAL='nvim'
export EDITOR="$VISUAL"

eval "$(direnv hook zsh)"

export PATH=$PATH:/home/user/.local/bin
export PATH=$PATH:/home/user/workspace/Odin
export PATH=$PATH:/home/user/workspace/ols

export EMSDK_QUIET=1
source "/home/user/workspace/emsdk/emsdk_env.sh"

alias gdb="gdb -q"

# opencode
export PATH=/home/user/.opencode/bin:$PATH
