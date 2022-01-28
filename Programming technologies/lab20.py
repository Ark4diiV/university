import random
a = []
# Генерируем рандомный массив
for i in range(10):
    a.append(random.randint(-100, 100))
# Выводим его
print('We have an array: ', end='')
for i in a:
    print(i, ' ', end='')
print()
print('----------------')
# Новый массив, куда запишем наименьшие 3 числа
minimal = []
# Отсекаем 3 наименьших числа и пишем их во временный массив
for x in range(3):
    minimal.append(min(a))
    a.remove(min(a))
# Вывод
print('Smallest 3 numbr: ', end='')
for i in minimal:
    print(i, '', end='')