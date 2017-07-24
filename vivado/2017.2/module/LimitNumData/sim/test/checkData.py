#! /usr/bin/env python3

fin = open('../../LimitNumData/LimitNumData.sim/sim_1/behav/result.txt', 'r')
fref = open('ref.txt', 'r')
line_no = 1
lin = fin.readline()
ok = True
while lin:
    # 結果を読み込む
    results = lin[:-1].split(' ')
    tdata = int(results[0], 16)

    # 比較する値を読み込み
    lref = fref.readline()
    if not lref:
        print("Error: too much output data")
        raise Exception()

    refs = lref[:-1].split(' ')
    ref_tdata = int(refs[0], 16)

    if (tdata != ref_tdata):
        print("line {0}: Invalid data {1:04x}, expected {2:04x}".
              format(line_no, tdata, ref_tdata))
        ok = False
                
    # 次の行を読み込む
    lin = fin.readline()
    line_no += 1

# まだ行が残っていたらエラー
if fref.readline():
    print("Error: less output data")
    raise Exception()

if ok:
    print("All data is good")
