#!/bin/bash
set -e
relative_from_include=$1

current_dir=$(pwd)

scripts_dir=$(cd `dirname "$0"`;pwd)

#echo current_dir $current_dir
#echo scripts_dir $scripts_dir

# Symlink scripts folder
[[ ! -d scripts ]] && ln -s "$scripts_dir" scripts || true

# Exit if modules.json not found
[[ ! -f ".terraform/modules/modules.json" ]] && exit 0 || true

modules=$(cat .terraform/modules/modules.json | jq -r 'values[][] | select(.Source != "") | "\(.Source)>\(.Dir)"')

# Iterate over each key value pairs in modules.json
for str in $modules
do
  kv=(${str//>/ })
  source=${kv[0]}
  dir=${kv[1]}
  echo "$source => $dir"
  sub_folder=$(echo $source | grep -o "\\w\\/\\/.*" | sed 's/.\/\///g')
  main_folder=${dir//.terraform\/modules\//}
  main_folder=${main_folder//\/$sub_folder/}

  echo "Main_folder: $main_folder  -  Sub_folder: $sub_folder " 

  # Replace / with |
  replaced_source=${source//\//|}
  replaced_source=${replaced_source//:/;}
  
  relative_root_folder=$relative_from_include/../../../.terragrunt-cache
  
  # If not present, create .modules-cache folder
  [[ ! -d $relative_root_folder/.modules-cache ]] && mkdir $relative_root_folder/.modules-cache || true
  
  # If not symlink copy
  [[ ! -h $dir && -d $dir ]] && rsync -a --exclude='.git' --delete $dir/ $relative_root_folder/.modules-cache/$replaced_source || true
  
  # If target does not exist remove modules folder
  [[ ! -d $relative_root_folder/.modules-cache/$replaced_source ]] && rm -R -f ".terraform/modules" && exit 0 || true

  # If not symlink remove
  [[ ! -h $dir && -d $dir ]] && rm -R -f ".terraform/modules/$main_folder" || true

  # Create symlink
  if [[ -d $relative_root_folder/.modules-cache/$replaced_source && ! -h $dir && ! -d $dir ]]
  then
    if [[ ! -z $sub_folder ]]
    then
      if [[ ! -d ".terraform/modules/$main_folder" ]] 
      then
        mkdir ".terraform/modules/$main_folder"
      fi
      cd ".terraform/modules/$main_folder"
      ln -s "../../../$relative_root_folder/.modules-cache/$replaced_source" "$sub_folder"
      echo symlink created ".terraform/modules/$sub_folder => <repo-root>/.modules-cache/$replaced_source"
      cd $current_dir
    else
      cd ".terraform/modules/"
      ln -s "../../$relative_root_folder/.modules-cache/$replaced_source" "$main_folder"
      echo symlink created ".terraform/modules/$main_folder => <repo-root>/.modules-cache/$replaced_source"
      cd $current_dir
    fi
  fi

done
