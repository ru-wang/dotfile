set -x LANG en_US.UTF-8

eval (/opt/homebrew/bin/brew shellenv)
set HOMEBREW_API_DOMAIN https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api
set HOMEBREW_BREW_GIT_REMOTE https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git
set HOMEBREW_BOTTLE_DOMAIN https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles

alias lh="ls -lh"
alias lah="ls -lah"

alias gb="git branch"
alias gba="git branch -a"

alias gg="git glog"
alias ggb="git glog --branches"
alias gga="git glog --all"

alias gp="git pull"
alias gpp="git pull --prune"

alias gs="git status"
alias gf="git flow"
