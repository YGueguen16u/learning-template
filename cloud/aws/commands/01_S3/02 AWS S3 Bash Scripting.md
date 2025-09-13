## Overview

This lab focuses on using Bash scripts to interact with AWS S3 programmatically. We'll cover creating, listing, deleting buckets and objects, and syncing files using the AWS CLI and Bash scripting.

## Prerequisites

- AWS CLI installed and configured
- GitPod or similar environment with Bash support
- JQ installed (`sudo apt-get install jq`)
- Basic understanding of Bash scripting

## Steps

### Step 1: Set Up Environment

- 1.1
    
    I have read this. [https://github.com/ExamProCo/AWS-Examples/tree/main/s3/bash-scripts](https://github.com/ExamProCo/AWS-Examples/tree/main/s3/bash-scripts)
    
- 1.2
    
    Create Directories
    

```
mkdir -p S3/bash-scripts
cd S3/bash-scripts
```

- 1.3
    
    Make Scripts Executable
    

```
chmod u+x *.sh
```

### Step 2: Create and Delete Buckets

- 2.1
    
    Create Bucket Script (create_bucket.sh)
    

```
#!/usr/bin/env bash
echo "== create bucket"

set -e
if [ -z "$1" ]; then
    echo "No bucket name provided. Usage: $0 bucket-name"
    exit 1
fi
BUCKET_NAME=$1
REGION=${2:-us-east-1}
aws s3api create-bucket\ 
--bucket "$BUCKET_NAME"\ 
--create-bucket-configuration LocationConstraint="$REGION"\
--query Location \
--output text
```

- 2.2
    
    Delete Bucket Script (delete_bucket.sh)
    

```
#!/bin/bash
set -e
if [ -z "$1" ]; then
    echo "No bucket name provided. Usage: $0 bucket-name"
    exit 1
fi
BUCKET_NAME=$1
# https://docs.aws.amazon.com/cli/latest/reference/s3api/create-bucket.html

aws s3api delete-bucket\ 
--bucket "$BUCKET_NAME"
```

### Step 3: Sync Files to Bucket

- 3.1
    
    Generate Random Files Script (generate_files.sh)
    

```
#!/usr/bin/env bash
echo "== sync"

# Exit immediately if any command returns a non-zero status
set -e

# where we'll store these files
OUTPUT_DIR="./temp"

# lets create output folder
mkdir -p $OUTPUT_DIR

# remove folder if it already exists
rm -rf $OUTPUT_DIR/*

# generate a random number
# to determine how many files to create
NUM_FILES=$((RANDOM % 6 + 5))

for i in $(seq 1 $NUM_FILES); do
    # Generate a random filename
    FILE_NAME="$OUTPUT_DIR/file_$i.txt"
    # Generate random data and write it to the file
    head -c 100 </dev/urandom > $FILE_NAME
    echo "Created $FILE_NAME"
    #dd if=/dev/urandom of="$FILENAME" bs=1024 count=$((RANDOM % 1024 + 1)) 2>/dev/null
done

tree $OUTPUT_DIR

aws s3 sync $OUTPUT_DIR s3://$BUCKET_NAME/files
```

- 3.2
    
    Sync Files Script (sync_files.sh)
    

```
#!/bin/bash
set -e
if [ -z "$1" ]; then
    echo "No bucket name provided. Usage: $0 bucket-name"
    exit 1
fi

# Check for filename prefix
if [ -z "$2" ]; then
    echo "There needs to be a filename prefix eg. ./bucket my-bucket-name my-filename-prefix"
    exit 1
fi

BUCKET_NAME=$1
FILE_PREFIX=${2:-files}
aws s3 sync ./temp s3://$BUCKET_NAME/$FILE_PREFIX
```

### Step 4: List and Delete Objects

- 4.1
    
    List Objects Script (list_objects.sh)
    

```
#!/bin/bash
set -e
if [ -z "$1" ]; then
    echo "No bucket name provided. Usage: $0 bucket-name"
    exit 1
fi
BUCKET_NAME=$1
aws s3api list-objects --bucket "$BUCKET_NAME" --query 'Contents[].{Key: Key, Size: Size}'
```

- 4.2
    
    Delete All Objects Script (delete_objects.sh)
    

```
#!/bin/bash
set -e
if [ -z "$1" ]; then
    echo "No bucket name provided. Usage: $0 bucket-name"
    exit 1
fi
BUCKET_NAME=$1
OBJECTS=$(aws s3api list-objects --bucket "$BUCKET_NAME" --query 'Contents[].{Key: Key}' --output json)
if [ "$OBJECTS" == "null" ]; then
    echo "Bucket is empty"
    exit 0
fi
echo '{"Objects":' > delete.json
echo $OBJECTS | jq '.' >> delete.json
echo '}' >> delete.json
aws s3api delete-objects --bucket "$BUCKET_NAME" --delete file://delete.json
rm delete.json
```

### Step 5: Additional Utility Scripts

- 5.1
    
    Get Newest Bucket Script (get_newest_bucket.sh)
    

```
#!/bin/bash
aws s3api list-buckets --query 'Buckets | sort_by(@, &CreationDate) | [-1:].Name' --output text
```

- 5.2
    
    List Buckets Script (list_buckets.sh)
    

```
#!/bin/bash
aws s3 ls
```

### Step 6: Running the Scripts

- 6.1
    
    Generate Random Files
    

```
./generate_files.sh
```

- 6.2
    
    Create a New Bucket
    

```
./create_bucket.sh my-new-bucket us-east-1
```

- 6.3
    
    Sync Files to Bucket
    

```
./sync_files.sh my-new-bucket files
```

- 6.4
    
    List Objects in Bucket
    

```
./list_objects.sh my-new-bucket
```

- 6.5
    
    Delete All Objects in Bucket
    

```
./delete_objects.sh my-new-bucket
```

- 6.6
    
    Delete the Bucket
    

```
./delete_bucket.sh my-new-bucket
```

## Conclusion

These scripts provide a structured approach to managing AWS S3 buckets and objects programmatically using Bash. Mastery of these scripting techniques is essential for cloud engineers and DevOps professionals.

### Other scripts 

### create-bucket
```sh
#!/usr/bin/env bash
echo "== create bucket"

# Check for bucket name
if [ -z "$1" ]; then
    echo "There needs to be a bucket name eg. ./bucket my-bucket-name"
    exit 1
fi

BUCKET_NAME=$1

# https://docs.aws.amazon.com/cli/latest/reference/s3api/create-bucket.html
aws s3api create-bucket \
--bucket $BUCKET_NAME \
--create-bucket-configuration="LocationConstraint=ca-central-1" \
--query Location \
--output text
```

### delete-bucket
```sh
#!/usr/bin/env bash
echo "== delete bucket"

# Check for bucket name
if [ -z "$1" ]; then
    echo "There needs to be a bucket name eg. ./bucket my-bucket-name"
    exit 1
fi

BUCKET_NAME=$1

# https://docs.aws.amazon.com/cli/latest/reference/s3api/create-bucket.html
aws s3api delete-bucket \
--bucket $BUCKET_NAME
```

### delete-objects
```sh
#!/usr/bin/env bash
echo "== delete-objects"

# Exit immediately if any command returns a non-zero status
set -e

# Check for bucket name
if [ -z "$1" ]; then
    echo "There needs to be a bucket name eg. ./bucket my-bucket-name"
    exit 1
fi

BUCKET_NAME=$1

aws s3api list-objects-v2 \
--bucket $BUCKET_NAME  \
--query Contents[].Key \
| jq -n '{Objects: [inputs | .[] | {Key: .}]}' > /tmp/delete_objects.json

aws s3api delete-objects --bucket $BUCKET_NAME --delete file:///tmp/delete_objects.json
```

### get-newest-bucket
```sh
#!/usr/bin/env bash
aws s3api list-buckets | jq -r '.Buckets | sort_by(.CreationDate) | reverse | .[0] | .Name'
```

### list-buckets
```sh
#!/usr/bin/env bash
echo "== list newest buckets"

aws s3api list-buckets | jq -r '.Buckets | sort_by(.CreationDate) | reverse | .[0:5] | .[] |  .Name'
echo "..."
```

### list-objects
```sh
#!/usr/bin/env bash
echo "== list objects"

# Check for bucket name
if [ -z "$1" ]; then
    echo "There needs to be a bucket name eg. ./bucket my-bucket-name"
    exit 1
fi

BUCKET_NAME=$1

# https://docs.aws.amazon.com/cli/latest/reference/s3api/create-bucket.html
aws s3api list-objects-v2 \
--bucket $BUCKET_NAME
```

### put-object
```sh
#!/usr/bin/env bash
echo "== put-object"

# Check for bucket name
if [ -z "$1" ]; then
    echo "There needs to be a bucket name eg. ./bucket my-bucket-name"
    exit 1
fi

if [ -z "$2" ]; then
    echo "There needs to be a filename eg. ./bucket my-bucket-name filename"
    exit 1
fi
BUCKET_NAME=$1
FILENAME=$2

OBJECT_KEY=$(basename "$FILENAME")

aws s3api put-object \
--bucket $BUCKET_NAME \
--body $FILENAME \
--key $OBJECT_KEY
```

### sync
```sh
#!/usr/bin/env bash
echo "== sync"
# Exit immediately if any command returns a non-zero status
set -e

# Check for bucket name
if [ -z "$1" ]; then
    echo "There needs to be a bucket name eg. ./bucket my-bucket-name"
    exit 1
fi


# Check for filename prefix
if [ -z "$2" ]; then
    echo "There needs to be a filename prefix eg. ./bucket my-bucket-name my-filename-prefix"
    exit 1
fi

BUCKET_NAME=$1
FILENAME_PREFIX=$2

# where we'll store these files
OUTPUT_DIR="/tmp/s3-bash-scripts"

# remove folder if it already exists
rm -r $OUTPUT_DIR

# lets create output folder
mkdir -p $OUTPUT_DIR

# generate a random number
# to determine how many files to create
NUM_FILES=$((RANDOM % 6 + 5))

for ((i=1; i<=$NUM_FILES; i++)); do
    # Generate a random filename
    FILENAME="$OUTPUT_DIR/${FILENAME_PREFIX}_$i.txt"

    # Generate random data and write it to the file
    dd if=/dev/urandom of="$FILENAME" bs=1024 count=$((RANDOM % 1024 + 1)) 2>/dev/null
done

tree $OUTPUT_DIR

aws s3 sync $OUTPUT_DIR s3://$BUCKET_NAME/files
```


```sh

```