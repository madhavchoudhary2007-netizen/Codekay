# Contributing to Codekay

Thank you for your interest in contributing to Codekay! This document provides guidelines and instructions for contributing to the project.

## Code of Conduct

By participating in this project, you agree to maintain a respectful and inclusive environment for all contributors.

## How to Contribute

### Reporting Bugs

If you find a bug, please create an issue with the following information:

1. **Clear title**: Use a descriptive title that summarizes the issue
2. **Description**: Provide a detailed description of the bug
3. **Steps to reproduce**: List the exact steps to reproduce the issue
4. **Expected behavior**: Describe what you expected to happen
5. **Actual behavior**: Describe what actually happened
6. **Environment**: Include details about your environment (OS, Flutter version, device/emulator)
7. **Screenshots**: If applicable, add screenshots to help explain the problem

### Suggesting Enhancements

We welcome suggestions for new features or improvements:

1. Check if the enhancement has already been suggested
2. Create an issue with a clear title and detailed description
3. Explain why this enhancement would be useful
4. Provide examples of how it would work

### Pull Requests

1. **Fork the repository** and create your branch from `main`
2. **Follow the coding standards** outlined below
3. **Write clear commit messages** that describe your changes
4. **Add tests** for new functionality
5. **Update documentation** if you change functionality
6. **Ensure tests pass** before submitting
7. **Submit a pull request** with a clear description of your changes

## Development Setup

1. Fork and clone the repository:
   ```bash
   git clone https://github.com/yourusername/codekay.git
   cd codekay
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Create a new branch:
   ```bash
   git checkout -b feature/your-feature-name
   ```

4. Make your changes and test thoroughly

5. Run tests:
   ```bash
   flutter test
   ```

6. Run code analysis:
   ```bash
   flutter analyze
   ```

## Coding Standards

### Dart Style Guide

- Follow the [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
- Use `flutter format` to format your code
- Keep lines under 80 characters when practical
- Use meaningful variable and function names

### Code Organization

- Place files in appropriate directories:
  - `lib/screens/` - UI screens
  - `lib/widgets/` - Reusable widgets
  - `lib/services/` - Business logic and API calls
  - `lib/models/` - Data models
  - `lib/utils/` - Utility functions
  - `lib/config/` - Configuration files

### Documentation

- Add doc comments for all public classes and methods
- Use `///` for documentation comments
- Include parameter descriptions and return value documentation
- Provide examples for complex functionality

Example:
```dart
/// Calculates the sum of two numbers
///
/// [a] - The first number
/// [b] - The second number
///
/// Returns the sum of [a] and [b]
int add(int a, int b) {
  return a + b;
}
```

### Testing

- Write unit tests for new functionality
- Maintain or improve code coverage
- Test edge cases and error conditions
- Use descriptive test names

### Commit Messages

Write clear and descriptive commit messages:

- Use the present tense ("Add feature" not "Added feature")
- Use the imperative mood ("Move cursor to..." not "Moves cursor to...")
- Limit the first line to 72 characters
- Reference issues and pull requests when relevant

Examples:
```
Add user profile screen
Fix authentication timeout issue
Update Firebase configuration documentation
```

## Project Structure

```
lib/
├── config/         # Configuration and setup
├── models/         # Data models and entities
├── screens/        # Full-page screens
├── services/       # Business logic and external services
├── utils/          # Helper functions and utilities
├── widgets/        # Reusable UI components
└── main.dart      # Application entry point
```

## Testing Guidelines

### Running Tests

```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/widget_test.dart

# Run with coverage
flutter test --coverage
```

### Writing Tests

- Test files should be in the `test/` directory
- Mirror the structure of the `lib/` directory
- Name test files with `_test.dart` suffix
- Group related tests using `group()`
- Use descriptive test descriptions

## Questions?

If you have questions about contributing, feel free to create an issue with the "question" label.

Thank you for contributing to Codekay!
