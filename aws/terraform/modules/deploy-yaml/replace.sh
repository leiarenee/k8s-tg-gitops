#!/bin/bash

# This script is used to substitute ${VAR} strings with corresponding values in *.yml or *.yaml files
# Replacement data is supplied as json key value pairs
# 
# Usage 
# replace.sh <json string> <source_dir> <destination_dir>  <quiet>
# ex:
# replace.sh source target '{"API_PATH":"/api", "API_ENDPOINT":"http://my-api:80"}'
#
# if first argument is supplied as $ENV_VAR the , value of env var is used 

set -e

replace_args=$1

# if replace argument is supplied as environment variable such as $TF_VARS_replacement 
# then evaluate the value of the variable
if [[ $(echo $replace_args | grep -p '^\$') != "" ]]
then 
  temp=$(echo $replace_args | sed 's/\$//')
  replace_args=$(echo ${!temp})
fi

src_dir=${2:-""}
dst_dir=${3:-""}
extensions=${4:-"yaml,yml"}
quiet=${5:-""}

# Check if replace arguments exists
if [[ -z $replace_args ]]
then
  echo No Replace Arguments Supplied.
  exit 0
fi

# Check if Source directory exists
if [[ ! -d "$src_dir" ]]
then 
  echo "Error: '$src_dir' directory not found"
  exit 1
fi

# Check if destination argument is supplied - giving "self","null", "" disables cloning
if [[ "$dst_dir" == "" || "$dst_dir" == "$src_dir" || "$dst_dir" == "null" || "$dst_dir" == "self" ]]
then
  dst_dir=$src_dir
else
  # Check if destination directory exists
  if [[ ! -d "$dst_dir" ]]
  then 
    echo "Error: '$dst_dir' directory not found"
    exit 1
  else
    # Clone source directory as destination
    rsync -a $src_dir/ $dst_dir 
  fi
fi


# Construct array
extension_array=(${extensions//,/ })
for i in "${!extension_array[@]}"
do
  list=$list" "$(find $dst_dir -type f -name "*.${extension_array[i]}")
done

# yml=$(find $dst_dir -type f -name "*.yml")
# yaml=$(find $dst_dir -type f -name "*.yaml")
# list=$yml" "$yaml

keys=$(echo $replace_args | jq -r keys[])
values=$(echo $replace_args | jq -r 'keys[] as $k | .[$k]')

set -f                      # avoid globbing (expansion of *).
keys_array=(${keys// / })
values_array=(${values// / })

for file in $list
do
  
  for i in "${!keys_array[@]}"
  do  
      find_source="${keys_array[i]}"
      match_source='${'$find_source'}'
      replace_with=${values_array[i]}

      tmp=$(sed s/$match_source/$replace_with/g $file)
      if [[ $tmp != $(cat $file) ]]
      then
        [[ -z $quiet ]] && [[ -z $prtd ]] && echo "$file"
        [[ -z $quiet ]] && echo " \${${keys_array[i]}} => ${values_array[i]}"
        echo "$tmp" > $file
        prtd="-"
      fi
      
      #echo
  done
prtd=""
echo
done