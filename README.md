# 🚀 Ultra-Lightweight Flask Docker Image

A production-ready Flask API packaged using an optimized Docker image with a focus on:

- Smaller image size
- Faster deployments
- Improved security
- Cleaner build process
- Production-grade application serving

This project demonstrates several Docker optimization techniques including multi-stage builds, Alpine Linux, virtual environments, dependency cleanup, non-root containers, and build context optimization.

---

## 📌 Project Overview

The application exposes two simple REST endpoints:

### Home Endpoint

```http
GET /
```

Response:

```json
{
  "message": "Hello from Docker!",
  "status": "success"
}
```

### Health Check Endpoint

```http
GET /health
```

Response:

```json
{
  "status": "healthy"
}
```

---

## 📂 Project Structure

```text
.
├── app.py
├── requirements.txt
├── Dockerfile
├── .dockerignore
└── README.md
```

---

## 🛠 Technologies Used

- Python 3.13
- Flask 3.1.2
- Gunicorn 23.0.0
- Docker
- Alpine Linux

---

## 🐳 Docker Optimizations Implemented

### 1. Multi-Stage Build

Dependencies are installed in a dedicated builder stage and only the required runtime artifacts are copied to the final image.

### 2. Alpine Base Image

Uses Alpine Linux to significantly reduce the image footprint compared to traditional Debian-based images.

### 3. Python Virtual Environment

Creates an isolated virtual environment for application dependencies.

### 4. Dependency Cleanup

Removes unnecessary packages and cache files after installation.

### 5. Non-Root User

The container runs as a dedicated application user instead of root, improving security.

### 6. Optimized Build Context

The .dockerignore file excludes unnecessary files such as Git metadata, IDE folders, logs, test artifacts, and virtual environments.

---

## 📦 Requirements

```text
Flask==3.1.2
gunicorn==23.0.0
```

---

## 🔨 Build the Docker Image

```bash
docker build -t flask-optimized .
```

---

## ▶️ Run the Container

```bash
docker run -d --name flask-app -p 5000:5000 flask-optimized
```

---

## 🧪 Testing

```bash
curl http://localhost:5000
```

```bash
curl http://localhost:5000/health
```

---

## 📈 Real-World Use Cases

- Kubernetes
- Amazon ECS
- AWS EKS
- Azure Container Apps
- Docker Swarm

---

## 🤝 Connect With Me

**Unni Pushpamgadan**

IT Infrastructure | AWS | Linux | Docker | Terraform | Python | DevOps

---

## ⭐ Support

If you found this project useful:

- Star this repository ⭐
- Fork the project 🍴
- Share feedback 💬

Happy Learning and Happy Containerizing! 🚀
