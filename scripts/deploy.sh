#!/bin/bash

# AgentForge Deployment Script

set -e

ENVIRONMENT=${1:-staging}

echo "🚀 Deploying AgentForge to $ENVIRONMENT..."
echo ""

# Build images
echo "🔨 Building Docker images..."
docker-compose build

echo ""

# Tag images
echo "🏷️  Tagging images..."
REGISTRY="your-registry.com"
VERSION=$(git rev-parse --short HEAD)

docker tag agentforge-frontend:latest $REGISTRY/agentforge-frontend:$VERSION
docker tag agentforge-api:latest $REGISTRY/agentforge-api:$VERSION
docker tag agentforge-agent-engine:latest $REGISTRY/agentforge-agent-engine:$VERSION

echo ""

# Push images
echo "📤 Pushing images to registry..."
docker push $REGISTRY/agentforge-frontend:$VERSION
docker push $REGISTRY/agentforge-api:$VERSION
docker push $REGISTRY/agentforge-agent-engine:$VERSION

echo ""

# Deploy to Kubernetes
if [ "$ENVIRONMENT" = "production" ]; then
    echo "🚢 Deploying to production..."
    kubectl apply -f infrastructure/kubernetes/production/
    kubectl set image deployment/frontend frontend=$REGISTRY/agentforge-frontend:$VERSION -n agentforge
    kubectl set image deployment/api api=$REGISTRY/agentforge-api:$VERSION -n agentforge
    kubectl set image deployment/agent-engine agent-engine=$REGISTRY/agentforge-agent-engine:$VERSION -n agentforge
else
    echo "🚢 Deploying to staging..."
    kubectl apply -f infrastructure/kubernetes/staging/
    kubectl set image deployment/frontend frontend=$REGISTRY/agentforge-frontend:$VERSION -n agentforge-staging
    kubectl set image deployment/api api=$REGISTRY/agentforge-api:$VERSION -n agentforge-staging
    kubectl set image deployment/agent-engine agent-engine=$REGISTRY/agentforge-agent-engine:$VERSION -n agentforge-staging
fi

echo ""
echo "✅ Deployment complete!"
echo "📊 Check status: kubectl get pods -n agentforge"
echo ""