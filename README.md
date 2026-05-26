<<<<<<< HEAD
# AI IT Support Assistant MVP Starter

This package contains a working MVP starter for your infrastructure project.

## Included
- Express backend with health and ticket APIs
- React frontend with ticket dashboard and create-ticket form
- Dockerfiles for backend and frontend

## Local run
### Backend
cd backend
npm install
npm start

### Frontend
cd frontend
npm install
npm start

## Docker build
From the project root:

docker build --platform linux/amd64 -t acraiitdev001.azurecr.io/backend:latest ./backend
docker build --platform linux/amd64 -t acraiitdev001.azurecr.io/frontend:latest ./frontend

