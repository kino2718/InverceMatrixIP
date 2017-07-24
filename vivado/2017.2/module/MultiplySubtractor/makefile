all:
	cd sim/test && ./makeData.py > /dev/null
	vivado -mode batch -source script/gen_project_and_ip.tcl

clean:
	rm -rf MultiplySubtractor ../../ip_repo/MultiplySubtractor sim/test/*.txt vivado* *.log 
