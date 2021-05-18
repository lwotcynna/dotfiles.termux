#!/data/data/com.termux/files/usr/bin/env bash

# myTermux utility
# change terminal color
alias chcolor='/data/data/com.termux/files/home/.termux/colors.sh'
# change terminal font
alias chfont='/data/data/com.termux/files/home/.termux/fonts.sh'

# my aliases
alias vi=nvim
alias q='exit'
alias c='clear'
alias vim='nvim -u ~/.vimrc'
exa &>/dev/null
if [ $? == 0 ]; then
  alias ls="exa --icons"
  alias la="exa -a --icons"
  #alias la="exa --icons -lgha --group-directories-first"
else
  alias l='ls -a'
fi
alias p='python'
alias bb=busybox
alias mkill='mpd --kill'
alias mem='df -h | egrEp "size|storage" | awk "{print $2}"'
alias srzsh='source ~/.zshrc'
alias neofetch='neoneo --ascii_distro android_small'
alias desktop='vncserver -geometry 1420x720'
alias dkill='vncserver -kill'
alias archlinux='proot-distro login archlinux'

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
alias Sd='cd /sdcard'
alias github='cd $SDCARD/Documents/github.com'
alias annzc='cd $SDCARD/Documents/github.com/annzc'
alias piton='cd $SDCARD/Documents/learnCode/python'
alias dload='cd /sdcard/download'
alias pf="cd $PREFIX"
alias Ex='cd $SDCARD/'
alias Doc='cd $SDCARD/Documents/'
alias binn='cd $PREFIX/bin'
alias etc='cd $PREFIX/etc'

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

termuxfoo(){
   termux-info | sed "s/localhost/Cactus/g"
}
alias termux-info=termuxfoo

unam(){
  uname $1 | sed "s/localhost/Cactus/g"
}
alias uname=unam

# python virtual environment control
pyenv(){
  menu="USAGE: pyenv [COMMANDS]\n\nlist commands:\n-------------\n-c   - create a \"env\" folder as virtualenv\n-a   - activate virtual environment\n-d   - deactivate current virtualenv\n-------------"
  if [ ! -f $PREFIX/bin/virtualenv ]; then
    echo "don't forget to install python virtualenv package first\nrun: pkg install virtualenv\nor : pip install virtualenv"
  elif [[ $1 == "-c" ]]; then
    virtualenv env
  elif [[ $1 == "-a" ]]; then
    command -v deactivate &>/dev/null
    if [ $? == 0 ]; then
      echo "you're already inside virtual environment"
    elif [ -f ./env/bin/activate ]; then
      source env/bin/activate
    else
      echo "have you already ran \"pyenv -c\" in your current directory?"
    fi
  elif [[ $1 == "-d" ]]; then
    deactivate &>/dev/null
    if [ ! $? == 0 ]; then
      echo "you're not in any virtual env!"
    fi
  elif [ $1 ]; then
    { echo "unknown parameter \"$1\"" && echo $menu; exit 1; }
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
