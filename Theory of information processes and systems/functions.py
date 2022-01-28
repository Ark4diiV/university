import numpy as np
function_list = np.array([
    # 0
    [
        {
            1: 2
        },
        {  
            2: 9,
            3: 10
        }
    ],
    # 1
    [
        {
           4:3,
           5:7,
           6:8
        }, 
        {
            9:9,
            10:10
        }
    ],
    # 2
    [
        {
            11: 1,
        },
        {
        }
    ],
    # 3
    [
        {
            12: 1,
        }, 
        {
            13: 0,
        }
    ],
    # 4
    [
        {
            14: 1
        }, 
        {
        }
    ],
    # 5
    [
        {
            15: 2,
        },
        {
            16:4,
            17:10,
            18:11
        }
    ],
    # 6
    [
        {
            19:3
        }, 
        {
            20:9,
            21:10
        }
    ],
    # 7
    [
        {
            22: 3,
        }, 
        {
            23: 9,
            24: 10
        }
    ],
    # 8
    [
        {
            25: 3,
            26: 8,
        }, 
        {}
    ],
    # 9
    [
        {
            27: 3,
            28: 6,
        }, 
        {
        }
    ],
    # 10
    [
        {
            29: 10,
            30: 0
        }, 
        {}
    ],
])


def process_part_of_expression(m,
                               F_list,
                               t,
                               dict_of_function_expressions,
                               new_function_list,
                               index_expression,
                               index_side):
    result = 1
    result_F_ = 0

    for num_function in new_function_list[index_expression][index_side]:
        result *= dict_of_function_expressions[num_function](m[new_function_list[index_expression][index_side][num_function]])
    for F_ in F_list:
        result_F_ += F_(t)
    return result * result_F_


def F_1(t):
    return 1

def F_2(t):
    return 1

def F_3(t):
    return 1

def F_4(t):
    return 1

def F_5(t):
    return 1

def F_6(t):
    return 1

def F_7(t):
    return 1


def pend(m, t, dict_of_function_expressions, new_function_list):
    dudt = [
        # 0
        (process_part_of_expression(m,
                                    [F_1],
                                    t,
                                    dict_of_function_expressions,
                                    new_function_list,
                                    0, 0)
         -
         process_part_of_expression(m,
                                    [F_3,F_4],
                                    t,
                                    dict_of_function_expressions,
                                    new_function_list,
                                    0, 0)),

        # 1
        (process_part_of_expression(m,
                                    [F_1,F_5],
                                    t,
                                    dict_of_function_expressions,
                                    new_function_list,
                                    1, 0)
         -
         process_part_of_expression(m,
                                    [],
                                    t,
                                    dict_of_function_expressions,
                                    new_function_list,
                                    1, 0)),

        # 2
        (process_part_of_expression(m,
                                    [F_1, F_3, F_4],
                                    t,
                                    dict_of_function_expressions,
                                    new_function_list,
                                    2, 0)),

        # 3
        (process_part_of_expression(m,
                                    [],
                                    t,
                                    dict_of_function_expressions,
                                    new_function_list,
                                    3, 0)
         -
         process_part_of_expression(m,
                                    [F_1, F_3, F_4],
                                    t,
                                    dict_of_function_expressions,
                                    new_function_list,
                                    3, 0)),

        # 4
        (process_part_of_expression(m,
                                    [F_2],
                                    t,
                                    dict_of_function_expressions,
                                    new_function_list,
                                    4, 0)),

        # 5
        (process_part_of_expression(m,
                                    [F_5,F_6],
                                    t,
                                    dict_of_function_expressions,
                                    new_function_list,
                                    5, 0)
         -
         process_part_of_expression(m,
                                    [F_7],
                                    t,
                                    dict_of_function_expressions,
                                    new_function_list,
                                    5, 0)),

        # 6
        (process_part_of_expression(m,
                                    [],
                                    t,
                                    dict_of_function_expressions,
                                    new_function_list,
                                    6, 0)),

        # 7
        (process_part_of_expression(m,
                                    [],
                                    t,
                                    dict_of_function_expressions,
                                    new_function_list,
                                    7, 0)
         -
         process_part_of_expression(m,
                                    [],
                                    t,
                                    dict_of_function_expressions,
                                    new_function_list,
                                    7, 0)),

        # 8
        (process_part_of_expression(m,
                                    [],
                                    t,
                                    dict_of_function_expressions,
                                    new_function_list,
                                    8, 0)),

        # 9
        (process_part_of_expression(m,
                                    [F_6],
                                    t,
                                    dict_of_function_expressions,
                                    new_function_list,
                                    9, 0)),

        # 10
        (process_part_of_expression(m,
                                    [F_6, F_7],
                                    t,
                                    dict_of_function_expressions,
                                    new_function_list,
                                    10, 0)
         -
         process_part_of_expression(m,
                                    [F_5],
                                    t,
                                    dict_of_function_expressions,
                                    new_function_list,
                                    10, 0)),
    ]
    return dudt
