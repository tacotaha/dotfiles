# If you come from bash you might have to change your $PATH.
export PATH=/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/usr/local/sbin:/usr/local/bin:/home/taha/.local/bin:/home/taha/.local/bin

# Path to your oh-my-zsh installation.
export ZSH=/home/taha/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

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
 ENABLE_CORRECTION="true"

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
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias zsh="source ~/.zshrc"
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

# Open a file with its default application
function open()
for FILE in "$@"
do
    xdg-open $FILE &> /dev/null 2>&1 &
done

# Auto-format C source code
function clean-c()
for FILE in "$@"
do
    cp $FILE "$FILE~"
    clang-format -i -style=google $FILE
done

# Auto-format html
function clean-html()
for FILE in "$@"
do
    cp $FILE "$FILE~"
    tidy -i -m -w 80 -ashtml -utf8 --tidy-mark no $FILE 
done

# Search and replace text
# Usage: $ change foo bar *.c
function change () {
        from=$1 
        shift
        to=$1 
        shift
        for file in $*
        do
                perl -i.bak -p -e "s{$from}{$to}g;" $file
                echo "Changing $from to $to in $file"
        done
}

# View the memory usage of a process
# Usage: $ mem firefox
function mem(){
    ps -eo rss,pid,euser,args:100 --sort %mem | grep -v grep | grep -i $@ | awk '{printf $1/1024 "MB"; $1=""; print }'
}

# C++11 support 
alias g11="g++ --std=c++11"

# Auto-login to freenode
alias irssi="irssi -c chat.freenode.net -n USER -w PASS"

# Recursively delete annoying .pyc and __pycache__ files
alias rpc="find ./ | grep -E '(__pycache__|\.pyc|\.pyo$)' | xargs rm -rf"

# Recursively delete tilde backup files
alias rbu="find ./ -name '*~' -exec rm '{}' \; -print -or -name '.*~' -exec rm {} \; -print"

# GUI-less emacs
alias em="emacs -nw"

export PYTHONPATH=$PYTHONPATH:/home/taha/Research/Cortix
export PATH=$PATH:/home/taha/.local/bin

# Edit pkg builds in VIM
export VISUAL=vim

# Update repo mirrors
alias update_mirrors="sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak; sudo reflector --verbose --country 'United States' -l 5 --sort rate --save /etc/pacman.d/mirrorlist"

# Automatically list the contents of a directory upon changing into it
chpwd() ls
