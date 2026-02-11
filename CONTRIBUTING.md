# Contributing to AgentForge

Thank you for your interest in contributing to AgentForge! We welcome contributions from the community.

## Code of Conduct

By participating in this project, you agree to abide by our Code of Conduct. Please be respectful and professional in all interactions.

## How to Contribute

### Reporting Bugs

1. Check if the bug has already been reported in [Issues](https://github.com/wuweillove/agentforge-platform/issues)
2. If not, create a new issue with:
   - Clear title and description
   - Steps to reproduce
   - Expected vs actual behavior
   - Environment details (OS, Node version, etc.)
   - Screenshots if applicable

### Suggesting Features

1. Check existing [feature requests](https://github.com/wuweillove/agentforge-platform/issues?q=is%3Aissue+label%3Aenhancement)
2. Create a new issue with:
   - Clear description of the feature
   - Use cases and benefits
   - Potential implementation approach

### Pull Requests

1. **Fork the repository**
   ```bash
   git clone https://github.com/wuweillove/agentforge-platform.git
   cd agentforge-platform
   ```

2. **Create a feature branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

3. **Make your changes**
   - Follow the code style (ESLint + Prettier)
   - Add tests for new functionality
   - Update documentation as needed

4. **Commit your changes**
   ```bash
   git commit -m "feat: add amazing feature"
   ```
   
   Follow [Conventional Commits](https://www.conventionalcommits.org/):
   - `feat:` - New feature
   - `fix:` - Bug fix
   - `docs:` - Documentation changes
   - `style:` - Code style changes (formatting)
   - `refactor:` - Code refactoring
   - `test:` - Adding or updating tests
   - `chore:` - Maintenance tasks

5. **Push to your fork**
   ```bash
   git push origin feature/your-feature-name
   ```

6. **Create a Pull Request**
   - Provide a clear description
   - Reference related issues
   - Include screenshots for UI changes
   - Ensure all tests pass

## Development Setup

```bash
# Install dependencies
npm install

# Start development environment
npm run dev

# Run tests
npm test

# Lint code
npm run lint

# Format code
npm run format
```

## Code Style

- Use TypeScript for all new code
- Follow ESLint configuration
- Use Prettier for formatting
- Write meaningful comments
- Keep functions small and focused

## Testing

- Write unit tests for new functions
- Write integration tests for APIs
- Maintain at least 80% code coverage
- Use Jest for testing

## Documentation

- Update README.md for major changes
- Document new APIs in `docs/api/`
- Add JSDoc comments to functions
- Update architecture docs if needed

## Review Process

1. All PRs require at least one approval
2. CI/CD checks must pass
3. Code coverage should not decrease
4. Documentation must be updated

## Getting Help

- Join our [Discord community](https://discord.gg/agentforge)
- Ask questions in [Discussions](https://github.com/wuweillove/agentforge-platform/discussions)
- Check the [documentation](./docs)

## License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

Thank you for contributing to AgentForge! 🚀