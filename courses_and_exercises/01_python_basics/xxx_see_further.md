- *values : unpacking
    - min_val, max_val = find_min_max(*numbers)
    - name, *line = input().split()
- print(*values, sep=' ', end='\n', file=sys.stdout)
    - sep : separator
    - end : end of line
    - file : file to write to
- map(function, iterable)
    - we are going to make example with list(map(str.upper, mots))
    - list(map(float, line))
- input().split()
    - we are going to make example with list(map(int, input().split()))
    - name, *line = input().split()
- for _ in range(int(input())):
- "{:.xf}".format() : format to x decimal places
    - print("{:.2f}".format(sum(student_marks[query_name])/len(student_marks[query_name])))
    - why round(a, x) doesn't work and we use "{:.xf}".format()
- __builtins__ module
    - dir(__builtins__)
    - help(__builtins__)
    - help(__builtins__.abs) ...
- import builtins
    - dir(builtins)
- hash() : return a hash value of an object
    - if __name__ == '__main__':
        n = int(input())
        integer_list = map(int, input().split())
        
        tup = tuple(integer_list)
        print(hash(tup)) 


