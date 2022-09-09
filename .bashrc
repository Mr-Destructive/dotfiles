alias cdc='cd .. && cd .. && cd D: && cd meet/Code'
alias env='source env/Scripts/activate'
alias venv='source venv/Scripts/activate'
alias venvd='source .venv/Scripts/activate'
alias python='winpty python'
alias node='winpty node'
alias md='x(){ mkdir "$1"; cd "$1"; }; x'
alias di='docker-machine env && eval $("D:\Code\chocolatey\lib\docker-machine\bin\docker-machine.exe" env)'

HISTSIZE=-1 
HISTFILESIZE=-1
export ANDROID_HOME=/d/Code/android
export PATH=$ANDROID_HOME/cmdline-tools/tools/bin/:$PATH
export PATH=$ANDROID_HOME/emulator/:$PATH
export PATH=$ANDROID_HOME/platform-tools/:$PATH

export PIPENV_VENV_IN_PROJECT="enabled"
export tmxu="/c/Program Files/Git/usr/bin/usr/bin"

alias venv="venv"
alias docker="sudo docker $@"
alias md='x(){ mkdir "$1"; cd "$1"; }; x'
#alias tmux="tmux -u"
alias tmux="TERM=screen-256color-bce tmux -u"

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

export ANDROID=/opt/android-sdk
export PATH=$ANDROID/tools:$PATH
export PATH=$ANDROID/tools/bin:$PATH
export PATH=$ANDROID/platform-tools:$PATH
# Android SDK
export ANDROID_SDK=$ANDROID/cmdline-tools/latest/bin/sdkmanager
export PATH=$ANDROID_SDK:$PATH
export PATH="/home/meet/Downloads/pycharm/pycharm-community-2022.1.3/bin:$PATH"

eval "$(starship init bash)"
alias sconda='eval "$(/home/meet/anaconda3/bin/conda shell.bash hook)"'
#export VISUAL=gedit

# Flutter
export PATH="$PATH:/home/meet/code/playground/flutter/install/flutter/bin"
export CHROME_EXECUTABLE="/var/lib/flatpak/app/com.google.Chrome/x86_64/stable/5bdb8b8618ac52dcfff040a9494cbe6c28367e6c2163430915cbb9a228307413/files/bin/chrome"
TERM=xterm-256color
alias tmux="env TERM=xterm-256color tmux -u"
