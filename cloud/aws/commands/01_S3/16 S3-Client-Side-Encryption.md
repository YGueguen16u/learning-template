https://github.com/ExamProCo/AWS-Examples/tree/main/s3/encryption-client

## Create a bucket

```sh
aws s3 mb s3://encrypt-client-fun-ab-634232
```

### Run our our SDK ruby script

#### bundle install

```sh
bundle install
```

```sh
bundle exec ruby encrypt.rb
```

### Cleanup 

```sh
aws s3 rm s3://encrypt-client-fun-ab-634232/hello.txt
aws s3 rb s3://encrypt-client-fun-ab-634232
```

### encrypt.rb

```rb
require 'aws-sdk-s3'
require 'openssl'
require 'pry'

key = OpenSSL::PKey::RSA.new(1024)

bucket = 'encrypt-client-fun-ab-634232'
object_key = 'hello.txt'
# encryption client
s3 = Aws::S3::EncryptionV2::Client.new(
  encryption_key: key,
  key_wrap_schema: :rsa_oaep_sha1, # the key_wrap_schema must be rsa_oaep_sha1 for asymmetric keys
  content_encryption_schema: :aes_gcm_no_padding,
  security_profile: :v2 # use :v2_and_legacy to allow reading/decrypting objects encrypted by the V1 encryption client
)

# round-trip an object, encrypted/decrypted locally
resp = s3.put_object(bucket: bucket, key: object_key, body:'handshake')
puts "PUT"
puts resp
resp = s3.get_object(bucket: bucket, key: object_key).body.read
puts "GET WITH KEy"
puts resp
#=> 'handshake'

# reading encrypted object without the encryption client
# results in the getting the cipher text
resp = Aws::S3::Client.new.get_object(bucket:bucket, key:object_key).body.read
puts "GET WITHOUT KEY"
puts resp
```

### gemfile

```rb
# frozen_string_literal: true

source "https://rubygems.org"

# gem "rails"
gem 'aws-sdk-s3'
gem 'ox'
gem 'pry'
```

### Gemfile.lock

```rb

GEM
  remote: https://rubygems.org/
  specs:
    aws-eventstream (1.3.0)
    aws-partitions (1.868.0)
    aws-sdk-core (3.190.0)
      aws-eventstream (~> 1, >= 1.3.0)
      aws-partitions (~> 1, >= 1.651.0)
      aws-sigv4 (~> 1.8)
      jmespath (~> 1, >= 1.6.1)
    aws-sdk-kms (1.75.0)
      aws-sdk-core (~> 3, >= 3.188.0)
      aws-sigv4 (~> 1.1)
    aws-sdk-s3 (1.141.0)
      aws-sdk-core (~> 3, >= 3.189.0)
      aws-sdk-kms (~> 1)
      aws-sigv4 (~> 1.8)
    aws-sigv4 (1.8.0)
      aws-eventstream (~> 1, >= 1.0.2)
    coderay (1.1.3)
    jmespath (1.6.2)
    method_source (1.0.0)
    ox (2.14.17)
    pry (0.14.2)
      coderay (~> 1.1)
      method_source (~> 1.0)

PLATFORMS
  ruby
  x86_64-linux

DEPENDENCIES
  aws-sdk-s3
  ox
  pry

BUNDLED WITH
   2.5.1
```
