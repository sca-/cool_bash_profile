# .bashrc

# User specific aliases and functions

# Source global definitions
if [ -r /etc/bashrc ]; then
	. /etc/bashrc
fi

export PATH=~/bin:/usr/local/bin:"${PATH}:"/opt/kde/bin

# Приветствия
#fortune

# Автодополнения
complete -cf sudo
complete -cf man

# Общая хистори
shopt -s histappend
#PROMPT_COMMAND='history -a'
PROMPT_COMMAND='history -a; history -n'

set -o noclobber

# Хистори без дубликатов
export HISTCONTROL="ignoredups"

# Игнорирование команд в хистори
export HISTIGNORE="&:ls:l:ll:la:exit:su"

# Цветной grep
export GREP_OPTIONS="--color=auto"

# Алиасы
alias ls='ls -FG'
alias ..='cd ..'
alias cd..='cd ..'
alias df='df -h'
alias du='du -h'
alias mc='mc -c'
alias l='ls -lhG'
alias la='ls -AFG'
alias li='ls -lhiG'
alias ll='ls -lAG'
alias clr='clear'
alias rm='rm -f'
alias dud='find . -maxdepth 1 -type d -print | xargs du -sk | sort -rn'
alias urar='unrar x'
alias uzip='unzip -x'
#alias pacman='pacman-color'
alias getback='xrandr -s 1152x864'
alias aurbuild="sudo env EDITOR=\$EDITOR aurbuild" 
alias ccat='pygmentize -O style=monokai -f console256 -g'

source /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh

# Приглашение
PS1='\[\e[1;32m\]\
[\u@\h \
\[\e[m\]\
\w\
\[\e[1;32m\]\
]\[\e[m\]\
\e[0;36m$(__git_ps1)\
\nruby $(ruby -e "print RUBY_VERSION")\e[0m → \D{%k:%M:%S} \[\e[1;32m\]\$ \
\[\e[m\]'

# trap 'prevcmd=$(date +"%k:%M:%S")' DEBUG

export LSCOLORS=gxFxCxDxBxegedabagacad

# Хайлайт
function hil 
{ 
        ESC=`echo -e "\033"` 

        COLORON="$ESC[1;33m" 
        COLOROFF="$ESC[1;0m" 

        if [ -z "$1" ] ; then 
                echo "Usage: hil 'regex' [file1 file2 ...]" 1>&2; 
                return 1 
        fi 

        REGEX="$1" 
        shift 

        sed -e "s/${REGEX}/${COLORON}&${COLOROFF}/g" $* 
}

export XDG_DATA_DIRS="/opt/kde/share:$XDG_DATA_DIRS"
export XDG_CONFIG_DIRS="/opt/kde/etc/xdg:$XDG_CONFIG_DIRS"
export EDITOR="vim"
##
# Your previous /Users/stfoo/.bash_profile file was backed up as /Users/stfoo/.bash_profile.macports-saved_2012-04-09_at_16:21:47
##

# MacPorts Installer addition on 2012-04-09_at_16:21:47: adding an appropriate PATH variable for use with MacPorts.
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:~/bin
# Finished adapting your PATH environment variable for use with MacPorts.


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh # This loads NVM

export HISTSIZE=1000
