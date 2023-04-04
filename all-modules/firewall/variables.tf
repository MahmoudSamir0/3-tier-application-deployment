variable "waf_name" {
    type = string
    description = "Friendly name of the WebACL"
}
variable "waf_description" {
    type = string
    description = "Friendly description of the WebACL"
}
variable "scope" {
    type = string
    description = "scope ( Specifies whether this is for an AWS CloudFront distribution or for a regional application. Valid values are CLOUDFRONT or REGIONAL. To work with CloudFront, you must also specify the region us-east-1 (N. Virginia) on the AWS provider.)"
}
variable "resource_arn_firewall" {
    description = "arn for cloudfront or arn for loadbalancer"
}