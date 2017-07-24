#! /usr/bin/env python3
import math

FIRST_VALUE = 1
NVALUES = 9*2
LAST_VALUE = FIRST_VALUE + NVALUES
ONE = "0100"
ZERO = "0000"

fin = open('input.txt', 'w') # 入力ファイル
fref_c1 = open('ref_c1.txt', 'w') # カラム1の比較ファイル
fref_c2 = open('ref_c2.txt', 'w') # カラム2の比較ファイル
fref_c3 = open('ref_c3.txt', 'w') # カラム3の比較ファイル
fref_c4 = open('ref_c4.txt', 'w') # カラム4の比較ファイル
fref_c5 = open('ref_c5.txt', 'w') # カラム5の比較ファイル
fref_c6 = open('ref_c6.txt', 'w') # カラム6の比較ファイル

count = 0
count2 = 0
# 入力は1づつ大きくなる
for d in range(FIRST_VALUE, LAST_VALUE):
    d2 = d * 2**8 #フォーマットは 7Q8
    s = "{0:04x}".format(d2)
    # 入力ファイルに書き込む
    #print(s)
    print(s, file=fin)

    # 比較ファイルに書き込む
    if count == 0:
        print(s, 0, file=fref_c1)
        count += 1
    elif count == 1:
        print(s, 0, file=fref_c2)
        count += 1
    elif count == 2:
        print(s, 0, file=fref_c3)
        print(ONE, 0, file=fref_c4)
        print(ZERO, 0, file=fref_c5)
        print(ZERO, 0, file=fref_c6)
        count += 1
    elif count == 3:
        print(s, 0, file=fref_c1)
        count += 1
    elif count == 4:
        print(s, 0, file=fref_c2)
        count += 1
    elif count == 5:
        print(s, 0, file=fref_c3)
        print(ZERO, 0, file=fref_c4)
        print(ONE, 0, file=fref_c5)
        print(ZERO, 0, file=fref_c6)
        count += 1
    elif count == 6:
        print(s, 1, file=fref_c1)
        count += 1
    elif count == 7:
        print(s, 1, file=fref_c2)
        count += 1
    else:
        print(s, 1, file=fref_c3)
        print(ZERO, 1, file=fref_c4)
        print(ZERO, 1, file=fref_c5)
        print(ONE, 1, file=fref_c6)
        count = 0

fin.close()
fref_c1.close()
fref_c2.close()
fref_c3.close()
fref_c4.close()
fref_c5.close()
fref_c6.close()

