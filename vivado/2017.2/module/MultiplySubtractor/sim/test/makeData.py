#! /usr/bin/env python3
import random

# c-a*b
PACKET_LEN = 4
MAX_VAL_AB = 2**4
MAX_VAL_C = 2**7

fa = open('a.txt', 'w') # 入力ファイル
fb = open('b.txt', 'w') # 入力ファイル
fc = open('c.txt', 'w') # 入力ファイル
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
    #print('a = {r} ({q8})'.format(r=a, q8=sa))
    print(sa, file=fa)

    b2 = int(b*256)
    b2 &= 0xffff
    sb = '{val:04x}'.format(val=b2)
    #print('b = {r} ({q8})'.format(r=b, q8=sb))
    print(sb, file=fb)

    c2 = int(c*256)
    c2 &= 0xffff
    sc = '{val:04x}'.format(val=c2)
    #print('c = {r} ({q8})'.format(r=c, q8=sc))
    print(sc, file=fc)

    if (count == PACKET_LEN-1):
        count = 0
        tlast = '1'
    else:
        count += 1
        tlast = '0'
        
    # 比較ファイルを作成する
    #print('ref =', res, tlast)
    print(res, tlast, file=fref)

fa.close()
fb.close()
fc.close()
fref.close()
