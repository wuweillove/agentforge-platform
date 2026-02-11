# AgentForge Frontend

Next.js 14 web application for the AgentForge platform.

## Features

- 🎨 Visual agent workflow builder with React Flow
- 📊 Real-time analytics dashboard
- 🔐 Authentication with NextAuth.js
- 🎨 Modern UI with Tailwind CSS and Shadcn/ui
- ⚡ Server-side rendering and static generation
- 📱 Responsive design

## Getting Started

```bash
# Install dependencies
npm install

# Run development server
npm run dev

# Build for production
npm run build

# Start production server
npm start
```

Open [http://localhost:3000](http://localhost:3000) in your browser.

## Project Structure

```
src/
├── app/                  # App router pages
│   ├── (auth)/          # Auth pages
│   ├── (dashboard)/     # Dashboard pages
│   └── api/             # API routes
├── components/          # React components
│   ├── ui/              # Base UI components
│   ├── agents/          # Agent-related components
│   ├── workflows/       # Workflow builder
│   └── dashboard/       # Dashboard components
├── lib/                 # Utilities
└── styles/              # Global styles
```

## Environment Variables

Create a `.env.local` file:

```env
NEXT_PUBLIC_API_URL=http://localhost:4000
NEXTAUTH_SECRET=your-secret
NEXTAUTH_URL=http://localhost:3000
```