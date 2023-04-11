module "rout53" {
  source              = "../all-modules/Route53"
  cloudfrontdnsname   = module.cloudfront.cloudfront_domain_name
  cloudzone           = module.cloudfront.cloudfront_zone_id
  loadbalancerdnsname = module.pub_lb.lb_dns
  lb_zone_id          = module.pub_lb.lb_zone
}