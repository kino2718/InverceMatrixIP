all:
	cd sim/test && ./makeData.py > /dev/null
	vivado -mode batch -source script/gen_project_and_ip.tcl

clean:
	rm -rf ParallelToStream3 ../../ip_repo/ParallelToStream3 sim/test/*.txt vivado* *.log
