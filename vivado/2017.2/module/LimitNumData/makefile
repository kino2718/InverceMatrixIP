all:
	cd sim/test && ./makeData.py > /dev/null
	vivado -mode batch -source script/gen_project_and_ip.tcl

clean:
	rm -rf LimitNumData ../../ip_repo/LimitNumData sim/test/*.txt vivado* *.log 
