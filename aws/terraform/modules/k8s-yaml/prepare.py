import json

# Globals
plural_exception_definitions = {
  "global":["container", "port", "rule", "subject", "node_selector_term", "http_header",
  "volume_mount", "option", "init_container", "metric", "toleration", "volume", "path",
  "limit", "volume_claim_template", "webhook"]
}

explicit_exception_definitions = {
  "global":{}
}


computed_exception_definitions = {
  "global": ["container.resources.limits","container.resources.requests"]
}

max_item_exception_definitions = {
  "global": ["label_selector"]
}

tab = ' ' * 2

# Read json
def import_file(json_file):

  with open(json_file, 'r') as file:
    data = file.read()

  obj = json.loads(data)

  return obj

def convert_to_camel_case(str):
  arr = str.split('_')
  res= []
  cnt = 0
  for n in arr:
    if cnt != 0:
      res.append(n[0].upper() + n[1:])
    else:
      res.append(n)
    cnt += 1
    a=0
  return "".join(res)

def write_file(file_name, txt, mode):
  global level
  with open(file_name, mode) as file:
    file.writelines(txt)

  return

def process_block(data, parent='each', file_name='', plural_exceptions=[], computed_exceptions=[], max_item_exceptions=[], explicit_exceptions=[], objpath="",debug=False, verbose=2, resource_name='',resource_short_name='',long_out=False):
  global level
  block= nesting_mode= version= attributes= block_types= min_items= max_items= None
  

  # Extract sub data
  if 'block'        in data: block        = data['block']
  if 'attributes'   in data: attributes   = data['attributes']
  if 'block_types'  in data: block_types  = data['block_types']

  #Process Block
  if block:
    process_block(
      data= block, 
      parent= parent, 
      file_name= file_name,
      plural_exceptions= plural_exceptions,
      computed_exceptions= computed_exceptions,
      max_item_exceptions= max_item_exceptions,
      explicit_exceptions = explicit_exceptions,
      objpath= objpath,
      debug= debug,
      verbose= verbose,
      resource_name= resource_name,
      resource_short_name= resource_short_name,
      long_out = long_out
      )
  
  # Process Attributes
  if attributes:   
    o = objpath.split(".")
    o.pop(0)
    op = ".0.".join(o)
    op += ".0."
    _objpath = "_".join(o)
    computed_exits=False
    if objpath and long_out:
      for key, value in attributes.items():
        if 'computed' in value:
          txt = f'        {_objpath} = {{\n'
          write_file('k8s.outputs.tf', txt, 'a')
          computed_exits=True
          break

    #res = OrderedDict(sorted(attributes.items(), key = lambda x: getitem(x[1], 'optional'))) 
    for key, value in attributes.items():
      type= description= required= optional= computed= sensitive= None
      if 'type' in value: type  = value['type']
      if 'description' in value: description  = value['description']
      if 'required' in value: required  = value['required']
      if 'optional' in value: optional  = value['optional']
      if 'computed' in value: computed  = value['computed']
      if 'sensitive' in value: sensitive  = value['sensitive']
      if verbose > 2:
        print (f' Attribute: {objpath}.{key}')

      discard_computed = False
      for comp in computed_exceptions:
        if objpath.find(comp) >= 0:
          discard_computed = True
      if not computed or discard_computed or optional or required:
        if key == "id":continue
        txt = ""
        if key != "namespace":
          if key in explicit_exceptions:
            txt +=  (level * tab) + f'{key} = lookup({parent}.value,, "{explicit_exceptions[key]}", null)' + f'\n'
          else:
            txt += ( level * tab ) + f'{key} = lookup({parent}.value, "{convert_to_camel_case(key).replace("Ip","IP").replace("IPc","IPC")}", null)' + f'\n' 
        else:
          txt += ( level * tab ) + f'{key} = var.namespace != "" ? var.namespace : lookup({parent}.value, "{convert_to_camel_case(key)}", null)' + f'\n' 
        txt += ( level * tab ) + f'# Type: {type} {"Required" if required else ""}  {"Optional" if optional else ""} {"Computed" if computed else ""} {"Sensitive" if sensitive else ""}' + f'\n' 
        if description:
          pass
          # txt += ( level * tab ) + '# ' + f'\n{( level * tab )}# '.join(description.replace("\n\n","\n").split("\n")) + f'\n'
        txt += f'\n'
        write_file(file_name, txt, 'a')

      if computed and long_out:
        txt = f'{"  " if objpath else ""}        {convert_to_camel_case(key)} = try({resource_name}.instance[app]{("." + op) if objpath else ""}{"." if not objpath else ""}{key},null)\n'
        if description:
          pass
          # txt +=  f'{"  " if objpath else ""}        # {description}\n'
          # txt += f'\n'
        write_file('k8s.outputs.tf', txt, 'a')

      


    if objpath and computed_exits and long_out:
      txt = f'        }}\n'
      txt += f'\n'
      write_file('k8s.outputs.tf', txt, 'a')

  if block_types:
    for key, value in block_types.items():
      
      nesting_mode= version= min_items= max_items= None
      if 'min_items'    in value: min_items    = value['min_items']
      if 'max_items'    in value: max_items    = value['max_items']
      if 'nesting_mode' in value: nesting_mode = value['nesting_mode']
      if 'version'      in value: version      = value['version']
      
      # Print 
      if verbose > 1:
        print(f'Block:      {objpath}.{key}')

      txt= ""
      btxt = f'{"Version : " + version + "  " if version else "" }{"Nesting Mode: " + nesting_mode + "  " if nesting_mode else "" }{"Min Items : " + str(min_items) + "  " if min_items else "" }{"Max Items : " + str(max_items) + "  " if max_items else ""}' 
      txt += (level * tab) + f'dynamic "{key}" {{' + (" # " + btxt) + f'\n'
      level += 1

      if nesting_mode == "list" and not max_items and not (key in max_item_exceptions):
        if key in explicit_exceptions:
          txt +=  (level * tab) + f'for_each = lookup({parent}.value, "{explicit_exceptions[key]}", {{}})' + f'\n'
        else:  
          txt +=  (level * tab) + f'for_each = lookup({parent}.value, "{convert_to_camel_case(key)}{"s" if key in plural_exceptions else ""}", {{}})' + f'\n'
      else:
        txt +=  (level * tab) + f'for_each = contains(keys({parent}.value), "{convert_to_camel_case(key)}") ? {{item = {parent}.value["{convert_to_camel_case(key)}"]}} : {{}}' + f'\n'
      
      txt += f'\n'
      txt +=  (level * tab) +  f'content {{' + f'\n'
      level += 1
      if txt != "": write_file(file_name, txt, 'a')
      
      # Call Recursively
      process_block (
        data= value, 
        parent= key, 
        file_name= file_name,
        plural_exceptions=plural_exceptions,
        computed_exceptions=computed_exceptions,
        max_item_exceptions=max_item_exceptions,
        explicit_exceptions=explicit_exceptions,
        objpath=objpath + "." + key, 
        debug= debug, 
        verbose= verbose,
        resource_name=resource_name,
        resource_short_name= resource_short_name,
        long_out = long_out
        )

      level -= 1
      txt =  (level * tab) + f'}}' + f'\n'
      level -= 1
      txt +=  (level * tab) + f'}}' + f'\n'
      txt += f'\n'
      if txt != "": write_file(file_name, txt, 'a')

  return

def process_json(json_file = 'provider.json', filter=[], debug=False, verbose=1, config_var="appConfig", long_out=False):
  global level, tab
  global plural_exception_definitions, computed_exception_definitions, max_item_exception_definitions, explicit_exception_definitions
  
  
  data = import_file(json_file)
  provider_schemas = data['provider_schemas']
  kubernetes = provider_schemas['registry.terraform.io/hashicorp/kubernetes']
  provider = kubernetes['provider']
  resource_schemas = kubernetes['resource_schemas']
  data_source_schemas = kubernetes['data_source_schemas']
  
  # Locals
  txt =  f'locals {{\n'
  write_file('locals.tf', txt, 'w')

  # Outputs
  txt = ""
  if long_out:
    txt = f'output "output" {{\n'
    txt += f'value = {{\n'
  
    txt += f'  for app, config in var.appConfig:\n'
    txt += f'    app => {{\n'
  write_file('k8s.outputs.tf', txt, 'w')

  for resource_name, resource_schema in resource_schemas.items():
    
    rn = resource_name.split('_')
    rn.pop(0)
    resource_short_name = '_'.join(rn)
    if len(filter) > 0 and resource_short_name not in filter: continue
    
    # Resource file
    txt = f'resource "{resource_name}" "instance" {{ \n'
    level = 1
    txt += (level * tab) + f'depends_on = [null_resource.module_depends_on]\n'
    #txt += (level * tab) + f'lifecycle {{\n' 
    #txt += (level * tab) + f'{tab}ignore_changes = all\n'
    #txt += (level * tab) + f'{tab }}}\n'
    txt += (level * tab) + f'for_each = local.{resource_short_name}.applications\n'
    txt += f'\n'
    output_file = f'k8s.{resource_short_name}.tf'
    write_file(output_file, txt, 'w')

    # Output File
    if long_out:
      txt = f'      {resource_short_name} = contains(keys(local.{resource_short_name}.applications), app) ? {{\n'
      write_file('k8s.outputs.tf', txt, 'a')

    if verbose > 0:
      print (f'Processing {resource_name}...\n')

    # Plural Exceptions
    global_plural_exceptions = plural_exception_definitions["global"] if "global" in plural_exception_definitions else []
    local_plural_exceptions = plural_exception_definitions[resource_short_name] if resource_short_name in plural_exception_definitions else []
    plural_exceptions = global_plural_exceptions + local_plural_exceptions

    # Explicit Exceptions
    global_explicit_exceptions = explicit_exception_definitions["global"] if "global" in explicit_exception_definitions else {}
    local_explicit_exceptions = explicit_exception_definitions[resource_short_name] if resource_short_name in explicit_exception_definitions else {}
    explicit_exceptions = {**global_explicit_exceptions, **local_explicit_exceptions}

    # Computed Exceptions
    global_computed_exceptions = computed_exception_definitions["global"] if "global" in computed_exception_definitions else []
    local_computed_exceptions = computed_exception_definitions[resource_short_name] if resource_short_name in computed_exception_definitions else []
    computed_exceptions = global_computed_exceptions + local_computed_exceptions

    # Plural Exceptions
    global_max_item_exceptions = max_item_exception_definitions["global"] if "global" in max_item_exception_definitions else []
    local_max_item_exceptions = max_item_exception_definitions[resource_short_name] if resource_short_name in max_item_exception_definitions else []
    max_item_exceptions = global_max_item_exceptions + local_max_item_exceptions
    
    process_block(
      data= resource_schema, 
      parent= 'each', 
      file_name = output_file, 
      plural_exceptions = plural_exceptions,
      computed_exceptions = computed_exceptions,
      max_item_exceptions = max_item_exceptions,
      explicit_exceptions = explicit_exceptions,
      objpath = "", 
      debug = debug,
      verbose = verbose,
      resource_name=resource_name,
      resource_short_name = resource_short_name,
      long_out = long_out
      )
    
    write_file(output_file, f'\n}}', 'a')

    # locals
    txt  = f'  {resource_short_name} = {{\n'
    txt += f'    applications = {{\n'
    txt += f'      for key, value in var.{config_var} :\n' 
    txt += f'        key => lookup(lookup(value, "k8s", {{}}), "{resource_short_name}", null)\n'
    txt += f'        if contains(keys(lookup(value, "k8s", {{}})), "{resource_short_name}") && var.module_enabled && !lookup(lookup(value, "k8s", {{}}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {{}}), "{resource_short_name}", {{}}), "disabled", false)\n'
    txt += f'    }}\n'
    txt += f'  }}\n'
    txt += f'\n'
    write_file('locals.tf', txt, 'a')

    # Outputs
    if long_out:
      txt = f'      }} : null\n'
      txt += f'\n'
      write_file('k8s.outputs.tf', txt, 'a')

  # Locals
  txt = f'}}'
  write_file('locals.tf', txt, 'a')

  # Outputs
  if long_out:
    txt  = f'      }}\n'
    txt += f'  }}\n'
    txt += f'}}\n'
    write_file('k8s.outputs.tf', txt, 'a')

  return 

process_json(
  json_file = 'provider.json',  
  config_var = "appConfig",
  filter = [],
  debug = False,
  verbose = 1,
  long_out = True
  )



