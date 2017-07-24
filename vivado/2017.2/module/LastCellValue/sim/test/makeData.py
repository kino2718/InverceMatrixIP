#! /usr/bin/env python3

PACKET_LEN = 4
REPEAT = 4
INIT_VAL = 0

fin = open('input.txt', 'w')
fref =  open('ref.txt', 'w')

d = 1
for r in range(REPEAT):
    for i in range(PACKET_LEN):
        # 入力ファイルに書き込む
        s = "{0:04x}".format(d)
        print(s, file=fin)

        # 比較ファイルに書き込む
        if (i == PACKET_LEN-1):
            s = "{0:04x}".format(d)
            print(s, file=fref)
            
        d += 1

fin.close()
fref.close()
