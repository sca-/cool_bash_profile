# Path to your oh-my-zsh installation.
  export ZSH=/Users/semenov/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="amuse"
setopt promptsubst
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

  export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/semenov/Documents/phpStorm/bin:/usr/local/mysql/bin:$HOME/.bin:$HOME/.npm-global/bin:$HOME/Library/Python/3.7/bin:/Library/Frameworks/Mono.framework/Versions/Current/Commands"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh
# source ~/.bash_weather.sh
CONFIGFILE=~/.LAST_TIME_CHECKED_WEATHER.vars

getWeather (){
	if [ -r ${CONFIGFILE} ]; then
	  source ${CONFIGFILE}
	fi
	echo "$WEATHERCHAR"
}

TRAFFICFILE=~/.TRAFFIC.vars
getTraffic (){
    if [ -r ${TRAFFICFILE} ]; then
      source ${TRAFFICFILE}
    fi
    echo "$TRAFFICCHAR"
}

getRprompt (){
    # RPROMPT="%{$fg_bold[red]%}r: $RPROMPT"
    if [ -z "$VIRTUAL_ENV" ]; then
        MYRPROMPT="p: $(python --version | sed 's/[^0-9.]*//g')"
    else
        # PIPENVSHELL="$(echo $VIRTUAL_ENV | sed 's/.*\///')"
        # RPROMPT="pipenv $PIPENVSHELL %{$fg_bold[red]%}ruby: $RPROMPT"
        MYRPROMPT="p: env ↵ "
    fi
    echo "$FG[240] n: $(node -v)$FG[255] $MYRPROMPT"
}


PROMPT="$PROMPT $FG[080] \$(getWeather) \$(getTraffic)
$FG[255]→  "
RPROMPT="\$(getRprompt)"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# JAVA
export JAVA_HOME=$(/usr/libexec/java_home)

# less
export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
export LESS=" -R "
alias less='less -m -N -g -i -J --underline-special --SILENT'
alias more='less'

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

## ALIAS
 alias tru="~/tools/trans -b :ru"
 alias ten="~/tools/trans -b :en"
 alias h="perl -lne 'm#: (\d+):\d+;(.+)# && printf \"%s :: %s\n\",scalar localtime \$1,\$2' \$HISTFILE"
 alias htoday="h | grep \"\$(LANG=en_us date +\"%a %b %_d\")\""
 alias hyest="h | grep \"\$(LANG=en_us date -v-1d +\"%a %b %_d\")\""
 alias w="webpack"
 alias vgs="cd ~/vagrant-tutu && vagrant ssh"
# ssh hosts
 alias ssh-dev="ssh semenov@semenov.tutu.pro"
 alias ssh-dci="ssh semenov@deploy.ci.tutu.ru"
 alias ssh-dd="ssh semenov@deploy.devel.tutu.ru"
 alias ssh-dsci="ssh semenov@deploy-storedata.ci.tutu.ru"
 alias ssh-dep="ssh semenov@depot.tutu.ru"
# cd shortcuts
 alias cdtutu="cd ~/work/projects/tutu"
 alias cdsmth="cd ~/smth"
 alias cdlego="cd ~/work/libraries/Lego"
 alias cdnickel="cd ~/work/libraries/Nickel"
# git
 alias cssdiff="git diff www/css2"
 alias jsdiff="git diff www/js4/src/app"
 alias gs="git status"
 alias gds="git diff --staged"
 alias gph="git pull origin $(git rev-parse --abbrev-ref HEAD)"
# project tutu
 alias pullscripts="scp -r semenov@semenov.tutu.pro:/home/semenov/devel/projects/tutu/www/scripts/build /home/semenov/tutu/www/scripts"
 function rjs () { grunt rjs:app/avia/require/"$@" }
 function abless() { grunt less-file:www/css2/ab/"$@" }
 function bless() { grunt less-file:www/css2/bemp/page/avia/"$@" }

# eval $(thefuck --alias)

# toggle iTerm Dock icon
# add this to your .bash_profile or .zshrc
function toggleiTerm() {
    pb='/usr/libexec/PlistBuddy'
    iTerm='/Applications/iTerm.app/Contents/Info.plist'

    echo "Do you wish to hide iTerm in Dock?"
    select ync in "Hide" "Show" "Cancel"; do
        case $ync in
            'Hide' )
                $pb -c "Add :LSUIElement bool true" $iTerm
                echo "relaunch iTerm to take effectives"
                break
                ;;
            'Show' )
                $pb -c "Delete :LSUIElement" $iTerm
                echo "run killall 'iTerm' to exit, and then relaunch it"
                break
                ;;
        'Cancel' )
            break
            ;;
        esac
    done
}


# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

source ~/.oc_completion
