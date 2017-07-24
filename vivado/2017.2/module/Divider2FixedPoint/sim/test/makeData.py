#! /usr/bin/env python3
import random

PACKET_LEN = 4
RAND_START = -2**15
RAND_STOP = 2**15
fin = open('input.txt', 'w') # 入力ファイル
fref = open('ref.txt', 'w') # 比較ファイル

count = 0
for i in range(PACKET_LEN*4):
    dividend = random.randrange(RAND_START, RAND_STOP)
    divisor = random.randrange(RAND_START, RAND_STOP)
    while divisor == 0:
        divisor = randaom.randrange(RAND_START, RAND_STOP)
    val = dividend / divisor
    quotient = int(val)
    fractional = val - quotient
    #print('quotient =', quotient)
    #print('fractional =', fractional)

    # 入力ファイルに書き込む値を作成する
    quotient2 = quotient << 9
    quotient2 &= 0xfffffe00

    fractional2 = int(fractional*256)
    fractional2 &= 0x000001ff

    d = quotient2 | fractional2

    if (count == PACKET_LEN-1):
        count = 0
        tlast = '1'
    else:
        count += 1
        tlast = '0'
        
    s = '{val:08x} {tlast}'.format(val=d, tlast=tlast)
    #print(s)
    print(s, file=fin)

    # 比較ファイルを作成する
    #print('ref =', val, tlast)
    print(val, tlast, file=fref)

fin.close()
fref.close()
