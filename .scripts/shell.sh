sh=$(echo $SHELL | sed "s/\// /g" | awk '{print $3}')
eval "$sh --version" | awk '{print $1, $2}'
