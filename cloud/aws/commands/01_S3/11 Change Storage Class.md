https://github.com/ExamProCo/AWS-Examples/blob/main/s3/change-storage-class/Readme.md

## Create a bucket

```sh
aws s3 mb s3://class-fun-ab-6346
```

## Create a file

```sh
echo "Hello World" > hello.txt
```

## Upload file with metadata

```sh
aws s3 cp hello.txt s3://class-fun-ab-6346 \
--storage-class STANDARD_IA
```

## Cleanup

```sh
aws s3 rm s3://class-fun-ab-6346/hello.txt
aws s3 rb s3://class-fun-ab-6346
```
