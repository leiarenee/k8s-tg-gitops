#!/bin/bash
# Usage 
# ./health-check <timeout> <host1>:<port1> <host2>:<port2> .... <hostn>:<portn>
# If <timeout> is discarded, default value is assigned

# Default timeout value
time_out_default=1
retry_interval=1

# Check if first argument is number
if [ -n "$1" ] && [ "$1" -eq "$1" ] 2>/dev/null; then
  #number, assign it as common timeout value
  time_out=$1;shift 1;
else
  #not a number, assign common timeout value as 
  time_out=$time_out_default
fi

while test $# -gt 0 # Loop through all arguments
do
  IFS=':'
  read -a strarr <<< "$1" #split a string based on the delimiter ':' 
  IFS=" "
  
  host=${strarr[0]}
  port=${strarr[1]}
  tout=${strarr[2]}

  if [ ! -z $tout ];then tmout=$tout;else tmout=$time_out;fi
  echo "Checking if $host:$port responds... (Timeout $tmout seconds)"

  i=0
  success=0
  while [[ $i -lt $tmout ]]
  do
    ((i=i+1))

    # echo . # Print Dots

    result=$(timeout $retry_interval nc -z $host $port 2>&1 )
    exit_code=$?
    
    #If success exit
    if [[ $exit_code -eq 0 ]]
    then
      echo "connection succesfull $host:$port"
      success=1 
      break
    fi

    # If timeout occurs do not sleep 
    if [[ $exit_code -ne 124 ]]
    then
      sleep $retry_interval
    fi
  done
  if [[ $success -eq 1 ]]
  then
    shift 1
  else
    echo "connection failed $host:$port within $tmout seconds."
    exit 1
  fi

done


