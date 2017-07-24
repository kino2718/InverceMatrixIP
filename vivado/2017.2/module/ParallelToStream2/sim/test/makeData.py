#! /usr/bin/env python3

REPEAT = 8

# 入力ファイル作成
fin0 = open('input0.txt', 'w')
fin1 = open('input1.txt', 'w')
# 比較ファイル作成
fref = open('ref.txt', 'w')

for i in range(REPEAT):
    d = i + 1
    s = "{0:04x}".format(d)

    # 入力ファイル
    if i % 2 == 0:
        print(s, file=fin0)
    else:
        print(s, file=fin1)

    # 比較ファイル
    print(s, file=fref)

fin0.close()
fin1.close()
fref.close()
