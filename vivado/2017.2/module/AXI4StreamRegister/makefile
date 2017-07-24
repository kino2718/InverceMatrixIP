all:
	cd sim/test && ./makeData.py > /dev/null
	vivado -mode batch -source script/gen_project_and_ip.tcl

clean:
	rm -rf AXI4StreamRegister ../../ip_repo/AXI4StreamRegister sim/test/*.txt vivado* *.log 
