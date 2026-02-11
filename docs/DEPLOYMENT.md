# Deployment Guide

## Overview

This guide covers deploying AgentForge to various environments.

## Prerequisites

- Docker and Docker Compose
- Kubernetes (for production)
- Domain name and SSL certificate
- Cloud provider account (AWS, Azure, or GCP)

## Local Development

### Using Docker Compose

```bash
# Clone repository
git clone https://github.com/wuweillove/agentforge-platform.git
cd agentforge-platform

# Copy environment file
cp .env.example .env

# Edit environment variables
nano .env

# Start all services
docker-compose -f docker-compose.dev.yml up -d

# Check logs
docker-compose logs -f
```

### Manual Setup

```bash
# Install dependencies
npm install

# Start infrastructure
docker-compose -f docker-compose.dev.yml up -d postgres redis mongodb qdrant

# Run migrations
npm run db:migrate

# Start services
npm run dev
```

## Production Deployment

### Docker Deployment

1. **Build images:**
```bash
docker-compose build
```

2. **Push to registry:**
```bash
docker tag agentforge/frontend:latest your-registry/agentforge-frontend:latest
docker push your-registry/agentforge-frontend:latest
```

3. **Deploy:**
```bash
docker-compose up -d
```

### Kubernetes Deployment

1. **Create namespace:**
```bash
kubectl create namespace agentforge
```

2. **Apply configurations:**
```bash
kubectl apply -f infrastructure/kubernetes/
```

3. **Check status:**
```bash
kubectl get pods -n agentforge
```

4. **Scale deployment:**
```bash
kubectl scale deployment frontend --replicas=3 -n agentforge
```

### AWS Deployment

#### Using ECS

1. **Create ECS cluster**
2. **Define task definitions**
3. **Create services**
4. **Configure load balancer**
5. **Set up RDS for PostgreSQL**
6. **Configure ElastiCache for Redis**

#### Using EKS

```bash
# Create cluster
eksctl create cluster --name agentforge --region us-east-1

# Deploy
kubectl apply -f infrastructure/kubernetes/
```

### Azure Deployment

```bash
# Create resource group
az group create --name agentforge-rg --location eastus

# Create AKS cluster
az aks create --resource-group agentforge-rg --name agentforge-aks

# Get credentials
az aks get-credentials --resource-group agentforge-rg --name agentforge-aks

# Deploy
kubectl apply -f infrastructure/kubernetes/
```

### GCP Deployment

```bash
# Create GKE cluster
gcloud container clusters create agentforge --region us-central1

# Get credentials
gcloud container clusters get-credentials agentforge --region us-central1

# Deploy
kubectl apply -f infrastructure/kubernetes/
```

## Environment Variables

Critical environment variables for production:

```env
NODE_ENV=production
DATABASE_URL=postgresql://...
REDIS_URL=redis://...
OPENAI_API_KEY=...
ANTHROPIC_API_KEY=...
NEXTAUTH_SECRET=...
JWT_SECRET=...
```

## SSL/TLS Configuration

### Using Let's Encrypt

```bash
# Install certbot
sudo apt-get install certbot

# Generate certificate
sudo certbot certonly --standalone -d agentforge.dev
```

### Using Cloud Provider

- AWS: Use ACM (AWS Certificate Manager)
- Azure: Use Azure Key Vault
- GCP: Use Google-managed SSL certificates

## Monitoring Setup

### Prometheus + Grafana

```bash
# Deploy Prometheus
kubectl apply -f infrastructure/kubernetes/monitoring/prometheus.yaml

# Deploy Grafana
kubectl apply -f infrastructure/kubernetes/monitoring/grafana.yaml
```

### ELK Stack

```bash
# Deploy Elasticsearch
kubectl apply -f infrastructure/kubernetes/logging/elasticsearch.yaml

# Deploy Logstash
kubectl apply -f infrastructure/kubernetes/logging/logstash.yaml

# Deploy Kibana
kubectl apply -f infrastructure/kubernetes/logging/kibana.yaml
```

## Backup Configuration

### PostgreSQL Backup

```bash
# Manual backup
pg_dump -U agentforge agentforge > backup.sql

# Automated backup (cron)
0 2 * * * pg_dump -U agentforge agentforge > /backups/$(date +\%Y\%m\%d).sql
```

### Redis Backup

```bash
# Enable AOF persistence in redis.conf
appendonly yes
appendfsync everysec
```

## Health Checks

```bash
# Frontend health
curl http://localhost:3000/api/health

# API health
curl http://localhost:4000/health

# Agent engine health
curl http://localhost:5000/health
```

## Troubleshooting

### Container won't start

```bash
# Check logs
docker logs <container-id>

# Check resource usage
docker stats
```

### Database connection issues

```bash
# Test connection
psql -h localhost -U agentforge -d agentforge

# Check network
docker network inspect agentforge-network
```

### Performance issues

- Check resource limits
- Review slow query logs
- Monitor cache hit rates
- Check network latency

## Security Checklist

- [ ] Environment variables secured
- [ ] SSL/TLS enabled
- [ ] Firewall configured
- [ ] Database access restricted
- [ ] API rate limiting enabled
- [ ] CORS configured properly
- [ ] Secrets in vault
- [ ] Regular security updates
- [ ] Backup tested
- [ ] Monitoring alerts configured

## Maintenance

### Updates

```bash
# Pull latest changes
git pull origin main

# Rebuild containers
docker-compose build

# Rolling update
kubectl rollout restart deployment/frontend -n agentforge
```

### Database Migrations

```bash
# Run migrations
npm run db:migrate

# Rollback if needed
npm run db:migrate:rollback
```