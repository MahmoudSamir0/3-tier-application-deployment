resource "aws_route53_zone" "cloudfront_zone" {
  name = "media.app.com"
}

resource "aws_route53_zone" "loadbalancer_zone" {
  name = "www.app.com"
}

resource "aws_route53_record" "cloudfront_record" {
  zone_id = aws_route53_zone.cloudfront_zone.id
  name    = "media.app.com"
  type    = "A"

  alias {
    name    = "${var.cloudfrontdnsname}"
    zone_id = "${var.cloudzone}"
    evaluate_target_health = false
  }
}
resource "aws_route53_record" "loadbalancer_record" {
  zone_id = aws_route53_zone.loadbalancer_zone.id
  name = "www.app.com"
  type    = "A"

 alias {
    name                   = "${var.loadbalancerdnsname}"
    zone_id                = "${var.lb_zone_id}"
    evaluate_target_health = true
  }
  geolocation_routing_policy {
    continent = "NA"
    country   = "US"
  }
  set_identifier = "loadbalancer-record"
}