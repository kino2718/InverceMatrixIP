#! /usr/bin/env python3
import random
import numpy as np

fin = open('input.txt', 'w') # 入力ファイル
fref = open('ref.txt', 'w') # 比較ファイル

REPEAT = 4
RAND_RANGE = 10

for i in range(REPEAT):
    A = np.array([[0., 0., 0.], [0., 0., 0.], [0., 0., 0.]])
    for i in range(3):
        for j in range(3):
            A[i, j] = random.uniform(-RAND_RANGE, RAND_RANGE)

    #print("A = \n", A)
    try:
        Ainv = np.linalg.inv(A)
    except np.linalg.linalg.LinAlgError:
        Ainv = np.array([[0, 0, 0], [0, 0, 0], [0, 0, 0]])
        
    #print("\nAinv = \n", Ainv)

    for el in A.reshape(-1):
        el2 = int(el * 2**8) # フォーマットは7Q8
        el2 &= 0xffff
        s = "{0:04x}".format(el2)
        # 入力ファイルに書き込む
        #print(s)
        print(s, file=fin)
        
    # 比較ファイルに出力する
    s = "{val} {tlast}".format(val=Ainv[0, 0], tlast='0')
    #print(s)
    print(s, file=fref)

    s = "{val} {tlast}".format(val=Ainv[0, 1], tlast='0')
    #print(s)
    print(s, file=fref)

    s = "{val} {tlast}".format(val=Ainv[0, 2], tlast='0')
    #print(s)
    print(s, file=fref)

    s = "{val} {tlast}".format(val=Ainv[1, 0], tlast='0')
    #print(s)
    print(s, file=fref)

    s = "{val} {tlast}".format(val=Ainv[1, 1], tlast='0')
    #print(s)
    print(s, file=fref)

    s = "{val} {tlast}".format(val=Ainv[1, 2], tlast='0')
    #print(s)
    print(s, file=fref)

    s = "{val} {tlast}".format(val=Ainv[2, 0], tlast='0')
    #print(s)
    print(s, file=fref)

    s = "{val} {tlast}".format(val=Ainv[2, 1], tlast='0')
    #print(s)
    print(s, file=fref)

    s = "{val} {tlast}".format(val=Ainv[2, 2], tlast='1')
    #print(s)
    print(s, file=fref)

fin.close()
fref.close()
