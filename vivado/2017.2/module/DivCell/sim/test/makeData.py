#! /usr/bin/env python3
import random

PACKET_LEN = 2
REPEAT = 10
RANDRANGE = 2**15

# 入力ファイル
fdivdend_int = open('dividend_init.txt', 'w')
fdivdend = open('dividend.txt', 'w')
fdivisor = open('divisor.txt', 'w')
fref = open('ref.txt', 'w') # 比較ファイル

for i in range(REPEAT):
    for packet_no in range(PACKET_LEN):
        dividend = random.randrange(-RANDRANGE, RANDRANGE)
        divisor =  random.randrange(-RANDRANGE, RANDRANGE)
        
        s = '{val:04x}'.format(val=dividend&0xffff)
        if (packet_no == 0):
            #print(s, 'to fdivdend_int.txt')
            print(s, file=fdivdend_int)
        else:
            #print(s, 'to fdivdend.txt')
            print(s, file=fdivdend)

        s = '{val:04x}'.format(val=divisor&0xffff)
        #print(s, 'to fdivisor.txt')
        print(s, file=fdivisor)
        
        v = dividend / divisor;
        if (packet_no < PACKET_LEN-1):
            tlast = 0
        else:
            tlast = 1
        #print('ref =', v, ', tlast =', tlast)
        print(v, tlast, file=fref)

fdivdend_int.close()
fdivdend.close()
fdivisor.close()
fref.close()



