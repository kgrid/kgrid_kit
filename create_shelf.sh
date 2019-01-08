#!/bin/bash

shelfUrl=$1

if [[ -n "shelfUrl" ]]; then
  rm -rf build
  mkdir build
  cd build

  repos=(opioid-collection cpic-collection example-collection cancer-risk-collection icon-array script-numerate postpci labwise )

  for i in "${repos[@]}"
  do
     url=(https://api.github.com/repos/kgrid-objects/$i/releases/latest?access_token=604b8cbeab5731ce52144e5cbb0c999547dd262c  )
     ../download.sh "$url"
  done

  for zipFile in *.koio.zip
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




