# TERRAFORM_02_MULTI_REGION_MUMBAI_VIRGINIA

## Project Overview

This Terraform project demonstrates how to provision AWS resources in multiple regions using provider aliases. The example uses Mumbai and N. Virginia regions.

## Regions Used

| Region Name | AWS Region Code |
| --- | --- |
| Mumbai | `ap-south-1` |
| N. Virginia | `us-east-1` |

## What This Project Creates

- AWS resources in Mumbai
- AWS resources in N. Virginia
- Multiple AWS provider configurations
- Region-specific resource deployment

## Technologies Used

| Technology | Purpose |
| --- | --- |
| Terraform | Infrastructure as Code |
| AWS Provider Alias | Multi-region deployment |
| AWS EC2 | Demo compute resource |

## Recommended Files

```text
TERRAFORM_02_MULTI_REGION_MUMBAI_VIRGINIA/
├── provider.tf
├── main.tf
├── variables.tf
├── outputs.tf
└── README.md
```

## Provider Alias Concept

Terraform can manage multiple AWS regions in the same project by using provider aliases.

Example:

```hcl
provider "aws" {
  region = "ap-south-1"
}

provider "aws" {
  alias  = "virginia"
  region = "us-east-1"
}
```

Resources can then use a specific provider:

```hcl
provider = aws.virginia
```

## Prerequisites

- AWS account
- Terraform installed
- AWS CLI configured
- AMI IDs available for both regions

## Terraform Commands

```bash
terraform init
terraform validate
terraform plan
terraform apply
```

Type `yes` when prompted.

## Destroy Resources

```bash
terraform destroy
```

## Expected Output

The deployment should create resources in both:

- Mumbai region
- N. Virginia region

## Important Notes

- AMI IDs are region-specific.
- A Mumbai AMI ID will not work in N. Virginia.
- Confirm your AWS account has access to both regions.
- Destroy all resources after testing to avoid charges.

