// Shared TypeScript types for Workflow

export interface Workflow {
  id: string;
  name: string;
  description?: string;
  trigger: WorkflowTrigger;
  agents: WorkflowAgent[];
  steps: WorkflowStep[];
  status: WorkflowStatus;
  createdAt: Date;
  updatedAt: Date;
}

export enum WorkflowStatus {
  DRAFT = 'draft',
  ACTIVE = 'active',
  PAUSED = 'paused',
  ARCHIVED = 'archived',
}

export interface WorkflowTrigger {
  type: 'manual' | 'webhook' | 'schedule' | 'event';
  config: Record<string, any>;
}

export interface WorkflowAgent {
  id: string;
  role: string;
  agentId: string;
}

export interface WorkflowStep {
  id: string;
  agentId: string;
  action: string;
  input?: string | string[];
  output?: string;
  condition?: WorkflowCondition;
  retry?: RetryConfig;
}

export interface WorkflowCondition {
  type: 'if' | 'switch';
  expression: string;
  branches: Record<string, string>;
}

export interface RetryConfig {
  maxAttempts: number;
  backoff: 'linear' | 'exponential';
  delay: number;
}

export interface WorkflowExecution {
  id: string;
  workflowId: string;
  status: ExecutionStatus;
  steps: StepExecution[];
  startedAt: Date;
  completedAt?: Date;
  error?: string;
}

export interface StepExecution {
  stepId: string;
  status: ExecutionStatus;
  input: any;
  output?: any;
  error?: string;
  duration: number;
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