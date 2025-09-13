Here’s a concise English summary of the eTag demo with Terraform:

- **Context & Goal**
    
    Use Terraform to create an S3 bucket and object, then show how eTags let you detect—and manage—updates to the object’s contents.
    
- **Project Setup**
    
    1. In your IaC repo (e.g. adus-examples), create a new folder called e-tags.
        
    2. Inside it, add main.tf and ensure your AWS credentials are loaded via environment variables (or configured profile).
        
    
- **Terraform Configuration**
    

```json
terraform {
  required_providers {
    aws = { source = "hashicorp/aws", version = "~> 5.30" }
  }
}

provider "aws" {
  region = "ca-central-1"
}

resource "aws_s3_bucket" "default" { }

resource "aws_s3_object" "file" {
  bucket      = aws_s3_bucket.default.id
  key         = "myfile.txt"
  source      = "myfile.txt"
  # etag_file = "myfile.txt"   # uncomment to track changes
}
```

- No bucket name → Terraform auto-generates one.
        
- The object resource points to a local myfile.txt containing e.g. “Hello Mars”.
        
    
- **Initial Apply & Inspection**
    
    1. terraform init pulls down the AWS provider.
        
    2. terraform plan → shows you’ll create both bucket and object.
        
    3. terraform apply → uploads the file; you can list it (aws s3 ls) and aws s3 cp ```s3://<bucket>/myfile.txt``` - to cat its contents.
        
    
- **Detecting Updates with eTags**
    
    - Simply changing myfile.txt (e.g. to “Hello World”) won’t trigger Terraform to update the object, because it doesn’t know the contents changed.
        
    - **Solution:** add the etag_file = "myfile.txt" argument. Terraform will compute the MD5 checksum as the object’s eTag, so any content change updates that checksum.
        
    
- **Workflow After Adding etag_file:**
    
    1. Edit myfile.txt.
        
    2. terraform plan now sees the eTag has changed and plans an update.
        
    3. terraform apply re-uploads the new version.
        
    
- **Why Not CloudFormation?**
    
    CloudFormation doesn’t support S3 objects (only buckets), since objects are “data” rather than “infrastructure”. Terraform’s provider model lets you treat any API-manageable resource—buckets **or** objects—as code.
    
- **Cleanup**
    
    Finally, terraform destroy (with -auto-approve) tears down both the bucket and its object.

https://github.com/ExamProCo/AWS-Examples/tree/main/s3/etags
https://www.youtube.com/watch?v=f2HSU5MG6bU

main.tf
```json
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.30.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

resource "aws_s3_bucket" "default" {
}

resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.default.id
  key    = "myfile.txt"
  source = "myfile.txt"

  etag = filemd5("myfile.txt")
}
```

myfile.txt
```
Hello Jupiter!
```


```json
# This file is maintained automatically by "terraform init".
# Manual edits may be lost in future updates.

provider "registry.terraform.io/hashicorp/aws" {
  version     = "5.30.0"
  constraints = "5.30.0"
  hashes = [
    "h1:TZjoFKWi4v7ofVf52OvajTejB1Uhe9Gl4ZU9YuIOzbs=",
    "zh:0ac576f2278c6d3fead05fbb136df87e399ec065edeef56c054fa2f3ac465390",
    "zh:1ef592d293cac2f35c37c4d23cb5f9e8b34713e24585cedaf5874d024712d9fd",
    "zh:21d8412d5cec5e7e9a2199089d95287c5882f4db0e3b820e4f7760242bfa83b2",
    "zh:29bcc5616d579cd389b9c43a1922e7eafe68c8ca1b0f13e91b9e0a38d59c8b89",
    "zh:3afed6c066524eccabab25ba83af5d2b5b46e6187968284da0cb49a01002e0e8",
    "zh:4745d71ca72a6dcf819afe8065fcd8883c8434cdcfcfdc9ab3a4722fd611b437",
    "zh:486701b188b4a6a656a3f23b704dc53f4766164c23368542de36622f28b3248d",
    "zh:56cd5846b35cd405f63cf33b1fdfe6e99ff19f893aaacedc6e9245c563397173",
    "zh:5d1d4806c15c49755c8e73dd590471c43ae84a3ded8c54b0e397ad6336fba6e5",
    "zh:7df03941001c14ce255a6f4f5c2edd275fb45a9d7cd316229eef6558f79c0149",
    "zh:9b12af85486a96aedd8d7984b0ff811a4b42e3d88dad1a3fb4c0b580d04fa425",
    "zh:b0c1732d3a32630bc17d8da29662b16e346b1739ff72273e6169f9f5a968cb82",
    "zh:ce9888a63f6a6a8786499fa3e2350b13f6b87410561122799871d50a3cf07604",
    "zh:d336271de465e9ed48bce89ce97a874e3d9e2916712e3359d419c811365d75ee",
    "zh:e528275339aea59021ec810ee74220ce328181ee38f4ce6c7b1efb2db9dca56f",
  ]
}
```