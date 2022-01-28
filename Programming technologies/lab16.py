print('Input point coordinates:')
print('x = ', end='')
x0 = float(input())  # Вводим координату по оси x
print()
print('y = ', end='')
y0 = float(input())  # Вводим координату по оси y
x1, y1 = 0, 0
x2, y2 = 2, 0
x3, y3 = 0, 3
# Площадь треугольника:
s = 1 / 2 * abs((x2 - x1) * (y3 - y1) - (x3 - x1) * (y2 - y1))
# Площади треугольников с вершиной в x, y
s1 = 1 / 2 * abs((x0 - x1) * (y3 - y1) - (x3 - x1) * (y0 - y1))
s2 = 1 / 2 * abs((x2 - x1) * (y0 - y1) - (x0 - x1) * (y2 - y1))
s3 = 1 / 2 * abs((x2 - x0) * (y3 - y0) - (x3 - x0) * (y2 - y0))
s4 = s1 + s2 + s3
# Если сумма площадей равна общей площади треугольника, то точка принадлежит данному треугольнику
if s == s1 + s2 + s3:
    print('The point inside of the triangle')
else:
    print('The point outside of the triangle')