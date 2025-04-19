# Mason Bricks Repository

Welcome to the **Mason Bricks** repository! 🎉

This repository contains reusable and customizable bricks designed to streamline your development process with clean architecture principles and feature-based scaffolding. Whether you're starting a new project or adding features to an existing one, these bricks will save you time and ensure consistency.

## Included Bricks

### Clean Architecture Template
- A boilerplate template for setting up a project with clean architecture principles.
- Promotes scalability, testability, and maintainability.

### Feature Template
- A template for quickly creating new features in your application.
- Organized for clarity and ease of integration.

## Getting Started

### Install the Mason CLI
```bash
dart pub global activate mason_cli

mason add clean_architecture --path ./bricks/clean_architecture
mason add feature_template --path ./bricks/feature_template

mason make clean_architecture
mason make feature_template

### Contribution
Contributions are welcome! Feel free to submit issues or pull requests to enhance the bricks and make them even more powerful.
