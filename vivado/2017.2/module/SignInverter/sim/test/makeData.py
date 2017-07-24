#! /usr/bin/env python3

REPEAT = 4
PACKET_LEN = 4

# 入力ファイル作成
fin = open('input.txt', 'w')
# 比較ファイル作成
fref = open('ref.txt', 'w')

d = 1
for r in range(REPEAT):
    for i in range(PACKET_LEN):
        s = "{0:04x}".format(d)
        print(s, file=fin)

        # 固定小数点での負の値を計算(16bit)
        dinv = (-d) & 0xffff
        if (i == PACKET_LEN-1):
            tlast = 1
        else:
            tlast = 0
            
        s = "{val:04x} {tlast}".format(val=dinv, tlast=tlast)
        print(s, file=fref)
    
        d += 1
