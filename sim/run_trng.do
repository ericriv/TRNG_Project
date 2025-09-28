# ================================
# TRNG Simulation Run Script (run.do)
# Run from the sim/ directory
# ================================

# Clean and recreate work directory
vdel -all
vlib work

# Compile RTL, assertions, and testbench
vlog -sv ../rtl/ro.v
vlog -sv ../rtl/sampler.v
vlog -sv ../rtl/sampler_16.v
vlog -sv ../rtl/trng.v
vlog -sv ../assertions/trng_sva.sv
vlog -sv ../tb/trng_tb.sv

# Run simulation (with limited optimization for waveform viewing)
vsim -voptargs=+acc work.trng_tb 

# Record sim log
transcript file sim_output.log

# Plot waveform
add wave -r trng_tb/*

# Run until completion
run -all

#quit -sim
