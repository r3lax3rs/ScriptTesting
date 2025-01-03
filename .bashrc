#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1="\e[38;5;87m\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\033[01;37m\]\342\234\227]\342\224\200\")\e[38;5;196m[\[\033[01;37m\]\e[38;5;87m\t\e[38;5;196m]\e[1;30m\342\224\200\e[38;5;87m[\[\033[01;37m\]\e[38;5;196m\u\e[38;5;87m]\n\342\224\224\342\224\200\342\224\200> \[\033[01;37m\]\e[38;5;87m\W\e[1;30m $ \[\033[01;37m\]\e[38;5;196m>>\\[\\033[0m\\]\e[38;5;87m "
# Change 'relaxer' to your own username. Can also be doen after the fact by editing /home/$USER/.bashrc and replace; save; exit and either reboot
# or type "source .bashrc" without quotes in the terminal.
export PATH=/home/relaxer/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl

if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases
fi
