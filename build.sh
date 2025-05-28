#!/usr/bin/env bash
# exit on error
set -o errexit

# Install backend dependencies
cd backend
pip install -r requirements.txt

# Run backend migrations
python manage.py migrate

# Install frontend dependencies and build
cd ../frontend
npm install
npm run build

# Return to backend directory
cd ../backend

# Collect static files
python manage.py collectstatic --no-input 