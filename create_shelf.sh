#!/bin/bash

shelfUrl=$1

if [[ -n "shelfUrl" ]]; then
  rm -rf build
  mkdir build
  cd build

  repos=(opioid-collection cpic-collection example-collection cancer-risk-collection icon-array script-numerate postpci labwise )

  for i in "${repos[@]}"
  do
     url=(https://api.github.com/repos/kgrid-objects/$i/releases/latest  )
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




