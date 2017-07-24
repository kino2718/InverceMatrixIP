#! /usr/bin/env python3
import math

fout1 = open ('../../DivCell/DivCell.sim/sim_1/behav/result.txt', 'r')
fout2 = open ('../../DivCell/DivCell.sim/sim_1/behav/nextcell.txt', 'r')
fref = open('ref.txt', 'r')

ok = True
line_no = 1

lout1 = fout1.readline()
while lout1:
    # シミュレーション結果を読み込む
    results = lout1[:-1].split(' ')
    val1 = int(results[0], 16)
    tlast1 = results[1]

    # もう一つの結果を読み込む。値は同じになるはず
    lout2 = fout2.readline()
    if not lout2:
        print("Error: 2 outputs data num does't match")
        raise Exception()
    
    results2 = lout2[:-1].split(' ')
    val2 = int(results[0], 16)
    tlast2 = results[1]

    if (val1 != val2):
        print("Error: 2 outputs data value doesn't match. val1 =", val1, ", val2 =", val2)
    
    if (tlast1 != tlast2):
        print("Error: 2 outputs data tlast doesn't match. tlast1 =", tlast1,
              ", tlast2 =", tlast2)
    
    # 負の値に対応する
    if (val1 & 0x8000):
        val1 -= 0x10000
    val1 /= 2**8 # フォーマットは7Q8
    print('val = {val}, tlast = {tlast}'.format(val=val1, tlast=tlast1))

    # 比較値を読み込む
    lref = fref.readline()
    if not lref:
        print("Error: too much data")
        raise Exception()
            
    results = lref[:-1].split(' ')
    ref_val = float(results[0])
    ref_tlast = results[1]
    print('ref val = {val}, ref_tlast = {tlast}'.format(val=ref_val, tlast=ref_tlast))

    # 結果をリファレンスと比較する
    d = val1 - ref_val
    if -1. < ref_val < 1:
        d = math.fabs(d)
    else:
        d = math.fabs(d/ref_val)

    print('diff = ', d)
    if (0.01 < d):
        print('Error: line {line} value is {sim}, expected {ref}'.
              format(line=line_no, sim=val1, ref=ref_val))
        ok = False

    # if tlast != ref_tlast:
    #     print('Error: line {line} tlast {sim}, expected {ref}'.
    #           format(line=line_no, sim=tlast, ref=ref_tlast))
    #     ok = False
                      
    # 次の結果の行を読み込む
    lout1 = fout1.readline()
    line_no += 1
    print()

# まだ行が残っていたらエラー
if fref.readline():
    print("Error: less data")
    ok = False

if ok:
    print("All data is good")

fout1.close()
fout2.close()
fref.close()
