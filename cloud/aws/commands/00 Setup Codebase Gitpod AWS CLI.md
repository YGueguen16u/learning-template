#### Step 1: Create a New Repository on GitHub

- 1.1
    
    Log into your GitHub account.
    
- 1.2
    
    Navigate to the "Repositories" section.
    
- 1.3
    
    Click "New" to create a new repository.
    
- 1.4
    
    Name the repository (e.g., `aws-examples`).
    
- 1.5
    
    Set the repository to public (or private, if you prefer).
    
- 1.6
    
    Initialize the repository with a README file.
    
- 1.7
    
    Click "Create repository".
    

#### Step 2: Open Repository in Gitpod

- 2.1
    
    Ensure you have the Gitpod extension installed in Chrome.
    
- 2.2
    
    Navigate to your new repository on GitHub.
    
- 2.3
    
    Click the Gitpod button or type `gitpod.io/#` before the URL in the address bar and press Enter.
    
- 2.4
    
    Gitpod will launch and set up the workspace.
    

#### Step 3: Install AWS CLI

- 3.1
    
    Open the terminal in Gitpod.
    
- 3.2
    
    To install the AWS CLI, enter the following commands:
    

```
   curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
   unzip awscliv2.zip
   sudo ./aws/install
```

-3.3 [ ] Verify the installation by running:

```
   aws --version
```

#### Step 4: Create Gitpod Configuration File

- 4.1
    
    In the root directory of your repository, create a new file named `.gitpod.yml`.
    
- 4.2
    
    Add the following configuration to the file:
    

```
   tasks:
     - name: Setup AWS CLI
       init: |
         curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
         unzip awscliv2.zip
         sudo ./aws/install
```

- 4.3
    
    Save the file.
    

#### Step 5: Configure AWS CLI with IAM Credentials

- 5.1
    
    In your AWS account, navigate to the IAM section.
    
- 5.2
    
    Create a new user with programmatic access and attach the "AdministratorAccess" policy.
    
- 5.3
    
    Generate and download the access keys (Access Key ID and Secret Access Key).
    
- 5.4
    
    Back in Gitpod, open the terminal and configure the AWS CLI with the generated keys:
    

```
   aws configure
```

- Enter the Access Key ID.
- Enter the Secret Access Key.
- Set the default region (e.g., `us-east-1`).
- Set the default output format (e.g., `json`).

#### Step 6: Set Environment Variables in Gitpod

- 6.1
    
    In your `.gitpod.yml` file, add the environment variables section:
    

```
   tasks:
     - name: Setup AWS CLI
       init: |
         curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
         unzip awscliv2.zip
         sudo ./aws/install
         export AWS_ACCESS_KEY_ID=your_access_key_id
         export AWS_SECRET_ACCESS_KEY=your_secret_access_key
         export AWS_DEFAULT_REGION=us-east-1
```

- 6.2
    
    Save the file.
    

#### Step 7: Verify AWS CLI Installation and Configuration

- 7.1
    
    Open the terminal in Gitpod.
    
- 7.2
    
    Verify the AWS CLI is installed correctly:
    

```
   aws --version
```

- 7.3
    
    Verify the configuration by running a simple command:
    

```
   aws sts get-caller-identity
```

- This should return your AWS account and user information.

#### Step 8: Commit and Push Changes

- 8.1
    
    Stage the new `.gitpod.yml` file:
    

```
   git add .gitpod.yml
```

- 8.2
    
    Commit the changes:
    

```
   git commit -m "Add Gitpod configuration for AWS CLI setup"
```

- 8.3
    
    Push the changes to the repository:
    

```
   git push origin main
```

### Conclusion

You have successfully set up a code repository using Gitpod and installed the AWS CLI. This setup will be used for various projects involving AWS services. Ensure your AWS credentials are kept secure and rotated regularly. If you encounter issues, refer back to the repository and configuration steps.

### Additional Notes

- If you need to install additional AWS tools (e.g., AWS CDK, SAM CLI), you can add those installations to the `.gitpod.yml` file.
- For a more secure setup, consider using AWS IAM roles and temporary credentials.