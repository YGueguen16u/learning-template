# Types of Policy

https://github.com/ExamProCo/AWS-Examples/blob/main/iam/type-of-policies

## Convert to json

The command
```sh
yq -o json policy.yml > policy.json
```

The bash script

```sh
./convert
```

# Create  IAM Policy

```sh
aws iam create-policy \
--policy-name my-fun-policy \
--policy-document file://policy.json
```

# Attach Policy to user

```sh
aws iam attach-user-policy \
--policy-arn arn:aws:iam::982383527471:policy/my-fun-policy  \
--user-name aws-examples
```


## template.yaml

```yaml
Resources:
  MyUser:
    # https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-user.html#aws-resource-iam-user-return-values
    Type: AWS::IAM::User
    Properties:
      #UsernName: 'my-cool-user'
      ManagedPolicyArns:
        - arn:aws:iam::aws:policy/job-function/ViewOnlyAccess
      Policies:
        - PolicyName: MyCoolPolicy
          PolicyDocument:
            Version: 2012-10-17
            Statement:
                - Sid: IamListAccess
                  Effect: Allow
                  Action:
                  - 'iam:ListRoles'
                  - 'iam:ListUsers'
                  Resource: '*'
  MyInlinePolicy:
    # https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-user.html#cfn-iam-user-policies
    Type: 'AWS::IAM::Policy'
    Properties:
      PolicyName: MyInlinePolicy
      PolicyDocument:
        Version: "2012-10-17"
        Statement:
          - Effect: Allow
            Action: 'ec2:*'
            Resource: '*'
      Users:
        - !Ref MyUser
  MySecondInlinePolicy:
    # https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-userpolicy.html
    Type: 'AWS::IAM::UserPolicy'
    Properties:
      PolicyName: MySecondInlinePolicy
      UserName: !Ref MyUser
      PolicyDocument:
        Version: "2012-10-17"
        Statement:
          - Effect: Allow
            Action: 's3:*'
            Resource: '*'
```