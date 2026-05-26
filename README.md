# Docker Swarm Stack Deployment

## Project Overview

This project demonstrates a production-style multi-service deployment using Docker Swarm and Docker Stack.

The stack consists of multiple containerized services deployed across Swarm nodes with support for:

- Docker Swarm orchestration
- Docker Stack deployment
- Overlay networking
- Persistent volumes
- Docker Secrets
- Resource limits and reservations
- Replicated services
- Stateful MySQL deployment
- Multi-service architecture

---

# Architecture

The stack contains the following services:

| Service | Image | Purpose |
|---|---|---|
| PMs | navyasrig/jenkins:nodejs2 | NodeJS Application |
| movie | navyasrig/jenkins:nginx1 | Nginx Web Server |
| quiz | navyasrig/jenkins:java1 | Java/Tomcat Application |
| mysql | mysql:8 | MySQL Database |

---

# Technologies Used

- Docker
- Docker Compose
- Docker Swarm
- Docker Stack
- MySQL 8
- Overlay Networks
- Docker Secrets
- Linux

---

# Features Implemented

- Multi-service deployment using Docker Stack
- Docker Swarm orchestration
- Overlay networking for inter-service communication
- Persistent storage using Docker Volumes
- Docker Secrets integration for secure credential handling
- Service replication for application containers
- CPU and memory resource management
- Stateful MySQL deployment
- Container restart policies
- Multi-node Swarm cluster deployment

---

# Docker Compose Configuration

## Services

### PMs Service
- NodeJS-based application
- 2 replicas
- Overlay networking
- Persistent volume attached
- CPU and memory limits configured

### Movie Service
- Nginx-based application
- 2 replicas
- Overlay networking
- Persistent volume attached
- CPU and memory limits configured

### Quiz Service
- Java/Tomcat-based application
- 2 replicas
- Overlay networking
- Persistent volume attached
- CPU and memory limits configured

### MySQL Service
- MySQL 8 database
- Docker Secrets integration
- Overlay networking
- Persistent volume attached
- Secure password management using secret files
- Resource limits configured

---

# Docker Secrets Used

The following Docker Secrets were created and integrated into the MySQL container:

- MYSQL_ROOT_PASSWORD
- MYSQL_PASSWORD

Secrets are mounted inside the container under:

```bash
/run/secrets/
```

Environment variables used:

```yaml
MYSQL_PASSWORD_FILE: /run/secrets/MYSQL_PASSWORD
MYSQL_ROOT_PASSWORD_FILE: /run/secrets/MYSQL_ROOT_PASSWORD
```

---

# Overlay Networks

Separate overlay networks were created for service isolation and communication.

Networks used:

- PM_network
- movie_network
- quiz_network
- sql_network

---

# Persistent Volumes

Docker volumes were used for persistent storage.

Volumes created:

- PM
- movie
- quiz
- mysql

---

# Resource Management

CPU and memory limits were configured using Docker Swarm resource management.

Example:

```yaml
resources:
  limits:
    cpus: "0.5"
    memory: 128M

  reservations:
    cpus: "0.25"
    memory: 64M
```

MySQL memory was increased to prevent OOM kills during initialization.

---

# Swarm Initialization

Initialize Docker Swarm:

```bash
docker swarm init
```

Verify nodes:

```bash
docker node ls
```

---

# Docker Secret Creation

Create MySQL secrets:

```bash
echo "rootpassword" | docker secret create MYSQL_ROOT_PASSWORD -
```

```bash
echo "userpassword" | docker secret create MYSQL_PASSWORD -
```

Verify secrets:

```bash
docker secret ls
```

---

# Stack Deployment

Deploy the stack:

```bash
docker stack deploy -c compose.yaml production
```

Verify services:

```bash
docker service ls
```

Verify stack:

```bash
docker stack ls
```

---

# Useful Docker Commands

## Check Running Containers

```bash
docker ps
```

## Check Service Tasks

```bash
docker service ps production_mysql
```

## Check Service Logs

```bash
docker service logs production_mysql
```

## Check Overlay Networks

```bash
docker network ls
```

## Check Volumes

```bash
docker volume ls
```

## Check Secrets

```bash
docker secret ls
```

---

# MySQL Verification

Enter MySQL container:

```bash
docker exec -it <container-id> bash
```

Verify mounted secrets:

```bash
ls /run/secrets/
```

Login to MySQL:

```bash
mysql -u root -p
```

Show databases:

```sql
SHOW DATABASES;
```

Use database:

```sql
USE employeedb;
```

Show tables:

```sql
SHOW TABLES;
```

---

# Challenges Faced

During implementation and troubleshooting, the following challenges were identified and resolved:

- Docker Secret mounting issues
- MySQL container restart loops
- Swarm service rescheduling behavior
- Overlay network configuration errors
- Memory limitation causing OOM kills
- MySQL initialization failures
- Stateful container persistence handling
- Debugging Swarm task recreation

---

# Key Learnings

This project provided hands-on experience with:

- Docker Swarm orchestration
- Docker Stack deployments
- Multi-container architecture
- Stateful vs stateless containers
- Docker Secrets management
- Overlay networking
- Persistent storage handling
- Resource optimization
- Troubleshooting container failures
- Production-style container deployment strategies

---

# Future Improvements

- Add Nginx reverse proxy
- Deploy using GitHub Actions or Jenkins

---

# Author

Navya Sri
--- 26/05/2026
