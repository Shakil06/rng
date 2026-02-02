# True Random Number Generator (TRNG)

A hardware-based True Random Number Generator implemented in SystemVerilog using a chaotic XOR network and ISU (Interleaved Shuffle Unit) architecture.

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Architecture](#architecture)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Usage](#usage)
  - [Hardware Simulation](#hardware-simulation)
  - [Statistical Testing](#statistical-testing)
- [Testing](#testing)
- [Documentation](#documentation)
- [Contributing](#contributing)
- [License](#license)

## 🔍 Overview

This project implements a True Random Number Generator (TRNG) using hardware-based entropy generation. Unlike pseudo-random number generators (PRNGs), TRNGs generate random numbers from physical processes, making them suitable for cryptographic applications and security-critical systems.

The design utilizes:
- **Chaotic XOR Network**: Generates high-entropy outputs through non-linear feedback
- **ISU (Interleaved Shuffle Unit) Network**: Enhances randomness distribution
- **16-bit Output**: Generates 16-bit random numbers per clock cycle

## ✨ Features

- 🔐 Hardware-based true random number generation
- ⚡ 16-bit random output per clock cycle
- 🔄 Seedable design for initialization
- 🧪 Includes comprehensive statistical testing (Wald-Wolfowitz Runs Test)
- 📊 Entropy calculation and validation
- 🎯 Suitable for cryptographic applications

## 🏗️ Architecture

The TRNG consists of two main components:

### 1. Chaotic XOR Network
- 16 parallel XOR operations on shifted versions of the internal state
- Creates non-linear feedback for enhanced entropy

### 2. ISU (Interleaved Shuffle Unit) Network
- 8 ISU modules processing pairs of bits
- Each ISU uses multiplexers to shuffle and invert bits
- Provides additional mixing and randomness distribution

## 📁 Project Structure

```
rng/
├── src/
│   └── hdl/
│       ├── design.sv          # Main TRNG design (top module + submodules)
│       └── testbench.sv       # Testbench for simulation
├── tests/
│   └── WaldWolfowitzRunsTest.py  # Statistical validation script
├── docs/
│   └── EEE458_ProjectReport_Group27.pdf  # Detailed project report
├── .gitignore                 # Git ignore rules
├── requirements.txt           # Python dependencies
└── README.md                  # This file
```

## 🚀 Getting Started

### Prerequisites

**For Hardware Simulation:**
- ModelSim, Vivado, or any SystemVerilog-compatible simulator
- SystemVerilog compiler support

**For Statistical Testing:**
- Python 3.7+
- pip (Python package manager)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/Shakil06/rng.git
   cd rng
   ```

2. **Install Python dependencies**
   ```bash
   pip install -r requirements.txt
   ```

## 💻 Usage

### Hardware Simulation

#### Using ModelSim/Questa

```bash
# Compile the design
vlog src/hdl/design.sv src/hdl/testbench.sv

# Run simulation
vsim -c trng_test -do "run -all; quit"
```

#### Using Vivado

```bash
# Create a new project and add source files
# Add src/hdl/design.sv as design source
# Add src/hdl/testbench.sv as simulation source
# Run behavioral simulation
```

The testbench will:
- Initialize the TRNG with seed value `1327`
- Generate 4599 random numbers
- Save the output to `output.txt`

### Statistical Testing

After running the hardware simulation:

```bash
# Run the Wald-Wolfowitz Runs Test
python tests/WaldWolfowitzRunsTest.py
```

**Expected Output:**
```
Wald-Wolfowitz Runs Test
passed/failed
z-test statistic: X.XXXXXXX
p-value: X.XXXXXXX
entropy: X.XXXXXXX
```

## 🧪 Testing

### Wald-Wolfowitz Runs Test

This statistical test validates the randomness of the generated sequence:

- **Null Hypothesis (H₀)**: The sequence was produced in a random manner
- **Alternative Hypothesis (Hₐ)**: The sequence was not produced in a random manner
- **Significance Level**: α = 0.05

The test calculates:
- **z-test statistic**: Measures deviation from expected randomness
- **p-value**: Probability of observing the data under H₀
- **entropy**: Shannon entropy of the distribution

**Interpretation:**
- If p-value > 0.05: Test **passed** ✅ (sequence appears random)
- If p-value < 0.05: Test **failed** ❌ (sequence shows non-random patterns)

## 📚 Documentation

Detailed documentation is available in the `docs/` directory:

- **[Project Report](docs/EEE458_ProjectReport_Group27.pdf)**: Comprehensive analysis including:
  - Design methodology
  - Architecture details
  - Implementation results
  - Statistical analysis
  - Performance evaluation

## 🤝 Contributing

Contributions are welcome! Here's how you can help:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Development Guidelines

- Follow existing code style and conventions
- Add tests for new features
- Update documentation as needed
- Ensure all tests pass before submitting PR

## 📝 License

This project is part of academic coursework (EEE458 - Group 27). Please refer to your institution's policies regarding code reuse and attribution.

## 👥 Authors

- **Group 27** - EEE458 Course Project

## 🙏 Acknowledgments

- Course instructors and teaching assistants
- Reference papers on TRNG design and chaotic systems
- Open-source simulation tools community

## 📧 Contact

For questions or feedback, please open an issue on GitHub.

---

**Note**: This TRNG design is intended for educational purposes. For production cryptographic applications, additional analysis and certification may be required.
