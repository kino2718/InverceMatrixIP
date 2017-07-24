all:
	cd sim/test && ./makeData.py > /dev/null
	vivado -mode batch -source script/gen_project_and_ip.tcl

clean:
	rm -rf Reorder2 ../../ip_repo/Reorder2 sim/test/*.txt vivado* *.log 
