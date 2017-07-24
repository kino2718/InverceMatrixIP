#! /usr/bin/env python3

REPEAT = 4
PACKET_LEN = 3
NDATA_PASSED = 2

# 入力ファイル作成
fin = open('input.txt', 'w')
# 比較ファイル作成
fref = open('ref.txt', 'w')

d = 1
for r in range(REPEAT):
    for i in range(PACKET_LEN):
        s = "{0:04x}".format(d)
        print(s, file=fin)

        if (i < NDATA_PASSED):
            s = "{val:04x}".format(val=d)
            print(s, file=fref)
    
        d += 1
