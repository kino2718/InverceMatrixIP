#! /usr/bin/env python3
import numpy as np

fin = open('input.txt', 'w') # 入力ファイル
fref = open('ref.txt', 'w') # 比較ファイル

mat1 = np.array([[1, 2], [3, 4]])
mat2 = np.array([[1, 2], [3, 9]])
mat3 = np.array([[21, 9], [-13, 69]])
mat4 = np.array([[1, 1], [1, 2]])
for A in (mat1, mat2, mat3, mat4):
    #print("A = \n", A)
    try:
        Ainv = np.linalg.inv(A)
    except np.linalg.linalg.LinAlgError:
        Ainv = np.array([[0, 0], [0, 0]])
        
    #print("\nAinv = \n", Ainv)

    for el in A.reshape(-1):
        el2 = el * 2**8 # フォーマットは7Q8
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

    s = "{val} {tlast}".format(val=Ainv[1, 0], tlast='0')
    #print(s)
    print(s, file=fref)

    s = "{val} {tlast}".format(val=Ainv[1, 1], tlast='1')
    #print(s)
    print(s, file=fref)

fin.close()
fref.close()
