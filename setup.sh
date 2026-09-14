#!/bin/bash

# CarpenterPro Setup Script
# This script automates the setup process

echo "🔨 CarpenterPro Setup"
echo "===================="
echo ""

# Check Node.js installation
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js 16+ first."
    exit 1
fi

echo "✅ Node.js $(node -v) found"

# Copy .env files
if [ ! -f .env ]; then
    echo "📋 Creating .env file..."
    cp .env.example .env
    echo "⚠️  Please update .env with your configuration"
fi

# Install root dependencies
echo ""
echo "📦 Installing root dependencies..."
npm install

# Install backend dependencies
echo ""
echo "📦 Installing backend dependencies..."
cd backend
npm install
cd ..

# Install frontend dependencies
echo ""
echo "📦 Installing frontend dependencies..."
cd frontend
npm install
cd ..

# Install mobile dependencies
echo ""
echo "📦 Installing mobile dependencies..."
cd mobile
npm install
cd ..

echo ""
echo "✅ Setup complete!"
echo ""
echo "📚 Next steps:"
echo "1. Update .env with your database and server configuration"
echo "2. Start backend: cd backend && npm run dev"
echo "3. Start frontend: cd frontend && npm start"
echo "4. Start mobile: cd mobile && npm start"
echo ""
echo "Or use Docker Compose:"
echo "docker-compose up -d"
echo ""
echo "🌐 Access points:"
echo "Frontend: http://localhost:3000"
echo "Backend: http://localhost:5000/api"
echo "Database: localhost:5432"
echo ""
