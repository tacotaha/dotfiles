function _open_ (){
for FILE in "$@"
do
    xdg-open $FILE &> /dev/null 2>&1 &
done
}

alias open="_open_"
alias g11="g++ --std=c++11"
alias lampp="/opt/lampp/lampp"
alias irssi="irssi -c chat.freenode.net -n USERNAME -w PASSWORD"
export TERM=xterm-256color
export XAUTHORITY=/home/taha/.Xauthority