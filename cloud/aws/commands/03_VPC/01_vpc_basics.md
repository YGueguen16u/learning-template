
# AWS VPC Basics Lab Notes

## Introduction

In this lab, we will explore the basics of Amazon Virtual Private Cloud (VPC) by creating and managing VPCs using both the AWS Management Console and the AWS CLI. We will cover the creation of VPCs, subnets, route tables, and internet gateways. We will also learn how to manage and delete these resources.

## Prerequisites

- AWS Account
- AWS CLI installed and configured
- Basic understanding of networking concepts

## Step-by-Step Instructions

### Part 1: Creating a VPC Using the AWS Management Console

1.1 Log in to the AWS Management Console:

1.2 Create a New VPC:

- Click on "Create VPC."
- Choose "VPC and more" to create a VPC with all necessary components (subnets, route tables, internet gateway).
- Configure the settings:
    - Name: MyVPC
    - IPv4 CIDR block: 172.31.0.0/16
    - Subnet settings: Create a public subnet in one availability zone (AZ).
- Click "Create VPC."

1.3 Verify the Creation:

- Navigate to the "Your VPCs" section and verify that MyVPC has been created.
- Check the "Subnets" section to see the created subnet.
- Verify the "Route Tables" and "Internet Gateways" sections for the created resources.

1.4 Deleting the VPC:

- Select the VPC you created.
- Click on "Actions" and choose "Delete VPC."
- Confirm the deletion. This will remove the VPC and all associated resources.

### Part 2: Creating a VPC Using the AWS CLI

2.1 Open your Terminal:

- Ensure that your AWS CLI is configured properly.

2.2 Create a VPC:

```sh
VPC_ID=$(aws ec2 create-vpc \
--cidr-block 172.31.0.0/16 \
--tag-specifications 'ResourceType=vpc,Tags=[{Key=Name,Value=MyVPC}]' \
--query 'Vpc.VpcId' \
--output text)
echo "Created VPC with ID: $VPC_ID"
```

2.3 Enable DNS Hostnames:

```sh
aws ec2 modify-vpc-attribute \
--vpc-id $VPC_ID \
--enable-dns-hostnames "{\"Value\":true}"
```

2.4 Create an Internet Gateway (IGW):

```sh
IGW_ID=$(aws ec2 create-internet-gateway \
--query 'InternetGateway.InternetGatewayId' \
--output text)

echo "Created IGW with ID: $IGW_ID"

aws ec2 attach-internet-gateway s\
--vpc-id $VPC_ID \
--internet-gateway-id $IGW_ID
```

2.5 Create a Subnet:

```sh
SUBNET_ID=$(aws ec2 create-subnet \
--vpc-id $VPC_ID \
--cidr-block 172.31.1.0/24 \
--availability-zone <your-availability-zone> \
--query 'Subnet.SubnetId' \
--output text)
echo "Created Subnet with ID: $SUBNET_ID"
```

2.6 Enable Auto-assign Public IP on Subnet:

```sh
aws ec2 modify-subnet-attribute \
--subnet-id $SUBNET_ID \
--map-public-ip-on-launch
```

2.7 Create a Route Table and Associate Subnet:

```sh
RT_ID=$(aws ec2 describe-route-tables \
--filters "Name=vpc-id,Values=$VPC_ID" "Name=association.main,Values=true" \
--query 'RouteTables[0].RouteTableId' \
--output text)
echo "Default Route Table ID: $RT_ID"

ASSOCIATION_ID=$(aws ec2 associate-route-table \
--route-table-id $RT_ID \
--subnet-id $SUBNET_ID \
--query 'AssociationId' \
--output text)
echo "Associated Route Table with ID: $ASSOCIATION_ID"
```

2.8 Create a Route to the Internet Gateway:

```sh
aws ec2 create-route \
--route-table-id $RT_ID \
--destination-cidr-block 0.0.0.0/0 \
--gateway-id $IGW_ID
```

2.9 Verification:

List the created VPC, Subnet, Route Table, and IGW to verify their existence and associations.

```sh
aws ec2 describe-vpcs --vpc-ids $VPC_ID
aws ec2 describe-subnets --subnet-ids $SUBNET_ID
aws ec2 describe-route-tables --route-table-ids $RT_ID
aws ec2 describe-internet-gateways --internet-gateway-ids $IGW_ID
```

2.10 Deleting the VPC and Associated Resources:

Create a script delete_vpc.sh with the following content:

```sh
#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: delete_vpc <VPC_ID> <IGW_ID> <SUBNET_ID> <RT_ID> <ASSOC_ID>"
  exit 1
fi

VPC_ID=$1
IGW_ID=$2
SUBNET_ID=$3
RT_ID=$4
ASSOC_ID=$5

echo "Detaching Internet Gateway"
aws ec2 detach-internet-gateway \
--internet-gateway-id $IGW_ID \
--vpc-id $VPC_ID

echo "Deleting Internet Gateway"
aws ec2 delete-internet-gateway \
--internet-gateway-id $IGW_ID

echo "Disassociating Route Table"
aws ec2 disassociate-route-table \
--association-id $ASSOC_ID

echo "Deleting Subnet"
aws ec2 delete-subnet \
--subnet-id $SUBNET_ID

echo "Deleting Route Table"
aws ec2 delete-route-table \
--route-table-id $RT_ID

echo "Deleting VPC"
aws ec2 delete-vpc \
--vpc-id $VPC_ID

echo "VPC Deletion Completed"
```

Run the script with appropriate IDs:

```sh
./delete_vpc.sh $VPC_ID $IGW_ID $SUBNET_ID $RT_ID $ASSOC_ID
```

### Conclusion

By following these steps, you will gain a comprehensive understanding of creating and managing AWS VPCs using both the AWS Management Console and the AWS CLI. Practicing these tasks repeatedly will solidify your understanding and proficiency with AWS VPCs.


The full file

```sh
#!/usr/bin/env bash

set -e

# Create our vpc

VPC_ID=$(aws ec2 create-vpc \
--cidr-block "172.1.0.0/16" \
--tag-specifications 'ResourceType=vpc,Tags=[{Key=Name,Value=my-vpc-3}]' \
--region ca-central-1  \
--query Vpc.VpcId \
--output text)

echo "VPC_ID: $VPC_ID"

# Turn on DNS Hostnames
aws ec2 modify-vpc-attribute --vpc-id $VPC_ID --enable-dns-hostnames "{\"Value\":true}"

# create an IGW
IGW_ID=$(aws ec2 create-internet-gateway \
--query InternetGateway.InternetGatewayId \
--output text
)

echo "IGW_ID: $IGW_ID"

# attach an IGW

aws ec2 attach-internet-gateway --internet-gateway-id $IGW_ID --vpc-id $VPC_ID

# create a new subnet

SUBNET_ID=$(aws ec2 create-subnet \
--vpc-id $VPC_ID \
--cidr-block 172.1.0.0/20 \
--query Subnet.SubnetId \
--output text)

echo "SUBNET_ID: $SUBNET_ID"

## auto assign IPv4 addresses

aws ec2 modify-subnet-attribute --subnet-id $SUBNET_ID --map-public-ip-on-launch

# explicty associate subnet

RT_ID=$(aws ec2 describe-route-tables \
--filters "Name=vpc-id,Values=$VPC_ID" "Name=association.main,Values=true" \
--query "RouteTables[].RouteTableId[]" \
--output text)

echo "RT_ID: $RT_ID"

ASSOC_ID=$(aws ec2 associate-route-table \
--route-table-id $RT_ID \
--subnet-id $SUBNET_ID \
--query AssociationId \
--output text)

echo "ASSOC_ID: $ASSOC_ID"

# add a route for our RT to our IGW

aws ec2 create-route \
--route-table-id $RT_ID \
--destination-cidr-block 0.0.0.0/0 \
--gateway-id $IGW_ID

# Print out delete command
echo "./delete_vpc $VPC_ID $IGW_ID $SUBNET_ID $ASSOC_ID $RT_ID"
```
