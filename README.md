# Dockerized Fullstack Web Application

A production-style fullstack web application containerized using Docker and orchestrated with Docker Compose.

This project demonstrates how to build and run a multi-container architecture with:

- Frontend
- Backend API
- MongoDB Database
- Nginx Reverse Proxy

The entire stack runs using a single Docker Compose command.

Architecture:
Browser
   ↓
Nginx (Reverse Proxy)
   ↓
Backend API
   ↓
MongoDB Database

Techstack:
- Frontend: (React / HTML / Your Framework)
- Backend: (Node.js / Express / Your Backend)
- Database: MongoDB
- Reverse Proxy: Nginx
- Containerization: Docker
- Orchestration: Docker Compose

Project Structure:

├── backend/
   ├── Dockerfile
   └── source code
├── frontend/
   ├── Dockerfile
   └── source code
├── nginx/
  └── nginx.conf
├── compose.yml
└── README.md















