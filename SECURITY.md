# Security Policy

## Supported Versions

| Version | Supported          |
| ------- | ------------------ |
| 0.1.x   | :white_check_mark: |

## Reporting a Vulnerability

We take security vulnerabilities seriously. If you discover a security issue, please follow these steps:

### Private Disclosure

**Please do not open public issues for security vulnerabilities.**

Instead:

1. Email us at security@agentforge.dev
2. Include:
   - Description of the vulnerability
   - Steps to reproduce
   - Potential impact
   - Suggested fix (if any)

### Response Timeline

- **Initial Response**: Within 24 hours
- **Status Update**: Within 72 hours
- **Fix Timeline**: Depends on severity
  - Critical: Within 7 days
  - High: Within 14 days
  - Medium: Within 30 days
  - Low: Next release cycle

## Security Best Practices

### For Users

1. **API Keys**
   - Never commit API keys to version control
   - Rotate keys regularly
   - Use environment variables
   - Restrict key permissions

2. **Authentication**
   - Use strong passwords
   - Enable 2FA when available
   - Don't share credentials

3. **Deployment**
   - Always use HTTPS in production
   - Keep dependencies updated
   - Regular security audits
   - Monitor access logs

### For Developers

1. **Code Security**
   - Input validation on all endpoints
   - Parameterized queries (no SQL injection)
   - CSRF protection
   - XSS prevention

2. **Dependencies**
   - Regular dependency updates
   - Security scanning (npm audit)
   - License compliance

3. **Infrastructure**
   - Principle of least privilege
   - Network segmentation
   - Regular backups
   - Incident response plan

## Known Security Considerations

### LLM-Specific Risks

1. **Prompt Injection**: Validate and sanitize all user inputs
2. **Data Leakage**: Don't include sensitive data in prompts
3. **Rate Limiting**: Prevent abuse and DoS attacks
4. **Cost Control**: Monitor token usage and set limits

### API Security

1. **Authentication**: All endpoints require valid tokens
2. **Rate Limiting**: 100 requests/hour (free), 1000/hour (pro)
3. **CORS**: Configured for authorized domains only
4. **Input Validation**: Zod schemas for all inputs

## Security Features

- ✅ JWT authentication
- ✅ API key management
- ✅ Rate limiting
- ✅ CORS protection
- ✅ Input validation
- ✅ SQL injection prevention
- ✅ XSS protection
- ✅ CSRF tokens
- ✅ Audit logging
- ✅ Encrypted secrets

## Compliance

- GDPR compliance guidelines
- SOC 2 (planned)
- CCPA compliance

## Security Updates

Security updates are released as soon as possible:

- Critical: Immediate patch release
- High: Within 7 days
- Medium: Next minor version
- Low: Next major version

## Contact

- **Security Team**: security@agentforge.dev
- **Bug Bounty**: Coming soon
- **PGP Key**: Available on request

## Acknowledgments

We thank security researchers who responsibly disclose vulnerabilities:

- [List of contributors]

---

Last updated: February 10, 2026