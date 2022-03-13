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
