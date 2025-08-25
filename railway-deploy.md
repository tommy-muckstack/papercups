# Railway Deployment Guide for Papercups

## Step 1: Create Railway Project

1. Go to [Railway](https://railway.app)
2. Click "New Project"
3. Select "Deploy from GitHub repo"
4. Choose your forked `tommy-muckstack/papercups` repository

## Step 2: Add PostgreSQL Database

1. In your Railway project dashboard
2. Click "New" → "Database" → "PostgreSQL"
3. Railway will automatically create a PostgreSQL database

## Step 3: Configure Environment Variables

Go to your Railway project → Settings → Variables and add:

### Required Variables:
```
MIX_ENV=prod
PHX_HOST=your-app-name.up.railway.app
SECRET_KEY_BASE=<generate-32-character-random-string>
PORT=4000
REQUIRE_DB_SSL=true
USE_IP_V6=false
```

### Frontend Variables:
```
REACT_APP_URL=your-app-name.up.railway.app
BACKEND_URL=your-app-name.up.railway.app
REACT_APP_FILE_UPLOADS_ENABLED=0
```

### Auto-Generated (Railway provides):
```
DATABASE_URL (automatically provided by Railway PostgreSQL)
RAILWAY_PUBLIC_DOMAIN (automatically provided)
```

## Step 4: Deploy

1. Push your changes to GitHub
2. Railway will automatically deploy
3. Check the build logs for any issues

## Step 5: Generate SECRET_KEY_BASE

Run this command locally to generate a secure secret:
```bash
cd papercups
mix phx.gen.secret
```

Copy the output and set it as SECRET_KEY_BASE in Railway.