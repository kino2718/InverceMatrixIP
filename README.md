# InverceMatrixIP

PYNQ ボード上で動作する逆行列計算IP を作成してみました。
行列のサイズは 2x2 または 3x3 で、それぞれ異なるIP となっています。

アルゴリズムは QR分解と後退代入によって逆行列を計算しています。
QR分解はGivens Rotation で行っています。

回路構成は Systolic array で各セルは AXI4-Stream を用いて通信しています。

データは16bitの固定小数点で、小数部が8bit、整数部が符号も含めて8bitとなっています。

今の所オーバーフロー（起きた場合はラップアラウンドする）や、正則でない
行列への対応などはありません。

とりあえず PYNQ で動かしてみるには

pynq ディレクトリにあるファイルを PYNQ ボード上にコピーして、
testInverceMatrix.ipynb を Jupyter Notebook で開いてください。
上から順番にCellを実行すれば、動作確認できます。

IPの本体は vivado/2017.2/ip_repo/ ディレクトリの
InverceMatrix2 と InverceMatrix3 です。それぞれ 2x2, 3x3 の行列に対応しています。
ip_repo にある他の IP は InverceMatrix2, InverceMatrix3 を作るためのサブモジュールです。
PYNQボード(Zynq)で動作確認していますが、他のXILINXのFPGAでも動作するはずです。
但し確認はしていません。

pynq ディレクトリ下のファイルや IP 、プロジェクトを作成するには、
vivado/2017.2 ディレクトリで
```
make clean
make
```
として下さい。
対応している Vivado のバージョンはディレクトリ名を見れば分かる通り 2017.2 です。

今の所ちゃんとmakefileを作っていないので、`make clean` をしないと失敗する場合があります。


PYNQ に載せる bitファイルと tclファイルを作成するプロジェクトは
vivado/2017.2/PYNQ/ ディレクトリの
PynqInverceMatrix2, PynqInverceMatrix3 にあります。

各IP を作成するプロジェクトは
vivado/2017.2/module/ ディレクトリの下にあります。

## License

Copyright 2017 kino2718

License は [MIT License](https://choosealicense.com/licenses/mit/) とします。
