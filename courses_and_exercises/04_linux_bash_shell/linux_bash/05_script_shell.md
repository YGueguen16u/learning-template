# Script Shell

## 5.1 Langage Bash

**Bash** est un langage installé par défaut sur les machines Linux et permet de piloter la manipulation des fichiers.

### Exécuter des scripts Bash

Un script Bash est un simple fichier contenant des lignes de codes écrites en Bash qui peuvent être exécutés. Il contient à sa base, un **shebang**, qui correspond à un indicateur de l'emplacement du shell qui doit être utilisé pour exécuter le code et se présente sous cette forme :

```shell
#!/bin/bash
```

C'est quelque chose que vous trouverez dans de nombreux scripts, pas seulement dans les scripts Bash : par exemple, au début d'un script Python, vous pouvez trouver une ligne du type `#!/bin/python3`. Cela permet au fichier de s'exécuter de lui-même.

> Ouvrez un fichier nommé `script.sh` avec `nano`. Ajoutez le shebang correspondant à Bash et une autre ligne qui répertorie le contenu du répertoire `/`. Ensuite, quittez l'édition du fichier et enregistrez-le.

Il y a deux façons d'exécuter le fichier :

```shell
bash script.sh
./script.sh
```

Dans le premier cas, nous lisons uniquement le contenu du fichier et le transmettons à Bash. Dans le second cas, nous l'exécutons. Par défaut, cela devrait déclencher une erreur car vous n'avez pas le droit d'exécuter ce fichier.

Modifiez les droits pour rendre ce fichier exécutable par vous et essayez de le relancer:

```shell
chmod +x script.sh
```

## 5.2 Les bases en Bash

### Commentaires

Tout d'abord, comme pour tout langage de programmation, vous pouvez commenter des parties de votre code. Pour ce faire, vous pouvez commenter une ligne en utilisant `#` au début de celle-ci.

### Définir une variable

Pour définir une variable, nous pouvons utiliser `=`. Par exemple, nous pouvons définir la variable `my_variable` de la façon suivante :

```shell
my_variable=hello
```

> Essayez d'utiliser la commande `echo` pour imprimer le contenu de la variable avec :

```shell
echo my_variable
```

Vous devriez voir que cette commande retourne `my_variable`. C'est parce que vous devez vous référer à la valeur même de la variable en précédant celle-ci par `$`.

> Essayez la ligne de code suivante pour vous en rendre compte :

```shell
echo $my_variable
```

Notez que les variables ne sont pas typées et doivent apparaître sous forme de tableaux ou listes de caractères, mais certaines peuvent être utilisées pour des opérations arithmétiques, comparaisons, ...

### Guillemets

Si vous souhaitez attribuer une phrase à une variable, vous rencontrerez quelques problèmes :

> Essayez par exemple :

```shell
my_variable=hello world
```

Nous nous rendons compte que l'espace rompt l'affectation de variable. Vous devez utiliser des guillemets pour correctement définir votre variable :

```shell
my_variable="hello world"
echo $my_variable
```

**Attention pas d'espace entre le `=`et les termes**e
Il existe plusieurs types de guillemets : `'`, `"` et ` .

> Pour comprendre les différences entre les deux premiers, exécutez les lignes suivantes :

```shell
echo 'the content of my variable is $my_variable'
echo "the content of my variable is $my_variable"
```

Le dernier est utilisé pour affecter le résultat d'une commande Bash à une variable :

```shell
my_variable=`ls -l`
echo $my_variable
```

### Opérations mathématiques

Nous pouvons définir des opérations mathématiques en Bash en utilisant le mot-clé `let` :

```shell
let "a=1"
let b=2
let "c=b"
let "d = a + b * c"
echo $d
```

Les opérations mathématiques sont assez similaires aux autres langages de programmation : `+`, `-`, `*`, `/`, `**`, ... .

### Tableaux

Nous pouvons définir des objets similaires à des listes **tableaux** (_array_), pour stocker plusieurs valeurs à la fois :

```shell
my_array=(hello world)
```

Pour accéder aux différentes valeurs du tableau, nous pouvons utiliser la syntaxe suivante, en tenant compte du fait que l'indexation d'un tableau commence à partir de 0 :

```shell
echo ${my_array[0]}
```

Pour lui attribuer de nouvelles valeurs, nous pouvons utiliser :

```shell
my_array[0]=Hi
echo ${my_array[0]}
```

Et pour renvoyer le tableau complet, nous remplaçons simplement l'index par `*` .

```shell
echo ${my_array[*]}
```

Pour ajouter des éléments à la liste, nous attribuons simplement des valeurs aux indices qui ne sont pas encore attribués dans le tableau :

```shell
my_array[2]=or
my_array[4]=hello
my_array[1000]=world

echo ${my_array[*]}
```

Notez que l'index n'a pas besoin d'être complet en ce sens que les indices n'ont pas besoin de se suivre.

De plus, les tableaux présentent deux fonctionnalités intéressantes :

- `echo ${!my_array[*]}` renvoie les indices des éléments.
    
- `echo ${#my_array[*]}` renvoie le nombre d'éléments.
    

### Boucles et conditions

#### If

Pour vérifier une condition et effectuer une opération si celle-ci est remplie, nous pouvons utiliser une structure **if-then-fi** :

```shell
prenom="Daniel"
if [ $prenom = "Daniel" ]
then
echo "Salut Daniel !"
fi
```

Si vous souhaitez ajouter une instruction `else`, il est possible de le faire avec :

```shell
prenom="Daniel"
if [ "$prenom" = "Daniel" ]; then
    echo "Salut Daniel !"
else
    echo "Bonjour $prenom !"
fi
```

Si nous voulons enchaîner les conditions pour vérifier plusieurs cas :

```shell
prenom="Diane"
if [ $prenom = "Daniel" ]
then
echo "Salut Daniel ! "
elif [ $prenom = "Diane" ]
then
echo "Salut Diane"
else
echo "Bonjour" + $prenom +"!"
fi
```

Nous pouvons faire appel à de nombreux éléments pour créer une condition :

- `$var1 = $var2` teste l'égalité des tableaux de caractères ;
- `$var1 != $var2` teste l'inégalité des tableaux de caractères ;
- `-z $variable` teste si le tableau de caractères est vide ;
- `-n $variable` teste si le tableau de caractères n'est pas vide ;
- `$var1 -eq $var2` teste l'égalité de valeurs numériques ;
- `$var1 -ne $var2` teste l'inégalité de valeurs numériques ;
- `$var1 -gt $var2` teste `var1 > var2` ;
- `$var1 -lt $var2` teste `var1 < var2` ;
- `$var1 -ge $var2` teste `var1 >= var2` ;
- `$var1 -le $var2` teste `var1 <= var2` .

Pour combiner deux conditions, nous pouvons utiliser `&&` (ET) si nous souhaitons que les deux conditions soient vérifiées et `||` (OU) si nous voulons qu'au moins une des deux conditions le soit :

```shell
prenom="Diane"
nom="Datascientest"
if [[ $prenom == "Daniel" && $nom == "Datascientest" ]]
then
echo "Bonjour Daniel Data"
else
echo "Bonjour" + $prenom + $nom
fi
```

#### While

Pour effectuer une boucle **while** , la syntaxe est la suivante :

```shell
let i=0

while [ $i -lt 10 ]
do
let "i=i+1"
done
echo $i
```

#### For

Pour effectuer une boucle **for** (pour...), la syntaxe est la suivante :

```shell
for x in '1st iteration' '2nd iteration' '3rd iteration'
do
echo $x
done
```

Une fonction intéressante pour ces boucles est `seq`. Cette fonction fournit une suite d'entiers d'un entier de départ à un entier de fin comme suit :

> Exécutez le code suivant :

```shell
seq 3 22
```

### Fonctions

Il y a deux façons pour définir une fonction :

```shell
my_function () {
echo "Nous pouvons faire quelque chose ici"
}
```

Ou

```shell
function my_function {
echo "Nous pouvons faire quelque chose ici"
}
```

Les arguments à passer à la fonction sont donnés par leur numéro. Par exemple une fonction dans laquelle on affiche le premier puis le second argument ressemblera à ceci :

```shell
function my_function {
echo "Premier argument"
echo $1
echo "Second argument"
echo $2
}
```

Enfin pour appeler ma fonction, il suffit simplement d'écrire :

```shell
my_function "Daniel" "24"
``` 