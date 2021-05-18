#!/bin/env bash

# my aliases
alias q='exit'
alias c='clear'
alias vi=nvim
alias vim='nvim -u ~/.vimrc'
exa &>/dev/null
if [ ! $? -ne 0 ]; then
  alias ls='exa --icons'
  alias la='ls -a'
  alias l='exa --icons -a'
else
  alias l='ls -a'
fi
alias p='python'
alias srzsh='source ~/.zshrc'
alias desktop='vncserver -geometry 1420x720'
alias dkill='vncserver -kill'
alias ee='echo -e'

host=Archlinux
alias neo='neofetch | sed "s/localhost/$host/g"
'

# config files
alias zshrc="vi ~/.zshrc"
alias bashrc='vi ~/../usr/etc/bash.bashrc'
alias vimrc='vi ~/.vimrc'
alias nvimrc="vi ~/.config/nvim/init.vim"
alias aliases='vi ~/.bash_aliases'
alias xstart='vi ~/.vnc/xstartup'
alias rcxml='vi ~/.config/openbox/rc.xml'
alias neoconf='vi ~/.config/neofetch/config.conf'
alias ncmconf="vi ~/.config/ncmpcpp/config"
alias mycolors='vi ~/.termux/colors/ann.colors'

# go to directory
SDCARD="/storage/D639-79B5"
THOME='/data/data/com.termux/files/home'
alias Sd='cd /sdcard'
alias github='cd $SDCARD/Documents/github.com'
alias annzc='cd $SDCARD/Documents/github.com/annzc'
alias piton='cd $SDCARD/Documents/learnCode/python'
alias dload='cd /sdcard/download'
alias pf="cd $PREFIX"
alias Ex='cd $SDCARD/'
alias Doc='cd $SDCARD/Documents/'
alias binn='cd /usr/bin'
alias etc='cd /etc'

# johnTheRipper aliases
if [ -f ~/bin/john_aliases ]; then
  . ~/bin/john_aliases
fi

# enable icon for lf file explorer
if [ -f ~/.config/lf/lfrc ]; then
  . ~/.config/lf/lfrc
fi

listfile(){
  find . -maxdepth 1 -type f | sed "/\.\/\./d" | sed "s/\.\///g"
}

unam(){
  uname $1 | sed "s/localhost/Archlinux/g"
}
alias uname=unam

# python virtual environment control
pyenv(){
  menu="
  USAGE: pyenv [COMMANDS]\n\nlist commands:
  
  -c   - create a \"env\" folder as virtualenv
  -a   - activate virtual environment
  -d   - deactivate current virtualenv
  "

  if [ ! -f $PREFIX/bin/virtualenv ]; then
    echo "don't forget to install python virtualenv package first
run: pkg install virtualenv
or : pip install virtualenv"
  elif [[ $1 == "-c" ]]; then
    if [ -f ./env ]; then
      echo virtualenv folder exist, activating..
      sleep 0.5
    else
      virtualenv env
    fi
  elif [[ $1 == "-a" ]]; then
    command -v deactivate &>/dev/null
    if [ $? -eq 0 ]; then
      (
        echo "you're already inside virtual environment";
        exit 1;
      )
    elif [ -f ./env/bin/activate ]; then
      source env/bin/activate
    else
      (
        echo "have you already created virtual env in your current directory?"
        echo "run pyenv -c to create a virtual env in current dir"
        exit 1;
      )
    fi
  elif [[ $1 == "-d" ]]; then
    deactivate &>/dev/null
    if [ ! $? -eq 0 ]; then
      (
        echo "you're not in any virtual env!"
        exit 1;
      )
    fi
  elif [ $1 ]; then
    (
      echo "unknown parameter \"$1\""
      echo $menu; exit 1;
    )
  else
    echo $menu
  fi
}

## another useful functions
## got these from tutermuxid
# shorthand for chmod
cx(){
  if [ $1 ]; then
    chmod +x $1
  else
    echo "Usage: cx [file]"
  fi
}

# shorthand for git clone
gitc(){
  if [ $2 ]; then
    git clone https://github.com/$1/$2
  elif [ $1 ]; then
    echo -e "[repo] not found!"
    echo -e "USAGE: $ gitc [username] [repo]"
  else
    echo -e "USAGE: \n$ gitc [username] [repo]"
  fi
}

# shorthand to git remote
gitrmt(){
  if [ $2 ]; then
    git remote add origin https://github.com/$1/$2
  elif [ $1 ]; then
    echo -e "[repo] not found!"
    echo -e "USAGE: $ gitrmt [username] [repo]"
  else
    echo -e "USAGE: \n$ gitrmt [username] [repo]"
  fi
}
jptnb(){
  (
    nb(){
      sleep 3
      xdg-open "http://localhost:8888/tree#notebooks"
    }
    command -v deactivate &>/dev/null
    if [ $? -eq 0 ]; then
      nb &>/dev/null
      jupyter notebook --allow-root
    else
      echo "zsh: command not found: jupyter";
      exit 1;
    fi
  )
}
alias jupyter=jptnb
