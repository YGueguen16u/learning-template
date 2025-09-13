# DMS

https://github.com/ExamProCo/AWS-Examples/tree/main/dms/serverless


# Install MySQL and PSQL Client

```sh
sudo apt-get install -y postgresql-client 
sudo apt-get install -y mysql-client 
```

## Assemble PSQL Connection String

```sh
postgresql://postgres:password@<hostname>:3306/mydatabase
```

## Assemble MySQL Connection String

```sh
mysql://admin:password@<hostname>:5432/mydatabase
```

## Test Connection

```sh
mysql -u admin -ppassword -h database-2.ck6c4llggxsy.us-east-1.rds.amazonaws.com -P 5432 database
psql postgresql://postgres:password@rds-dms-postgres-rdsinstance-ghj0ttbqkmaf.cv1x0r3utzcm.ca-central-1.rds.amazonaws.com:3306/mydatabase

```

## data.sql

```sql
INSERT INTO example_table (name, age, salary, is_active) VALUES
('John Doe', 25, 55000.00, true),
('Jane Smith', 30, 72000.50, false),
('Alice Johnson', 22, 48000.75, true),
('Chris Lee', 28, 38000.25, true),
('Debra Morgan', 35, 64000.55, false),
('Evan Wright', 45, 50000.65, true),
('Nancy Drew', 29, 52000.85, false),
('Aaron Carter', 31, 43000.95, true),
('Patricia Holmes', 60, 69000.15, false),
('Beth Harmon', 22, 32000.55, true),
('Carl Grimes', 28, 47000.65, true),
('Donna Paulsen', 46, 65000.85, false),
('Elliot Alderson', 31, 44000.95, true),
('Fitzgerald Grant', 52, 52000.15, false),
('Ursula Buffay', 41, 53000.25, true);
```

## mysql.sql

```sql
CREATE TABLE example_table (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    salary DECIMAL(10,2),
    is_active BOOLEAN
);
```

## postgresql.sql

```sql
CREATE TABLE example_table (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    salary DECIMAL(10, 2),
    is_active BOOLEAN
);
``` 

## bin

### deploy-mysql.sh

```sh
#!/usr/bin/env bash

echo "== deploy rds"

STACK_NAME="rds-dms-mysql"

# https://awscli.amazonaws.com/v2/documentation/api/latest/reference/cloudformation/deploy/index.html
aws cloudformation deploy \
--template-file cfn/mysql.yaml \
--capabilities CAPABILITY_NAMED_IAM \
--no-execute-changeset \
--parameter-overrides VpcId="vpc-08f0ec02f7471b018" Subnets="subnet-0e0fd31733061237d,subnet-0377c6b172e2951d4,subnet-0d8058cb02f147a86" \
--region ca-central-1 \
--stack-name $STACK_NAME
```

### deploy-postgresql.sh

```sh
#!/usr/bin/env bash

echo "== deploy rds"

STACK_NAME="rds-dms-postgres"

# https://awscli.amazonaws.com/v2/documentation/api/latest/reference/cloudformation/deploy/index.html
aws cloudformation deploy \
--template-file cfn/postgres.yaml \
--capabilities CAPABILITY_NAMED_IAM \
--no-execute-changeset \
--parameter-overrides VpcId="vpc-08f0ec02f7471b018" Subnets="subnet-0e0fd31733061237d,subnet-0377c6b172e2951d4,subnet-0d8058cb02f147a86" \
--region us-east-1 \
--stack-name $STACK_NAME
```

## cfn

### mysql.yaml  

```yaml
AWSTemplateFormatVersion: 2010-09-09
Description: RDS Postgress
Parameters:
  VpcId:
    Type: String
  Username:
    Type: String
    Default: admin
  Password:
    Type: String
    Default: password
  BackupRetentionPeriod:
    Type: Number
    Default: 0
  InstanceClass:
    Type: String
    Default: db.t3.micro
  Engine:
    Type: String
    Default: mysql
  EngineVersion:
    Type: String
    Default: 8.0.35
  PubliclyAccessible:
    Type: String
    AllowedValues:
      - true
      - false
    Default: true
  DeletionProtection:
    Type: String
    AllowedValues:
      - true
      - false
    Default: false
  RdsDatabaseName:
    Type: String
    Default: "mydatabase"
  RdsPort:
    Type: Number
    Default: 3306
  Subnets:
    Type: 'List<AWS::EC2::Subnet::Id>'
    Description: A list of subnets for the Auto Scaling group    
Resources:
  DbSg:
    Type: AWS::EC2::SecurityGroup
    Properties:
      GroupDescription: !Sub "Security Group for RDS Instance"
      SecurityGroupIngress:
        - IpProtocol: tcp
          FromPort: !Ref RdsPort
          ToPort: !Ref RdsPort
          CidrIp: 0.0.0.0/0
      SecurityGroupEgress:
        - IpProtocol: -1
          FromPort: -1
          ToPort: -1
          CidrIp: 0.0.0.0/0
      VpcId: !Ref VpcId
  DBSubnetGroup:
    Type: AWS::RDS::DBSubnetGroup
    Properties:
      DBSubnetGroupDescription: "My DB Subnet Group"
      SubnetIds: !Ref Subnets

  RdsInstance:
    Type: AWS::RDS::DBInstance
    DeletionPolicy: 'Delete'
    UpdateReplacePolicy: 'Delete'
    Properties:
      MasterUsername: !Ref Username
      MasterUserPassword: !Ref Password
      DBSubnetGroupName: !Ref DBSubnetGroup
      AllocatedStorage: '20'
      AllowMajorVersionUpgrade: true
      AutoMinorVersionUpgrade: true
      # This should be turned off When using AuthIAM on the Proxy.
      Port: !Ref RdsPort
      EnableIAMDatabaseAuthentication: false
      BackupRetentionPeriod: !Ref BackupRetentionPeriod
      DBInstanceClass: !Ref InstanceClass
      DBName: !Ref RdsDatabaseName
      Engine: !Ref Engine
      DeletionProtection: !Ref DeletionProtection
      EngineVersion: !Ref EngineVersion
      PubliclyAccessible: !Ref PubliclyAccessible
      VPCSecurityGroups:
        - !GetAtt DbSg.GroupId
Outputs:
  StackName:
    Value: !Ref AWS::StackName
  RdsUsername:
    Value: !Ref Username
    Export:
      Name: !Sub ${AWS::StackName}RdsUsername
  RdsPort:
    Value: !Ref RdsPort
    Export:
      Name: !Sub ${AWS::StackName}RdsPort
  RdsDatabaseName:
    Value: !Ref RdsDatabaseName
    Export:
      Name: !Sub ${AWS::StackName}RdsDatabaseName
```

### postgres.yaml

```yaml
AWSTemplateFormatVersion: 2010-09-09
Description: RDS Postgress
Parameters:
  VpcId:
    Type: String
  Username:
    Type: String
    Default: postgres
  Password:
    Type: String
    Default: password
  BackupRetentionPeriod:
    Type: Number
    Default: 0
  InstanceClass:
    Type: String
    Default: db.t3.micro
  Engine:
    Type: String
    Default: postgres
  EngineVersion:
    Type: String
    Default: 15.4
  PubliclyAccessible:
    Type: String
    AllowedValues:
      - true
      - false
    Default: true
  DeletionProtection:
    Type: String
    AllowedValues:
      - true
      - false
    Default: false
  RdsDatabaseName:
    Type: String
    Default: "mydatabase"
  RdsPort:
    Type: Number
    Default: 5432
  Subnets:
    Type: 'List<AWS::EC2::Subnet::Id>'
    Description: A list of subnets for the Auto Scaling group    
Resources:
  DbSg:
    Type: AWS::EC2::SecurityGroup
    Properties:
      GroupDescription: !Sub "Security Group for RDS Instance"
      SecurityGroupIngress:
        - IpProtocol: tcp
          FromPort: !Ref RdsPort
          ToPort: !Ref RdsPort
          CidrIp: 0.0.0.0/0
      SecurityGroupEgress:
        - IpProtocol: -1
          FromPort: -1
          ToPort: -1
          CidrIp: 0.0.0.0/0
      VpcId: !Ref VpcId
  DBSubnetGroup:
    Type: AWS::RDS::DBSubnetGroup
    Properties:
      DBSubnetGroupDescription: "My DB Subnet Group"
      SubnetIds: !Ref Subnets

  RdsInstance:
    Type: AWS::RDS::DBInstance
    DeletionPolicy: 'Delete'
    UpdateReplacePolicy: 'Delete'
    Properties:
      MasterUsername: !Ref Username
      MasterUserPassword: !Ref Password
      DBSubnetGroupName: !Ref DBSubnetGroup
      AllocatedStorage: '20'
      AllowMajorVersionUpgrade: true
      AutoMinorVersionUpgrade: true
      # This should be turned off When using AuthIAM on the Proxy.
      Port: !Ref RdsPort
      EnableIAMDatabaseAuthentication: false
      BackupRetentionPeriod: !Ref BackupRetentionPeriod
      DBInstanceClass: !Ref InstanceClass
      DBName: !Ref RdsDatabaseName
      Engine: !Ref Engine
      DeletionProtection: !Ref DeletionProtection
      EngineVersion: !Ref EngineVersion
      PubliclyAccessible: !Ref PubliclyAccessible
      VPCSecurityGroups:
        - !GetAtt DbSg.GroupId
Outputs:
  StackName:
    Value: !Ref AWS::StackName
  RdsUsername:
    Value: !Ref Username
    Export:
      Name: !Sub ${AWS::StackName}RdsUsername
  RdsPort:
    Value: !Ref RdsPort
    Export:
      Name: !Sub ${AWS::StackName}RdsPort
  RdsDatabaseName:
    Value: !Ref RdsDatabaseName
    Export:
      Name: !Sub ${AWS::StackName}RdsDatabaseName
```





