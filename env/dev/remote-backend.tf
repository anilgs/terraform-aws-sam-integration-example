terraform {
  backend "s3" {
    encrypt = true
    bucket  = "linkage-tf"
    key     = "linkage.tfstate"
    region  = "us-east-1"
    profile = "linkage-dev"
  }
}

