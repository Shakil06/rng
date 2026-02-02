# Source Code Directory

This directory contains the hardware design source files for the TRNG.

## HDL (Hardware Description Language)

The `hdl/` subdirectory contains SystemVerilog files:

### design.sv

Main design file containing:

- **`trng` module**: Top-level TRNG module
  - 16-bit random output
  - Seedable initialization
  - Clock-driven operation
  
- **`xor16_1` module**: 16-input XOR gate
  - Used in the chaotic XOR network
  
- **`mux` module**: 2-to-1 multiplexer
  - Used in ISU units
  
- **`ISU` module**: Interleaved Shuffle Unit
  - Processes pairs of bits
  - Provides mixing and randomness distribution

### testbench.sv

Simulation testbench:
- Initializes TRNG with seed value (1327)
- Generates 4599 random numbers
- Saves output to `output.txt`
- Displays each generated number

## Simulation Instructions

### Using ModelSim/Questa

```bash
# Compile
vlog hdl/design.sv hdl/testbench.sv

# Simulate
vsim -c trng_test -do "run -all; quit"
```

### Using Vivado

1. Create a new project
2. Add `hdl/design.sv` as design source
3. Add `hdl/testbench.sv` as simulation source
4. Run behavioral simulation

### Using Icarus Verilog

```bash
# Compile and simulate
iverilog -g2012 -o trng_sim hdl/design.sv hdl/testbench.sv
vvp trng_sim
```

## Output

The simulation generates `output.txt` in the working directory, containing one random number per line.
