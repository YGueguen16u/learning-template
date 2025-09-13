# Collections

Data types like strings, dictionaries, lists, sets and tuples are called sequence data types or containers in Python.

## 1. Séquences (ordre préservé)

- **Définition** : Collections qui maintiennent l'ordre d'insertion des éléments. L'accès aux éléments se fait par index numérique. Chaque élément a une position unique et fixe.
    - **Chaînes de caractères** (strings)
    - **Listes** (lists)
    - **Tuples**
    - **Arrays** (array.array)
    - **Deque** (collections.deque)
    - **Named Tuples** (collections.namedtuple)

## 2. Collections non-séquentielles (pas d'ordre garanti)
- **Définition** : Collections où l'ordre des éléments n'est pas garanti. L'accès se fait généralement par clé ou par hachage plutôt que par position. Optimisées pour la recherche rapide plutôt que pour l'ordre.
    - **Dictionnaires** (dict)
    - **Ensembles** (set, frozenset)
    - **Counter** (collections.Counter)
    - **DefaultDict** (collections.defaultdict)
    - **ChainMap** (collections.ChainMap)

## 3. Collections spécialisées
- **Définition** : Collections conçues pour des cas d'usage spécifiques, avec des optimisations et fonctionnalités adaptées à leur domaine.

### Pour les données
- **Définition** : Collections optimisées pour le traitement et l'analyse de données, avec des opérations vectorisées et des fonctionnalités statistiques.

    - **NumPy Arrays** (np.ndarray)
    - **Pandas Series**
    - **Pandas DataFrames**

### Pour la concurrence
- **Définition** : Collections thread-safe conçues pour la communication et la synchronisation entre processus/threads.
    - **Queue** (queue.Queue)
    - **Heap Queue** (heapq)

### Wrappers
- **Définition** : Classes qui encapsulent les types de base pour permettre leur personnalisation tout en conservant leur interface standard.
    - **UserList**
    - **UserDict**
    - **UserString**