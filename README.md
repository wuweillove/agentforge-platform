# 🚀 AgentForge Platform

<div align="center">

![AgentForge Banner](https://img.shields.io/badge/AgentForge-AI%20Agent%20Platform-blue?style=for-the-badge)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)
[![TypeScript](https://img.shields.io/badge/TypeScript-007ACC?style=for-the-badge&logo=typescript&logoColor=white)](https://www.typescriptlang.org/)
[![Next.js](https://img.shields.io/badge/Next.js-000000?style=for-the-badge&logo=next.js&logoColor=white)](https://nextjs.org/)
[![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)](https://www.docker.com/)

**Next-generation AI agent creation platform with visual workflow builder, multi-agent orchestration, and enterprise deployment.**

*Superior alternative to QuickClaw.app with enhanced OpenClaw.ai integration*

[Documentation](./docs) · [Quick Start](#quick-start) · [Architecture](#architecture) · [Contributing](./CONTRIBUTING.md)

</div>

---

## 📋 Table of Contents

- [Overview](#overview)
- [Key Features](#key-features)
- [Architecture](#architecture)
- [Tech Stack](#tech-stack)
- [Quick Start](#quick-start)
- [Installation](#installation)
- [Project Structure](#project-structure)
- [Configuration](#configuration)
- [Development](#development)
- [Deployment](#deployment)
- [API Documentation](#api-documentation)
- [Contributing](#contributing)
- [Roadmap](#roadmap)
- [License](#license)

---

## 🎯 Overview

**AgentForge** is a production-ready, open-source platform for building, deploying, and managing autonomous AI agents. Built with enterprise-grade architecture, it combines the best of OpenClaw.ai's deployment model with advanced orchestration capabilities.

### Why AgentForge?

- 🎨 **Visual Workflow Builder**: Drag-and-drop interface for creating complex agent workflows
- 🔄 **Multi-Agent Orchestration**: Coordinate multiple specialized agents seamlessly
- 🧠 **Advanced Memory Systems**: Persistent memory with MemOS integration
- 🔌 **MCP Protocol Support**: Native Model Context Protocol for tool integration
- 🌐 **Multi-Platform Deployment**: Deploy to WhatsApp, Telegram, Discord, Slack, and more
- 📊 **Real-time Analytics**: Monitor agent performance and interactions
- 🔐 **Enterprise Security**: Role-based access control and audit logging
- 🚀 **One-Click Deployment**: Docker and Kubernetes ready
- 💾 **Version Control**: Git-based agent configuration management
- 🔧 **Extensible Plugin System**: Custom tools and integrations

---

## ✨ Key Features

### Agent Creation & Management
- **Visual Agent Designer**: No-code interface for building agents
- **Template Library**: Pre-built agent templates for common use cases
- **Agent Marketplace**: Share and discover community agents
- **Version Control**: Track changes and rollback agents
- **A/B Testing**: Test multiple agent configurations

### Orchestration & Workflow
- **Multi-Agent Swarms**: Coordinate teams of specialized agents
- **Event-Driven Architecture**: Trigger agents based on events
- **Conditional Logic**: Build complex decision trees
- **Parallel Execution**: Run multiple agents simultaneously
- **Workflow Templates**: Reusable workflow patterns

### Integration & Deployment
- **LLM Provider Agnostic**: OpenAI, Anthropic, Azure, Google, local models
- **Messaging Platforms**: WhatsApp, Telegram, Discord, Slack, Teams
- **Voice Assistants**: Alexa, Google Assistant integration
- **API Gateway**: RESTful and GraphQL APIs
- **Webhooks**: Real-time event notifications

### Memory & Context
- **Long-term Memory**: Persistent conversation and knowledge storage
- **RAG Integration**: Vector databases for context retrieval
- **Shared Memory**: Agents can share context and knowledge
- **Memory Optimization**: Automatic context pruning and summarization

### Monitoring & Analytics
- **Real-time Dashboard**: Monitor all agents and workflows
- **Performance Metrics**: Token usage, latency, success rates
- **Conversation Analytics**: User engagement and satisfaction
- **Error Tracking**: Automatic error detection and alerting
- **Audit Logs**: Complete activity history

---

## 🏗️ Architecture

```mermaid
graph TB
    subgraph "Frontend Layer"
        A[Next.js Web App]
        B[Visual Workflow Builder]
        C[Agent Dashboard]
        D[Admin Console]
    end
    
    subgraph "API Gateway Layer"
        E[REST API]
        F[GraphQL API]
        G[WebSocket Server]
        H[Auth Service]
    end
    
    subgraph "Agent Execution Layer"
        I[Agent Orchestrator]
        J[Execution Engine]
        K[Task Queue]
        L[Worker Pool]
    end
    
    subgraph "Intelligence Layer"
        M[LLM Router]
        N[OpenAI/Anthropic/etc]
        O[Local Models]
        P[Tool Registry]
    end
    
    subgraph "Memory & Context Layer"
        Q[Vector Database]
        R[Redis Cache]
        S[Memory Manager]
        T[RAG Engine]
    end
    
    subgraph "Integration Layer"
        U[Messaging Connectors]
        V[MCP Server]
        W[Webhook Manager]
        X[Plugin System]
    end
    
    subgraph "Data Layer"
        Y[(PostgreSQL)]
        Z[(MongoDB)]
        AA[(Pinecone/Weaviate)]
    end
    
    subgraph "Infrastructure Layer"
        AB[Docker/K8s]
        AC[Load Balancer]
        AD[Monitoring]
        AE[Logging]
    end
    
    A --> E
    B --> F
    C --> G
    D --> H
    
    E --> I
    F --> I
    G --> I
    H --> I
    
    I --> J
    J --> K
    K --> L
    
    L --> M
    M --> N
    M --> O
    L --> P
    
    L --> S
    S --> Q
    S --> R
    S --> T
    T --> AA
    
    L --> U
    L --> V
    L --> W
    L --> X
    
    I --> Y
    J --> Z
    Q --> AA
    
    AB --> AC
    AC --> AD
    AC --> AE
```

### Architecture Principles

1. **Microservices Architecture**: Independently deployable services
2. **Event-Driven Design**: Asynchronous communication via message queues
3. **Horizontal Scalability**: Scale individual components as needed
4. **Fault Tolerance**: Circuit breakers and retry mechanisms
5. **API-First**: All functionality accessible via APIs
6. **Security by Design**: Authentication, authorization, and encryption at every layer

---

## 🛠️ Tech Stack

### Frontend
- **Framework**: Next.js 14 (App Router)
- **UI Library**: React 18 with TypeScript
- **Styling**: Tailwind CSS + Shadcn/ui
- **State Management**: Zustand + React Query
- **Workflow Editor**: React Flow
- **Charts**: Recharts + D3.js
- **Forms**: React Hook Form + Zod

### Backend
- **API Framework**: Node.js + Express/Fastify
- **GraphQL**: Apollo Server
- **WebSocket**: Socket.io
- **Authentication**: NextAuth.js / Passport.js
- **Task Queue**: BullMQ (Redis-based)
- **ORM**: Prisma / TypeORM

### Agent Execution
- **Runtime**: Node.js + TypeScript
- **LLM Integration**: LangChain / LangGraph
- **MCP Protocol**: Native implementation
- **Tool Execution**: Sandboxed execution environment
- **Memory**: MemOS integration

### Data Storage
- **Primary DB**: PostgreSQL (agent config, users, logs)
- **Document Store**: MongoDB (conversations, analytics)
- **Vector DB**: Pinecone / Weaviate / Qdrant
- **Cache**: Redis (sessions, rate limiting)
- **Object Storage**: S3 / MinIO (files, media)

### Infrastructure
- **Containerization**: Docker + Docker Compose
- **Orchestration**: Kubernetes (production)
- **CI/CD**: GitHub Actions
- **Monitoring**: Prometheus + Grafana
- **Logging**: ELK Stack (Elasticsearch, Logstash, Kibana)
- **Tracing**: Jaeger / OpenTelemetry

---

## ⚡ Quick Start

### Prerequisites

- Node.js 20+ and npm/yarn/pnpm
- Docker and Docker Compose
- Git
- PostgreSQL (or use Docker)
- Redis (or use Docker)

### One-Command Setup (Docker)

```bash
# Clone the repository
git clone https://github.com/wuweillove/agentforge-platform.git
cd agentforge-platform

# Copy environment variables
cp .env.example .env

# Edit .env with your API keys and configuration
nano .env

# Start all services
docker-compose up -d

# Wait for services to be ready (about 30 seconds)
# Access the platform at http://localhost:3000
```

### Development Setup

```bash
# Clone and install dependencies
git clone https://github.com/wuweillove/agentforge-platform.git
cd agentforge-platform
npm install

# Start infrastructure (PostgreSQL, Redis, etc.)
docker-compose -f docker-compose.dev.yml up -d

# Run database migrations
npm run db:migrate

# Seed sample data (optional)
npm run db:seed

# Start development servers (all services)
npm run dev

# Or start services individually:
npm run dev:frontend   # Frontend on :3000
npm run dev:api        # API on :4000
npm run dev:agents     # Agent engine on :5000
npm run dev:workers    # Background workers
```

Access the platform:
- **Frontend**: http://localhost:3000
- **API**: http://localhost:4000
- **GraphQL Playground**: http://localhost:4000/graphql
- **Agent Dashboard**: http://localhost:3000/dashboard

---

## 📦 Installation

### 1. Clone the Repository

```bash
git clone https://github.com/wuweillove/agentforge-platform.git
cd agentforge-platform
```

### 2. Environment Configuration

Create a `.env` file from the template:

```bash
cp .env.example .env
```

Configure the following required variables:

```env
# Application
NODE_ENV=development
APP_URL=http://localhost:3000
API_URL=http://localhost:4000

# Database
DATABASE_URL=postgresql://user:password@localhost:5432/agentforge
MONGO_URL=mongodb://localhost:27017/agentforge
REDIS_URL=redis://localhost:6379

# LLM Providers
OPENAI_API_KEY=your-openai-key
ANTHROPIC_API_KEY=your-anthropic-key
GOOGLE_AI_API_KEY=your-google-key

# Vector Database
PINECONE_API_KEY=your-pinecone-key
PINECONE_ENVIRONMENT=your-environment

# Authentication
NEXTAUTH_SECRET=generate-a-random-secret
NEXTAUTH_URL=http://localhost:3000

# Optional: Messaging Platforms
TELEGRAM_BOT_TOKEN=your-telegram-token
DISCORD_BOT_TOKEN=your-discord-token
WHATSAPP_API_KEY=your-whatsapp-key
```

### 3. Install Dependencies

```bash
# Install all workspace dependencies
npm install

# Or use yarn
yarn install

# Or use pnpm (recommended for monorepo)
pnpm install
```

### 4. Database Setup

```bash
# Start databases with Docker
docker-compose -f docker-compose.dev.yml up -d postgres redis mongodb

# Run migrations
npm run db:migrate

# Seed initial data
npm run db:seed
```

### 5. Start Development

```bash
# Start all services
npm run dev

# Or start individually
npm run dev:frontend
npm run dev:api
npm run dev:agents
npm run dev:workers
```

---

## 📁 Project Structure

```
agentforge-platform/
├── apps/
│   ├── frontend/                 # Next.js web application
│   │   ├── src/
│   │   │   ├── app/             # App router pages
│   │   │   ├── components/      # React components
│   │   │   ├── lib/             # Utilities and helpers
│   │   │   └── styles/          # Global styles
│   │   ├── public/              # Static assets
│   │   └── package.json
│   │
│   ├── api/                     # Backend REST/GraphQL API
│   │   ├── src/
│   │   │   ├── routes/          # API routes
│   │   │   ├── controllers/     # Request handlers
│   │   │   ├── services/        # Business logic
│   │   │   ├── middleware/      # Express middleware
│   │   │   └── graphql/         # GraphQL schema and resolvers
│   │   └── package.json
│   │
│   └── agent-engine/            # Agent execution engine
│       ├── src/
│       │   ├── orchestrator/    # Agent orchestration
│       │   ├── executors/       # Agent execution logic
│       │   ├── memory/          # Memory management
│       │   ├── tools/           # Tool implementations
│       │   └── integrations/    # Platform integrations
│       └── package.json
│
├── packages/
│   ├── shared/                  # Shared TypeScript types and utilities
│   ├── database/                # Database schemas and migrations
│   ├── config/                  # Shared configuration
│   └── ui/                      # Shared UI components
│
├── infrastructure/
│   ├── docker/                  # Dockerfiles for each service
│   ├── kubernetes/              # K8s manifests
│   │   ├── deployments/
│   │   ├── services/
│   │   └── ingress/
│   ├── terraform/               # Infrastructure as Code
│   └── helm/                    # Helm charts
│
├── workers/
│   ├── task-processor/          # Background task worker
│   ├── scheduler/               # Cron jobs and scheduled tasks
│   └── event-handler/           # Event processing worker
│
├── docs/
│   ├── api/                     # API documentation
│   ├── architecture/            # Architecture docs
│   ├── deployment/              # Deployment guides
│   └── user-guide/              # User documentation
│
├── scripts/
│   ├── setup.sh                 # Initial setup script
│   ├── migrate.sh               # Database migration script
│   └── deploy.sh                # Deployment script
│
├── tests/
│   ├── unit/                    # Unit tests
│   ├── integration/             # Integration tests
│   └── e2e/                     # End-to-end tests
│
├── .github/
│   ├── workflows/               # GitHub Actions CI/CD
│   └── ISSUE_TEMPLATE/          # Issue templates
│
├── docker-compose.yml           # Production compose
├── docker-compose.dev.yml       # Development compose
├── package.json                 # Root package.json (monorepo)
├── turbo.json                   # Turborepo configuration
├── tsconfig.json                # TypeScript configuration
├── .env.example                 # Environment template
├── .gitignore
├── LICENSE
└── README.md
```

---

## ⚙️ Configuration

### Agent Configuration

Create agents via the UI or by defining JSON configuration:

```json
{
  "name": "Customer Support Agent",
  "description": "Handles customer inquiries and support tickets",
  "model": "gpt-4-turbo",
  "temperature": 0.7,
  "systemPrompt": "You are a helpful customer support agent...",
  "tools": [
    "search_knowledge_base",
    "create_ticket",
    "send_email"
  ],
  "memory": {
    "type": "long_term",
    "provider": "memos"
  },
  "integrations": ["slack", "zendesk"]
}
```

### Workflow Configuration

```yaml
workflow:
  name: "Multi-Agent Research"
  trigger:
    type: "webhook"
    path: "/research/start"
  
  agents:
    - id: "researcher"
      role: "Research Agent"
      model: "gpt-4-turbo"
      
    - id: "analyst"
      role: "Analysis Agent"
      model: "claude-3-opus"
      
    - id: "writer"
      role: "Writing Agent"
      model: "gpt-4"
  
  steps:
    - agent: "researcher"
      action: "search_and_summarize"
      output: "research_data"
      
    - agent: "analyst"
      action: "analyze"
      input: "research_data"
      output: "analysis"
      
    - agent: "writer"
      action: "write_report"
      input: ["research_data", "analysis"]
      output: "final_report"
```

---

## 🚀 Deployment

### Docker Deployment

```bash
# Build images
docker-compose build

# Start services
docker-compose up -d

# Check status
docker-compose ps

# View logs
docker-compose logs -f
```

### Kubernetes Deployment

```bash
# Apply configurations
kubectl apply -f infrastructure/kubernetes/

# Check deployment status
kubectl get pods -n agentforge

# Scale deployment
kubectl scale deployment frontend --replicas=3 -n agentforge
```

### Cloud Deployment

#### AWS
```bash
# Using Terraform
cd infrastructure/terraform/aws
terraform init
terraform plan
terraform apply
```

#### Azure
```bash
cd infrastructure/terraform/azure
terraform init
terraform apply
```

#### GCP
```bash
cd infrastructure/terraform/gcp
terraform init
terraform apply
```

---

## 📚 API Documentation

### REST API

Base URL: `http://localhost:4000/api/v1`

#### Create Agent
```http
POST /agents
Content-Type: application/json
Authorization: Bearer {token}

{
  "name": "My Agent",
  "model": "gpt-4",
  "systemPrompt": "You are..."
}
```

#### Execute Agent
```http
POST /agents/{agentId}/execute
Content-Type: application/json

{
  "message": "Hello, agent!",
  "context": {}
}
```

Full API documentation: [docs/api/README.md](./docs/api/README.md)

### GraphQL API

```graphql
query GetAgent($id: ID!) {
  agent(id: $id) {
    id
    name
    model
    status
    executions {
      id
      status
      createdAt
    }
  }
}

mutation CreateAgent($input: CreateAgentInput!) {
  createAgent(input: $input) {
    id
    name
  }
}
```

---

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guide](./CONTRIBUTING.md) for details.

### Development Workflow

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/amazing-feature`
3. Commit changes: `git commit -m 'Add amazing feature'`
4. Push to branch: `git push origin feature/amazing-feature`
5. Open a Pull Request

### Code Standards

- TypeScript for all code
- ESLint + Prettier for formatting
- Conventional Commits for commit messages
- Jest for testing
- 80%+ code coverage required

---

## 🗺️ Roadmap

### Phase 1: Foundation (Q1 2026) ✅
- [x] Core architecture setup
- [x] Basic agent execution engine
- [x] REST API implementation
- [x] Frontend dashboard

### Phase 2: Enhancement (Q2 2026)
- [ ] Visual workflow builder
- [ ] Multi-agent orchestration
- [ ] MCP protocol integration
- [ ] Memory system (MemOS)
- [ ] Plugin marketplace

### Phase 3: Scale (Q3 2026)
- [ ] Kubernetes deployment
- [ ] Advanced analytics
- [ ] Team collaboration features
- [ ] Marketplace launch
- [ ] Enterprise features

### Phase 4: Expansion (Q4 2026)
- [ ] Voice agent support
- [ ] Mobile app
- [ ] Advanced AI features
- [ ] Global deployment
- [ ] Partner integrations

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

- Inspired by OpenClaw.ai's deployment model
- Built upon LangChain and LangGraph foundations
- Community feedback and contributions

---

## 📞 Support

- **Documentation**: [docs/](./docs)
- **Issues**: [GitHub Issues](https://github.com/wuweillove/agentforge-platform/issues)
- **Discussions**: [GitHub Discussions](https://github.com/wuweillove/agentforge-platform/discussions)
- **Discord**: [Join our community](https://discord.gg/agentforge)
- **Email**: support@agentforge.dev

---

<div align="center">

**Built with ❤️ by the AgentForge Team**

[⭐ Star us on GitHub](https://github.com/wuweillove/agentforge-platform) | [🐦 Follow on Twitter](https://twitter.com/agentforge)

</div>