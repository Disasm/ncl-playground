default: synth2.v

synth.blif synth.v: segment7.v simple.lib segment7.ys
	yosys segment7.ys

synth2.blif: synth.blif
	./nclify.py synth.blif synth2.blif

synth2.v: synth2.blif ncl.v ncl.ys
	yosys ncl.ys

clean:
	rm -f synth.v synth.blif synth2.v synth2.blif
