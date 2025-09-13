
# Share a VPC Across AWS Accounts Using Resource Access Manager (RAM)

This assumes you have two AWS accounts:

- Account A (Owner) – where the VPC is created and shared
- Account B (Participant) – where resources (e.g., EC2) are deployed into the shared VPC

## Prerequisites

- Two AWS accounts in the same region
- Proper IAM permissions to create VPCs, subnets, EC2 instances, and RAM shares
- CLI access configured for both accounts (optional)
- Region: ca-central-1 (or any one region)

## Step 1: Create a VPC in Account A

1. Sign into the AWS Management Console of Account A
2. Go to VPC > Your VPCs
3. Delete any test VPCs you previously created if necessary
4. Click Create VPC
5. Click Create VPC

## Step 2: Create a Subnet in the VPC (Required to Share)
1. Go to VPC > Subnets
2. Click Create Subnet
3. Click Create subnet

## Step 3: Share the Subnet Using AWS RAM
1. Go to Resource Access Manager (RAM) in Account A
2. Click Create a resource share
3. Under Resources, select:
4. Under Principals, add the Account ID of Account B
5. Click Next, then Create resource share

Note: You cannot share an entire VPC directly — only its subnets.

## Step 4: Accept the Shared Resource in Account B
1. Log into Account B
2. Go to Resource Access Manager > Shared with me
3. If not automatically accepted, click Accept next to the shared resource

## Step 5: Launch an EC2 Instance in Account B Using Shared VPC
1. Go to EC2 > Launch instance
2. Name: ram-ec2-original
3. Select Amazon Linux 2 (or any free-tier image)
4. Under Network Settings:
5. Skip key pair (for test) or create one if needed
6. Launch the instance

If you try to use a security group from Account A, you will get an error like:

“The subnet belongs to another account. Specify a security group you own.”

Optional Test: Try to View the Instance from Account A
1. Go to EC2 > Instances in Account A
2. You will not see the instance from Account B, even though it was launched into a shared subnet.

AWS does not provide cross-account visibility for EC2 instances via console unless:
1. You configure cross-account IAM roles
2. Or use CloudWatch Logs/Monitoring for insights

## Step 6: Clean Up Resources
1. In both accounts:
2. Delete the VPC
3. Delete the EC2 instance
4. Delete the subnet
5. Delete the security group
6. Delete the RAM share

## Key Learnings
|Concept	|Summary
|---|---
|What is shared?|Only subnets, not full VPCs or EC2s
|Resource Access?|Only the participant account can launch into shared subnet
|Cross-account visibility?|Not allowed by default – requires IAM roles
|Billing?|Resources billed to the account that creates them
|When is this used?|For centralized networking, e.g., central VPC and decentralized workloads
