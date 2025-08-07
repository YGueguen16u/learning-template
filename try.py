to_generate = (i**2 for i in [4,5,6])
print(next(to_generate))
print(next(to_generate))
print(next(to_generate))

to_generate = (i**2 for i in [4,5,6])
print(list(to_generate))