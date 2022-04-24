#!/bin/bash
image_url=$(cat ./stream.log | grep -o '[0-9]*.dkr.*:v[0-9]*.[0-9]*.*$')
if [[ $? -eq 0 && ! -z $image_url ]]
then
  echo "{\"image_url\": \"$image_url\"}"
else
  echo "{\"image_url\": \"error\"}"
fi