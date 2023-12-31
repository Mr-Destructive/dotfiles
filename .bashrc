alias md='x(){ mkdir "$1"; cd "$1"; }; x'
alias tmux="tmux -u"

function venv(){
    if [ -d "venv" ]; then
        source venv/bin/activate
    elif [ -d ".venv" ]; then
        source .venv/bin/activate
    elif [ -d ".env" ]; then
        source .env/bin/activate
    elif [ -d "env" ]; then
        source env/bin/activate
    else
        virtualenv .venv
        source .venv/bin/activate
    fi
}

eval "$(starship init bash)"

TERM=xterm-256color
#alias tmux="env TERM=xterm-256color tmux -u"
alias vim="nvim"

unset LSCOLORS
export CLICOLOR=1
export CLICOLOR_FORCE=1
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/home/meet/Downloads/programs/zellij
