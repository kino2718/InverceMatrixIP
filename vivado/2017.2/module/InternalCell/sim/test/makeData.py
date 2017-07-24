#! /usr/bin/env python3
import math

REPEAT = 4
PACKET_LEN = 4

fin = open('input.txt', 'w') # 入力ファイル
fin_phase = open('input_phase.txt', 'w') # 位相の入力ファイル
frot = open('ref_rotated.txt', 'w') # 回転結果の比較ファイル
fres = open('ref_result.txt', 'w') # cellの結果の比較ファイル

phase = -90
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
        # 位相の入力ファイルに書き込む
        rad = phase / 180 * 3.14
        rad2 = rad * 2**13 # フォーマットは2Q13
        rad2 = int(rad2) & 0xffff
        s = "{phase:04x}".format(phase=rad2)
        #print(s)
        print(s, file=fin_phase)

        # 回転前の座標
        x = feedback
        y = d
        # 回転
        x2 = math.cos(rad) * x - math.sin(rad) * y;
        y2 = math.sin(rad) * x + math.cos(rad) * y;

        if count == PACKET_LEN-1:
            count = 0
            tlast = 1
            feedback = 0
            #print(x2)
            print(x2, file=fres)
        else:
            count += 1
            tlast = 0
            feedback = x2

        # 回転結果の出力
        #print("rotated:", y2, tlast)
        print(y2, tlast, file=frot)

        # 入力値を1増やす
        d += 1
        
        # 回転角を10°増やす
        phase += 10
            
fin.close()
fin_phase.close()
frot.close()
fres.close()
