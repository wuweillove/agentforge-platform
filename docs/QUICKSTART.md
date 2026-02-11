# Quick Start Guide

Get started with AgentForge in 5 minutes!

## 1. Installation

### Using Docker (Recommended)

```bash
# Clone the repository
git clone https://github.com/wuweillove/agentforge-platform.git
cd agentforge-platform

# Copy environment file
cp .env.example .env

# Start all services
docker-compose up -d

# Wait for services (about 30 seconds)
sleep 30

# Open in browser
open http://localhost:3000
```

### Manual Installation

```bash
# Clone the repository
git clone https://github.com/wuweillove/agentforge-platform.git
cd agentforge-platform

# Install dependencies
npm install

# Copy environment file
cp .env.example .env

# Start infrastructure
docker-compose -f docker-compose.dev.yml up -d

# Run migrations
npm run db:migrate

# Start development servers
npm run dev
```

## 2. Configure API Keys

Edit `.env` and add your API keys:

```env
OPENAI_API_KEY=sk-your-openai-key
ANTHROPIC_API_KEY=sk-ant-your-anthropic-key
```

## 3. Create Your First Agent

### Via Web Interface

1. Navigate to http://localhost:3000
2. Sign up for an account
3. Click "Create Agent"
4. Fill in the details:
   - **Name**: My First Agent
   - **Model**: GPT-4 Turbo
   - **System Prompt**: "You are a helpful assistant"
5. Click "Save"

### Via API

```bash
curl -X POST http://localhost:4000/api/v1/agents \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -d '{
    "name": "My First Agent",
    "model": "gpt-4-turbo",
    "systemPrompt": "You are a helpful assistant"
  }'
```

## 4. Execute Your Agent

### Via Web Interface

1. Click on your agent
2. Type a message in the chat
3. Press Enter

### Via API

```bash
curl -X POST http://localhost:4000/api/v1/agents/{agentId}/execute \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -d '{
    "message": "Hello, what can you help me with?"
  }'
```

## 5. Create a Multi-Agent Workflow

1. Navigate to "Workflows"
2. Click "Create Workflow"
3. Drag agents onto the canvas
4. Connect them
5. Configure each step
6. Save and activate

## Next Steps

- 📚 Read the [Architecture Documentation](./ARCHITECTURE.md)
- 🔧 Explore the [API Documentation](./API.md)
- 🎨 Customize your agents
- 🚀 Deploy to production

## Common Issues

### Port already in use

```bash
# Change ports in .env
PORT=3001
API_PORT=4001
```

### Database connection error

```bash
# Restart PostgreSQL
docker-compose restart postgres

# Check connection
psql -h localhost -U agentforge -d agentforge
```

### API key not working

- Make sure you added the key to `.env`
- Restart the services: `npm run dev`
- Check the API key is valid

## Getting Help

- 💬 [Discord Community](https://discord.gg/agentforge)
- 📖 [Full Documentation](./README.md)
- 🐛 [Report Issues](https://github.com/wuweillove/agentforge-platform/issues)
- 💡 [Feature Requests](https://github.com/wuweillove/agentforge-platform/discussions)