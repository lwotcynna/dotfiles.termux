data=$HOME/.config/neofetch/data.tmp
bash ~/.scripts/batt.sh -a > $data
icob="$(awk '{print $1}' $data)"
stts="$(awk '{print $2, $3}' $data)"

bash ~/.scripts/storage.sh -a > $data
in="$(grep inter $data | awk '{print $2,$3,$4,$5}')"
ex="$(grep exter $data | awk '{print $2,$3,$4,$5}')"

rm $data &>/dev/null
