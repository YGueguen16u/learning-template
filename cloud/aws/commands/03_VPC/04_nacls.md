https://github.com/ExamProCo/AWS-Examples/blob/main/vpc/nacl/Readme.md

## Create NACL

```sh
aws ec2 create-network-acl --vpc-id vpc-03181823a2da0addd
```

## Add entry

```sh
aws ec2 create-network-acl-entry \
--network-acl-id acl-02def3052778d5ce2 \
--ingress \
--rule-number 90 \
--protocol -1 \
--port-range From=0,To=65535 \
--cidr-block 174.5.108.3/32 \
--rule-action deny
```


## Get AMI for Amazon Linux 2

Gab the latest AML2 AMI
```sh
aws ec2 describe-images \
--owners amazon \
--filters "Name=name,Values=amzn2-ami-hvm-*-x86_64-gp2" "Name=state,Values=available" \
--query "Images[?starts_with(Name, 'amzn2')]|sort_by(@, &CreationDate)[-1].ImageId" \
--region ca-central-1 \
 --output text
```

## template.yaml

```yaml
AWSTemplateFormatVersion: "2010-09-09"
Description: Launch a simple EC2 for use with testing VPCs
Parameters:
  InstanceType:
    Type: String
    Default: t2.micro
  VpcId:
    Type: String
    Default: vpc-03181823a2da0addd
  ImageId:
    Type: String
    Default: ami-003c24b59bb839e19
  SubnetId:
    Type: String
    Default: subnet-0584791a9829bc51c
Resources:
  SSMRole:
    Type: AWS::IAM::Role
    Properties:
      AssumeRolePolicyDocument:
        Version: '2012-10-17'
        Statement:
          - Effect: Allow
            Principal:
              Service: ec2.amazonaws.com
            Action: sts:AssumeRole
      ManagedPolicyArns:
        - arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore
  EC2InstanceProfile:
    Type: AWS::IAM::InstanceProfile
    Properties:
      Roles:
        - !Ref SSMRole
  MyEC2Instance: 
    Type: AWS::EC2::Instance
    Properties: 
      IamInstanceProfile: !Ref EC2InstanceProfile
      InstanceType: !Ref InstanceType
      ImageId: !Ref ImageId
      #SubnetId: !Ref SubnetId
      #SecurityGroupIds:
      #  - !GetAtt SG.GroupId
      NetworkInterfaces:
        - DeviceIndex: 0
          SubnetId: !Ref SubnetId
          AssociatePublicIpAddress: true
          GroupSet:
            - !GetAtt SG.GroupId
          DeleteOnTermination: true
      UserData:
        Fn::Base64: |
          #!/bin/bash
          yum update -y
          yum install -y httpd
          systemctl start httpd
          systemctl enable httpd
          echo "<html><body><h1>Hello from Apache on Amazon Linux 2!</h1></body></html>" > /var/www/html/index.html
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
