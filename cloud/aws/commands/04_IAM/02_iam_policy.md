# IAM Policy

https://github.com/ExamProCo/AWS-Examples/tree/main/iam/policy

## IAM Policy Follow Along

1.1 I have read this.

- Use s3:ListAllMyBuckets in the policy for listing all buckets.
- s3:ListBucket is used for listing objects inside a specific bucket.



## AWS IAM Policies Follow-Along Lab: Types of IAM Policies

### Objective

Understand and configure different types of AWS IAM policies, including AWS managed policies, customer-managed policies, and inline policies. We'll create and attach each type of policy to a user, and use CloudFormation to automate policy configuration.

### Step 1: Set Up an IAM User

1.1. Navigate to IAM in the AWS Management Console.

1.2. Create a New User (or use an existing "test" or "junk" user).
- Name the user as needed (e.g., "lab-user").
- Access Type: Select "Programmatic access" and/or "AWS Management Console access" as required.

1.3. Attach Policies – You’ll add policies to this user during this follow-along.

### Step 2: AWS Managed Policies

AWS Managed Policies are policies created and maintained by AWS. These policies follow AWS best practices and are suitable for common use cases.

2.1. Select the User created in Step 1.

2.2. Add Permissions > Attach Policies Directly.

2.3. Choose an AWS Managed Policy:

For example, select ViewOnlyAccess if you only want the user to view resources.
Click Next, review, and then Attach Policy.

2.4. Verify that the AWS Managed Policy is attached to the user.

### Step 3: Customer-Managed Policies
Customer-Managed Policies are policies that you define yourself. These provide more flexibility as you can tailor permissions specifically to your needs.

3.1. Create a New Customer-Managed Policy:
Go to Policies in the IAM console.
Click Create Policy.

3.2. Define Policy Permissions:
Choose a service (e.g., EC2).
In the Actions section, select All EC2 actions or specify particular actions.
Under Resources, select All Resources (for this lab), or define specific resources.

3.3. Review Policy:
Click Next and name your policy (e.g., "EC2FullAccessPolicy").
Click Create Policy.

3.4. Attach the Policy to the user:
Return to IAM Users and select your user.
Click Add Permissions > Attach Policies Directly.
Search for your custom policy (e.g., "EC2FullAccessPolicy") and attach it.

### Step 4: Inline Policies
Inline Policies are embedded directly in a single user, group, or role and are not shared with other entities. Inline policies are suitable when you need specific permissions for only one user.

4.1. Add an Inline Policy:
Go to IAM Users and select your user.
Click Add Permissions > Add inline policy.

4.2. Create the Policy:
Choose JSON editor for more control.
Input JSON code, such as the following for EC2 access:

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "ec2:*",
            "Resource": "*"
        }
    ]
}
```

4.3. Name and Attach:
Name the inline policy (e.g., "EC2InlinePolicy").
Click Create Policy to attach it to the user.

### Step 5: Use CloudFormation for IAM Policies (Optional)
You can automate the creation of IAM policies with CloudFormation templates.

5.1. Create a CloudFormation Template:
Write a CloudFormation YAML file with the following template:

```yaml
Resources:
  MyUser:
    Type: "AWS::IAM::User"
    Properties:
      UserName: "lab-user"
      ManagedPolicyArns:
        - "arn:aws:iam::aws:policy/ViewOnlyAccess"

  MyCustomerPolicy:
    Type: "AWS::IAM::Policy"
    Properties:
      PolicyName: "EC2FullAccessPolicy"
      PolicyDocument:
        Version: "2012-10-17"
        Statement:
          - Effect: "Allow"
            Action: "ec2:*"
            Resource: "*"
      Users:
        - Ref: "MyUser"

  MyInlinePolicy:
    Type: "AWS::IAM::Policy"
    Properties:
      PolicyName: "EC2InlinePolicy"
      PolicyDocument:
        Version: "2012-10-17"
        Statement:
          - Effect: "Allow"
            Action: "ec2:*"
            Resource: "*"
      Users:
        - Ref: "MyUser"
```

5.2. Deploy the CloudFormation Template:
Upload the template to CloudFormation.
Go to CloudFormation > Create Stack > Upload a template file.
Select your YAML file, configure stack details, and Create Stack.

5.3. Verify that the stack deploys successfully and that all policies attach to the user as defined.

### Summary
You have now:

- Attached AWS Managed, Customer-Managed, and Inline Policies to an IAM user.
- Used CloudFormation to create and attach policies.
- Cleanup: Remove the IAM user and policies if they were only for learning.


## policy.yml

```yaml
Version: "2012-10-17"
Statement: 
  - Sid: "AccessToS3"
    Effect: "Allow"
    Action: "s3:ListBucket"
    Resource: 
      - "*"
```

## update

```sh
#!/usr/bin/env bash

#yq -o json policy.yml > policy.json

aws iam create-policy-version \
--policy-arn arn:aws:iam::982383527471:policy/my-fun-policy \
--policy-document "$(yq -o json policy.yml)" \
--set-as-default
```
