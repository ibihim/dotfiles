# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH=$HOME/.oh-my-zsh

DEFAULT_USER=ibihim
ZSH_THEME="../../../../usr/share/zsh-theme-powerlevel10k/powerlevel10k"

plugins=(
  git
  kubectl
)

source /usr/share/autojump/autojump.zsh
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

source $ZSH/oh-my-zsh.sh


export LANG=en_US.UTF-8

export GOROOT=/usr/lib/go
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export GOPRIVATE=github.com/$ORGANIZATION/*

export TERM="xterm-256color"
export CHROME_BIN=/usr/bin/chromium
export CDPATH=$HOME/workspace/src/github.com
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export EDITOR=nvim

export PATH=$PATH:$GOBIN:$NPM_PACKAGES/bin


alias glog="git log --graph --abbrev-commit --date=relative --pretty=format:'%Cred%h%C(yellow)%d %Cblue%an%C(magenta) (%GK)%C(reset) %s %Cgreen%cr'"

alias goplay='cd $(mktemp -d) && $EDITOR main.go && go run main.go'

alias k='kubectl'
alias kpo='kubectl --context phdp-prod'
alias kst='kubectl --context phdp-staging'
alias kde='kubectl --context phdp-dev'
alias klo='microk8s.kubectl'
alias hlo='microk8s.helm'

alias tpd='trackpad-disable'
alias tpe='trackpad-enable'

alias tma='tmux-add'
alias tmd='tmux detach'
alias tml='tmux ls'
alias tp='tmuxp-load'

alias twa='timew start'
alias twe='timew stop'
alias tw='timew summary :ids'
alias tww='timew week'
alias twl='timew lengthen @1'

alias cdtemp='cd $(mktemp -d)'
alias v='nvim'
alias vim='nvim'
alias man='PAGER=most man'
alias please='sudo'
alias ggl='git pull'
alias theia='docker run -it --init -p 3000:3000 -v "$(pwd):/home/project:cached" theiaide/theia:next'
alias jira-browse="$HOME/scripts/jira-browse.sh"
alias pom='timeout 25m mpg123 --loop -1 ~/Music/pomodoro.mp3'
alias lock='swaylock -f -c 000000'
alias browsh='docker container run -it browsh/browsh'


unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
    export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

# yubikey
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
gpg-connect-agent updatestartuptty /bye > /dev/null

# nix package manager
source /etc/profile.d/nix.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

