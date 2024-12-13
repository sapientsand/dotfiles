#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias twdlp='yt-dlp --cookies-from-browser firefox::none --trim-filenames 100' 
PS1='[\u@\h \W]\$ '

[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
