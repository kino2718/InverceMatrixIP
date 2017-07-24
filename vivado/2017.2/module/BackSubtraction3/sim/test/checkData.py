#! /usr/bin/env python3
import math

fout = open ('../../BackSubtraction3/BackSubtraction3.sim/sim_1/behav/result.txt', 'r')
fref = open('ref.txt', 'r')

ok = True
line_no = 1

lout = fout.readline()
while lout:
    # シミュレーション結果を読み込む
    results = lout[:-1].split(' ')
    val = int(results[0], 16)
    # 負の値に対応する
    if (val & 0x8000):
        val -= 0x10000
    val /= 2**8 # フォーマットは7Q8
    tlast = results[1]
    print('val = {val}, tlast = {tlast}'.format(val=val, tlast=tlast))

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
    d = val - ref_val
    if -1. < ref_val < 1:
        d = math.fabs(d)
    else:
        d = math.fabs(d/ref_val)

    print('diff = ', d)
    if (0.03 < d):
        print('Error: line {line} value is {sim}, expected {ref}'.
              format(line=line_no, sim=val, ref=ref_val))
        ok = False

    # if tlast != ref_tlast:
    #     print('Error: line {line} tlast {sim}, expected {ref}'.
    #           format(line=line_no, sim=tlast, ref=ref_tlast))
    #     ok = False
                      
    # 次の結果の行を読み込む
    lout = fout.readline()
    line_no += 1
    print()

# まだ行が残っていたらエラー
if fref.readline():
    print("Error: less data")
    ok = False

if ok:
    print("All data is good")

fout.close()
fref.close()
