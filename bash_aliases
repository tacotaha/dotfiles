#alias open="xdg-open '$1' &> /dev/null &"

function _open_ (){
for FILE in "$@"
do
    xdg-open $FILE &> /dev/null 2>&1 &
done
}
alias open="_open_"
alias g11="g++ --std=c++11"
alias lampp="/opt/lampp/lampp"
alias irssi="irssi -c chat.freenode.net -n USER -w PASS"
export TERM=xterm-256color
export XAUTHORITY=/home/taha/.Xauthority
export PYTHONPATH=$PYTHONPATH:/home/taha/Research/Cortix
alias em="emacs -nw"
alias wifi="nmcli c up uuid" # paste UUID
alias rpc="find . | grep -E '(__pycache__|\.pyc|\.pyo$)' | xargs rm -rf"