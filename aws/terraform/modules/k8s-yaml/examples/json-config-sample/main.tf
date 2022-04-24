provider "kubernetes" {
  # Use your custom configuration here or leave it blank so that 
  # it uses your default configuration in kubeconfig file
}


module "k8s_yaml_tf" {
  #source = "github.com/brcnblc/k8s-terraform-yaml" 
  source = "../.."
  appConfig = var.appConfig
  
}