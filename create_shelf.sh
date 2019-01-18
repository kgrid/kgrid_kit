#!/bin/bash

source config.conf
shelfUrl=$1
repos=($2)
if [[ -n "shelfUrl" ]]; then
  rm -rf build
  mkdir build
  cd build

  for i in "${repos[@]}"
  do
     echo -e "Download release  $i "
     if [[ $i == *:* ]]; then
       theReop=$(echo $i | cut -d':' -f 1)
       theTag=$(echo $i | cut -d':' -f 2)
       url=(https://api.github.com/repos/kgrid-objects/$theReop/releases/tags/$theTag?access_token=$GIT_TOKEN )
     else
       url=(https://api.github.com/repos/kgrid-objects/$i/releases/latest?access_token=$GIT_TOKEN  )
     fi
     ../download.sh "$url"
  done

  for zipFile in *.zip
  do
    echo -e "Processing $zipFile"
    fileName=${zipFile%%.*}
    curl -X PUT "${shelfUrl}/${fileName//-//}"\
             -H "Content-Type: multipart/form-data" \
             -F "ko=@$zipFile"
  done

else
    echo "no url passed in"
fi




