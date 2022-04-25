output "vpc" {
  value = {
    vpc_id = module.vpc.vpc_id
    private_subnets = module.vpc.private_subnets
  }
}
