# Contributing to True Random Number Generator (TRNG)

Thank you for considering contributing to this project! We welcome contributions from the community.

## How to Contribute

### Reporting Bugs

If you find a bug, please open an issue with:
- A clear, descriptive title
- Steps to reproduce the issue
- Expected vs actual behavior
- Your environment (OS, simulator version, Python version)
- Relevant logs or screenshots

### Suggesting Enhancements

Enhancement suggestions are welcome! Please open an issue with:
- A clear description of the enhancement
- Why this enhancement would be useful
- Example use cases

### Pull Requests

1. **Fork the repository** and create your branch from `main`
2. **Make your changes** following our coding standards
3. **Test your changes** thoroughly
4. **Update documentation** as needed
5. **Commit your changes** with clear, descriptive commit messages
6. **Push to your fork** and submit a pull request

#### Coding Standards

**SystemVerilog:**
- Use meaningful signal and module names
- Add comments for complex logic
- Follow existing indentation style (spaces, not tabs)
- Include testbenches for new modules

**Python:**
- Follow PEP 8 style guide
- Use meaningful variable and function names
- Add docstrings for functions and classes
- Include type hints where appropriate

#### Commit Messages

- Use present tense ("Add feature" not "Added feature")
- Use imperative mood ("Move file to..." not "Moves file to...")
- Keep the first line under 50 characters
- Add detailed description if needed

Example:
```
Add entropy visualization feature

- Implement histogram plotting for random output
- Add matplotlib to requirements.txt
- Update README with new usage instructions
```

### Testing

Before submitting a pull request:

1. **Run hardware simulations** to ensure design integrity
2. **Run statistical tests** to validate randomness
3. **Test with different seeds** to ensure robustness
4. **Check for regressions** in existing functionality

### Code Review Process

All submissions require review. We'll:
- Check code quality and adherence to standards
- Verify test coverage
- Ensure documentation is updated
- Test functionality

We aim to review PRs within a week. Please be patient and responsive to feedback.

## Development Setup

1. Clone your fork:
   ```bash
   git clone https://github.com/Shakil06/rng.git
   cd rng
   ```

2. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

3. Create a branch:
   ```bash
   git checkout -b feature/your-feature-name
   ```

4. Make your changes and test them

5. Commit and push:
   ```bash
   git add .
   git commit -m "Your descriptive commit message"
   git push origin feature/your-feature-name
   ```

## Community

- Be respectful and inclusive
- Provide constructive feedback
- Help others learn and grow
- Follow the [Code of Conduct](CODE_OF_CONDUCT.md)

## Questions?

Feel free to open an issue with the "question" label if you need help or clarification.

---

Thank you for contributing to making this project better! 🚀
