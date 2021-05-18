#!/usr/bin/bash
setpass(){
  echo -ne "New password: "; read -s paswod
  echo -ne "\nRetype new password: "; read -s paswod1
  sleep 0.3
  if [[ "$paswod" == "$paswod1" ]]; then
    echo "paswod='$paswod'" > $HOME/.password
    sleep 0.2
    echo -e "\n\npassword changed √
    "
  else
    {
      echo -e "\n\npassword do not match!";
      echo -e "passwd: password unchanged. exit";
      exit 1;
    }
  fi
}
setpass
