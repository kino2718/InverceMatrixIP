#! /usr/bin/env python3
import math

# 回転の結果を比較する
frot = open ('../../InternalCell/InternalCell.sim/sim_1/behav/rotated.txt', 'r')
fref = open('ref_rotated.txt', 'r')
ok = True
line_no = 1
lrot = frot.readline()
while lrot:
    # シミュレーション結果を読み込む
    results = lrot[:-1].split(' ')
    rotated = int(results[0], 16)
    # 負の値に対応する
    if (rotated & 0x8000):
        rotated -= 0x10000

    rotated /= 2**8 # フォーマットは7Q8
    tlast = results[1]
    #print('rotated = {rotated}, tlast = {tlast}'.format(rotated=rotated, tlast=tlast))

    # 比較値を読み込む
    lref = fref.readline()
    if not lref:
        print("Error: too much rotated data")
        raise Exception()
            
    results = lref[:-1].split(' ')
    ref_rotated = float(results[0])
    ref_tlast = results[1]
    #print('ref rotated = {rotated}, ref_tlast = {tlast}'.format(rotated=ref_rotated, tlast=ref_tlast))

    # 結果をリファレンスと比較する
    dp = rotated - ref_rotated
    if -0.01 < ref_rotated < 0.01:
        dp = math.fabs(dp)
    else:
        dp = math.fabs(dp/ref_rotated)

    #print(dp)
    if (0.01 < dp):
        print('Error: line {line} rotated is {sim}, expected {ref}'.
              format(line=line_no, sim=rotated, ref=ref_rotated))
        ok = False

    if tlast != ref_tlast:
        print('Error: line {line} tlast {sim}, expected {ref}'.
              format(line=line_no, sim=tlast, ref=ref_tlast))
        ok = False
                      
    # 次の結果の行を読み込む
    lrot = frot.readline()
    line_no += 1

# まだ行が残っていたらエラー
if fref.readline():
    print("Error: less rotated data")
    ok = False

if ok:
    print("All rotated data are good")

frot.close()
fref.close()

fout = open ('../../InternalCell/InternalCell.sim/sim_1/behav/result.txt', 'r')
fref = open('ref_result.txt', 'r')
ok = True
line_no = 1
lre = fout.readline()
while lre:
    results = lre[:-1].split(' ')
    result = int(results[0], 16)
    if (result & 0x8000):
        result -= 0x10000

    result /= 2**8 # フォーマットは7Q8
    #print('result = {result}'.format(result=result))

    # 比較値を読み込む
    lref = fref.readline()
    if not lref:
        print("Error: too much result data")
        raise Exception()
            
    ref_result = float(lref)
    #print('ref = {ref}'.format(ref=ref_result))

    # 結果を比較する
    d = result - ref_result
    if -0.01 < ref_result < 0.01:
        d = abs(d)
    else:
        d /= abs(d/ref_result)

    if (0.01 < d):
        print('Error: line {line} result is {sim}, expected {ref}'.
              format(line=line_no, sim=result, ref=ref_result))
                    
    # 次の結果の行を読み込む
    lre = fout.readline()
    line_no += 1
        
if fref.readline():
    print("Error: less result data")
    ok = False

if ok:
    print("All result data are good")

fout.close()
fref.close()
