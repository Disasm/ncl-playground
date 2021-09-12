default: synth2.v

synth.blif synth.v: segment7.v simple.lib segment7.ys
	yosys segment7.ys

synth2.blif: synth.blif
	./nclify.py synth.blif synth2.blif

synth2.v: synth2.blif ncl.v ncl.ys
	yosys ncl.ys

segment7.sim: segment7_tb.v synth2.v ncl_sim.v
	iverilog -W all -o segment7.sim -s segment7_tb segment7_tb.v synth2.v ncl_sim.v

segment7.vcd: segment7.sim
	./segment7.sim

sim: segment7.vcd

show: synth2.v ncl_sim.v
	yosys -p "show segment7" synth2.v ncl_sim.v

clean:
	rm -f synth.v synth.blif synth2.v synth2.blif segment7.sim segment7.vcd
