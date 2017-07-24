#! /usr/bin/env python3
import math

for column in ('1', '2', '3', '4'):
    print('* check column ' + column + ' data *')
    fc = open ('../../StreamToColumns2/StreamToColumns2.sim/sim_1/behav/c' + column + '.txt', 'r')
    ref_fc = open('ref_c' + column + '.txt', 'r')
    ok = True
    line_no = 1
    line = fc.readline()
    while line:
        # シミュレーション結果を読み込む
        results = line[:-1].split(' ')
        d = int(results[0], 16)
        tlast = results[1]
        # 比較値を読み込む
        lref = ref_fc.readline()
        if not lref:
            print("Error: too much data")
            raise Exception()
        results = lref[:-1].split(' ')
        ref_d = int(results[0], 16)
        ref_tlast = results[1]
    
        if d != ref_d:
            print('Error: line {line} is {sim}, expected {ref}'.
                  format(line=line_no, sim=d, ref=ref_d))
            ok = False
        
        if tlast != ref_tlast:
            print('Error: line {line} tlast {sim}, expected {ref}'.
                  format(line=line_no, sim=tlast, ref=ref_tlast))
            ok = False

        # 次の結果の行を読み込む
        line = fc.readline()
        line_no += 1

    # まだ行が残っていたらエラー
    if ref_fc.readline():
        print("Error: less data")
        ok = False

    if ok:
        print("All data is good")

    fc.close()
    ref_fc.close()
    print();
