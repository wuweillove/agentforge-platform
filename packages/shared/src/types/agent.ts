// Shared TypeScript types for Agent

export interface Agent {
  id: string;
  name: string;
  description?: string;
  model: LLMModel;
  temperature?: number;
  systemPrompt: string;
  tools: string[];
  memory: MemoryConfig;
  integrations: string[];
  status: AgentStatus;
  createdAt: Date;
  updatedAt: Date;
}

export enum AgentStatus {
  DRAFT = 'draft',
  ACTIVE = 'active',
  PAUSED = 'paused',
  ARCHIVED = 'archived',
}

export enum LLMModel {
  GPT4_TURBO = 'gpt-4-turbo',
  GPT4 = 'gpt-4',
  GPT35_TURBO = 'gpt-3.5-turbo',
  CLAUDE_3_OPUS = 'claude-3-opus-20240229',
  CLAUDE_3_SONNET = 'claude-3-sonnet-20240229',
  GEMINI_PRO = 'gemini-pro',
  LLAMA2 = 'llama2',
}

export interface MemoryConfig {
  type: 'short_term' | 'long_term' | 'hybrid';
  provider: 'memos' | 'redis' | 'custom';
  maxTokens?: number;
}

export interface AgentExecution {
  id: string;
  agentId: string;
  input: string;
  output?: string;
  status: ExecutionStatus;
  duration?: number;
  tokensUsed?: number;
  error?: string;
  startedAt: Date;
  completedAt?: Date;
}

export enum ExecutionStatus {
  PENDING = 'pending',
  RUNNING = 'running',
  COMPLETED = 'completed',
  FAILED = 'failed',
  CANCELLED = 'cancelled',
}

export interface CreateAgentInput {
  name: string;
  description?: string;
  model: LLMModel;
  temperature?: number;
  systemPrompt: string;
  tools?: string[];
  memory?: MemoryConfig;
  integrations?: string[];
}

export interface UpdateAgentInput {
  name?: string;
  description?: string;
  model?: LLMModel;
  temperature?: number;
  systemPrompt?: string;
  tools?: string[];
  memory?: MemoryConfig;
  integrations?: string[];
  status?: AgentStatus;
}