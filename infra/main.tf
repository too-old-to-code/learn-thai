
# Declare which provider we are using
provider "aws" {
  region = "eu-west-2"
}

# Set a variable for the name of our bucket
variable "branch_name" {
  default = "learn-the-thai-alphabet"
}

# Create a bucket, complete with bucket policy
resource "aws_s3_bucket" "react_bucket" {
  bucket = "${var.branch_name}"
  acl    = "public-read"
  force_destroy = true

  policy = <<EOF
{
  "Id": "bucket_policy_site",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "bucket_policy_site_main",
      "Action": [
        "s3:GetObject"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::${var.branch_name}/*",
      "Principal": "*"
    }
  ]
}
EOF

  website {
    index_document = "index.html"
    error_document = "index.html"
  }
}

output "website_domain" {
  value = "${aws_s3_bucket.react_bucket.website_domain}"
}

output "website_endpoint" {
  value = "${aws_s3_bucket.react_bucket.website_endpoint}"
}

output "bucket_name" {
  value = "${var.branch_name}"
}

