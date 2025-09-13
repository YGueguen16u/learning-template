- **Context & Goal**
    
    After exploring the AWS SDK, PowerShell scripting, and the S3 CLI (v1 vs. v2), the focus shifts to using Infrastructure as Code with AWS CloudFormation to manage S3 buckets.
    
- **Project Setup**
    
    1. In a GitHub-hosted Gitpod environment (or your preferred IDE), create a new folder named IAC.
        
    2. Inside it, add template.yaml for your CloudFormation template.
        
    
- **Building the CloudFormation Template**
    
    1. Choose YAML (more human-friendly than JSON) and start with the required top-line version header (AWSTemplateFormatVersion: '2010-09-09').
        
    2. Add a Description (“Simple S3 bucket”) and define a single AWS::S3::Bucket resource.
        
    3. Omit the BucketName so CloudFormation auto-generates a unique name.
        
    4. Copy the official AWS docs link above your resource block for easy reference.
        
    
- **Writing Deploy & Cleanup Scripts**
    
    1. Create a deploy Bash script with a shebang and a CLI call:
        
    

```
aws cloudformation deploy \
  --template-file template.yaml \
  --stack-name cfn-s3-simple \
  --region ca-central-1 \
  --no-execute-changeset
```

- 1. – This uses the consolidated deploy command, specifies stack name and region, and opts out of auto-executing the change set so you can review it first.
        
    2. Test the script: it generates a change set, which you can review in the console before executing.
        
    3. Modify the script to switch regions (e.g. us-west-2), re-run, manually execute the change set, and watch CloudFormation’s dependency-aware updates.
        
    
- **Tearing Down**
    
    1. Create a delete-stack script:
        
    

```
aws cloudformation delete-stack \
  --stack-name cfn-s3-simple \
  --region us-west-2
```

- 1.   
        
    2. Run it to remove the stack (CloudFormation will error if the bucket still contains objects).
        
    
- **Key Takeaways**
    
    - CloudFormation manages state for free and lets you review change sets before applying.
        
    - YAML templates with minimal boilerplate make it easy to spin up resources.
        
    - Using Bash scripts around the AWS CLI streamlines repetitive deploy and teardown tasks.
        
    - Always consider region settings and manual change-set approval for production-safe deployments.


https://github.com/ExamProCo/AWS-Examples/blob/main/s3/iac/cfn/template.yaml

template.yml
```yaml
AWSTemplateFormatVersion: "2010-09-09"
Description: A simple s3 bucket
Resources:
  S3Bucket:
    # https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-s3-bucket.html
    Type: 'AWS::S3::Bucket'
    # We don't need supply a Bucket Name as AWS will generate a random name for us.
```

deploy
```sh
#!/usr/bin/env bash

echo "== deploy s3 bucket via CFN"

STACK_NAME="cfn-s3-simple"

aws cloudformation deploy \
--template-file template.yaml \
--no-execute-changeset \
--region us-west-2 \
--stack-name $STACK_NAME
```

delete-stack
```sh
#!/usr/bin/env bash

echo "== delete stack for s3 bucket via CFN"

STACK_NAME="cfn-s3-simple"

aws cloudformation delete-stack \
--stack-name $STACK_NAME \
--region us-west-2
```
