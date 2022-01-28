print('Type any number: ', end='')
a = int(input())
result = 0
print('Reversed: ', end='')
while a != 0:
    result = a % 10
    print(result, end="")
    a = a // 10