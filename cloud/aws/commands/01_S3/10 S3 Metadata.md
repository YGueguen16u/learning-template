https://github.com/ExamProCo/AWS-Examples/tree/main/s3/metadata

### Create a bucket

```shell
aws s3 mb s3://metadata-fun-ab-12421
```

### Create a new file

```shell
echo "Hello Mars" > hello.txt
```

### Upload file with metadata

You can find all fields here: https://docs.aws.amazon.com/cli/latest/reference/s3api/put-object.html

```shell
put-object
[--acl <value>]
[--body <value>]
--bucket <value>
[--cache-control <value>]
.
.
.
```

```shell
aws s3api put-object \
    --bucket metadata-fun-ab-12421 \
    --key hello.txt \
    --body hello.txt \
    --metadata Planet=Mars
```

### Get Metadata through head object

```shell
aws s3api head-object \
    --bucket metadata-fun-ab-12421 \
    --key hello.txt
```

### Cleanup

```shell
aws s3 rm s3://metadata-fun-ab-12421/hello.txt \
aws s3 rb s3://metadata-fun-ab-12421
```