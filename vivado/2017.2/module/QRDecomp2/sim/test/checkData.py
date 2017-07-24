#! /usr/bin/env python3
import math

# QR分解の結果を比較する
fout = open ('../../QRDecomp2/QRDecomp2.sim/sim_1/behav/r11.txt', 'r')
fref = open('r11.txt', 'r')

ok = True
line_no = 1

print('check r11')
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
    if -0.01 < ref_val < 0.01:
        d = math.fabs(d)
    else:
        d = math.fabs(d/ref_val)

    #print('diff = ', d)
    if (0.013 < d):
        print('Error: line {line} value is {sim}, expected {ref}'.
              format(line=line_no, sim=val, ref=ref_val))
        ok = False

    if tlast != ref_tlast:
        print('Error: line {line} tlast {sim}, expected {ref}'.
              format(line=line_no, sim=tlast, ref=ref_tlast))
        ok = False
                      
    # 次の結果の行を読み込む
    lout = fout.readline()
    line_no += 1

# まだ行が残っていたらエラー
if fref.readline():
    print("Error: less data")
    ok = False

if ok:
    print("All data is good")

fout.close()
fref.close()

print()

fout = open ('../../QRDecomp2/QRDecomp2.sim/sim_1/behav/r12.txt', 'r')
fref = open('r12.txt', 'r')

ok = True
line_no = 1

print('check r12')
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
    if -0.01 < ref_val < 0.01:
        d = math.fabs(d)
    else:
        d = math.fabs(d/ref_val)

    #print('diff = ', d)
    if (0.013 < d):
        print('Error: line {line} value is {sim}, expected {ref}'.
              format(line=line_no, sim=val, ref=ref_val))
        ok = False

    if tlast != ref_tlast:
        print('Error: line {line} tlast {sim}, expected {ref}'.
              format(line=line_no, sim=tlast, ref=ref_tlast))
        ok = False
                      
    # 次の結果の行を読み込む
    lout = fout.readline()
    line_no += 1

# まだ行が残っていたらエラー
if fref.readline():
    print("Error: less data")
    ok = False

if ok:
    print("All data is good")

fout.close()
fref.close()

print()

fout = open ('../../QRDecomp2/QRDecomp2.sim/sim_1/behav/r22.txt', 'r')
fref = open('r22.txt', 'r')

ok = True
line_no = 1

print('check r22')
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
    if -0.01 < ref_val < 0.01:
        d = math.fabs(d)
    else:
        d = math.fabs(d/ref_val)

    #print('diff = ', d)
    if (0.013 < d):
        print('Error: line {line} value is {sim}, expected {ref}'.
              format(line=line_no, sim=val, ref=ref_val))
        ok = False

    if tlast != ref_tlast:
        print('Error: line {line} tlast {sim}, expected {ref}'.
              format(line=line_no, sim=tlast, ref=ref_tlast))
        ok = False
                      
    # 次の結果の行を読み込む
    lout = fout.readline()
    line_no += 1

# まだ行が残っていたらエラー
if fref.readline():
    print("Error: less data")
    ok = False

if ok:
    print("All data is good")

fout.close()
fref.close()

print()

fout = open ('../../QRDecomp2/QRDecomp2.sim/sim_1/behav/qt11.txt', 'r')
fref = open('qt11.txt', 'r')

ok = True
line_no = 1

print('check qt11')
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
    if -0.01 < ref_val < 0.01:
        d = math.fabs(d)
    else:
        d = math.fabs(d/ref_val)

    #print('diff = ', d)
    if (0.013 < d):
        print('Error: line {line} value is {sim}, expected {ref}'.
              format(line=line_no, sim=val, ref=ref_val))
        ok = False

    if tlast != ref_tlast:
        print('Error: line {line} tlast {sim}, expected {ref}'.
              format(line=line_no, sim=tlast, ref=ref_tlast))
        ok = False
                      
    # 次の結果の行を読み込む
    lout = fout.readline()
    line_no += 1

# まだ行が残っていたらエラー
if fref.readline():
    print("Error: less data")
    ok = False

if ok:
    print("All data is good")

fout.close()
fref.close()

print()

fout = open ('../../QRDecomp2/QRDecomp2.sim/sim_1/behav/qt12.txt', 'r')
fref = open('qt12.txt', 'r')

ok = True
line_no = 1

print('check qt12')
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
    if -0.01 < ref_val < 0.01:
        d = math.fabs(d)
    else:
        d = math.fabs(d/ref_val)

    #print('diff = ', d)
    if (0.013 < d):
        print('Error: line {line} value is {sim}, expected {ref}'.
              format(line=line_no, sim=val, ref=ref_val))
        ok = False

    if tlast != ref_tlast:
        print('Error: line {line} tlast {sim}, expected {ref}'.
              format(line=line_no, sim=tlast, ref=ref_tlast))
        ok = False
                      
    # 次の結果の行を読み込む
    lout = fout.readline()
    line_no += 1

# まだ行が残っていたらエラー
if fref.readline():
    print("Error: less data")
    ok = False

if ok:
    print("All data is good")

fout.close()
fref.close()

print()

fout = open ('../../QRDecomp2/QRDecomp2.sim/sim_1/behav/qt21.txt', 'r')
fref = open('qt21.txt', 'r')

ok = True
line_no = 1

print('check qt21')
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
    if -0.01 < ref_val < 0.01:
        d = math.fabs(d)
    else:
        d = math.fabs(d/ref_val)

    #print('diff = ', d)
    if (0.013 < d):
        print('Error: line {line} value is {sim}, expected {ref}'.
              format(line=line_no, sim=val, ref=ref_val))
        ok = False

    if tlast != ref_tlast:
        print('Error: line {line} tlast {sim}, expected {ref}'.
              format(line=line_no, sim=tlast, ref=ref_tlast))
        ok = False
                      
    # 次の結果の行を読み込む
    lout = fout.readline()
    line_no += 1

# まだ行が残っていたらエラー
if fref.readline():
    print("Error: less data")
    ok = False

if ok:
    print("All data is good")

fout.close()
fref.close()

print()

fout = open ('../../QRDecomp2/QRDecomp2.sim/sim_1/behav/qt22.txt', 'r')
fref = open('qt22.txt', 'r')

ok = True
line_no = 1

print('check qt22')
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
    if -0.01 < ref_val < 0.01:
        d = math.fabs(d)
    else:
        d = math.fabs(d/ref_val)

    #print('diff = ', d)
    if (0.013 < d):
        print('Error: line {line} value is {sim}, expected {ref}'.
              format(line=line_no, sim=val, ref=ref_val))
        ok = False

    if tlast != ref_tlast:
        print('Error: line {line} tlast {sim}, expected {ref}'.
              format(line=line_no, sim=tlast, ref=ref_tlast))
        ok = False
                      
    # 次の結果の行を読み込む
    lout = fout.readline()
    line_no += 1

# まだ行が残っていたらエラー
if fref.readline():
    print("Error: less data")
    ok = False

if ok:
    print("All data is good")

fout.close()
fref.close()

print()

