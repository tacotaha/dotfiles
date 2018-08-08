export PATH=/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/usr/local/sbin:/usr/local/bin:/home/taha/.local/bin
export PYTHONPATH=$PYTHONPATH:/home/taha/Research/Cortix
export ZSH=/home/taha/.oh-my-zsh
ZSH_THEME="robbyrussell"
ENABLE_CORRECTION="true"
plugins=(git zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh
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

# Create a backup of a set of files
function backup()
for FILE in "$@"
do
    cp $FILE "$FILE~"
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
alias irssi="irssi -c chat.freenode.net -n USER -w PASS && echo '' > $HISTFILE"

# Recursively delete annoying .pyc and __pycache__ files
alias rpc="find ./ | grep -E '(__pycache__|\.pyc|\.pyo$)' | xargs rm -rf"

# Recursively delete tilde backup files
alias rbu="find ./ -name '*~' -exec rm '{}' \; -print -or -name '.*~' -exec rm {} \; -print"

# GUI-less emacs
alias em="emacs -nw"

# Edit pkg builds in VIM
export VISUAL=vim

# Update repo mirrors
alias update_mirrors="sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak; sudo reflector --verbose --country 'United States' -l 5 --sort rate --save /etc/pacman.d/mirrorlist"

# Browser info for viewing evil HTML email in mutt
export BROWSER=firefox
export BROWSERCLI=w3m

# Set theme
wal -i /home/taha/Pictures/bit-rain.png > /dev/null

# Stop latex compilation on an error
alias pdflatex="pdflatex -halt-on-error"

# Create a markdown file with a given name 
# Timestamp is used if no name is provied
# Usage: $ note <some_title>
function note(){
    date=$(date +%F@%T)
    if [ $# -eq 0 ]; then 
        fname=$date.md
        title=""
    else
        fname=$1.md
        title=$1
    fi
    header="---\nAuthor: Taha Azzaoui\nDate: $date\nTitle: $title\n---\n" 
    echo -e $header > $fname
    vim $fname
}

