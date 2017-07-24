#! /usr/bin/env python3
import random

PACKET_LEN = 4
REPEAT = 4
RANDRANGE = 10

# 入力ファイル
fy = open('y.txt', 'w')
ffrom_right = open('from_right.txt', 'w')
fx = open('x.txt', 'w')
fr = open('r.txt', 'w')
fref = open('ref.txt', 'w') # 比較ファイル

for i in range(REPEAT):
    for packet_no in range(PACKET_LEN):
        a = random.uniform(-RANDRANGE, RANDRANGE)
        b =  random.uniform(-RANDRANGE, RANDRANGE)
        c =  random.uniform(-RANDRANGE, RANDRANGE)

        a1 = int(a*256) & 0xffff
        s = '{val:04x}'.format(val=a1)
        #print(a, s, 'val a to x.txt')
        print(s, file=fx)
        
        b1 = int(b*256) & 0xffff
        s = '{val:04x}'.format(val=b1)
        #print(b, s, 'val b to r.txt')
        print(s, file=fr)
        
        c1 = int(c*256) & 0xffff
        s = '{val:04x}'.format(val=c1)
        if (packet_no == 0):
            #print(c, s, 'val c to y.txt')
            print(s, file=fy)
        else:
            #print(c, s, 'val c to from_right.txt')
            print(s, file=ffrom_right)

        v = c - a * b
        if (packet_no < PACKET_LEN-1):
            tlast = 0
        else:
            tlast = 1
        #print('ref =', v, ', tlast =', tlast)
        print(v, tlast, file=fref)

fy.close()
ffrom_right.close()
fx.close()
fr.close()
fref.close()



