all:
	cd sim/test && ./makeData.py > /dev/null
	vivado -mode batch -source script/gen_project_and_ip.tcl

clean:
	rm -rf DivCell ../../ip_repo/DivCell sim/test/*.txt vivado* *.log 
