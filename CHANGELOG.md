# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.2.0] - 2024-12-21

### Added
- Full type hints throughout the codebase
- Comprehensive test suite with pytest
- GitHub Actions for CI/CD
- Automated PyPI publishing workflow
- `py.typed` marker for PEP 561 compliance
- Short `-i` flag for `--input` option
- `-V/--version` flag to display version
- Modern `src/` layout package structure
- Ruff for linting and formatting
- MyPy for static type checking
- Code coverage reporting

### Changed
- Upgraded minimum Python version to 3.9
- Migrated from setuptools to hatchling build backend
- Improved error messages and CLI help text
- Better modular code organization with separate modules for graph, printer, and CLI
- Enhanced documentation with badges and examples

### Fixed
- Proper handling of edge cases in resource parsing
- Improved tree connector rendering

## [0.1.0] - 2024-XX-XX

### Added
- Initial release
- Tree visualization for Terraform/OpenTofu plan output
- Color support for resource change symbols (+, -, ~)
- Automatic plan execution
- Summary statistics
- Position-based tree prefixes similar to `tree` command
- Support for reading from stdin
- Support for both Terraform and OpenTofu

[Unreleased]: https://github.com/yourusername/tofu-tree/compare/v0.2.0...HEAD
[0.2.0]: https://github.com/yourusername/tofu-tree/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/yourusername/tofu-tree/releases/tag/v0.1.0
