<h1>Introduction to Git and GitHub</h1>

<h2>Table of Contents</h2>
<div class="alert alert-block alert-info" style="margin-top: 20px">
  <ul>
    <li><a href="#what-is-a-version-control-system-vcs">What is a Version Control System (VCS)?</a></li>
    <li><a href="#what-is-git">What is Git?</a></li>
    <li><a href="#what-is-a-git-repository">What Is a Git Repository?</a></li>
    <li><a href="#centralized-vs-distributed-vcs">Centralized vs Distributed VCS</a></li>
    <li><a href="#why-was-git-created">Why Was Git Created?</a></li>
    <li><a href="#what-is-github">What is GitHub?</a></li>
    <li><a href="#key-gitgitub-terminology">Key Git/GitHub Terminology</a></li>
    <li><a href="#github-vs-gitlab">GitHub vs GitLab</a></li>
    <li><a href="#final-takeaways">Final Takeaways</a></li>
  </ul>
</div>


<h2 id="what-is-a-version-control-system-vcs">What is a Version Control System (VCS)?</h2>

  

A **Version Control System (VCS)** tracks changes to files over time, allowing you to:

- Revert to earlier versions
    
- See who changed what and when
    
- Collaborate without overwriting each other’s work
    

  

**Example**:

You’re editing a shared shopping list with roommates.

- Without VCS → Chaos
    
- With VCS → Clear history of edits
    

---

<h2 id="what-is-git">What is Git?</h2>

- **Git** is a free, open-source **Distributed Version Control System (DVCS)**
    
- Created in **2005 by Linus Torvalds** (creator of Linux)
    
- Licensed under **GNU GPL**
    

  

**Key Features:**

- Local and remote repositories
    
- Full offline functionality
    
- Supports **branching**, **merging**, and **rollback**
    
- **Secure**: Every commit is hashed (SHA-1 or SHA-256)
    
- Efficient for large projects and high-speed workflows (e.g., Linux kernel)
    

  

**Example**:

You create a feature on a separate branch, test it, and only merge it into main when it’s ready.

---

<h2 id="what-is-a-git-repository">What Is a Git Repository?</h2>

  

A **repository (repo)** is a data structure used to:

- Store application source code
    
- Track file versions
    
- Support collaboration, branching, and merging
    

  

A Git repository can exist:

- **Locally** (your machine)
    
- **Remotely** (GitHub, GitLab, etc.)
    

---

<h2 id="centralized-vs-distributed-vcs">Centralized vs Distributed VCS</h2>

|**Feature**|**Centralized VCS**|**Git (Distributed VCS)**|
|---|---|---|
|Location|Central server|Every contributor has a full copy|
|Collaboration|Check in/out|Pull/push between local/remote|
|Offline Use|Limited|Full history offline|

---

<h2 id="why-was-git-created">Why Was Git Created?</h2>

  

In 2005, **BitKeeper**, previously free, became paid.

The Linux community needed a fast, distributed, free alternative.

**Git** was created with these principles:

|**Feature**|**Explanation**|
|---|---|
|Non-linear development|Supports massive branching/merging|
|Distributed architecture|Every user has full repo history|
|Protocol compatibility|Works with SSH, HTTP, etc.|
|Scales to large projects|Designed for the Linux kernel|
|Secure history|Uses cryptographic commit hashes|
|Pluggable merges|Custom strategies for conflict resolution|

---

<h2 id="what-is-github">What is GitHub?</h2>

- **GitHub** is a cloud platform to **host Git repositories**
    
- Adds collaboration tools: **Pull Requests**, **Issues**, **Code Reviews**
    
- Owned by **Microsoft**, with **free**, **Pro**, and **Enterprise** tiers
    
- Supports integrations: **CI/CD**, **project boards**, GitHub Desktop

- > In 2019, GitHub surpassed **100M repositories**
    


**Analogy:**

- Git = The engine
    
- GitHub = The garage with collaboration tools
    

**Example**:

https://github.com/your-username/my-project

---

<h2 id="key-gitgitub-terminology">Key Git/GitHub Terminology</h2>

|**Term**|**Definition**|**Example**|
|---|---|---|
|**SSH**|Secure connection to remote|git@github.com:user/repo.git|
|**Repository**|Git-managed folder|.git/ inside a project folder|
|**Fork**|Copy of a repo under your account|Used to suggest changes|
|**Pull Request**|Suggest merging changes|“Please review and approve”|
|**Working Directory**|Files being edited|index.html, style.css|
|**Commit**|Snapshot with a message|git commit -m "Fix login bug"|
|**Branch**|Parallel development path|feature/signup-form|
|**Merge**|Combine branches|git merge feature/signup-form|
|**Clone**|Local copy of remote repo|git clone https://...|

---

<h2 id="github-vs-gitlab">GitHub vs GitLab</h2>

|**Feature**|**GitHub**|**GitLab**|
|---|---|---|
|Owner|Microsoft|GitLab Inc.|
|Hosting|Git repositories|Git repositories|
|CI/CD|Optional (GitHub Actions)|Built-in|
|DevOps|Partial|Full platform|
|Merge Process|Pull Requests|Merge Requests|

---

<h2 id="final-takeaways">Final Takeaways</h2>

- **Git** is a powerful, fast, and secure system for tracking code versions
    
- **GitHub** is the most popular web-based platform to host Git repos and collaborate on code
    
- Git enables:
    
    - Offline development
        
    - Full version tracking
        
    - Secure cryptographic history
        
    - Multiple simultaneous workflows with branches
        
    