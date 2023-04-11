module "cloudfront" {
  source                    = "../all-modules/cloudfront"
  load_balancer_domain_name = module.pub_lb.lb_dns
  load_balancer_id          = module.pub_lb.lb_id
  firewall_id               = module.firewall_cloudfront.waf_id
}