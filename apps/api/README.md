# AgentForge API

Backend API service for the AgentForge platform.

## Features

- 🚀 RESTful API with Express
- 🔍 GraphQL API with Apollo Server
- 🔐 JWT authentication
- 💾 Prisma ORM with PostgreSQL
- 📡 Real-time updates with Socket.io
- 📋 Task queue with BullMQ
- 🛡️ Rate limiting and security

## Getting Started

```bash
# Install dependencies
npm install

# Generate Prisma client
npm run db:generate

# Run migrations
npm run db:migrate

# Seed database (optional)
npm run db:seed

# Start development server
npm run dev
```

API will be available at [http://localhost:4000](http://localhost:4000)

## API Endpoints

### REST API

- `POST /api/v1/auth/login` - User login
- `POST /api/v1/auth/register` - User registration
- `GET /api/v1/agents` - List agents
- `POST /api/v1/agents` - Create agent
- `GET /api/v1/agents/:id` - Get agent
- `PUT /api/v1/agents/:id` - Update agent
- `DELETE /api/v1/agents/:id` - Delete agent
- `POST /api/v1/agents/:id/execute` - Execute agent

### GraphQL API

GraphQL Playground: [http://localhost:4000/graphql](http://localhost:4000/graphql)

## Project Structure

```
src/
├── routes/              # API routes
├── controllers/         # Request handlers
├── services/            # Business logic
├── middleware/          # Express middleware
├── graphql/             # GraphQL schema and resolvers
├── models/              # Data models
├── utils/               # Utilities
└── config/              # Configuration
```