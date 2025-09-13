https://github.com/ExamProCo/AWS-Examples/blob/main/s3/acls/Readme.md
## Create a new bucket

```sh
aws s3api create-bucket \
--bucket acl-example-ab-5235 \
--region us-east-1
```

## Turn off Block Public Access for ACLs

```sh
aws s3api put-public-access-block \
--bucket acl-example-ab-5235 \
--public-access-block-configuration "BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=true,RestrictPublicBuckets=true"
```

```sh
aws s3api get-public-access-block \
--bucket acl-example-ab-5235
```

## Change Bucket Ownership

```sh
aws s3api put-bucket-ownership-controls \
--bucket acl-example-ab-5235 \
--ownership-controls="Rules=[{ObjectOwnership=BucketOwnerPreferred}]"
```

## Change ACLs to allow for a user in another AWS Account

```sh
aws s3api put-bucket-acl \
--bucket acl-example-ab-5235 \
--access-control-policy file:///workspace/AWS-Examples/s3/acls/policy.json
```

## Access Bucket from other account

```sh
touch bootcamp.txt
aws s3 cp bootcamp.txt s3://acl-example-ab-5235
aws s3 ls s3://acl-example-ab-5235
```

## Cleanup

```sh
aws s3 rm s3://acl-example-ab-5235/bootcamp.txt
aws s3 rb s3://acl-example-ab-5235
```

## Policy.json

```json
{
  "Grants": [
    {
      "Grantee": {
        "DisplayName": "andrewbrown",
        "ID": "e602ac4aeb23a4d25642f95dc2fbc085279cf5b30824067afbb329d7eeb49fe5",
        "Type": "CanonicalUser"
      },
      "Permission": "FULL_CONTROL"
    }
  ],
  "Owner": {
    "DisplayName": "andrewbrown",
    "ID": "74ababf54b6810c1d34431ceee560f5de666617490e539850338964d29c30eef"
  }
}
```

## Policy.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<AccessControlPolicy xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
  <Owner>
    <ID>74ababf54b6810c1d34431ceee560f5de666617490e539850338964d29c30eef</ID>
    <DisplayName>andrewbrown</DisplayName>
  </Owner>
  <AccessControlList>
    <Grant>
      <Grantee xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
               xsi:type="Canonical User">
        <ID>e602ac4aeb23a4d25642f95dc2fbc085279cf5b30824067afbb329d7eeb49fe5</ID>
        <DisplayName>andrewbrown</DisplayName>
      </Grantee>
      <Permission>FULL_CONTROL</Permission>
    </Grant>
  </AccessControlList>
</AccessControlPolicy> 
```


