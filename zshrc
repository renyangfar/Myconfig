ZSH_THEME="bira"

plugins=(
git
python
pip
pep8
tmux
vim-interaction
zsh-autosuggestions
z
docker docker-compose
# git-open
# vi-mode
)
source $ZSH/oh-my-zsh.sh

export TERM="xterm-256color"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=250'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#if [[ `uname` == "Linux" ]] && [[ -z "$TMUX" ]] ; then
    #tmux attach-session || tmux new-session -s new
#fi


alias set_antiy_ssh='ssh -N -f -L localhost:2222:localhost:2222 ali_in'
alias set_antiy_socks='ssh -N -f -L 65530:localhost:65530 ali_in'
alias set_proxy_socks='export http_proxy="socks5://localhost:65530";export https_proxy="socks5://localhost:65530"'

alias setproxy='export http_proxy="http://localhost:65533";export https_proxy="http://localhost:65533"'
alias unsetproxy="unset http_proxy; unset https_proxy"
alias setgitproxy='git config --global http.proxy "http://localhost:65533"; git config --global https.proxy "http://localhost:65533"'
alias unsetgitproxy="git config --global --unset http.proxy; git config --global --unset https.proxy"

export GIT_EDITOR=vim
export EDITOR=vim
export VIMRC=~/projects/Myconfig/vimrc
export GOPATH=~/go
#export GO111MODULE=on
#export GOPROXY=https://goproxy.cn
#
export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :300 {}'"
#export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --preview"
export RIPGREP_CONFIG_PATH='/root/.rg.conf'


if [[ -d "/usr/local/opt/go/libexec" ]] ; then
        export GOROOT=/usr/local/opt/go/libexec
elif [[ -d "/usr/local/apps/go" ]] ; then
	export GOROOT=/usr/local/apps/go
else
	export GOROOT=/usr/lib/golang
fi

export PATH=$PATH:$GOPATH/bin:$GOROOT/bin
