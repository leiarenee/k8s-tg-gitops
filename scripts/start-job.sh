#!/bin/bash

# capture an interrupt # 0
trap '[[ $(jobs -l | grep "$job_id Running") ]] && kill -9 $job_id' EXIT

# colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Stop on error
set -e

function usage (){
  echo usage:
  echo start-job -c "<command>" -f "<file.log>"
}

while [ "$1" != "" ]; do
  case $1 in
  -f | --file )     shift;log_file=$1;;
  -c | --command )  shift;command="$1;echo";; 
  -s | --success )  shift;success_phrase=$1;; 
  -e | --error )    shift;error_phrase=$1;;
  -t | --timeout )  shift;time_out=$1;;                             
  -h | --help )     usage;exit;;
  * )               usage;exit 1
  esac
  shift
done

if [[ -z $error_phrase ]];then error_phrase="error";fi

echo command $command
echo log file $log_file

# Clear file
if [ -f "$log_file" ]; then rm $log_file;fi
touch $log_file

# Attach cw process to background, direct stdout to log file
bash -c "$command" > $log_file 2>&1 &

# Get Job Id
job_id=$!

echo Job: $job_id

sleep 1

declare -i lines=0
declare -i linesold=0
declare -i elapsedtime=0
logupdated=false

while :
do
  
  linesold=$lines
  lines=$(wc -l $log_file | awk '{ print $1 }')

  if [[ $linesold != $lines ]];then 
    echo 
    awk -v linesold=$linesold 'NR > linesold' $log_file | sed '/^$/d'
    elapsedtime=0
    logupdated=true

    # Evaluate completion and exit on complete
    if [[ -f $log_file ]] && [[ $(jobs -l | grep "$job_id Done") ]];then
      if [[ $(grep "$success_phrase" "$log_file") && ! -z $success_phrase  ]];then
        echo -e "\n${GREEN}Success: Job completed succesfully.${NC} ";exit 0
      fi
      if [[ $(grep "$error_phrase" "$log_file") && ! -z $error_phrase  ]];then
        echo -e "\n${RED}Error: Job Failed.${NC} ";exit 1
      else
        echo -e "\n${GREEN}Success: Job completed succesfully.${NC} ";exit 0
      fi
    fi
  fi

  # Wait for each cycle
  sleep 1
  
  # Exit if timeout occurs
  elapsedtime+=1
  if [[ ! -z $time_out && $(($elapsedtime > $time_out)) ]];then 
    echo -e "\n${RED}Error: Job Failed-Timeout.${NC} ";exit 2
  fi
done

