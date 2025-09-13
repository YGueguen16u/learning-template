# EFS

http://github.com/ExamProCo/AWS-Examples/tree/main/efs/basic


## Setting UP

```sh
sudo yum install -y amazon-efs-utils
sudo mkdir /mnt/efs
```

## Mounting

```sh
sudo mount -t efs -o tls fs-0bf948f125e97f2d2:/ /mnt/efs
```

## deploy

```sh
#!/usr/bin/env bash

echo "== deploy ec2 instance"

STACK_NAME="aws-efs-basic"

# https://awscli.amazonaws.com/v2/documentation/api/latest/reference/cloudformation/deploy/index.html
aws cloudformation deploy \
--template-file template.yaml \
--capabilities CAPABILITY_NAMED_IAM \
--no-execute-changeset \
--region ca-central-1 \
--stack-name $STACK_NAME
```

## template.yaml

```yaml
AWSTemplateFormatVersion: "2010-09-09"
Parameters:
  InstanceType:
    Type: String
    Default: t3.micro
  VpcId:
    Type: String
    Default: vpc-08f0ec02f7471b018
  ImageId:
    Type: String
    # ca-central-1 AMI
    Default: ami-07413789aae50b0e0
  SubnetId:
    Type: String
    Default: subnet-0e0fd31733061237d
Resources:
  FileSystem:
    # https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-efs-filesystem.html
    Type: 'AWS::EFS::FileSystem'
    Properties:
      BackupPolicy:
        Status: DISABLED
      PerformanceMode: generalPurpose
      Encrypted: true
      #FileSystemPolicy:
      #  Version: "2012-10-17"
      #  Statement:
      #    - Effect: "Allow"
      #      Action:
      #        - "elasticfilesystem:ClientMount"
      #      Principal:
      #          AWS: 'arn:aws:iam::111122223333:role/EfsReadOnly'

  MountTarget: 
    # https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-efs-mounttarget.html
    Type: AWS::EFS::MountTarget
    Properties: 
      FileSystemId: !Ref FileSystem
      SubnetId: !Ref SubnetId
      SecurityGroups:
        - !GetAtt SG.GroupId
  # https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-efs-accesspoint.html
  SG:
    Type: AWS::EC2::SecurityGroup
    Properties:
      GroupDescription: Allow http to client host
      VpcId: !Ref VpcId
      SecurityGroupIngress:
        - IpProtocol: -1
          FromPort: -1
          ToPort: -1
          CidrIp: 0.0.0.0/0
      SecurityGroupEgress:
        - IpProtocol: -1
          FromPort: -1
          ToPort: -1
          CidrIp: 0.0.0.0/0
```
