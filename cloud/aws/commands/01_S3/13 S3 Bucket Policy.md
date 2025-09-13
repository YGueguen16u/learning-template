https://github.com/ExamProCo/AWS-Examples/tree/main/s3/bucket-policy
## Create a bucket

```sh
aws s3 mb s3://bucket-policy-example-ab-5235
```

## Create bucket policy

```sh
aws s3api put-bucket-policy \
--bucket bucket-policy-example-ab-5235 \
--policy file://policy.json
```

## In the other account access the bucket

```sh
touch bootcamp.txt
aws s3 cp bootcamp.txt s3://bucket-policy-example-ab-5235
aws s3 ls s3://bucket-policy-example-ab-5235
```

## Cleanup

```sh
aws s3 rm s3://bucket-policy-example-ab-5235/bootcamp.txt
aws s3 rb s3://bucket-policy-example-ab-5235
```

## Policy.json

Info: https://docs.aws.amazon.com/AmazonS3/latest/userguide/example-bucket-policies.html
```json
{
  "Statement": [
     {
        "Effect": "Allow",
        "Principal": {
           "AWS": "arn:aws:iam::387543059434:user/andrewbrown"
        },
        "Action": [
          "s3:ListBucket",
          "s3:GetObject",
          "s3:PutObject"
        ],
        "Resource": [
          "arn:aws:s3:::bucket-policy-example-ab-5235",
          "arn:aws:s3:::bucket-policy-example-ab-5235/*"
        ]
     }
  ]
}
```