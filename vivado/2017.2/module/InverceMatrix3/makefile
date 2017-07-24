all:
	cd sim/test && ./makeData.py > /dev/null
	vivado -mode batch -source script/gen_project_and_ip.tcl

clean:
	rm -rf InverceMatrix3 ../../ip_repo/InverceMatrix3 sim/test/*.txt vivado* *.log 
