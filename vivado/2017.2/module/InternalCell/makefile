all:
	cd sim/test && ./makeData.py > /dev/null
	vivado -mode batch -source script/gen_project_and_ip.tcl

clean:
	rm -rf InternalCell ../../ip_repo/InternalCell sim/test/*.txt vivado* *.log 
