#! /usr/bin/env python3

REPEAT = 4
MATSIZE = 2

# 入力ファイル作成
fcol1 = open('col1.txt', 'w')
fcol2 = open('col2.txt', 'w')
# 比較ファイル作成
fref = open('ref.txt', 'w')

d = 1
for i in range(REPEAT):
    col1 = [0 for _ in range(MATSIZE)]
    col2 = [0 for _ in range(MATSIZE)]
    for k in range(MATSIZE):
        col1[k] = d
        s = "{0:04x}".format(d)
        print(s, file=fcol1)
        d += 1
        col2[k] = d
        s = "{0:04x}".format(d)
        print(s, file=fcol2)
        d += 1

    # 比較ファイル
    col1.reverse()
    col2.reverse()
    for k in range(MATSIZE):
        d2 = col1[k]
        s = "{0:04x}".format(d2)
        print(s, file=fref)
        d2 = col2[k]
        s = "{0:04x}".format(d2)
        print(s, file=fref)

fcol1.close()
fcol2.close()
fref.close()
