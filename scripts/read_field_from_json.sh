#!/bin/bash

# ARG_POSITIONAL_SINGLE([file],[Json filename with path              (ex: ../my_file.json)])
# ARG_OPTIONAL_SINGLE([field],[d],[Full Field name starting from root.  (ex: users.account.name)])
# ARG_HELP([This script gets field value of json object using jq])
# ARG_VERSION([echo $0 v0.1])
# ARG_DEFAULTS_POS([])
# ARGBASH_SET_INDENT([  ])
# ARGBASH_GO()

eval "$(`dirname "$0"`/argbash/bin/argbash $0 --strip all)"

# [ <-- needed because of Argbash

# ---------- START OF THE MAIN SCRIPT ----------------------------
#
# MIT Licence - (C) 2020 Bircan Bilici
#
# Requirements
# cat, jq, sed, xargs

# Arguments
file=$_arg_file
field=$_arg_field

# Command
cat $file | jq .$field | sed s/\"//g | xargs echo -n

# Explanation of Pipe Steps
#
# cat $file         - Gets content of the file
# jq .$field        - Extracts field value
# sed s/\"//g       - Removes double quotes (\")
# xargs echo -n     - Removes end of line character (\n)
#

# ---------- END OF THE MAIN SCRIPT ----------------------------
# ] <-- needed because of Argbash
