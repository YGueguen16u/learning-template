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

  

Git est le système de gestion de versions (_Version Control System_ ou VCS) le plus populaire. Il a été développé par Linus Torvalds, créateur du noyau Linux. Il offre un type de gestion de versions très différent, car il s'agit d'un système de gestion de versions distribué. Avec un système de gestion de versions distribué, il n'y a pas une base de code centralisée d'où tirer le code. Vous observerez cela plus en détail avec les dépôts locaux et distants (grâce à GitHub).

D'autres systèmes de gestion de versions, tels que SVN et CVS, reposent sur un système centralisé, ce qui signifie qu'une seule copie maîtresse du logiciel est utilisée. Ces systèmes nécessitent donc une connectivité réseau pour toute action au contraire de git qui va utiliser le réseau seulement lors d'une mise à jour entre le dépôt local et le dépôt distant.

C'est un gestionnaire de version qui est utilisé aussi bien pour des projets publics que des projets privés. Initialement, git permet de versionner des fichiers de code (python, C, C++...), mais il peut également servir pour tout type de fichier (txt, md, csv...).

L'intérêt de la gestion de versions (ou _versioning_) est de pouvoir revenir en arrière si besoin, et la capacité de voir qui a modifié quoi, a quel moment, ce qui apportera une meilleure gestion des participants du projet.
    

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

### Qu'est-ce que GitHub ?

[GitHub](https://github.com/) est une plateforme en ligne de développement collaboratif lancée le 10 avril 2008. Exploitant le logiciel de gestion de versions décentralisé **Git**, la plateforme permet à tout utilisateur d'y héberger ses projets et de les rendre accessibles au développement coopératif grâce à un système de **dépôts**, en anglais, **repository**, retraçant les avancées et modifications apportées aux projets. Outre ses facettes techniques qui attirent les développeurs, l'un des aspects majeurs de GitHub est son **caractère social prononcé**. Avec plus de 50 millions d'utilisateurs inscrits, le site met l'accent sur les interactions entre ceux-ci en proposant des fonctionnalités de suivi d'utilisateurs, suivi de projets, de discussions et bien d'autres encore, le tout dans une optique de laisser la vaste communauté s'approprier la plateforme.

Comme toute plateforme gratuite, elle comporte son lot de limitations. En effet, la partie gratuite de GitHub est principalement orientée autour du développement de projets de particuliers. Dès lors qu'une entreprise ou une équipe privée de développeurs cherche à intégrer GitHub à leur mode de fonctionnement, la version **gratuite n'est plus suffisante** et les organisations sont poussées vers des forfaits payants. Les fonctionnalités ajoutées sont multiples, et peuvent aller d'une simple augmentation de l'espace d'hébergement par utilisateur, à l'ajout de Wikis et de branches protégées. Le détail de ces différents forfaits sont retrouvables [ici](https://github.com/pricing).

### Le marché de la gestion de code

Naturellement, GitHub n'a pas le monopole absolu du développement collaboratif en ligne. Également construit autour de **Git**, [**GitLab**](https://about.gitlab.com/) est sans doute la meilleure alternative à GitHub. Open source, l'outil est privilégié par les entreprises pour son approche DevOps et ses outils d'administration organisationnelle. À d'autres niveaux, on peut également citer les plateformes de gestion de code proposées par Google et Amazon : [Cloud Source](https://cloud.google.com/source-repositories/) et [AWS CodeCommit](https://aws.amazon.com/fr/codecommit/), pouvant également être de bonnes alternatives si l'organisation choisie se base déjà autour des services cloud de Google ou AWS.

### Se lancer sur GitHub

Pour utiliser la plateforme, il faut avant tout se créer un compte sur ce [lien](https://github.com/join). Vous n'aurez qu'à vérifier votre compte à l'aide du lien qui vous sera envoyé à l'adresse mail renseignée.

Une fois que cette étape est faite, deux options se présentent à vous pour interagir avec la plateforme : **Git** ou **GitHub Desktop**. Dans la continuité de ce cours, nous ne nous intéresserons qu'à l'approche avec Git. Il reste intéressant de dire quelques mots sur GitHub Desktop.

[GitHub Desktop](https://desktop.github.com/) est un outil visant à simplifier les interactions avec GitHub en permettant aux utilisateurs de s'affranchir des lignes de commandes Git tout en gardant une vision d'ensemble claire de l'état des projets administrés. Pour les moins férus de `shell` c'est l'alternative idéale, en revanche d'autres plus expérimentés diront que l'application limite les possibilités de part son interface _trop simplifiée_.

**Comme dit précédemment, nous ne présenterons dans ce cours que l'approche de GitHub par Git, assurez vous qu'il est bien installé de votre côté.**

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
        
    