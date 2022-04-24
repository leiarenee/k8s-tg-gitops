#!/usr/bin/env python
import hcl2

with(open('backend.tf', 'r')) as file:
    dict = hcl2.load(file)
with(open('backend.tf', 'r')) as file:
    txt = file.readlines(1)

s = dict["terraform"][0]["backend"][0]["s3"]
f = {}
for i in sorted(s): 
  f[i] = s[i]
dict["terraform"][0]["backend"][0]["s3"]=f

result = txt[0] 
result += "terraform {\n"
result += '  backend "s3" {\n'
for key,value in f.items(): 
  k = '{:15}'.format(key)
  if f'{value[0]}' == 'True':
    result += f'    {k} = true\n'
  elif f'{value[0]}' == 'False':
    result += f'    {k} = false\n'
  else:
    result += f'    {k} = "{value[0]}"\n'
result += '  }\n'
result += '}\n'

with(open('backend.tf', 'w')) as file:
    file.write(result)
  
print(result)

    
    