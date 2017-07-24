#! /usr/bin/env python3
import numpy as np

FIRST_VALUE = 1
NVALUES = 16
LAST_VALUE = FIRST_VALUE + NVALUES
PACKET_LEN = 4

fin = open('input.txt', 'w') # 入力ファイル
fr11 = open('r11.txt', 'w') # 比較ファイル
fr12 = open('r12.txt', 'w') # 比較ファイル
fr13 = open('r13.txt', 'w') # 比較ファイル
fr22 = open('r22.txt', 'w') # 比較ファイル
fr23 = open('r23.txt', 'w') # 比較ファイル
fr33 = open('r33.txt', 'w') # 比較ファイル
fqt11 = open('qt11.txt', 'w') # 比較ファイル
fqt12 = open('qt12.txt', 'w') # 比較ファイル
fqt13 = open('qt13.txt', 'w') # 比較ファイル
fqt21 = open('qt21.txt', 'w') # 比較ファイル
fqt22 = open('qt22.txt', 'w') # 比較ファイル
fqt23 = open('qt23.txt', 'w') # 比較ファイル
fqt31 = open('qt31.txt', 'w') # 比較ファイル
fqt32 = open('qt32.txt', 'w') # 比較ファイル
fqt33 = open('qt33.txt', 'w') # 比較ファイル

mat1 = np.array([[1, 2, 3], [4, 5, 6], [7, 8, -9]])
mat2 = np.array([[-2, 2, 3], [3, 9, 7], [10, 3, -1]])
mat3 = np.array([[21, 9, 16], [-13, 9, -1], [2, 3, -5]])
#mat4 = np.array([[1, 1, 1], [1, 1, 1], [1, 1, 1]])
#for A in (mat1, mat2, mat3, mat4):
for A in (mat1, mat2, mat3):
#for A in (mat1, mat2):
    #print("A = \n", A)
    (Q, R) = np.linalg.qr(A)
    #print("\nR = \n", R)
    #print("\nQ = \n", Q)

    # Rの対角成分を正の値にする
    if R[0, 0] < 0:
        R[0, 0] = -R[0, 0]
        R[0, 1] = -R[0, 1]
        R[0, 2] = -R[0, 2]
        Q[0, 0] = -Q[0, 0]
        Q[1, 0] = -Q[1, 0]
        Q[2, 0] = -Q[2, 0]
    if R[1, 1] < 0:
        R[1, 1] = -R[1, 1]
        R[1, 2] = -R[1, 2]
        Q[0, 1] = -Q[0, 1]
        Q[1, 1] = -Q[1, 1]
        Q[2, 1] = -Q[2, 1]
    if R[2, 2] < 0:
        R[2, 2] = -R[2, 2]
        Q[0, 2] = -Q[0, 2]
        Q[1, 2] = -Q[1, 2]
        Q[2, 2] = -Q[2, 2]
        
    #print("\nR = \n", R)
    #print("\nQ = \n", Q)
    #print("\nQR = \n", Q.dot(R))

    for el in A.reshape(-1):
        el2 = el * 2**8 # フォーマットは7Q8
        el2 &= 0xffff
        s = "{0:04x}".format(el2)
        # 入力ファイルに書き込む
        #print(s)
        print(s, file=fin)
        
    # 比較ファイルに出力する
    s = "{val} {tlast}".format(val=R[0, 0], tlast='0')
    #print(s)
    print(s, file=fr11)

    s = "{val} {tlast}".format(val=R[0, 1], tlast='0')
    #print(s)
    print(s, file=fr12)

    s = "{val} {tlast}".format(val=R[0, 2], tlast='0')
    #print(s)
    print(s, file=fr13)

    s = "{val} {tlast}".format(val=R[1, 1], tlast='0')
    #print(s)
    print(s, file=fr22)

    s = "{val} {tlast}".format(val=R[1, 2], tlast='0')
    #print(s)
    print(s, file=fr23)

    s = "{val} {tlast}".format(val=R[2, 2], tlast='0')
    #print(s)
    print(s, file=fr33)

    s = "{val} {tlast}".format(val=Q[0, 0], tlast='0')
    #print(s)
    print(s, file=fqt11)

    # QT は Qを転値
    s = "{val} {tlast}".format(val=Q[1, 0], tlast='0')
    #print(s)
    print(s, file=fqt12)

    s = "{val} {tlast}".format(val=Q[2, 0], tlast='0')
    #print(s)
    print(s, file=fqt13)

    s = "{val} {tlast}".format(val=Q[0, 1], tlast='0')
    #print(s)
    print(s, file=fqt21)

    s = "{val} {tlast}".format(val=Q[1, 1], tlast='0')
    #print(s)
    print(s, file=fqt22)

    s = "{val} {tlast}".format(val=Q[2, 1], tlast='0')
    #print(s)
    print(s, file=fqt23)

    s = "{val} {tlast}".format(val=Q[0, 2], tlast='0')
    #print(s)
    print(s, file=fqt31)

    s = "{val} {tlast}".format(val=Q[1, 2], tlast='0')
    #print(s)
    print(s, file=fqt32)

    s = "{val} {tlast}".format(val=Q[2, 2], tlast='0')
    #print(s)
    print(s, file=fqt33)

fin.close()
fr11.close()
fr12.close()
fr13.close()
fr22.close()
fr23.close()
fr33.close()
fqt11.close()
fqt12.close()
fqt13.close()
fqt21.close()
fqt22.close()
fqt23.close()
fqt31.close()
fqt32.close()
fqt33.close()
