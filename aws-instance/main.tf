terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "leslie-test"
    workspaces {
      name = "leslie-test-workspace"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 1.0"
}

locals {
  region = "us-west-2"
}

provider "aws" {
  profile = "default"
  region  = local.region
}

resource "aws_instance" "app_server" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  tags = {
    "Name" = "ExampleAppServerInstance"
  }
}
