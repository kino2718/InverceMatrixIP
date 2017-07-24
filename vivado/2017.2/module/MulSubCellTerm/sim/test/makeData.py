#! /usr/bin/env python3
import random

# c-a*b
PACKET_LEN = 4
MAX_VAL_AB = 2**4
MAX_VAL_C = 2**7

fx = open('x.txt', 'w') # 入力ファイル
fr = open('r.txt', 'w') # 入力ファイル
fy = open('y.txt', 'w') # 入力ファイル
fref = open('ref.txt', 'w') # 比較ファイル

count = 0
for i in range(PACKET_LEN*4):
    a = random.uniform(-MAX_VAL_AB, MAX_VAL_AB)
    b = random.uniform(-MAX_VAL_AB, MAX_VAL_AB)
    c = random.uniform(-MAX_VAL_C, MAX_VAL_C)
    # c-a*bの結果
    res = c - a*b
    # オーバーフローしないようにする
    while (res < -MAX_VAL_C or MAX_VAL_C <= res):
        a = random.uniform(-MAX_VAL_AB, MAX_VAL_AB)
        b = random.uniform(-MAX_VAL_AB, MAX_VAL_AB)
        c = random.uniform(-MAX_VAL_C, MAX_VAL_C)
        res = c - a*b

    # a,b,cを7Q8形式に変換する
    a2 = int(a*256)
    a2 &= 0xffff
    sa = '{val:04x}'.format(val=a2)
    #print('x = {r} ({q8})'.format(r=a, q8=sa))
    print(sa, file=fx)

    b2 = int(b*256)
    b2 &= 0xffff
    sb = '{val:04x}'.format(val=b2)
    #print('r = {r} ({q8})'.format(r=b, q8=sb))
    print(sb, file=fr)

    c2 = int(c*256)
    c2 &= 0xffff
    sc = '{val:04x}'.format(val=c2)
    #print('y = {r} ({q8})'.format(r=c, q8=sc))
    print(sc, file=fy)

    if (count == PACKET_LEN-1):
        count = 0
    else:
        count += 1
        
    # 比較ファイルを作成する
    tlast = '1'
    #print('ref =', res, tlast)
    print(res, tlast, file=fref)

fx.close()
fr.close()
fy.close()
fref.close()
