
eval "$(starship init zsh)"
##########
# HISTORY
##########

HISTFILE=$HOME/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

# Immediately append to history file:
setopt INC_APPEND_HISTORY

# Record timestamp in history:
setopt EXTENDED_HISTORY

# Expire duplicate entries first when trimming history:
setopt HIST_EXPIRE_DUPS_FIRST

# Dont record an entry that was just recorded again:
setopt HIST_IGNORE_DUPS

# Delete old recorded entry if new entry is a duplicate:
setopt HIST_IGNORE_ALL_DUPS

# Do not display a line previously found:
setopt HIST_FIND_NO_DUPS

# Dont record an entry starting with a space:
setopt HIST_IGNORE_SPACE

# Dont write duplicate entries in the history file:
setopt HIST_SAVE_NO_DUPS

# Share history between all sessions:
setopt SHARE_HISTORY

# Execute commands using history (e.g.: using !$) immediatel:
unsetopt HIST_VERIFY


# ALIASES
alias vim="nvim"
alias ls="ls --color"
alias md='x(){ mkdir "$1"; cd "$1"; }; x'

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

TERM=xterm-256color

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/home/meet/Downloads/programs/zellij
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export LS_COLORS='di=1;38;5;208:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

[[ -s "/home/meet/.gvm/scripts/gvm" ]] && source "/home/meet/.gvm/scripts/gvm"
