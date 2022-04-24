#!/usr/bin/env python

# (C) 2020 Bircan Bilici - MIT Licence
# This script is intended to merge identical nested kubernets sub configurations without overriding each other.

from deepmerge import Merger
from collections import OrderedDict
import argparse
import json
import operator
import sys

# Argument parser
parser = argparse.ArgumentParser(description='Merge arrays in sub configurations. Eg: { "deployment":[{},{}], "service":[{},{}]} }')
parser.add_argument('--json', type=str, default=None, help="a json objects. Note: pass json object quoted with ' ' ")
parser.add_argument('--file-out', type=str, default=None, help='Name of the file to store result.')
parser.add_argument('--input-file', type=str, default=None, help='Name of the input json file.')
parser.add_argument('--quite', type=bool, default=False, help='Suppress output to stdout.')
args = parser.parse_args()

# Sort function
def deep_sort(obj):
  if isinstance(obj, dict):
    obj = OrderedDict(sorted(obj.items()))
    for k, v in obj.items():
      if isinstance(v, dict) or isinstance(v, list):
        obj[k] = deep_sort(v)

  if isinstance(obj, list):
    for i, v in enumerate(obj):
      if isinstance(v, dict) or isinstance(v, list):
          obj[i] = deep_sort(v)
    obj = sorted(obj, key=lambda x: json.dumps(x))

  return obj

# Custom merge definitions
def merge_sets(merger, path, base, nxt):
    base |= nxt
    return base

def merge_lists(config, path, base, nxt):
  """ a list strategy to merge lists """
  for i in range(len(nxt)):
    base[i]=my_merger.merge(base[i], nxt[i])
  return base

# Custom Merger function  
my_merger = Merger(
  # pass in a list of tuple, with the
  # strategies you are looking to apply
  # to each type.
  [
      (list, [merge_lists]),
      (dict, ["merge"]),
      (set, merge_sets)
  ],
  # next, choose the fallback strategies,
  # applied to all other types:
  ["override"],
  # finally, choose the strategies in
  # the case where the types conflict:
  ["override"]
)

if not args.input_file and not args.json:
  print("Either input_file  --input-file  or --json  must be specified. run with --help for details.")
  sys.exit(1)

result = {}
try:
  if args.input_file:
    with open(args.input_file) as file:
      data = json.load(file)
  else: 
    data = json.loads(args.json)
  for config_name, merge_array in data.items():
    config_data = {}
    for item in merge_array:
      my_merger.merge(config_data, item)
    result[config_name] = config_data
  ordered_result = deep_sort(result)
  if args.file_out:
    with open(args.file_out,"w") as file:
      json.dump(ordered_result, file)
  if not args.quite:
    print(json.dumps(ordered_result))
except:
  print(sys.exc_info()[0])
  sys.exit(1)
