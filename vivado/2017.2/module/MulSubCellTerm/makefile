all:
	cd sim/test && ./makeData.py > /dev/null
	vivado -mode batch -source script/gen_project_and_ip.tcl

clean:
	rm -rf MulSubCellTerm ../../ip_repo/MulSubCellTerm sim/test/*.txt vivado* *.log 
