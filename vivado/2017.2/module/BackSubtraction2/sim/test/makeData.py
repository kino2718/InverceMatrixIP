#! /usr/bin/env python3
import random
import numpy as np

REPEAT = 4
RAND_RANGE = 2**6

fr11 = open('r11.txt', 'w') # 入力ファイル
fr12 = open('r12.txt', 'w') # 入力ファイル
fr22 = open('r22.txt', 'w') # 入力ファイル
fy1 = open('y1.txt', 'w') # 入力ファイル
fy2 = open('y2.txt', 'w') # 入力ファイル
fref = open('ref.txt', 'w') # 比較ファイル

count = 0
for i in range(REPEAT):
    r11 = random.uniform(-RAND_RANGE, RAND_RANGE)
    r12 = random.uniform(-RAND_RANGE, RAND_RANGE)
    r22 = random.uniform(-RAND_RANGE, RAND_RANGE)
    y1 = random.uniform(-RAND_RANGE, RAND_RANGE)
    y2 = random.uniform(-RAND_RANGE, RAND_RANGE)

    # 7Q8形式に変換する
    r11q8 = int(r11*256)
    r11q8 &= 0xffff
    s = '{val:04x}'.format(val=r11q8)
    #print('r11 = {r} ({q8})'.format(r=r11, q8=s))
    print(s, file=fr11)
    
    r12q8 = int(r12*256)
    r12q8 &= 0xffff
    s = '{val:04x}'.format(val=r12q8)
    #print('r12 = {r} ({q8})'.format(r=r12, q8=s))
    print(s, file=fr12)
    
    r22q8 = int(r22*256)
    r22q8 &= 0xffff
    s = '{val:04x}'.format(val=r22q8)
    #print('r22 = {r} ({q8})'.format(r=r22, q8=s))
    print(s, file=fr22)
    
    y1q8 = int(y1*256)
    y1q8 &= 0xffff
    s = '{val:04x}'.format(val=y1q8)
    #print('y1 = {r} ({q8})'.format(r=y1, q8=s))
    print(s, file=fy1)
    
    y2q8 = int(y2*256)
    y2q8 &= 0xffff
    s = '{val:04x}'.format(val=y2q8)
    #print('y2 = {r} ({q8})'.format(r=y2, q8=s))
    print(s, file=fy2)

    # 比較値を計算
    R = np.array([[r11, r12], [0, r22]])
    y = np.array([y1, y2])
    Rinv = np.linalg.inv(R)
    x = Rinv.dot(y)
    #print('x1 =', x[0])
    #print('x2 =', x[1])
    # 逆順
    print(x[1], '0', file=fref)
    print(x[0], '0', file=fref)
    
fr11.close()
fr12.close()
fr22.close()
fy1.close()
fy2.close()
fref.close()
