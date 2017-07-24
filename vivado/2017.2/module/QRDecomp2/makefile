all:
	cd sim/test && ./makeData.py > /dev/null
	vivado -mode batch -source script/gen_project_and_ip.tcl

clean:
	rm -rf QRDecomp2 ../../ip_repo/QRDecomp2 sim/test/*.txt vivado* *.log 
