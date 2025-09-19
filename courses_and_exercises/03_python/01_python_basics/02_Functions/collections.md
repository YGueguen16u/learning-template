# Collections

When the number of arguments  are unknown for a function, They can all be packed into a tuple as shown:

```python
def add_to_playlist(*songs):  # Pack all songs into a tuple
    print(f"Adding {len(songs)} songs to playlist:")
    for i, song in enumerate(songs, 1):
        print(f"{i}. {song}")
    print("Playlist updated!")

# Adding 3 songs
add_to_playlist('Thunderstruck', 'Highway to Hell', 'Back in Black')

# Adding 5 songs
add_to_playlist('Bohemian Rhapsody', 'Stairway to Heaven', 'Sweet Child O Mine', 
                'Hotel California', 'Smoke on the Water')
```

```
Adding 3 songs to playlist:
1. Thunderstruck
2. Highway to Hell
3. Back in Black
Playlist updated!
Adding 5 songs to playlist:
1. Bohemian Rhapsody
2. Stairway to Heaven
3. Sweet Child O Mine
4. Hotel California
5. Smoke on the Water
Playlist updated!
```

The arguments can also be packed into a dictionary as shown:

```python
def printDictionary(**args):
    for key in args:
        print(key + " : " + args[key])

printDictionary(Name='John',Province='Ontario',City='Toronto')
```

```
Name : John
Province : Ontario
City : Toronto
```
