module "ecs" {
    source = "./modules/ecs"

    prefix                = var.prefix
    region                = var.region
    vpc_id                = module.vpc.vpc_id
    private_subnet_ids    = module.vpc.private_subnets
    alb_target_group_arn  = module.ecs.alb_target_group_arn
    alb_security_group_id = module.ecs.alb_security_group_id
    
}