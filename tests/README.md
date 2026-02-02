# Tests Directory

This directory contains statistical validation tests for the TRNG output.

## WaldWolfowitzRunsTest.py

This script performs the Wald-Wolfowitz Runs Test on the random number output.

### Prerequisites

```bash
pip install numpy pandas scipy
```

Or from the project root:
```bash
pip install -r requirements.txt
```

### Usage

1. First, run the hardware simulation to generate `output.txt`:
   - The testbench (`src/hdl/testbench.sv`) will create this file
   - It contains 4599 random numbers, one per line

2. Then run the test script from the project root:
   ```bash
   python tests/WaldWolfowitzRunsTest.py
   ```

   Or from this directory:
   ```bash
   cd tests
   python WaldWolfowitzRunsTest.py
   ```

### Output

The script will display:
- Test result (passed/failed)
- z-test statistic
- p-value
- Entropy value

### Understanding the Results

- **Passed**: p-value > 0.05 → The sequence appears random
- **Failed**: p-value < 0.05 → The sequence shows non-random patterns
- **Entropy**: Higher values indicate better randomness distribution
