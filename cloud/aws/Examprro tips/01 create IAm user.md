## Create IAM User

### Step 1: Sign in to the AWS Management Console

- 1.1
    
    Log into the AWS Management Console using your root user credentials.
    
- 1.2
    
    Once logged in, you'll be on the AWS Management Console homepage. The most recently used services are displayed here.
    

### Step 2: Update Account Name (Optional)

- 2.1
    
    If you want to change your account name:
    
- Click on your account name in the top right corner and select **"My Account."**
- In the **"Account Settings"** section, click **"Edit"** to change the account name.

### Step 3: Log Out and Familiarize with AWS Login

- 3.1
    
    Log out of your root account to practice logging back in.
    
- 3.2
    
    Go to the login page, and you'll notice two options: **"Root user"** and **"IAM user."**
    
- When using the **"Root user"** option, you log in with your email address.
- When using the **"IAM user"** option, you log in with your account ID or alias.

### Step 4: Set Up an IAM User

- 4.1
    
    Log back in to your root account.
    
- 4.2
    
    In the search bar, type **"IAM"** and select **"IAM"** from the services.
    
- 4.3
    
    On the **IAM dashboard**, you will see security recommendations. One of the recommendations is to set up an alias for your account. You can set the alias to make it easier to log in.
    
- 4.4
    
    In the left sidebar, select **"Users."**
    
- 4.5
    
    Click **"Add users"** to create a new IAM user.
    

### Step 5: Provide User Details

- 5.1
    
    Enter a username for the new IAM user (e.g., "Andrew Brown").
    
- 5.2
    
    Select access type:
    
- ✅ **AWS Management Console access** → Choose either auto-generated or custom password.
- ❌ **Programmatic access** is no longer an option at this step.
- ✔️ Ensure "**Require password reset**" is checked.

✅ You will add programmatic access (access keys) after user creation.

### Step 6: Set Permissions

- 6.1
    
    Click **"Next: Permissions."**
    
- 6.2
    
    Choose how to assign permissions:
    
- **Add user to group**: Click **"Create group"** and name it (e.g., "admin").
- Select the **"AdministratorAccess"** policy to provide full access to AWS services.
- 6.3
    
    If you want more specific permissions, explore **"AWS managed policies"** to assign roles like **"PowerUserAccess."**
    
- 6.4
    
    Click **"Create group"** and add the user to the new group.
    

### Step 7: (Optional) Add Tags

- 7.1
    
    Click **"Next: Tags."**
    
- 7.2
    
    Optionally, add metadata to your user (e.g., department, role).
    

### Step 8: Review and Create User

- 8.1
    
    Click **"Next: Review"** to see a summary of the user's details.
    
- 8.2
    
    Click **"Create user."**
    
- 8.3
    
    A page will display the new user's **Access key ID** and **Secret access key**. Copy these credentials and store them securely.
    

⚠️ **Access keys are no longer created during user setup**.

To allow this IAM user to use the AWS CLI, SDK, or API, you must create an access key after the user is created (see Step 12 below).

### Step 9: Set Up Account Alias

- 9.1
    
    To set up an account alias (useful for logging in):
    
- In the IAM dashboard, under **"Account settings,"** click **"Create account alias."**
- Enter an alias (e.g., "DeepSpaceNine").

### Step 10: Log In with the IAM User

- 10.1
    
    Log out of the root account.
    
- 10.2
    
    Go to the AWS login page and choose **"IAM user."**
    
- 10.3
    
    Enter your account alias or account ID.
    
- 10.4
    
    Enter the IAM username (e.g., "Andrew Brown") and the password.
    
- 10.5
    
    If prompted, reset the password using a strong, unique one.
    

### Step 11: Verify Login

- 11.1
    
    Log out and log back in to ensure that the new IAM user account is set up correctly.
    
- 11.2
    
    When logged in as the IAM user, the console displays the username and account alias to distinguish it from the root account.
    

### Step 12: Create Access Key for Programmatic Access

- 12.1
    
    In the **IAM dashboard**, click "**Users**" and select the new IAM user (e.g., Andrew Brown).
    
    ✋
    
- 12.2
    
    Go to the "**Security credentials**" tab.
    
    ✋
    
- 12.3
    
    Under **Access keys**, click "**Create access key.**"
    
    ✋
    
- 12.4
    
    You will be asked to choose the **use case** for the access key:
    
    ✋
    
- Choose "**Command Line Interface (CLI)**" if the user will use AWS CLI or SDK.

You may also choose "**Local code**" or another appropriate option depending on the context.

- 12.5
    
    After selecting the use case, click "**Next.**"
    
    ✋
    
- 12.6
    
    Copy the **Access Key ID** and **Secret Access Key** and store them securely.