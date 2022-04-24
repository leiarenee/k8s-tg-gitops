

locals {

  raw_appConfig = {
    (var.application_name) = {
      k8s = {
        apply = {
          folders = [
            var.source_folder 
          ]
        }
      }
    }
  }

  folder_files = {
    for app, config in local.raw_appConfig:
      app => {
        for folderName in lookup(lookup(lookup(config, "k8s", {}), "apply", {}), "folders", {}):
        folderName => regexall("(?m)^.+\\.yml$|^.+\\.yaml$", join("\n\n", fileset (folderName, "**")))
      }
  }

  add_folder_names = {
    for app, folderList in local.folder_files:
      app => {
        for folderName, fileList in folderList:
          folderName => split("," , "${folderName}/${join(",${folderName}/", fileList)}")
      }
  }
  
  split_content_folders = {
    for app, folders in local.add_folder_names:
      app => {
        for path, fileList in folders:
        path => {
          for fileName in fileList:
            fileName => split("\n---" , replace(file(fileName),"/#.+/",""))  
        }
        
      }
    }

  yaml_decode_folders = {
    for app, folders in local.split_content_folders:
      app => {
          for folderName, folderContent in folders:
            folderName => {
              for fileName, fileContent in folderContent:
                fileName => [
                  for index, sub_content in fileContent:
                  {
                    config = yamldecode(sub_content)
                    source = {
                      kind = yamldecode(sub_content).kind
                      path = "${app}:folders.${folderName}:${fileName}:${format("%02d",index)}"
                      app = app
                      folder = folderName
                      file = fileName
                      section = index
                      type = "folder"
                    }
                  }
                ]
            }
      }
  }

  serialize_yaml_decode_folders = {
    for app, folders in local.yaml_decode_folders:
      app => flatten([
      for folderName, folderContent in folders:
        flatten([
          for fileName, fileContent in folderContent:
          [
            for index, sub_content in fileContent:
            sub_content
          ]
        ])
      ])
  }

  object_map_of_serialized_yaml_decode_folders = {
    for app, dataList in local.serialize_yaml_decode_folders:
      app => {
        for index, item in dataList:
        item.source.path => item
      }
  }

  array_of_object_map_of_serialized_yaml_decode_folders = [
    for app, dataList in local.object_map_of_serialized_yaml_decode_folders:
      dataList
  ]

  key_of_configs = flatten([
    for config in local.array_of_object_map_of_serialized_yaml_decode_folders:
    [
      for key, value in config:
        key
    ]
  ])

  value_of_configs = flatten([
    for config in local.array_of_object_map_of_serialized_yaml_decode_folders:
    [
      for key, value in config:
        value
    ]
  ])

  global_map = {
    for index, key in local.key_of_configs:
      key => local.value_of_configs[index]
  }

  appConfig = {
    for app, value in local.global_map:
      app => {
        k8s = {
          ( value.source.kind != "DaemonSet" ? lower(join("_", regexall("[A-Z][a-z]+", value.source.kind))) : lower(value.source.kind) ) = value.config
          # DeamonSet does not fit into pattern
        }
      }
  }
 
 
}
  