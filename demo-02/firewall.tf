module "firewall_cloudfront" {
  source                = "../all-modules/firewall"
  waf_name              = "cloudfront_waf"
  waf_description       = "for cloud front"
  scope                 = "CLOUDFRONT"
  resource_arn_firewall = module.cloudfront.cloudfront_arn
}

module "firewall_load_balancer" {
  source                = "../all-modules/firewall"
  waf_name              = "firewall_load_balancer"
  waf_description       = "firewall_load_balancer"
  scope                 = "REGIONAL"
  resource_arn_firewall = module.pub_lb.lb_arn
}