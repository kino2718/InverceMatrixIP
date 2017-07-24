#! /usr/bin/env python3

PACKET_LEN = 4
REPEAT = 4

fin = open('input.txt', 'w')
finit = open('init.txt', 'w')
fref =  open('ref.txt', 'w')

d = 1
for r in range(REPEAT):
    # 初期値ファイルに書き込む
    s = "{val:04x}".format(val=d)
    print(s, file=finit)
    # 比較ファイルに書き込む
    print(s, file=fref)
    d += 1

    for i in range(PACKET_LEN):
        # 入力ファイルに書き込む
        s = "{0:04x}".format(d)
        print(s, file=fin)
        # 比較ファイルに書き込む
        print(s, file=fref)
        d += 1

fin.close()
fref.close()
