import sys
if __name__ == '__main__':
    args = sys.argv
    if len(args) <= 1:
        raise NameError('No se han introducido args a main')
    a = int(args[1])
    b = int(args[2])
    print 'a ='+str(a)
    print 'b ='+str(b)
    print a + b
