#!/bin/bash
set -e
cd aws/live
pwd
terragrunt run-all apply $@
