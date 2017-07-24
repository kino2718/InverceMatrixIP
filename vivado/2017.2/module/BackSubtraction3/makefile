all:
	cd sim/test && ./makeData.py > /dev/null
	vivado -mode batch -source script/gen_project_and_ip.tcl

clean:
	rm -rf BackSubtraction3 ../../ip_repo/BackSubtraction3 sim/test/*.txt vivado* *.log 
