#!/bin/bash
commit_hash=$(git ls-remote $1 $2 | cut -f 1)

if [[ -z "$commit_hash" ]] 
then
  echo
  echo "Error : could not fetch commit hash "
  echo "Repository : $1"
  echo "Branch : $2"
  echo

  exit 1
fi

echo $commit_hash
