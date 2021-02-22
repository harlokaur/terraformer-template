# terraformer-template
Run your terraformer scripts in a docker container

1. download saml2aws
2. Run saml2aws configure 
- select OKTA > DUO > enter AWS login url https://..okta.com/home/amazon_aws/XXXX/272 > enter your OKTA username > enter you okta password
3. RUN saml2aws login
 This should add credentials to ~/.aws/credentials file

create new directory add main.tf with contents as - 
```
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.27"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}
```
and run terraform init to install aws provider 

Lastly run 
terraformer import aws --resources=ec2 --regions=us-west-2