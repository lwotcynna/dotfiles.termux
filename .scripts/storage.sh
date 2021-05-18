#!/bin/env bash
## storage info
## some devices might be different, specify on your own
internal=/storage/emulated/0/Android/data
external=/storage/D639-79B5 # your external card's name
ftmp=$HOME/.scripts/util_data/data.tmp
df -h 2>/dev/null > $ftmp

scrp(){
  grep $internal $ftmp | awk "{print \$$1}"
}
scrpX(){
  grep $external $ftmp | awk "{print \$$1}"
}

## internal info
Fsys=$(scrp 1)
Size=$(scrp 2)
Used=$(scrp 3)
Avai=$(scrp 4)
Perc=$(scrp 5)
Moun=$(scrp 6)

# external info
FsysX=$(scrpX 1)
SizeX=$(scrpX 2)
UsedX=$(scrpX 3)
AvaiX=$(scrpX 4)
PercX=$(scrpX 5)
MounX=$(scrpX 6)

InAll="
Internal Storage
================
Device     : $Fsys
Size       : ${Size}B
Used       : ${Used}B ($Perc)
Available  : ${Avai}B
Mounted on : $Moun
"

ExAll="
External Storage
================
Device     : $FsysX
Size       : ${SizeX}B
Used       : ${UsedX}B ($PercX)
Available  : ${AvaiX}B
Mounted on : $MounX
"

fetch_info(){
  echo -e "${1}B / ${2}B ($3)"
}

data="
inter $(fetch_info $Used $Size $Perc)
exter $(fetch_info $UsedX $SizeX $PercX)
" &> $ftmp

if [[ "$1" == "-a" ]]; then
  echo "$data"
elif [[ "$1" == "-i" ]]; then
  fetch_info $Used $Size $Perc
elif [[ "$1" == "-e" ]]; then
  fetch_info $UsedX $SizeX $PercX
elif [[ "$1" == "-I" ]]; then
  echo -e "$InAll"
elif [[ "$1" == "-E" ]]; then
  echo -e "$ExAll"
else
  {
    echo -e "USAGE: ./storage.sh -[i|e|I|E]";
    echo -e "e.g: ./storage.sh -I";
    exit 1;
  }
fi
