all:
	cd sim/test && ./makeData.py > /dev/null
	vivado -mode batch -source script/gen_project_and_ip.tcl

clean:
	rm -rf Feedback ../../ip_repo/Feedback sim/test/*.txt vivado* *.log 
