output "waf-arn" {
    value = aws_wafv2_web_acl.firewall.arn
}
output "war-domain" {
    value = aws_wafv2_web_acl.firewall.name
}
output "waf_id" {
    value = aws_wafv2_web_acl.firewall.id
}