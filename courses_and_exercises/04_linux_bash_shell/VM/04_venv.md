# Introduction aux environnements virtuels

---

# Introduction

**Important :** Cette partie n'est pas obligatoire. Elle est présent pour vous donner un complément d'information et d'outils qui pourront s'avérer utiles pendant votre formation.

Bienvenue dans cette section introductive sur les environnements virtuels. L'objectif est de vous fournir un outil supplémentaire, à explorer et à utiliser en fonction de vos besoins spécifiques et de vos projets.

**Idéalement, nous vous recommandons de suivre ce cours après avoir complété le cours sur Linux & Bash.** Cette séquence optimale vous permettra de tirer pleinement parti des connaissances acquises précédemment, facilitant ainsi la mise en pratique des concepts abordés dans ce module.

  

## Qu'est-ce qu'un environnement virtuel ?

### Définition

D'après la documentation officielle de Python, un **environnement virtuel** est un environnement d'exécution isolé permettant aux utilisateurs de Python et aux applications d'installer ou mettre à jour des packages, sans interférer avec d'autres applications Python fonctionnant sur le même système.

  

### Pourquoi utiliser un environnement virtuel ?

Dans un projet de Data Science, nous sommes souvent amenés à utiliser de nombreux packages. Un package peut dépendre d'une version spécifique d'un autre, empêchant la mise à jour de ce dernier. Cet ensemble de contraintes s'appelle les **dépendances**.

Par exemple, il se peut qu'un programme ait été implémenté en utilisant une version obsolète de **scikit-learn**, elle-même dépendant d'une certaine version de **pandas**. D'un autre côté, en créant un nouveau projet avec d'autres dépendances, on s'aperçoit que celui-ci nécessite un autre jeu de dépendances, les versions actuelles créant un conflit dans le nouveau programme.

En attribuant un environnement par projet, on **isole** une copie de Python avec laquelle on peut installer un ensemble de paquets avec leurs versions associées, sans qu'elles n'aient le moindre impact en dehors de cet espace. L'intérêt est principalement de faciliter la **gestion des dépendances** au sein des différents projets dans l'objectif de mitiger les conflits de versions.

  

## Création d'un environnement virtuel

Il existe plusieurs types de virtualisation d'environnement. Pour bien comprendre son principe, nous allons montrer comment isoler vos dépendances python dans cet exemple. Ici on va explorer l'approche avec `venv` et avec `conda`.

  

### Avec venv

> Tout d'abord installez ce package python :

```shell
sudo apt install python3-venv
```

> Vous pouvez créer un environnement virtuel avec Python en utilisant la commande suivante :

```shell
python3 -m venv mon_env
```

Le nom choisi ici permet de repérer un environnement virtuel. Vous pouvez spécifier un nom personnalisé autre que `mon_env` si vous le souhaitez (attention par la suite à garder ce nom).

> Maintenant, rentrez dans votre environnement virtuel et installez les packages pandas et requests avec respectivement les versions 1.5.3 et 2.7.0 :

> Enfin, capturez les dépendances de votre environnement virtuel dans un fichier `requirements.txt` :

De cette manière, en partageant votre code python ainsi que le fichier `requirements.txt`, vous êtes certain que votre code fonctionnera peu importe le destinataire. L'utilisateur n'aura qu'à créer un environnement virtuel Python et à y installer les dépendances spécifiées par le fichier `requirements.txt`.

Pour désactiver un environnement virtuel, il vous suffit de lancer la commande suivante :

```shell
deactivate
```

  

### Avec conda

Pour ce faire il faut avoir Anaconda ou Miniconda installé.

Pour créer un environnement virtuel avec conda vous pouvez utiliser la commande suivante :

```shell
conda create –n mon_environnement python=3.12
```

  
Pour lister les environnements virtuels il suffit d'écrire :

```shell
conda env list
```

  
Quant à l'activation d'un environnement virtuel, la commande est :

```shell
conda activate mon_environnement
```

  
Si l'on souhaite installer une librairie, par exemple `pandas`, on peut utiliser la commande suivante :100:

```shell
conda install pandas==1.5.3
```

  
Pour désactiver l'environnement virtuel :

```shell
conda deactivate
```

  
Et finalement pour le supprimer :

```shell
conda env remove -n nom_environnement
```

  
Terminons cette introduction avec un ensemble de bonnes pratiques à adopter avec les environnements virtuels.

  

## Bonnes pratiques

### Utilisez les environnements virtuels !

Ayez le réflexe de créer un environnement virtuel à chaque fois que vous commencez un nouveau projet. Cela vous permet de vous assurer que vous "_repartez à zéro_", pour ne pas avoir de souci de portabilité à l'avenir. **Une bonne pratique est donc de réserver un environnement par projet.**

N'oubliez pas de vous assurer que l'environnement est bien activé dans votre terminal avant de débuter.

  

### Ne partagez pas un environnement virtuel sur plusieurs projets.

Même si vos projets peuvent se ressembler et partager beaucoup de librairies en commun, il n'est jamais conseillé de réunir les dépendances au sein d'un seul et unique environnement virtuel pour plusieurs projets. Il suffit qu'un projet ait de nouvelles dépendances pour risquer de corrompre les autres projets. De plus, l'espace mémoire économisé via cette pratique n'est pas assez significatif pour justifier un tel risque.

  

### Utilisez un fichier `requirements.txt`

Pour rappel, vous pouvez générer un fichier de dépendances via la commande suivante :

```shell
pip freeze > requirements.txt
```

  
Pour récupérer les librairies dans les versions correspondantes à partir d'un environnement vierge, il suffira de lancer :

```shell
pip install -r requirements.txt
```

  
Il est évidemment possible de créer soi-même un tel fichier (après tout, il ne s'agit que d'un fichier textuel). Si vous décidez de le faire, évitez absolument une contrainte du type `mon_paquet >= 2.2`. Cette ligne signifie que le paquet `mon_paquet` doit avoir une version supérieure à 2.2, sans spécifier de version exacte. Cela réduit considérablement l'intérêt de nos environnements virtuels, souhaitant maximiser la reproductibilité (il se pourrait qu'une version future devienne incompatible avec d'autres paquets).

  

### Attention aux packages très lourds !

Durant la formation, en particulier pour les Data Scientist, nous apprendrons à manipuler des librairies de _Deep Learning_, dont les paquets sont d'une taille non négligeable (_TensorFlow_ par exemple, requiert 1.1 GB d'espace mémoire). Pour cette raison, il peut être gênant de devoir réinstaller la librairie pour chaque environnement virtuel concerné.

Une "_solution_" est d'utiliser l'argument `--system-site-packages` lorsque vous créez un environnement avec `venv`. Cette option permet au nouvel espace de récupérer l'intégralité des paquets installés sur la version Python native au système. De ce fait, les environnements créés avec cette option ne réinstallent pas les librairies déjà présentes !

Naturellement, beaucoup de points sont alors à monitorer avec grand soin : votre environnement Python natif ne doit pas être parasité par une pléthore de librairies, **d'où le réflexe de ne jamais travailler sans environnement virtuel !**

  

# Conclusion

Vous disposez maintenant d'un outil puissant pour gérer les dépendances de vos projets de manière isolée et efficiente.

Dans la prochaine section, nous aborderons succinctement la conteneurisation et Docker, une technologie essentielle pour les Data Engineers. Bien que cette partie ne s'adresse pas à tous les spécialistes en data, elle offre des notions clés sur les conteneurs ainsi que quelques commandes utiles lors de leur manipulation. Ces connaissances seront particulièrement précieuses pour les Data Engineers en formation, car ils seront amenés à manipuler des conteneurs au cours des prochains modules.

Les conteneurs, bien que plus approfondis dans des cours ultérieurs, sont des éléments fondamentaux pour comprendre l'écosystème des technologies utilisées dans la transformation des données. Dans la section suivante, vous apprendrez à gérer les conteneurs qui seront déployés dans le cadre de votre formation.

