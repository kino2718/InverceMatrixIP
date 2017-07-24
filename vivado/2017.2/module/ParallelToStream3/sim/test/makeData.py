#! /usr/bin/env python3

REPEAT = 12

# 入力ファイル作成
fin0 = open('input0.txt', 'w')
fin1 = open('input1.txt', 'w')
fin2 = open('input2.txt', 'w')
# 比較ファイル作成
fref = open('ref.txt', 'w')

for i in range(REPEAT):
    d = i + 1
    s = "{0:04x}".format(d)

    # 入力ファイル
    n = i % 3
    if n == 0:
        print(s, file=fin0)
    elif n == 1:
        print(s, file=fin1)
    else:
        print(s, file=fin2)

    # 比較ファイル
    print(s, file=fref)

fin0.close()
fin1.close()
fref.close()
