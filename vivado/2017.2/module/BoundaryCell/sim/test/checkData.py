#! /usr/bin/env python3
import math

# 位相の結果を比較する
fph = open ('../../BoundaryCell/BoundaryCell.sim/sim_1/behav/phase.txt', 'r')
fref = open('ref_phase.txt', 'r')
ok = True
line_no = 1
lph = fph.readline()
while lph:
    # シミュレーション結果を読み込む
    results = lph[:-1].split(' ')
    phase = int(results[0], 16)
    # 負の値に対応する
    if (phase & 0x8000):
        phase -= 0x10000

    phase /= 2**13 # フォーマットは2Q13
    phase = phase / 3.14 * 180
    tlast = results[1]
    #print('phase = {phase}, tlast = {tlast}'.format(phase=phase, tlast=tlast))

    # 比較値を読み込む
    lref = fref.readline()
    if not lref:
        print("Error: too much phase data")
        raise Exception()
            
    results = lref[:-1].split(' ')
    ref_phase = float(results[0])
    ref_tlast = results[1]
    #print('ref phase = {phase}, ref_tlast = {tlast}'.format(phase=ref_phase, tlast=ref_tlast))

    # 結果をリファレンスと比較する
    dp = phase - ref_phase
    if ref_phase != 0:
        dp = math.fabs(dp/ref_phase)
    else:
        dp = math.fabs(dp)

    #print(dp)
    if (0.001 < dp):
        print('Error: line {line} phase is {sim}, expected {ref}'.
              format(line=line_no, sim=phase, ref=ref_phase))
        ok = False

    if tlast != ref_tlast:
        print('Error: line {line} tlast {sim}, expected {ref}'.
              format(line=line_no, sim=tlast, ref=ref_tlast))
        ok = False
                      
    # 次の結果の行を読み込む
    lph = fph.readline()
    line_no += 1

# まだ行が残っていたらエラー
if fref.readline():
    print("Error: less phase data")
    ok = False

if ok:
    print("All phase data are good")

fph.close()
fref.close()

fres = open ('../../BoundaryCell/BoundaryCell.sim/sim_1/behav/result.txt', 'r')
fref = open('ref_result.txt', 'r')
ok = True
line_no = 1
lres = fres.readline()
while lres:
    results = lres[:-1].split(' ')
    result = int(results[0], 16)
    if (result & 0x8000):
        result -= 0x10000
    result /= 2**8 # フォーマットは7Q8
    #print('result = {result}'.format(result=result))

    # 比較値を読み込む
    lres = fref.readline()
    if not lres:
        print("Error: too much result data")
        raise Exception()
            
    ref_result = float(lres)
    #print('ref = {ref}'.format(ref=ref_result))

    # 結果を比較する
    d = result - ref_result
    if ref_result != 0:
        d /= abs(d/ref_result)
    else:
        d = abs(d)

    if (0.001 < d):
        print('Error: line {line} result is {sim}, expected {ref}'.
              format(line=line_no, sim=result, ref=ref_result))
                    
    # 次の結果の行を読み込む
    lres = fres.readline()
    line_no += 1
        
if fref.readline():
    print("Error: less result data")
    ok = False

if ok:
    print("All result data are good")

fres.close()
fref.close()
