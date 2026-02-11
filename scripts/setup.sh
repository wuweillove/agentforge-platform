#!/bin/bash

# AgentForge Setup Script

set -e

echo "🚀 Setting up AgentForge Platform..."
echo ""

# Check prerequisites
echo "📋 Checking prerequisites..."

if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js 20 or higher."
    exit 1
fi

echo "✅ Node.js $(node --version) found"

if ! command -v npm &> /dev/null; then
    echo "❌ npm is not installed."
    exit 1
fi

echo "✅ npm $(npm --version) found"

if ! command -v docker &> /dev/null; then
    echo "❌ Docker is not installed. Please install Docker."
    exit 1
fi

echo "✅ Docker $(docker --version | cut -d ' ' -f3) found"

echo ""

# Install dependencies
echo "📦 Installing dependencies..."
npm install

echo ""

# Setup environment
if [ ! -f .env ]; then
    echo "⚙️  Creating .env file..."
    cp .env.example .env
    echo "✅ Created .env file. Please configure your environment variables."
    echo "📝 Edit .env with your API keys and configuration."
else
    echo "⚠️  .env file already exists. Skipping."
fi

echo ""

# Start infrastructure
echo "🐳 Starting infrastructure services..."
docker-compose -f docker-compose.dev.yml up -d

echo ""
echo "⏳ Waiting for services to be ready..."
sleep 10

echo ""

# Run migrations
echo "🗄️  Running database migrations..."
if [ -f "packages/database/package.json" ]; then
    npm run db:migrate || echo "⚠️  Migrations not available yet"
fi

echo ""
echo "✅ Setup complete!"
echo ""
echo "📚 Next steps:"
echo "  1. Configure your .env file with API keys"
echo "  2. Run 'npm run dev' to start development servers"
echo "  3. Open http://localhost:3000 in your browser"
echo ""
echo "📖 Documentation: ./docs/"
echo "💬 Need help? https://github.com/wuweillove/agentforge-platform/discussions"
echo ""