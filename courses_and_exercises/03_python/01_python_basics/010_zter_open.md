# open()
    
Maintenant que vous avez découvert la liste des built-in functions, c’est le moment pour moi de vous présenter la fonction open(), qui fait partie de cette liste et qui est très importante !

open() sert à ouvrir des fichiers. Pour s’entrainer avec, il va nous falloir un fichier texte à ouvrir et à lire. Commencez par créer un fichier texte vide appelé ultima_verba.txt.

Quand le fichier est créé, copiez/collez les deux dernières strophes du poème suivant de Victor Hugo:

> J'accepte l'âpre exil, n'eût-il ni fin ni terme, Sans chercher à savoir et sans considérer Si quelqu'un a plié qu'on aurait cru plus ferme, Et si plusieurs s'en vont qui devraient demeurer.
>Si l'on n'est plus que mille, eh bien, j'en suis ! Si même Ils ne sont plus que cent, je brave encor Sylla ; S'il en demeure dix, je serai le dixième ; Et s'il n'en reste qu'un, je serai celui-là !
    
Pour vérifier que tout a bien fonctionné, après avoir enregistré le fichier, vous pouvez utiliser la fonctionnalité “cat” dans le terminal:


![[01_01.png]]
    
    
### Lire un fichier avec open
    
On a maintenant un fichier texte qu’on peut ouvrir avec python. Top ! Voici comment utiliser la fonction open() pour ouvrir ce fichier:

![[01_02.png]]
ici, je commence par créer un fichier test.txt à la volée depuis le terminal (avec la commande echo et le chevron >)

Puis j’utilise python pour ouvrir le fichier, le lire, le print() et le fermer).]
    

### Ecrire dans un fichier avec open()
    
Essayez de deviner ce que va faire le code suivant, puis testez le dans replit:
    
```python
fichier = open('test.txt', 'r')
fichier.write("yo")
fichier.close()
```
    
- Que se passe-t’il ?
        
Vous avez surement eu cette erreur:

C’est parce que vous avez ouvert le fichier en lecture seule !

⇒ Avec le , ‘r’ dans votre fonction open() 🙂

Essayez maintenant de remplacer le ‘r’ par ‘w’ (vous l’aurez deviné, ‘r’ veut dire read (lire en anglais) et ‘w’ veut dire write (écrire).

- résultat
	
	```python
	fichier = open('test.txt', 'w')
	fichier.write("yo")
	fichier.close()
	```
        
Le terminal ne renvoie rien, ni erreur ni autre. C’est normal, on a juste écrit dans un fichier sans mettre aucun print(). Par contre vous pouvez utiliser la commande terminal “cat” qu’on a vu un peu plus haut pour vérifier que votre fichier test.txt existe et qu’il contient bien “yo” :
        
Ré écrivez à nouveau dans le fichier test.txt, mais cette fois ci mettez “Le lion ne s’associe pas avec le cafard” Faites à nouveau un cat pour voir le résultat. Que constatez vous ?
    
- résultat
        
![[01_03.png]]
        
On récupère bien la réplique de Gérard Darmon dans Astérix et Obélix Mission Cléopatre… … par contre, le “yo” a disparu !
        
J’ai fait exprès de vous demander d’écrire dans “test.txt” pour ces mini exercices, pour vous éviter d’avoir à recopier une 2e fois le poème dans Ultima_verba.
        
Il se trouve que le mode “w” _écrase_ le fichier.
        
On va voir tout de suite comment ajouter du texte à un fichier sans écraser ce qu’il y avait dedans auparavant.
        
### Ajouter du texte à un fichier avec open()
    
Pour ajouter du texte sans écraser l’ancien, il y a un 3e mode: “a”. Pouvez-vous deviner pourquoi on utilise la lettre “a” dans ce cas de figure ?
    
- indice / rappel
        
	c’est la première lettre d’une méthode qu’on a utilisé avec les listes ;)
        
- solution
        
    ‘a’ est la première lettre de append. Cette méthode servait à ajouter un nouvel item à la fin d’une liste: my_list.append(”nouvel item”)
        
    
Exercice:

Supprimez tout ce qu’il y a dans le fichier [main.py](http://main.py) Puis utilisez open() pour ouvrir le fichier ultima_verba.txt et ajouter _à la fin_ la ligne suivante:

“\nVictor Hugo, Jersey, 2 décembre 1852\n”


🚨 N’oubliez pas le fichier.close() à la fin, sinon vous pourriez vous retrouver dans une situation similaire à celle sur Windows où vous ne pouvez pas supprimer ou modifier le fichier parce qu’il est ouvert par un autre utilisateur:
    
![[01_04.png]]
    
Il y a une manière de s’assurer que vous n’aurez jamais ce problème sans avoir besoin d’utiliser à chaque fois la méthode .close(). Je vais vous la montrer, mais pas vous l’expliquer car elle utilise un “context manager”, et c’est une notion trop avancée pour l’instant. (“Thou shalt not cast pearls before swine”; Matthew 7:6 😛 )
    
```python
with open("my_new_file.txt", mode="r") as f:
		print(f.read())
```
    
