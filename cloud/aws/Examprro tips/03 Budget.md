By default, IAM users and roles in an AWS account cannot access the **Billing and Cost Management** console, even if they have the `AdministratorAccess` policy attached. To enable this access, you must configure the **Activate IAM Access** setting and assign the necessary permissions.

### Steps to Enable Billing Access:

- 1.1
    
    **Sign in with the Root Account:**
    
- Use the **Root account** credentials to sign in to the AWS Management Console.
- 1.2
    
    **Activate IAM Access:**
    
    ✋
    
- Navigate to [My Account](https://console.aws.amazon.com/billing/home?#/account).
- Scroll down to **IAM User and Role Access to Billing Information**.
- Click **Edit**, select the checkbox for **Activate IAM Access**, and choose **Update**.

![](https://exampro-support.s3.amazonaws.com/AWS/CCP/Questions/Q2923_1.png)

![](https://exampro-support.s3.amazonaws.com/AWS/CCP/Questions/Q2923_2.png)

- 1.3
    
    **Assign Billing Permissions:**
    
    ✋
    
- In the AWS Management Console, search for **IAM** in the dashboard.
- Go to the **Users** section and select the IAM user you want to grant billing access.
- Click **Add Permissions**:
    - Choose **Add Permission** > **Create Group** (if needed).
    - Add the policy **AWSBillingReadOnlyAccess** (or other relevant policies).
    - Save changes.
- 1.4
    
    **Test Access:**
    
    ✋
    
- Log out of the root account and log in using the IAM user account to confirm billing console access.

### Note:

- If using the new AWS console UI, adding billing permissions via IAM may be required even after activating IAM access. For full administrative access, ensure the `AdministratorAccess` policy is also attached.