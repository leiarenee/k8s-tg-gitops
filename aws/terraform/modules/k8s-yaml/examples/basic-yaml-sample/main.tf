provider "kubernetes" {

}

locals {
  appConfig = merge (
    {
      test-app = {
        k8s = {
          deployment = yamldecode(file("deployment.yml"))
          service = yamldecode(file("service.yml"))
        }
      } 
    }
  )
}

module "k8s_yaml_tf" {
  source = "github.com/brcnblc/k8s-terraform-yaml" 
  appConfig = local.appConfig
}
