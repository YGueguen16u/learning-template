# UserData

https://github.com/ExamProCo/AWS-Examples/tree/main/ec2/userdata

## userdata.ps1

```powershell
<powershell>
# If this script is not working check what version of PowerShell you have
# You can do this by entering in the $PSVersionTable variable.
# At the time of the script the Windows Servers on AWS was showing PowerShell 5.1 Desktop Edition
# $PSVersionTable


# Define download URL for Apache HTTP Server (Update the URL to the latest version)
# https://www.apachelounge.com/download/
$downloadUrl = "https://www.apachelounge.com/download/VS17/binaries/httpd-2.4.58-240131-win64-VS17.zip"

# Define where to save the downloaded zip
$zipPath = "C:\apache.zip"

# Download Apache HTTP Server zip
# Invoke-WebRequest -Uri $downloadUrl -OutFile $zipPath -MaximumRedirection 5

# Invoke-WebRequest was getting 308 redirect refuses to work with proper flag
# So we can use the web client to download instead.
$WebClient = New-Object System.Net.WebClient
$WebClient.DownloadFile($downloadUrl,$zipPath)

# Define the extraction path
$extractPath = "C:\"

# Extract the zip file
Expand-Archive -Path $zipPath -DestinationPath $extractPath

# Remove the downloaded zip file to save space
Remove-Item -Path $zipPath

# Apache HTTP Server configuration steps (if necessary)
# For example, editing httpd.conf to adjust server settings

# Path to the Apache Service Monitor executable
#$serviceMonitorPath = Join-Path -Path $extractPath -ChildPath "Apache24\bin\ApacheMonitor.exe"

# Install Apache as a Windows service (using the httpd.exe with the -k install option)
$httpdPath = Join-Path -Path $extractPath -ChildPath "Apache24\bin\httpd.exe"
Start-Process -FilePath $httpdPath -ArgumentList "-k install -d C:\Apache24" -Wait

# Configure apache to start on port 8080
#(Get-Content C:\Apache24\conf\httpd.conf) -replace '^Listen 80$', 'Listen 8080' | Set-Content C:\Apache24\conf\httpd.conf

# Start the Apache service
Start-Service -Name "Apache2.4"

# Optionally, use ApacheMonitor.exe to manage the Apache service
# Start-Process -FilePath $serviceMonitorPath
</powershell>
```

## userdata.sh

```bash
#!/bin/bash
# Update system package repository
sudo yum update -y

# Install Apache (httpd)
sudo yum install -y httpd

# Start Apache service
sudo systemctl start httpd

# Enable Apache to start at boot
sudo systemctl enable httpd

# Create a custom HTML file
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to My Website</title>
</head>
<body>
    <h1>Hello, World!</h1>
    <p>This is a custom HTML page served from my Apache server on EC2.</p>
</body>
</html>
EOF

# Restart Apache to apply changes
sudo systemctl restart httpd
```

## userdata.yaml

```yaml
#cloud-config

package_update: true
package_upgrade: true
packages:
  - httpd

write_files:
  - path: /var/www/html/index.html
    content: |
      <!DOCTYPE html>
      <html>
      <head>
          <title>Welcome to My Website</title>
      </head>
      <body>
          <h1>Hello, World!</h1>
          <p>This is a custom HTML page served from my Apache server on EC2.</p>
      </body>
      </html>
    owner: root:root
    permissions: '0644'
runcmd:
  - systemctl start httpd.service
  - systemctl enable httpd.service
  - systemctl restart httpd.service
```