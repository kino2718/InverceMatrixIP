#! /usr/bin/env python3
import math

REPEAT = 4
PACKET_LEN = 4

fin = open('input.txt', 'w') # 入力ファイル
fphase = open('ref_phase.txt', 'w') # 位相の比較ファイル
fres = open('ref_result.txt', 'w') # cellの結果の比較ファイル

feedback = 0
count = 0

d = 1
for r in range(REPEAT):
    for i in range(PACKET_LEN):
        d2 = d * 2**8 #フォーマットは 7Q8
        s = "{0:04x}".format(d2)
        # 入力ファイルに書き込む
        #print(s)
        print(s, file=fin)

        # 極座標での座標を求める
        r = math.sqrt(d*d + feedback*feedback)
        theta = math.atan2(d, feedback)
        theta2 = theta / 3.14 * 180

        if i == PACKET_LEN-1:
            tlast = 1
            feedback = 0
            #print(r)
            print(r, file=fres)
        else:
            tlast = 0
            feedback = r

        #print(-theta2, tlast)
        print(-theta2, tlast, file=fphase)
        d += 1
        
fin.close()
fphase.close()
fres.close()

