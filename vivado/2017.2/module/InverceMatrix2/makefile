all:
	cd sim/test && ./makeData.py > /dev/null
	vivado -mode batch -source script/gen_project_and_ip.tcl

clean:
	rm -rf InverceMatrix2 ../../ip_repo/InverceMatrix2 sim/test/*.txt vivado* *.log 
