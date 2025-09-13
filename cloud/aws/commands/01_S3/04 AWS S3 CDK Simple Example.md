### Objective

Create a simple AWS S3 bucket using AWS Cloud Development Kit (CDK) with TypeScript.

### Prerequisites

- AWS account
- Node.js and npm installed
- AWS CLI configured
- Basic knowledge of AWS services and TypeScript

### Step-by-Step Instructions

#### Step 1: Set Up Your Environment

- 1.1
    
    **Install AWS CDK CLI**
    
    ✋
    
- Open your terminal or command prompt.
- Install the AWS CDK CLI globally using npm:

```
npm install -g aws-cdk
```

- 1.2
    
    **Verify Installation**
    
    ✋
    
- Check that the CDK CLI is installed by running:

```
cdk --version
```

- 1.3
    
    **Create a New Directory for the Project**
    
    ✋
    
- Navigate to your preferred development directory and create a new folder:

```
mkdir aws-cdk-s3-example
cd aws-cdk-s3-example
```

- 1.4
    
    **Initialize the CDK Project**
    
    ✋
    
- Use the CDK CLI to initialize a new project with TypeScript:

```
cdk init app --language=typescript
```

- This command sets up a basic CDK project structure with the necessary configuration files.

#### Step 2: Modify the CDK Stack to Create an S3 Bucket

- 2.1
    
    **Open the Stack File**
    
    ✋
    
- Open the file `lib/aws-cdk-s3-example-stack.ts` in your preferred code editor.
- 2.2
    
    **Import the Required CDK Modules**
    
    ✋
    
- Ensure you have the following import statements at the top of your file:

```
import * as cdk from 'aws-cdk-lib';
import { Construct } from 'constructs';
import * as s3 from 'aws-cdk-lib/aws-s3';
```

- 2.3
    
    **Define an S3 Bucket**
    
    ✋
    
- Modify the stack to include an S3 bucket definition. Update the `AwsCdkS3ExampleStack` class as follows:

```
export class AwsCdkS3ExampleStack extends cdk.Stack {
  constructor(scope: Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);

    // Define an S3 bucket
    const bucket = new s3.Bucket(this, 'MyBucket', {
      versioned: false, // Disable versioning for simplicity
      removalPolicy: cdk.RemovalPolicy.DESTROY, // Specify removal policy
      autoDeleteObjects: true // Automatically delete objects
    });

    // Output the bucket name
    new cdk.CfnOutput(this, 'BucketName', {
      value: bucket.bucketName,
      description: 'The name of the S3 bucket'
    });
  }
}
```

#### Step 3: Bootstrap Your CDK Environment

- 3.1
    
    **Bootstrap Your AWS Environment**
    
    ✋
    
- Run the following command to bootstrap your environment, which prepares the resources needed by the CDK toolkit:

```
cdk bootstrap
```

- This command creates an S3 bucket to store synthesized CloudFormation templates and other deployment assets.

#### Step 4: Deploy the CDK Stack

- 4.1
    
    **Deploy Your CDK Stack**
    
    ✋
    
- Run the following command to deploy your stack to AWS:

```
cdk deploy
```

- Confirm the deployment when prompted. The command will output the S3 bucket name upon successful deployment.
- 4.2
    
    **Verify the Deployment**
    
    ✋
    
- Go to the [AWS Management Console](https://aws.amazon.com/console/) and navigate to the S3 service.
- Confirm that the new S3 bucket has been created with the specified configuration.

#### Step 5: Clean Up Resources

- 5.1
    
    **Destroy the CDK Stack**
    
    ✋
    
- After verifying the S3 bucket, destroy the stack to avoid incurring charges:

```
cdk destroy
```

- 5.2
    
    **Verify Resource Deletion**
    
    ✋
    
- Check the AWS Management Console to ensure that the S3 bucket and associated resources have been deleted.

#### Notes

- **CDK Toolkit**: The CDK toolkit requires bootstrapping once per AWS account/region. Ensure you have necessary permissions for bootstrapping and deploying stacks.
- **TypeScript Support**: This lab uses TypeScript, but CDK supports other languages like JavaScript, Python, Java, and .NET.
- **Auto-Completion**: TypeScript provides excellent auto-completion, which is beneficial for writing CDK constructs.

### Conclusion

This lab demonstrates the basic usage of AWS CDK to define and deploy an S3 bucket using TypeScript. CDK is a powerful tool that abstracts AWS CloudFormation, allowing you to define infrastructure with familiar programming languages.