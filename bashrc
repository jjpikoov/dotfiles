#
# ~/.bashrc
#

# If not running interactively, don't do anything
# [[ $- != *i* ]] && return
# 
# alias ls='ls --color=auto'
# PS1='[\u@\h \W]\$ '

# MADE BY JJPIKOOV

alias caaps='setxkbmap -option ctrl:nocaps'
alias tmux='tmux -2 -f ~/.tmux.conf'
alias adb='~/.buildozer/android/platform/android-sdk-21/platform-tools/adb'
alias sx='startx'
alias vv='. venv/bin/activate'
export TERM=screen-256color
#return value visualisation
set_prompt () {
    Last_Command=$? # Must come first!
    Blue='\[\e[01;34m\]'
    White='\[\e[01;37m\]'
    Red='\[\e[01;31m\]'
    Green='\[\e[01;32m\]'
    Reset='\[\e[00m\]'
    FancyX='\342\234\227'
    Checkmark='\342\234\223'
    Yellow='\[\e[0;33m\]'
    BYellow='\[\e[1;33m\]'
    BIYellow='\[\e[1;93m\]'
    Black='\[\e[0;30m\]'

    

    # Add a bright white exit status for the last command
    PS1="$Reset\$? "
    # If it was successful, print a green check mark. Otherwise, print
    # a red X.
    if [[ $Last_Command == 0 ]]; then
        PS1+="$Green$Checkmark "
    else
        PS1+="$Red$FancyX "
    fi
    # If root, just print the host in red. Otherwise, print the current user
    # and host in green.
    if [[ $EUID == 0 ]]; then
        PS1+="$Red\\h "
    else
        PS1+="$Green\\u@\\h "
    fi
    # Print the working directory and prompt marker in blue, and reset
    # the text color to the default.
    PS1+="$Blue\\w \\\$$Reset "
}

alias ls='ls --color'                                                       
LS_COLORS=$LS_COLORS:'di=1;90:ln=0;31:ex=0;93'                              
export LS_COLORS  

caaps

PROMPT_COMMAND='set_prompt'
echo ===================================
cat $HOME/.TODOJJPIKOOV
echo ===================================
