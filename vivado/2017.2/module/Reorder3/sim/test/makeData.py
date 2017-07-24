#! /usr/bin/env python3
import numpy as np

MATSIZE = 3
REPEAT = 4

fcol1 = open('col1.txt', 'w') # 入力ファイル
fcol2 = open('col2.txt', 'w') # 入力ファイル
fcol3 = open('col3.txt', 'w') # 入力ファイル
fref = open('ref.txt', 'w') # 比較ファイル

val = 1
for i in range(REPEAT):
    # col1
    col1 = [i for i in range(val, val+MATSIZE)]
    for i in range(MATSIZE):
        s = '{val:04x}'.format(val=col1[i])
        print(s, file=fcol1)
        val += 1

    # col2
    col2 = [i for i in range(val, val+MATSIZE)]
    for i in range(MATSIZE):
        s = '{val:04x}'.format(val=col2[i])
        print(s, file=fcol2)
        val += 1

    # col3
    col3 = [i for i in range(val, val+MATSIZE)]
    for i in range(MATSIZE):
        s = '{val:04x}'.format(val=col3[i])
        print(s, file=fcol3)
        val += 1

    # 比較ファイル
    for i in range(MATSIZE):
        s = '{val:04x} 0'.format(val=col1[MATSIZE-1-i])
        print(s, file=fref)
        s = '{val:04x} 0'.format(val=col2[MATSIZE-1-i])
        print(s, file=fref)
        if (i == MATSIZE-1):
            s = '{val:04x} 1'.format(val=col3[MATSIZE-1-i])
        else:
            s = '{val:04x} 0'.format(val=col3[MATSIZE-1-i])
        print(s, file=fref)

fcol1.close()
fcol2.close()
fcol3.close()
fref.close()
