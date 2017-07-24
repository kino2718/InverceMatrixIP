#! /usr/bin/env python3
import random
import numpy as np

REPEAT = 4
RAND_RANGE = 10

fr11 = open('r11.txt', 'w') # 入力ファイル
fr12 = open('r12.txt', 'w') # 入力ファイル
fr13 = open('r13.txt', 'w') # 入力ファイル
fr22 = open('r22.txt', 'w') # 入力ファイル
fr23 = open('r23.txt', 'w') # 入力ファイル
fr33 = open('r33.txt', 'w') # 入力ファイル
fy1 = open('y1.txt', 'w') # 入力ファイル
fy2 = open('y2.txt', 'w') # 入力ファイル
fy3 = open('y3.txt', 'w') # 入力ファイル
fref = open('ref.txt', 'w') # 比較ファイル

count = 0
for i in range(REPEAT):
    r11 = random.uniform(-RAND_RANGE, RAND_RANGE)
    r12 = random.uniform(-RAND_RANGE, RAND_RANGE)
    r13 = random.uniform(-RAND_RANGE, RAND_RANGE)
    r22 = random.uniform(-RAND_RANGE, RAND_RANGE)
    r23 = random.uniform(-RAND_RANGE, RAND_RANGE)
    r33 = random.uniform(-RAND_RANGE, RAND_RANGE)
    y1 = random.uniform(-RAND_RANGE, RAND_RANGE)
    y2 = random.uniform(-RAND_RANGE, RAND_RANGE)
    y3 = random.uniform(-RAND_RANGE, RAND_RANGE)

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
    
    r13q8 = int(r13*256)
    r13q8 &= 0xffff
    s = '{val:04x}'.format(val=r13q8)
    #print('r13 = {r} ({q8})'.format(r=r13, q8=s))
    print(s, file=fr13)
    
    r22q8 = int(r22*256)
    r22q8 &= 0xffff
    s = '{val:04x}'.format(val=r22q8)
    #print('r22 = {r} ({q8})'.format(r=r22, q8=s))
    print(s, file=fr22)
    
    r23q8 = int(r23*256)
    r23q8 &= 0xffff
    s = '{val:04x}'.format(val=r23q8)
    #print('r23 = {r} ({q8})'.format(r=r23, q8=s))
    print(s, file=fr23)
    
    r33q8 = int(r33*256)
    r33q8 &= 0xffff
    s = '{val:04x}'.format(val=r33q8)
    #print('r33 = {r} ({q8})'.format(r=r33, q8=s))
    print(s, file=fr33)
    
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

    y3q8 = int(y3*256)
    y3q8 &= 0xffff
    s = '{val:04x}'.format(val=y3q8)
    #print('y3 = {r} ({q8})'.format(r=y3, q8=s))
    print(s, file=fy3)

    # 比較値を計算
    R = np.array([[r11, r12, r13], [0, r22, r23], [0, 0, r33]])
    y = np.array([y1, y2, y3])
    Rinv = np.linalg.inv(R)
    x = Rinv.dot(y)
    #print('x1 =', x[0])
    #print('x2 =', x[1])
    #print('x3 =', x[2])
    # 逆順
    print(x[2], '0', file=fref)
    print(x[1], '0', file=fref)
    print(x[0], '0', file=fref)
    
fr11.close()
fr12.close()
fr13.close()
fr22.close()
fr23.close()
fr33.close()
fy1.close()
fy2.close()
fy3.close()
fref.close()
