https://github.com/ExamProCo/AWS-Examples/tree/main/s3/cors

# Create Website 1

## Create a bucket

```sh
aws s3 mb s3://cors-fun-ab-36252
```

## Change block public access

```sh
aws s3api put-public-access-block \
--bucket cors-fun-ab-36252 \
--public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```

## Create a bucket policy

```sh
aws s3api put-bucket-policy \
--bucket cors-fun-ab-36252 \
--policy file://bucket-policy.json
```

## Turn on static website hosting

```sh
aws s3api put-bucket-website \
--bucket cors-fun-ab-36252 \
--website-configuration file://website.json
```

## Upload our index.html file and include a resource that would be cross-origin

```sh
aws s3 cp index.html s3://cors-fun-ab-36252
```

## View the website and see if the index.html is there.

It this for ca-central-1
http://cors-fun-ab-36252.s3-website.ca-central-1.amazonaws.com

Other regions might ue a hyphen instead
http://cors-fun-ab-36252.s3-website-ca-central-1.amazonaws.com


# Create Website 2

```sh
aws s3 mb s3://cors-fun2-ab-36252
```

## Change block public access

```sh
aws s3api put-public-access-block \
--bucket cors-fun2-ab-36252 \
--public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```

## Create a bucket policy

```sh
aws s3api put-bucket-policy \
--bucket cors-fun2-ab-36252 \
--policy file://bucket-policy2.json
```

## Turn on static website hosting

```sh
aws s3api put-bucket-website \
--bucket cors-fun2-ab-36252 \
--website-configuration file://website.json
```

## Upload our javascript file

```sh
aws s3 cp hello.js s3://cors-fun2-ab-36252
```

## Create API Gateway with mock response and then test the endpoint

```sh
curl -X POST -H "Content-Type: application/json" https://1kccnjkm43.execute-api.ca-central-1.amazonaws.com/prod/hello
```

## Set CORS on our bucket

```sh
aws s3api put-bucket-cors \
--bucket cors-fun-ab-36252 \
--cors-configuration file://cors.json
```

## index.html

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Website!!!!</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Rubik+Bubbles&display=swap" rel="stylesheet">
    <style>
      * {
        font-family: 'Rubik Bubbles'
      }
    </style>
  </head>
  <body>
    <main>
        <h1>Welcome to My Website</h1>  
        <p>What do you think of my amazing Website!</p>
    </main>
    <script type="text/javascript">
      const xhr = new XMLHttpRequest();
      xhr.open("POST", "https://1kccnjkm43.execute-api.ca-central-1.amazonaws.com/prod/hello", true);
      // Send the proper header information along with the request
      xhr.setRequestHeader("Content-Type", "application/json");
      xhr.onreadystatechange = () => {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
          const results = JSON.parse(xhr.responseText);
          console.log('results',results)
        }
      };
      xhr.send();
    </script>
  </body>
</html>
```

## hello.js

```js
console.log('hello world')
```

## bucket-policy.json

```json
{
  "Version": "2012-10-17",
  "Statement": [
      {
          "Sid": "PublicReadGetObject",
          "Effect": "Allow",
          "Principal": "*",
          "Action": [
              "s3:GetObject"
          ],
          "Resource": [
              "arn:aws:s3:::cors-fun-ab-36252/*"
          ]
      }
  ]
}
```

## website.json

```json
{
  "IndexDocument": {
      "Suffix": "index.html"
  },
  "ErrorDocument": {
      "Key": "error.html"
  }
}
```

## bucket-policy2.json

```json
{
  "Version": "2012-10-17",
  "Statement": [
      {
          "Sid": "PublicReadGetObject",
          "Effect": "Allow",
          "Principal": "*",
          "Action": [
              "s3:GetObject"
          ],
          "Resource": [
              "arn:aws:s3:::cors-fun2-ab-36252/*"
          ]
      }
  ]
}
```

## cors.json

```json
{
  "CORSRules": [
    {
      "AllowedOrigins": ["https://1kccnjkm43.execute-api.ca-central-1.amazonaws.com"],
      "AllowedHeaders": ["*"],
      "AllowedMethods": ["PUT", "POST", "DELETE"],
      "MaxAgeSeconds": 3000,
      "ExposeHeaders": ["x-amz-server-side-encryption"]
    }
  ]
}
```
