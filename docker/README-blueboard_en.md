# Blueboard – Docker Setup

services:

- **builder** – builds and publishes the application, then exits  
- **migrator** – runs Entity Framework Core migrations against the database  
- **blueboard** – runs the backend in production mode  
- **db** – PostgreSQL database with persisted data

---

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/)  
- [Docker Compose](https://docs.docker.com/compose/install/)  

---

## Environment Variables

All sensitive values should be provided via a [`.env`](../Blueboard/.env.example) file in the [Blueboard](../Blueboard) folder

> ⚠️ **Do not commit** `.env` to version control.

---

## Usage

### 1. Start the database

```bash
docker compose up -d db
```

### 2. Build the app

```bash
docker compose run --rm builder
```
### 3. Run migrations

```bash
docker compose run --rm migrator
```

### 4. Run the app

```bash
docker compose up -d blueboard
```
