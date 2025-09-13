### Introduction

In this lab, we will go through common operations in AWS S3 using the AWS CLI. The focus will be on programmatically interacting with S3 buckets and objects using the AWS CLI instead of relying on the AWS Management Console (ClickOps). This guide covers creating, listing, uploading, downloading, and deleting buckets and objects.

### Prerequisites

- AWS CLI installed and configured with appropriate permissions.
- Basic knowledge of AWS S3 concepts.

### Step 1: Setting Up AWS CLI Environment

- 1.1
    
    Open CloudShell or Terminal
    

```
aws configure
```

- 1.2
    
    Enable Auto Prompt (Optional)
    

```
export AWS_CLI_AUTO_PROMPT=on-partial
```

### Step 2: Creating an S3 Bucket

- 2.1
    
    Create a Bucket
    

```
aws s3api create-bucket --bucket my-example-bucket-ab --region us-east-1
```

### Step 3: Listing Buckets

- 3.1
    
    List All Buckets
    

```
aws s3api list-buckets --query "Buckets[].Name"
```

### Step 4: Uploading Objects

- 4.1
    
    Upload a Single Object
    

```
aws s3 cp path/to/local/file.txt s3://my-example-bucket-ab/
```

- 4.2
    
    Upload Multiple Objects Using Sync
    

```
aws s3 sync path/to/local/directory/ s3://my-example-bucket-ab/
```

### Step 5: Downloading Objects

- 5.1
    
    Download a Single Object
    

```
aws s3 cp s3://my-example-bucket-ab/file.txt path/to/local/directory/
```

- 5.2
    
    Download Multiple Objects Using Sync
    

```
aws s3 sync s3://my-example-bucket-ab/ path/to/local/directory/
```

### Step 6: Listing Objects

- 6.1
    
    List Objects in a Bucket
    

```
aws s3api list-objects --bucket my-example-bucket-ab --query "Contents[].Key"
```

**TIP**: _Exclude Folder Names from Results_  
When listing objects, folder names end with a `/`. You can exclude these from the results by applying a JMESPath query. The command to achieve this is as follows:

```
aws s3api list-objects --bucket my-example-bucket-ab --query 'Contents[?(!ends_with(Key, `/`))].Key'
```

### Step 7: Deleting Objects

- 7.1
    
    Delete a Single Object
    
    ✋
    

```
aws s3 rm s3://my-example-bucket-ab/file.txt
```

- 7.2
    
    Delete All Objects in a Bucket Recursively
    

```
aws s3 rm s3://my-example-bucket-ab/ --recursive
```

### Step 8: Deleting Buckets

- 8.1
    
    Delete an Empty Bucket
    

```
aws s3api delete-bucket --bucket my-example-bucket-ab
```

### Step 9: Advanced Operations

- 9.1
    
    Get Object Metadata
    

```
aws s3api head-object --bucket my-example-bucket-ab --key file.txt
```

- 9.2
    
    Enable Versioning on a Bucket
    

```
aws s3api put-bucket-versioning --bucket my-example-bucket-ab --versioning-configuration Status=Enabled
```

### Conclusion

These operations cover the basic yet essential functionalities you will need when working with AWS S3 using the AWS CLI. Practice these commands to become more comfortable with managing S3 programmatically. For more advanced operations and details, refer to the [AWS CLI Command Reference](https://docs.aws.amazon.com/cli/latest/reference/s3/).