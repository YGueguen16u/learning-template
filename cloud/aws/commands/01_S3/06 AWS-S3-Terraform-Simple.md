- **Why Terraform?**
    
    Terraform is a popular, cloud-agnostic IaC tool—many teams choose it for multi-cloud workflows or simply for its workflow, even though AWS also offers CDK, SAM and CloudFormation.
    
- **Installing the Terraform CLI**
    
    1. In your Gitpod (or local) environment, open your config (e.g. .gitpod.yml) and add a task named terraform.
        
    2. Copy the Linux/Debian install commands from the Terraform docs into that task (adding the GPG key, downloading the package, installing).
        
    3. Restart the workspace, then verify with:
        
    

```sh
terraform --version
```

-   
    
- **Initializing Your Terraform Project**
    
    1. Create a new directory (e.g. IAC/terraform) and inside it add main.tf.
        
    2. In main.tf, declare the AWS provider:
        
    

```json
terraform {
  required_providers {
    aws = { source = "hashicorp/aws", version = "~> 5.26" }
  }
}

provider "aws" {
  region = "ca-central-1"
}
```

- 2.   
        
    3. Define an S3 bucket resource—no bucket name to let Terraform auto-generate one:
        
    

```
resource "aws_s3_bucket" "my_s3_bucket" { }
```

-   
    
- **Ignoring State & Plugin Files**
    
    Add a .gitignore to exclude:
    

```
.terraform/
terraform.tfstate*
```

- so you don’t check in large plugin binaries or sensitive state.
    
- **Deploying with Terraform**
    

```
cd IAC/terraform
terraform init    # Downloads the AWS plugin, creates .terraform/ and .tf.lock.hcl
terraform plan    # Shows the “change set”: it will create one aws_s3_bucket
terraform apply   # Prompts “yes” to actually create the bucket
```

- After apply, you’ll see a terraform.tfstate file tracking the real bucket name.
    
- **Inspecting & Destroying**
    
    - In the AWS console (S3), you’ll now find the newly created bucket.
        
    - To tear it down:
        
    

```
terraform destroy   # Prompts “yes” to delete everything in state
```

- -   
        
    - Verify in the console that the bucket is gone.
        
    
- **Key Takeaways**
    
    - Terraform stores state locally (so keep your .tfstate safe or back it up remotely).
        
    - Its plan/apply workflow is akin to CloudFormation’s change sets, but multi-cloud capable.
        
    - Always confirm destroys to avoid accidental data loss.
        
    - You can extend this setup for any AWS resources—and even provision data objects directly—but generally stick to infra (not “data”) in IaC.

https://github.com/ExamProCo/AWS-Examples/tree/main/s3/iac/terraform

main.tf
```js
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.26.0"
    }
  }
}

provider "aws" {
  # Configuration options
}
```

s3.tf
```js
resource "aws_s3_bucket" "my-s3-bucket" {
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
```

.terraform.lock.hcl
```js
# This file is maintained automatically by "terraform init".
# Manual edits may be lost in future updates.

provider "registry.terraform.io/hashicorp/aws" {
  version     = "5.26.0"
  constraints = "5.26.0"
  hashes = [
    "h1:UkBMGEScvNP+9JDzKXGrgj931LngYpIB8TBBUY+mvdg=",
    "zh:11a4062491e574c8e96b6bc7ced67b5e9338ccfa068223fc9042f9e1e7eda47a",
    "zh:4331f85aeb22223ab656d04b48337a033f44f02f685c8def604c4f8f4687d10f",
    "zh:915d6c996390736709f7ac7582cd41418463cfc07696218af6fea4a282df744a",
    "zh:9306c306dbb2e1597037c54d20b1bd5f22a9cdcdb2b2b7bad657c8230bea2298",
    "zh:93371860b9df369243219606711bfd3cfbd263db67838c06d5d5848cf47b6ede",
    "zh:98338c17764a7b9322ddb6efd3af84e6890a4a0687f846eefdfb0fa03cec892d",
    "zh:9b12af85486a96aedd8d7984b0ff811a4b42e3d88dad1a3fb4c0b580d04fa425",
    "zh:a28c9d77a5be25bac42d99418365757e4eb65a2c7c6788828263772cf2774869",
    "zh:bd9c4648a090622d6b8c3c91dad513eec81e54db3dfe940ab6d155e5f37735e5",
    "zh:bde63db136cccdeb282489e2ec2b3f9a7566edc9df27911a296352ab00832261",
    "zh:ccd33f9490ce3f2d89efab995abf3b30e75579585f6a8a5b1f756246903d3518",
    "zh:d73d1c461eb9d22833251f6533fc214cf014bc1d3165c5bfaa8ca29cd295ffb2",
    "zh:db4ffb7eec5d0e1d0dbd0d65e1a3eaa6173a3337058105aec41fd0b2af5a2b46",
    "zh:eb36b933419e9f6563330f3b7d53d4f1b09e62d27f7786d5dc6c4a2d0f6de182",
    "zh:ec85ce1976e43f7d7fa10fa191c0a85e97326a3cb22387c0ed8b74d426ec94fd",
  ]
}
```