products_db = set([1001, 1002, 1003, 1004, 1005, 1005])
scanned_products = set([1004, 1005, 1006, 1007])
to_remove = {1002, 1003}

print(1006 in products_db)
print(1002 in scanned_products)

products_db.add(1008)

products_db.remove(1001)

removed_id = products_db.pop()
print(removed_id)

db_products = products_db.union(scanned_products)
print(db_products | scanned_products)

print("differenced", db_products.difference(scanned_products))
print("difference operator", db_products - scanned_products)

print(scanned_products.difference(db_products))
print(scanned_products - db_products)

print(db_products.intersection(scanned_products))
print(db_products & scanned_products)

print(db_products.issubset(scanned_products))
print(db_products <= scanned_products)

print(db_products.issuperset(scanned_products))
print(db_products >= scanned_products)

print(scanned_products.issubset(db_products))
print(scanned_products <= db_products)

