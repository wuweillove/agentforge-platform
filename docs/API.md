# API Documentation

## REST API

Base URL: `https://api.agentforge.dev/v1`

### Authentication

All API requests require authentication using a Bearer token:

```http
Authorization: Bearer YOUR_API_KEY
```

### Agents

#### List Agents

```http
GET /agents
```

**Query Parameters:**
- `page` (number): Page number (default: 1)
- `limit` (number): Items per page (default: 20)
- `status` (string): Filter by status

**Response:**
```json
{
  "agents": [
    {
      "id": "agent_123",
      "name": "Customer Support Agent",
      "status": "active",
      "model": "gpt-4-turbo",
      "createdAt": "2026-02-10T00:00:00Z"
    }
  ],
  "pagination": {
    "page": 1,
    "limit": 20,
    "total": 45
  }
}
```

#### Create Agent

```http
POST /agents
```

**Request Body:**
```json
{
  "name": "My Agent",
  "description": "A helpful assistant",
  "model": "gpt-4-turbo",
  "temperature": 0.7,
  "systemPrompt": "You are a helpful assistant...",
  "tools": ["web_search", "calculator"],
  "memory": {
    "type": "long_term",
    "provider": "memos"
  }
}
```

**Response:**
```json
{
  "id": "agent_456",
  "name": "My Agent",
  "status": "active",
  "createdAt": "2026-02-10T00:00:00Z"
}
```

#### Execute Agent

```http
POST /agents/{agentId}/execute
```

**Request Body:**
```json
{
  "message": "What is the weather today?",
  "context": {
    "location": "New York"
  },
  "stream": false
}
```

**Response:**
```json
{
  "id": "exec_789",
  "output": "The weather in New York today is...",
  "tokensUsed": 250,
  "duration": 1500,
  "status": "completed"
}
```

### Workflows

#### Create Workflow

```http
POST /workflows
```

**Request Body:**
```json
{
  "name": "Research Workflow",
  "trigger": {
    "type": "webhook",
    "path": "/research/start"
  },
  "agents": [
    {
      "id": "researcher",
      "role": "Research Agent",
      "agentId": "agent_123"
    }
  ],
  "steps": [
    {
      "agentId": "researcher",
      "action": "search",
      "output": "research_data"
    }
  ]
}
```

## GraphQL API

Endpoint: `https://api.agentforge.dev/graphql`

### Queries

#### Get Agent

```graphql
query GetAgent($id: ID!) {
  agent(id: $id) {
    id
    name
    description
    model
    status
    createdAt
    executions(limit: 10) {
      id
      status
      duration
      tokensUsed
      createdAt
    }
  }
}
```

### Mutations

#### Create Agent

```graphql
mutation CreateAgent($input: CreateAgentInput!) {
  createAgent(input: $input) {
    id
    name
    status
  }
}
```

### Subscriptions

#### Agent Execution Updates

```graphql
subscription AgentExecution($agentId: ID!) {
  agentExecution(agentId: $agentId) {
    id
    status
    output
    tokensUsed
  }
}
```

## WebSocket API

Endpoint: `wss://api.agentforge.dev/ws`

### Events

#### Connect

```javascript
const socket = io('wss://api.agentforge.dev', {
  auth: { token: 'YOUR_API_KEY' }
});
```

#### Agent Execution

```javascript
socket.emit('agent:execute', {
  agentId: 'agent_123',
  message: 'Hello!'
});

socket.on('agent:response', (data) => {
  console.log(data.output);
});
```

## Error Codes

- `400` - Bad Request
- `401` - Unauthorized
- `403` - Forbidden
- `404` - Not Found
- `429` - Too Many Requests
- `500` - Internal Server Error

## Rate Limits

- **Free tier**: 100 requests/hour
- **Pro tier**: 1,000 requests/hour
- **Enterprise**: Unlimited

## SDKs

### JavaScript/TypeScript

```bash
npm install @agentforge/sdk
```

```javascript
import { AgentForge } from '@agentforge/sdk';

const client = new AgentForge({
  apiKey: 'YOUR_API_KEY'
});

const agent = await client.agents.create({
  name: 'My Agent',
  model: 'gpt-4-turbo'
});

const result = await client.agents.execute(agent.id, {
  message: 'Hello!'
});
```

### Python

```bash
pip install agentforge
```

```python
from agentforge import AgentForge

client = AgentForge(api_key='YOUR_API_KEY')

agent = client.agents.create(
    name='My Agent',
    model='gpt-4-turbo'
)

result = client.agents.execute(
    agent.id,
    message='Hello!'
)
```