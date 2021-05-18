source ~/.scripts/my_variables.sh
source ~/.password &>/dev/null

echo
echo -e "${cyn}proot-distro:$rst root@Archlinux login."
trap "echo -e \"\n${red}Canceled.\";{ exit 2; }" INT
i=0
while :; do
  echo -ne "password: "
  read -s psswd
  if [[ "$psswd" == "$paswod" ]]; then
    echo
    echo -e "${grn}"
    echo -e "Welcome to Arch Linux proot-distro!"
    echo -e "==================================="
    echo -e "${rst}"
    break
  else
    sleep 0.5
    (( i=i+1 ))
    if [ $i -eq 3 ]; then
      echo -e "\n$red"
      echo -e "3 incorrect password attempts. exiting...$rst"
      exit 1;
    fi
    echo -e "\n${red}Sorry, try again.${rst}"
  fi
done
