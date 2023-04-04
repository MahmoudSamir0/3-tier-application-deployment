# Define a role for ecr connection 
resource "aws_iam_role" "role" {
  name = "allow_ec2_access_ecr"
  path = "/"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}
resource "aws_iam_instance_profile" "ec2_ecr_connection" {
  name = "ec2_ecr_connection"
  role = aws_iam_role.role.name
}
# Create an iam role policy 
resource "aws_iam_role_policy" "access_ecr_policy" {
  name = "allow_ec2_access_ecr"
  role = aws_iam_role.role.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ecr:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}
# Get the current caller identity
data "aws_caller_identity" "current" {}
