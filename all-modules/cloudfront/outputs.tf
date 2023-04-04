output "cloudfront_domain_name" {
    value = aws_cloudfront_distribution.load_balancer_distribution.domain_name
}
output "cloudfront_zone_id" {
    value = aws_cloudfront_distribution.load_balancer_distribution.hosted_zone_id
}
output "cloudfront_arn" {
    value = aws_cloudfront_distribution.load_balancer_distribution.arn
}