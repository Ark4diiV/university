import random
x = []
# Создаём рандомный массив из 10 элементов
for i in range(10):
    x.append(random.randint(-100, 100))
print('Random array: ', end='')
for i in range(len(x)):
    print(x[i], ' ', end='')
print()
print('-------------')
counter = 0
i: int
# Находим в массиве положительные числа и копируем их последовательно в конец
for i in range(len(x)):
    if x[i - counter] >= 0:
        x.append(x[i - counter])
        del x[i - counter]  # Удаляем скопированное число
        counter += 1
print('Frmtd. array: ', end='')
for i in range(len(x)):
    print(x[i], ' ', end='')