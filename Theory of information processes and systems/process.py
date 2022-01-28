import matplotlib.pyplot as plt
import numpy as np
from scipy.integrate import odeint
from ui_dialog import *
from radar_diagram import RadarDiagram
from functions import pend, function_list, F_1, F_2, F_3, F_4, F_5, F_6, F_7
from sklearn import preprocessing
from random import randint


dict_of_function_expressions = dict()
free_members_of_fun_expr = []

data_sol = []


def init():
    dict_of_function_expressions[0] = function_0
    dict_of_function_expressions[1] = function_1
    dict_of_function_expressions[2] = function_2
    dict_of_function_expressions[3] = function_3
    dict_of_function_expressions[4] = function_4
    dict_of_function_expressions[5] = function_5
    dict_of_function_expressions[6] = function_6
    dict_of_function_expressions[7] = function_7
    dict_of_function_expressions[8] = function_8
    dict_of_function_expressions[9] = function_9
    dict_of_function_expressions[10] = function_10
    dict_of_function_expressions[11] = function_11
    dict_of_function_expressions[12] = function_12
    dict_of_function_expressions[13] = function_13
    dict_of_function_expressions[14] = function_14
    dict_of_function_expressions[15] = function_15
    dict_of_function_expressions[16] = function_16
    dict_of_function_expressions[17] = function_17
    dict_of_function_expressions[18] = function_18
    dict_of_function_expressions[19] = function_19
    dict_of_function_expressions[20] = function_20
    dict_of_function_expressions[21] = function_21



def handle(ui):
    ui.pushButton_2.clicked.connect(lambda: ui.label_15.setPixmap(QtGui.QPixmap('./figure.png')))
    ui.pushButton_3.clicked.connect(lambda: fillDiagrams(ui, data_sol, labels_array()))
    ui.comboBox_1.activated[str].connect(lambda text: activatedCombox(0, text))
    ui.comboBox_2.activated[str].connect(lambda text: activatedCombox(1, text))
    ui.comboBox_3.activated[str].connect(lambda text: activatedCombox(2, text))
    ui.comboBox_4.activated[str].connect(lambda text: activatedCombox(3, text))
    ui.comboBox_5.activated[str].connect(lambda text: activatedCombox(4, text))
    ui.pushButton.clicked.connect(lambda: process(ui, 
    [
        [
            float(ui.begin_expression_lineEdit_1.text()),
            float(ui.begin_expression_lineEdit_2.text()),
            float(ui.begin_expression_lineEdit_3.text()),
            float(ui.begin_expression_lineEdit_4.text()),
            float(ui.begin_expression_lineEdit_5.text()),
            float(ui.begin_expression_lineEdit_6.text()),
            float(ui.begin_expression_lineEdit_7.text()),
            float(ui.begin_expression_lineEdit_8.text()),
            float(ui.begin_expression_lineEdit_9.text()),
            float(ui.begin_expression_lineEdit_10.text()),
            float(ui.begin_expression_lineEdit_11.text()),
        ],
        [
            [
                float(ui.expression_lineEdit_1_1.text()), 
            ],
            [
                float(ui.expression_lineEdit_2_1.text())
            ],
            [
                float(ui.expression_lineEdit_3_1.text())
            ],
            [
                float(ui.expression_lineEdit_4_1.text())
            ],
            [
                float(ui.expression_lineEdit_5_1.text())
            ],
            [
                float(ui.expression_lineEdit_6_1.text())
            ],
            [
                float(ui.expression_lineEdit_7_1.text())
            ],
        ]
    ]
    ))


def activatedCombox(index, text):
    if index == 0:
        dict_of_function_expressions[int(text)] = function_0
    elif index == 1:
        dict_of_function_expressions[int(text)] = function_1
    elif index == 2:
        dict_of_function_expressions[int(text)] = function_2
    elif index == 3:
        dict_of_function_expressions[int(text)] = function_3
    elif index == 4:
        dict_of_function_expressions[int(text)] = function_4
    elif index == 5:
        dict_of_function_expressions[int(text)] = function_5
    elif index == 6:
        dict_of_function_expressions[int(text)] = function_6
    elif index == 7:
        dict_of_function_expressions[int(text)] = function_7
    elif index == 8:
        dict_of_function_expressions[int(text)] = function_8
    elif index == 9:
        dict_of_function_expressions[int(text)] = function_9
    elif index == 10:
        dict_of_function_expressions[int(text)] = function_10
    elif index == 11:
        dict_of_function_expressions[int(text)] = function_11
    elif index == 12:
        dict_of_function_expressions[int(text)] = function_12
    elif index == 13:
        dict_of_function_expressions[int(text)] = function_13
    elif index == 14:
        dict_of_function_expressions[int(text)] = function_14
    elif index == 15:
        dict_of_function_expressions[int(text)] = function_15
    elif index == 16:
        dict_of_function_expressions[int(text)] = function_16
    elif index == 17:
        dict_of_function_expressions[int(text)] = function_17
    elif index == 18:
        dict_of_function_expressions[int(text)] = function_18
    elif index == 19:
        dict_of_function_expressions[int(text)] = function_19
    elif index == 20:
        dict_of_function_expressions[int(text)] = function_20
    elif index == 21:
        dict_of_function_expressions[int(text)] = function_21

def function_0(u):
    return free_members_of_fun_expr[0][0] * u**0.8 * 0.0186

def function_1(u):
    return free_members_of_fun_expr[1][0] * u * 0.01

def function_2(u):
    return free_members_of_fun_expr[2][0] * u ** 2

def function_3(u):
    return free_members_of_fun_expr[3][0] * u

def function_4(u):
    return free_members_of_fun_expr[4][0] * u ** 2

def function_5(u):
    return free_members_of_fun_expr[5][0]

def function_6(u):
    return free_members_of_fun_expr[6][0]

def function_7(u):
    return free_members_of_fun_expr[0][0] * u ** 3

def function_8(u):
    return free_members_of_fun_expr[1][0] * u

def function_9(u):
    return free_members_of_fun_expr[2][0] * u ** 2

def function_10(u):
    return free_members_of_fun_expr[3][0] * u

def function_11(u):
    return free_members_of_fun_expr[4][0] * u ** 2

def function_12(u):
    return free_members_of_fun_expr[5][0]

def function_13(u):
    return free_members_of_fun_expr[6][0]

def function_14(u):
    return free_members_of_fun_expr[0][0] * u ** 3

def function_15(u):
    return free_members_of_fun_expr[1][0] * u

def function_16(u):
    return free_members_of_fun_expr[2][0] * u ** 2

def function_17(u):
    return free_members_of_fun_expr[3][0] * u

def function_18(u):
    return free_members_of_fun_expr[4][0] * u ** 2

def function_19(u):
    return free_members_of_fun_expr[5][0]

def function_20(u):
    return free_members_of_fun_expr[6][0]

def function_21(u):
    return free_members_of_fun_expr[3][0] * u

def draw_third_graphic(t):
    fig = plt.figure(figsize=(11, 10))
    plt.subplot(1, 1, 1)
    y1 = []
    y2 = []
    y3 = []
    y4 = []
    y5 = []
    y6 = []
    y7 = []

    for i in t:
        y1.append(F_1(i))
        y2.append(F_2(i))
        y3.append(F_3(i))
        y4.append(F_4(i))
        y5.append(F_5(i))
        y6.append(F_6(i))
        y7.append(F_7(i))

    plt.plot(t, y1, label='общее количество выброшенных аварийно химически опасных веществ на объекте')
    plt.plot(t, y2, label='количество персонала на химически опасном объекте')
    plt.plot(t, y3, label='скорость ветр')
    plt.plot(t, y4, label='температура воздуха')
    plt.plot(t, y5, label='время до начала оповещения')
    plt.plot(t, y6, label='численность населения')
    plt.plot(t, y7, label='количество убежищ')

    plt.legend(loc='best')
    plt.xlabel('t')
    plt.grid()
    fig.savefig("./figure2.png")


def fillDiagrams(ui, data, labels):
    radar1 = RadarDiagram()
    radar1.draw('./diagram.png', [data[0]], labels, "Характеристики системы в начальный момент времени")
    radar1.draw('./diagram2.png', (data[0], data[int(len(data)/4)]), labels, "Характеристики системы в 1 четверти")
    radar1.draw('./diagram3.png', (data[0], data[int(len(data)/2)]), labels, "Характеристики системы во 2 четверти")
    radar1.draw('./diagram4.png', (data[0], data[int(len(data))-1]), labels, "Характеристики системы в 3 четверти")
    radar1.draw('./diagram5.png', (data[0], data[int(len(data))-1]), labels, "Характеристики системы в последний момент времени")
    ui.label_53.setPixmap(QtGui.QPixmap('./diagram.png'))
    ui.label_54.setPixmap(QtGui.QPixmap('./diagram2.png'))
    ui.label_38.setPixmap(QtGui.QPixmap('./diagram3.png'))
    ui.label_55.setPixmap(QtGui.QPixmap('./diagram4.png'))
    ui.label_62.setPixmap(QtGui.QPixmap('./diagram5.png'))


# Выявление из краткой записи ф-ий дифф. ур-ий какие необходимо заменить на уравнения, а какие удалить (превратить в 1)
def process_function_list(num_functions):
    new_function_list = []
    for ind, expression in enumerate(function_list):
        new_expression = []
        for ind2, part in enumerate(expression):
            new_expression.append(np.intersect1d(list(part), num_functions))
            function_list[ind][ind2] = recreate(new_expression[ind2], part)

def recreate(new_expression, part):
    new_part = {}
    for ind in new_expression:
        new_part[ind] = part[ind]
    return new_part
    
def create_graphic(t, data):
    fig, axs = plt.subplots(figsize=(15, 10))
    plt.subplot(1, 1, 1)
    for i in range(11):
        plt.plot(t, data[:, i])
    plt.legend(labels_array(), loc='best')
    plt.xlabel('t')
    axs.legend(labels_array(), loc=(.75, .64),
                            labelspacing=0.1, fontsize='small')
    plt.grid()

    plt.xlim([0, 1])
    draw_third_graphic(t)
    fig.savefig('./figure.png')


def labels_array():
    return [
        "время испарения химически опасных веществ в районе аварии с поверхности земли",
        "время ликвидации последствий аварии на химически опасном объекте",
        "площадь заражени",
        "время подхода первичного и/или вторичного облака к населенным пунктам",
        "количество пораженных от первичного облака, чел.",
        "количество пораженных от вторичного облака, чел.",
        "количество госпитализированных, чел",
        "количество пораженной техники, ед.",
        "количество растворов для обеззараживания местности",
        "количество сил и средств, необходимых для проведения аварийно-спасательных работ",
        "эффективность системы оповещения, %.",
    ]

def process(ui, numbers):
    global data_sol
    global free_members_of_fun_expr
    start_value = numbers[0]

    init()

    free_members_of_fun_expr = numbers[1]
    t = np.linspace(0, 2, 80)
    process_function_list(list(dict_of_function_expressions.keys()))

    data_sol = odeint(pend, start_value, t, args=(dict_of_function_expressions, function_list))
    data_sol = preprocessing.normalize(data_sol)
    ui.expression_lineEdit_41.setText("Выполнено")
    create_graphic(t, data_sol)
