#!/bin/env bash
source $HOME/.scripts/my_variables.sh

menu="
USAGE: ./batt.sh -[i|s]
"

## scraping battery info using termux-battery-status
fbat=$HOME/.scripts/util_data/battery_info.json
echo "{ \"date\": \"$(date)\" }," >$fbat \
  && termux-battery-status &>>$fbat

scrp(){
  grep $1 $fbat \
    | sed "s/\"//g" \
    | sed "s/,//g" \
    | awk '{print $2}'
}

hlth=$(scrp health)
perc=$(scrp percen)
plug=$(scrp plugge)
stts=$(scrp status)
temp=$(scrp temper)

batt_icon(){
  if (( $perc <= 10 )); then
    echo -e $red""$rst
  elif (( $perc > 10 && $perc < 20 )); then
    echo -e $red""$rst
  elif (( $perc >= 20 && $perc < 30 )); then
    echo -e $ylw""$rst
  elif (( $perc >= 30 && $perc < 40 )); then
    echo -e $ylw""$rst
  elif (( $perc >= 40 && $perc < 50 )); then
    echo -e $ylw""$rst
  elif (( $perc >= 50 && $perc < 60 )); then
    echo -e $ylw""$rst
  elif (( $perc >= 60 && $perc < 70 )); then
    echo -e $grn""$rst
  elif (( $perc >= 70 && $perc < 80 )); then
    echo -e $grn""$rst
  elif (( $perc >= 80 && $perc < 90 )); then
    echo -e $grn""$rst
  elif (( $perc >= 90 && $perc < 100 )); then
    echo -e $blue""$rst
  elif [[ "$perc" == "100" ]]; then
    echo -e $blue""$rst
  fi
}

batt_stts(){
  case "$stts" in
    CHARGING)
      echo -e "$perc% $grn($stts)$rst"
      ;;
    DISCHARGING)
      echo -e "$perc% $ylw($stts)$rst"
      ;;
    FULL)
      echo -e "$perc% $blue($stts)$rst"
  esac
}

if [[ "$1" == "-a" ]]; then
  echo -e "$(batt_icon) $(batt_stts)"
elif [[ "$1" == "-i" ]]; then
  batt_icon
elif [[ "$1" == "-s" ]]; then
  batt_stts
else
  { echo $menu; exit 1; }
fi
