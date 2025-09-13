## Objective

To create and manage AWS S3 buckets and objects using PowerShell scripting in a Gitpod environment.

## Prerequisites

- AWS CLI configured with appropriate credentials.
- Gitpod account and workspace setup.
- Basic knowledge of PowerShell and AWS S3.

## Steps

### Step 1: Install PowerShell in Gitpod

- 1.1
    
    Open Gitpod Workspace
    
- 1.2
    
    Install PowerShell
    

```
# Update package lists
sudo apt-get update

# Install prerequisites
sudo apt-get install -y wget apt-transport-https software-properties-common

# Import the Microsoft GPG key
wget -q "https://packages.microsoft.com/keys/microsoft.asc" -O- | sudo apt-key add -

# Register the Microsoft Ubuntu repository
sudo add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/20.04/prod.list)"

# Install PowerShell
sudo apt-get update
sudo apt-get install -y powershell

# Start PowerShell
pwsh
```

### Step 2: Install AWS Tools for PowerShell

- 2.1
    
    Install AWS Tools Module
    

```
# Install AWS Tools for PowerShell
Install-Module -Name AWSPowerShell.NetCore -Scope CurrentUser -Force -AllowClobber

# Verify the installation
Get-Module -ListAvailable AWSPowerShell.NetCore
```

- 2.2
    
    Configure AWS CLI
    

```
# Configure AWS CLI with your credentials
Set-AWSCredential -AccessKey <YourAccessKey> -SecretKey <YourSecretKey> -StoreAs default
```

### Step 3: Create PowerShell Script for AWS S3

- 3.1
    
    Create PowerShell Script File
    

```
# Create a new directory for scripts
mkdir PowerShellScripts

# Create a new PowerShell script file
New-Item -Path "./PowerShellScripts/S3Script.ps1" -ItemType "file"
```

- 3.2
    
    Edit the Script
    

```
# Open the script file in an editor
code ./PowerShellScripts/S3Script.ps1
```

- 3.3
    
    Add the Following Script Content
    

```
# Import AWS PowerShell Module
Import-Module AWSPowerShell.NetCore

# Set AWS Region
$region = "us-east-1"

# Prompt for S3 Bucket Name
$bucketName = Read-Host -Prompt 'Enter the S3 bucket name'

# Function to check if the bucket exists
function BucketExists {
    param ($bucketName)
    try {
        Get-S3Bucket -BucketName $bucketName -ErrorAction Stop
        return $true
    } catch {
        return $false
    }
}

# Create S3 Bucket if it doesn't exist
if (-Not (BucketExists -bucketName $bucketName)) {
    New-S3Bucket -BucketName $bucketName -Region $region
    Write-Host "Bucket $bucketName created."
} else {
    Write-Host "Bucket $bucketName already exists."
}

# Create a sample file
$fileName = "sample.txt"
$fileContent = "Hello, S3!"
Set-Content -Path $fileName -Value $fileContent

# Upload the file to the S3 bucket
Write-S3Object -BucketName $bucketName -File $fileName -Key $fileName
Write-Host "File $fileName uploaded to bucket $bucketName."

# Clean up local file
Remove-Item -Path $fileName
```

### Step 4: Execute the PowerShell Script

- 4.1
    
    Run the Script
    

```
# Navigate to the script directory
cd PowerShellScripts

# Execute the PowerShell script
./S3Script.ps1
```

- 4.2
    
    Follow the Prompt
    
- Enter the S3 bucket name when prompted.

### Step 5: Verify S3 Bucket and Object

- 5.1
    
    Check the AWS S3 Console
    
- Navigate to the AWS S3 console.
- Verify that the bucket is created and the file `sample.txt` is uploaded.

### Conclusion

You have successfully created and managed an S3 bucket and objects using PowerShell scripting in a Gitpod environment. This process includes installing PowerShell, configuring AWS tools, writing a script, and executing it to perform S3 operations.