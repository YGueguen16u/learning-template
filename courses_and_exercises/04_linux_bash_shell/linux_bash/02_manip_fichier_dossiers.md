# 2. Manipulation de fichier et dossier

Nous allons maintenant voir comment créer des documents et des dossiers dans un terminal Linux.

## 2.1 Création de fichier et dossier

Pour créer un fichier vide, nous passons par la commande `touch` et nous spécifions un nom de fichier.

> Exécutez cette commande pour créer un fichier `my_file` .

```shell
touch my_file
```

Si ce fichier existe déjà, cela ne fait que mettre à jour sa dernière date de modification.

> Dans le dossier maison (`~`), créez les fichiers `file1`, `file2`, `file3` et vérifiez leur existence en utilisant `ls` .

Pour créer un répertoire, on peut utiliser la commande `mkdir` (qui signifie `make directory`) en lui précisant un nom pour ce dossier :

> Exécutez cette commande pour créer un dossier `my_directory` .

```shell
mkdir my_directory
```

> Créez un dossier `directory1` dans le dossier maison.

Nous pouvons aussi créer des fichiers et des dossiers en dehors du dossier courant en utilisant le chemin absolu ou relatif : par exemple, nous pouvons exécuter la commande suivante :

> Créez un fichier `file4` dans ce dossier en utilisant la commande suivante.

```shell
touch ./directory1/file4
```

> Vérifiez que le fichier a bien été créé en utilisant la commande `ls -R ~` qui permet de lister les fichiers de manière récursive.

Nous pouvons utiliser la commande `rm` qui signifie `remove` pour supprimer un fichier ou un dossier:
r l
> Supprimez le fichier `file3` avec cette commande :

```shell
rm file3
```

ou

```shell
rm ./file3
```

ou

```shell
rm /home/ubuntu/file3
```

Pour supprimer une arborescence, c'est à dire un dossier contenant des dossiers ou fichiers, il faut ajouter l'argument `-r` :

> Supprimez le dossier créé précédemment en utilisant la commande :

```shell
rm -r /home/ubuntu/directory1
```

> Créez à présent un dossier `directory2` dans le dossier maison. Nous pouvons bien évidemment copier/coller des fichiers/dossiers en utilisant `cp` ou les déplacer en utilisant `mv`.

> Copiez le fichier `file1` et collez le dans le dossier `directory2` en utilisant la commande suivante :

```shell
cp ./file1 ./directory2/
```

Nous pouvons faire la même chose en donnant un nouveau nom au fichier de destination:

```shell
cp ./file1 ./directory2/new_file1
```

> Déplacez le fichier `file2` dans le dossier `directory2` en le renommant `new_file2` avec la commande :

```shell
mv ./file2 ./directory2/new_file2
```

Nous pouvons utiliser `mv` pour renommer un fichier si le fichier de destination est dans le même répertoire que le fichier d'origine. Observez tous les changements avec la commande `ls -R` . Pour copier des dossiers, on peut utiliser l'argument `-r` comme nous pouvons le faire avec la commande `cp` .

## 2.2 Édition et lecture de fichier

### Imprimer dans un fichier

Pour imprimer du texte, nous pouvons utiliser la commande `echo`.

> Essayez cette commande avec cet exemple :

```shell
echo hello world
```

Nous affichons `hello world` dans la sortie standard, c'est-à-dire ici le terminal. Pour rediriger cette impression, il faut utiliser les caractères `>` ou `>>` puis spécifier le nom d'un fichier.

Par exemple, nous pouvons écrire `hello world` dans le fichier `file1` en utilisant cette commande :

> Exécutez cette commande pour écrire une ligne dans le `file1` .

```shell
echo hello world > file1
```

La différence entre ces deux possibilités est que la première écrase le contenu du fichier avant d'écrire dedans alors que la seconde ajoute le contenu à la suite du fichier s'il existe déjà. Dans le cas où le fichier n'existe pas, les deux commandes sont équivalentes : nous créons le fichier et nous ajoutons le résultat de la commande `echo` dans le fichier. Pour afficher le contenu d'un fichier, nous pouvons utiliser la commande `cat`.

> Essayez d'afficher le contenu du fichier `file1` :

```shell
cat file1
```

Cette commande devrait retourner `hello world` .

> Exécutez les commandes suivantes :

```shell
echo hello world > file1
echo hello world > file1

echo hello world >> file2
echo hello world >> file2
```

Affichez ensuite le contenu de ces deux fichiers : le premier ne devrait contenir qu'une seule ligne alors que le second devrait en contenir deux. Nous pouvons utiliser ce système de redirection avec toute commande qui imprime sur la sortie standard.

> Exécutez la commande suivante pour imprimer la liste du contenu de la racine `/` dans un fichier appelé `root_content` .

```shell
ls / > root_content
```

> Affichez ensuite son contenu en utilisant la commande `cat` .

Dans certains cas, par exemple lorsque les fichiers sont trop volumineux, nous ne voulons afficher que le début ou la fin du fichier. Dans ce cas, nous pouvons utiliser `head` ou `tail`. Ces deux commandes peuvent prendre l'argument `-n` qui introduit un nombre de lignes à afficher. Essayez ces deux commandes avec le fichier `root_content` :

> Exécutez cette commande :

```shell
head -n 2 root_content
tail -n 3 root_content
```

## 2.3 Éditeur de textes

Dans les parties précédentes, nous avons vu comment ajouter du contenu à un fichier de manière automatique avec le résultat d'une commande. Nous pouvons vouloir utiliser un moyen plus simple pour modifier le contenu d'un fichier. Sachant que nous allons être amenés à créer des scripts, il nous faut un vrai éditeur de texte qui va utiliser une coloration spéciale pour nous aider à y voir clair dans notre code. Il existe différents outils sous linux qui permettent de répondre à cette problématique comme `Nano` ou `Vim`. Le choix de l'éditeur dépendra de votre préférence personnelle.

### Nano

> Tapez `nano` pour ouvrir cet éditeur et ajoutez quelques lignes.

Maintenant, passons en revue quelques commandes de base :

**Déplacements**

Utilisez les touches de direction pour naviguer dans le fichier. Pour aller en haut ou en bas d'une page, utilisez les touches `ctrl + y` ou `ctrl + v`, respectivement. Pour aller directement à une ligne spécifique, utilisez la combinaison `ctrl + _` et entrez le numéro de ligne.

**Édition du texte**

Pour insérer du texte, placez simplement le curseur à l'endroit où vous souhaitez ajouter du contenu et commencez à taper. Pour supprimer du texte, déplacez le curseur sur le caractère que vous souhaitez supprimer et appuyez sur la touche `Suppr` ou `Retour`.

**Copier, couper et coller**

Pour copier du texte, placez le curseur à l'endroit où vous souhaitez commencer la copie, appuyez sur `ctrl + ^`, déplacez-vous jusqu'à la fin de la sélection et appuyez sur `alt + 6`. Pour couper du texte, suivez la même procédure que pour la copie, mais remplacez `alt + 6` par `ctrl + K`. Pour coller le texte copié ou coupé, placez le curseur à l'endroit où vous souhaitez insérer le contenu et utilisez `ctrl + U`.

**Enregistrer et quitter**

Pour enregistrer le fichier, utilisez `ctrl + O` et appuyez sur Entrée. Vous pouvez spécifier le nom de fichier si vous souhaitez enregistrer sous un nouveau nom. Pour quitter Nano, utilisez `ctrl + x`. Si des modifications n'ont pas été enregistrées, **Nano** vous demandera de les enregistrer avant de quitter.

### VIM

> Tapez `vim` pour ouvrir cet éditeur et ajoutez quelques lignes.

Vim possède différents modes, notamment :

- Mode normal : C'est le mode par défaut lorsque vous lancez Vim. Vous pouvez naviguer dans le fichier, effectuer des opérations de modification, etc.
- Mode insertion : Dans ce mode, vous pouvez insérer du texte à l'endroit où se trouve le curseur. Pour sortir du mode insertion, il faut appuyer sur la touche `Echap`
- Mode commande : Ce mode vous permet de lancer des commandes Vim spécifiques.

**Déplacements**

Utilisez les touches de direction pour naviguer dans le fichier en mode normal. Utilisez h (gauche), j (bas), k (haut) et l (droite) pour naviguer avec le clavier. Pour aller directement à une ligne spécifique, utilisez la commande suivante en mode normal :

```bash
:numéro_de_ligne
```

Par exemple, pour aller à la ligne 10, tapez `:10` et appuyez sur `Entrée`.

**Édition du texte**

En mode insertion, vous pouvez simplement commencer à taper du texte pour l'insérer à l'emplacement du curseur. Pour supprimer du texte, utilisez la touche x pour supprimer un caractère ou la commande dd pour supprimer une ligne entière en mode normal.

**Copier, couper et coller**

Pour copier du texte, placez le curseur à l'endroit où vous souhaitez commencer la copie, utilisez la commande y pour copier, déplacez-vous jusqu'à la fin de la sélection et utilisez la commande `p` pour coller. Pour couper du texte, suivez la même procédure que pour la copie, mais utilisez la commande `d` au lieu de `y`. Pour coller le texte copié ou coupé, placez le curseur à l'endroit où vous souhaitez insérer le contenu et utilisez la commande `p`.

**Enregistrer et quitter**

Pour enregistrer le fichier, utilisez la commande `:w` en mode normal et appuyez sur Entrée. Si vous souhaitez enregistrer sous un nouveau nom, utilisez la commande `:w` nom-de-fichier. Vous pouvez aussi vouloir enregistrer et quitter le fichier juste après. Pour se faire, quitter le mode insertion en appuyant sur `Echap` puis `:x` Pour quitter Vim, utilisez la commande `:q` en mode normal. Si des modifications n'ont pas été enregistrées, Vim vous avertira et vous pouvez utiliser `:q!` pour forcer la sortie sans enregistrer.

### Fichier .bashrc

Le fichier `.bashrc` est un fichier de configuration utilisé par le shell Bash, qui est un interpréteur de commandes utilisé principalement dans les systèmes d'exploitation de type Unix, tels que Linux et macOS. Il est spécifique à chaque utilisateur et est situé dans le répertoire personnel.

Le rôle principal du fichier .bashrc est de définir des variables d'environnement, des alias et des fonctions personnalisées pour le shell Bash. Lorsqu'un utilisateur ouvre une session de terminal, le fichier .bashrc est automatiquement exécuté pour charger ces configurations personnalisées.

Il est important de noter que les modifications apportées au fichier .bashrc ne prennent effet que lorsque vous ouvrez une nouvelle session de terminal ou que vous exécutez la commande `source ~/.bashrc` pour recharger les configurations.

Ce fichier est très important et toute modification du contenu originel peut entraîner des problèmes d'exécution ou d'affichage. Nous vous conseillons d'agir avec précaution lorsque vous manipulez ce fichier.

Pour rendre une variable d'environnement persistante, nous allons modifier ce fichier:

```shell
cd
nano .bashrc
```

Aller à la fin du fichier et ajouter la ligne suivante:

```bash
export my_var="Hello"
alias graphic_card='lspci -vnn | egrep "VGA|3D|Display"'
```

Pressez `ctrl+x`, écrivez `Y` puis appuyez sur `entrée` pour valider. La première ligne qui a été ajoutée permet de créer une variable d'environnement persistente qui pourra être appelée à chaque ouverture d'une session. La seconde ligne ajoutée est un alias. Elle permet de définir une commande sous la forme d'un nom personnalisé. Dans ce cas précis, nous avons créé un alias pour une commande qui permet de retourner la liste des cartes graphiques installées sur la machine. Plutôt que de taper plusieurs fois cette commande complexe, nous avons préféré utiliser un alias pour simplifier son utilisation. Attention tout de même à ne pas utiliser en nom d'alias une commande déjà existante.

Si vous voulez activer les modifications faites sur ce fichier lors de votre session actuelle, lancez la commande suivante:

```bash
source .bashrc
```

Maintenant, à chaque redémarrage de votre machine, vous pourrez accéder aux variables `my_var` et à l'alias `graphic_card`.

```bash
echo $my_var
graphic_card
```