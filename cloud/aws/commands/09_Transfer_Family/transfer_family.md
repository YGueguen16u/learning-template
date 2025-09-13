# Transfer Family

This lab covers setting up AWS Transfer Family with Simple Active Directory (Simple AD) for FTP access, utilizing Amazon S3 as the backend storage. It involves configuring a VPC, subnets, security groups, EC2 Windows Server, and IAM roles and policies to support the infrastructure.

## Step 1: Set Up AWS CloudShell
1.1 Open AWS CloudShell in the AWS Management Console.

1.2 Ensure you're working in the us-east-1 region, as Simple AD is not available in all regions.

1.3 Clean up existing security groups and instances if necessary.

## Step 2: Create a VPC and Subnets
2.1 Create a VPC:

```sh
aws ec2 create-vpc --cidr-block 10.0.0.0/16 --region us-east-1
```

2.2 Create two public subnets:

```sh
aws ec2 create-subnet --vpc-id <VPC_ID> --cidr-block 10.0.1.0/24 --availability-zone us-east-1a
aws ec2 create-subnet --vpc-id <VPC_ID> --cidr-block 10.0.3.0/24 --availability-zone us-east-1c
```
2.3 Create two private subnets:

```sh
aws ec2 create-subnet --vpc-id <VPC_ID> --cidr-block 10.0.2.0/24 --availability-zone us-east-1b
aws ec2 create-subnet --vpc-id <VPC_ID> --cidr-block 10.0.4.0/24 --availability-zone us-east-1d
```

2.4 Create an Internet Gateway and Attach to VPC:

```sh
aws ec2 create-internet-gateway
aws ec2 attach-internet-gateway --internet-gateway-id <IGW_ID> --vpc-id <VPC_ID>
```
2.5 Create Route Tables and Associate with Public Subnets:

```sh
aws ec2 create-route-table --vpc-id <VPC_ID>
aws ec2 create-route --route-table-id <RT_ID> --destination-cidr-block 0.0.0.0/0 --gateway-id <IGW_ID>
aws ec2 associate-route-table --subnet-id <SUBNET_ID> --route-table-id <RT_ID>
```

## Step 3: Set Up Simple Active Directory
3.1 Navigate to AWS Directory Service and choose Simple AD.

3.2 Create a Simple AD instance:

- Select Small Directory size.
- Enter a domain name (e.g., ad.exampro.co).
- Set an administrator password.
- Select the private subnets created earlier.
- Launch the directory (this takes a few minutes).

3.3 Verify that the directory is active under AWS Directory Service.

## Step 4: Launch an EC2 Windows Server and Join it to the Domain
4.1 Launch a Windows Server 2022 instance:

- Choose the T2.micro instance type.
- Use the previously created public subnet.
- Assign a public IP.
- In the IAM role, select the instance profile created for session manager.
- Enable domain join to the Simple AD.

4.2 Connect to the instance using RDP:

- Open RDP Client.
- Log in using domain credentials: ad.exampro.co\Administrator.

4.3 Install Active Directory Tools on the Windows Server:

- Open Server Manager → Add Roles and Features.
- Select Remote Server Administration Tools (RSAT) → Active Directory Users and Computers (ADUC).
- Click Install and wait for completion.

## Step 5: Create an FTP User Group and User in AD
5.1 Open Active Directory Users and Computers (ADUC).

5.2 Create a new security group:

- Right-click Users → New → Group → Name it FTPUsers.
- Set Global Scope & Security Type.

5.3 Create a new user:

- Right-click Users → New → User.
- Name: TestA, set a password.
- Uncheck "User must change password at next logon".

5.4 Add the user to FTPUsers Group:
- Double-click FTPUsers → Members → Add TestA.

## Step 6: Set Up AWS Transfer Family
6.1
Create an S3 Bucket:

```sh
aws s3api create-bucket --bucket my-ftp-bucket-unique123 --region us-east-1
```
6.2
Create an AWS Transfer Server:

```sh
aws transfer create-server --endpoint-type VPC --identity-provider-type SERVICE_MANAGED --region us-east-1
```
6.3
Associate Active Directory with AWS Transfer:

```sh
aws transfer update-server --server-id <SERVER_ID> --identity-provider-details DirectoryId=<DIRECTORY_ID>
```
6.4
Attach IAM Policy to Allow S3 Access:

```json
{
     "Version": "2012-10-17",
     "Statement": [
       {
         "Effect": "Allow",
         "Action": ["s3:ListBucket", "s3:GetObject", "s3:PutObject"],
         "Resource": ["arn:aws:s3:::my-ftp-bucket-unique123/*"]
       }
     ]
   }
```

6.5 Create a User in Transfer Family:

- Go to AWS Transfer Family.
- Click on Add User.
- Select FTPUsers SID (found via PowerShell on Windows Server).
- Assign S3 Bucket Home Directory.

## Step 7: Test FTP Connection
7.1 Install an FTP Client (e.g., FileZilla).

7.2 Connect using the provided AWS Transfer Family Endpoint:

```sh
Host: <Server_Endpoint>
Username: TestA@ad.exampro.co
Password: Testing123!
```

7.3 Upload a test file to the S3 bucket.

7.4 Verify in the S3 Console that the file is uploaded successfully.

## Step 8: Cleanup Resources
8.1 Delete the EC2 instance:

```sh
aws ec2 terminate-instances --instance-ids <INSTANCE_ID>
```

8.2 Delete the AWS Transfer Family Server:

```sh
aws transfer delete-server --server-id <SERVER_ID>
```

8.3 Delete the S3 Bucket:

```sh
aws s3 rb s3://my-ftp-bucket-unique123 --force
```

8.4 Delete Simple AD Directory:

```sh
aws ds delete-directory --directory-id <DIRECTORY_ID>
```

8.5 Delete Security Groups and IAM Policies manually.

8.6 Delete the VPC and all associated resources.

## Conclusion
By following these steps, you've successfully configured AWS Transfer Family with Simple AD for FTP access to an S3 bucket. This setup is ideal for organizations needing secure file transfers with Active Directory authentication.