#!/bin/bash
if [[ $1 != "true" ]]
then
git branch | grep "*" | sed s/\*\ //g
fi